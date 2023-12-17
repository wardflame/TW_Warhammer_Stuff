-- HEROES OF LEGEND: CHARACTERS-TO-BUILDINGS | scehr | 14/12/2023

local scehrLib = require("scehr_lib");
local cbEntries = require("scehr_hol_characters_buildings_entries");

local listHumans = {};

local function AINoHumanCheck(listEntry)
    local noHumans = false;
    local numSubcultures = #listEntry.subcultureKeys;
    local numFactions = #listEntry.factionKeys;

    if numSubcultures > 0 then
        local aiCultures = numSubcultures;
        for i = 1, #listEntry.subcultureKeys do
            local subKey = listEntry.subcultureKeys[i];
            for j = 1, #listHumans do
                local isHumanEligible = cm:get_faction(listHumans[j]):subculture() == subKey;
                if isHumanEligible then
                    aiCultures = aiCultures - 1;
                end
            end
        end
        if aiCultures >= numSubcultures then
            noHumans = true;
        end
    end

    if numFactions > 0 then
        local aiFactions = numFactions;
        for i = 1, #listEntry.factionKeys do
            local facKey = listEntry.factionKeys[i];
            for j = 1, #listHumans do
                if listHumans[i] == facKey then
                    aiFactions = aiFactions - 1;
                end
            end
        end
        if aiFactions >= numFactions then
            noHumans = true;
        end
    end

    if noHumans then
        return true;
    end

    return listEntry.aiEligibile;
end

local function SpawnCharacters(listEntry, factionObj, targetRegion)
    local locX, locY;
    local factionKey = factionObj:name();
    local regionKey = targetRegion:name();

    if #listEntry.heroes > 0 then
        -- Create heroes.
        for i = 1, #listEntry.heroes do

            local heroEntry = listEntry.heroes[i];
            locX, locY = scehrLib.GetSettlementSpawnCoords(factionKey, regionKey);
            local heroObj = cm:create_agent(
                factionKey,
                heroEntry.type,
                heroEntry.subtype,
                locX,
                locY
            );

            -- Set custom name.
            if heroEntry.customName then
                cm:change_character_custom_name(
                heroObj,
                heroEntry.forename,
                heroEntry.surname,
                heroEntry.title,
                ""
                );
            end

            -- Replenish action points so they can be used on-spawn.
            local heroLookUp = cm:char_lookup_str(heroObj);
            cm:replenish_action_points(heroLookUp);

            -- Create event message if one available.
            if heroEntry.message then
                scehrLib.CreateMessageEvent(factionKey, heroEntry.message);
            end
        end
    end

    if #listEntry.lords > 0 then
        -- Create lords.
        for i = 1, #listEntry.lords do
            local lordEntry = listEntry.lords[i];
            cm:spawn_character_to_pool(
                factionKey,
                lordEntry.forename,
                lordEntry.surname,
                lordEntry.title,
                "",
                20,
                lordEntry.maleOrFemale,
                lordEntry.type,
                lordEntry.subtype,
                true,
                ""
            );

            -- Create event message if one available.
            if lordEntry.message then
                scehrLib.CreateMessageEvent(factionKey, lordEntry.message);
            end
        end
    end
end

local function FactionBuildingQuery(listEntry, factionObj)
    local buildingKey = listEntry.buildingKey;
    local factionHasBuilding = cm:faction_contains_building(factionObj, buildingKey);

    if not factionHasBuilding then
        return;
    else
        local regionList = factionObj:region_list();
        local targetRegion;

        for i = 0, regionList:num_items() - 1 do
            local region = regionList:item_at(i);
            local regionHasBuilding = region:building_exists(buildingKey);
            if regionHasBuilding then
                targetRegion = region;
                return true, targetRegion;
            end
        end
    end
end

local function TerminateBuildingListeners(listEntry)

    local totalSubcultures = #listEntry.subcultureKeys;
    local totalFactions = #listEntry.factionKeys;
    local buildingKey = listEntry.buildingKey;

    if totalSubcultures > 0 then
        for i = 1, totalSubcultures do
            local subcultureKey = listEntry.subcultureKeys[i];
            local listenerName = "hol_bc_"..subcultureKey.."_"..buildingKey.."_characters_subculture_listener"
            cm:remove_faction_turn_start_listener_by_subculture(listenerName);
            out("#### SCEHR HOL: Terminated "..listenerName.."! ####");
        end
    end

    if totalFactions > 0 then
        for i = 1, totalFactions do
            local factionKey = listEntry.factionKeys[i];
            local listenerName = "hol_bc_"..factionKey.."_"..buildingKey.."_characters_faction_listener"
            cm:remove_faction_turn_start_listener_by_name(listenerName);
            out("#### SCEHR HOL: Terminated "..listenerName.."! ####");
        end
    end

end

local function InitLandmarkCharacterListeners()

    out("#### SCEHR HOL: Adding building/character listener(s)! ####");

    local listenersAdded = 0;
    for i = 1, #cbEntries do
        local listEntry = cbEntries[i];

        if listEntry.campaignKey == cm:get_campaign_name() then

            local claimString = "hol_bc_"..listEntry.buildingKey.."_characters_claimed";
            local charactersClaimed = cm:get_saved_value(claimString);

            if not charactersClaimed then
                local totalSubcultures = #listEntry.subcultureKeys;
                local totalFactions = #listEntry.factionKeys;
                local buildingKey = listEntry.buildingKey;
                listEntry.aiEligibile = AINoHumanCheck(listEntry);

                -- Subculture listener init.
                if totalSubcultures > 0 then
                    for j = 1, totalSubcultures do
                        local subcultureKey = listEntry.subcultureKeys[j];
                        cm:add_faction_turn_start_listener_by_subculture(
                            "hol_bc_"..subcultureKey.."_"..buildingKey.."_characters_subculture_listener",
                            subcultureKey,
                            function(context)
                                local factionObj = context:faction();
                                local factionIsNull = factionObj:is_null_interface();
                                local factionIsHuman = factionObj:is_human();
                                local aiEligible = not factionIsHuman and listEntry.aiEligibile;
                                local validClaim = factionIsHuman or aiEligible;

                                if not factionIsNull and validClaim then
                                    local hasBuilding, region = FactionBuildingQuery(listEntry, context:faction());
                                    if hasBuilding then
                                        SpawnCharacters(listEntry, context:faction(), region);
                                        cm:set_saved_value(claimString, true);
                                        TerminateBuildingListeners(listEntry);
                                    end
                                end
                            end,
                            true
                        );
                        listenersAdded = listenersAdded + 1;
                    end
                end

                -- Faction listener init.
                if totalFactions > 0 then
                    for j = 1, totalFactions do
                        local factionKey = listEntry.factionKeys[j];
                        local factionObj = cm:get_faction(factionKey);
                        local factionIsNull = factionObj:is_null_interface();
                        local factionIsHuman = factionObj:is_human();
                        local aiEligible = not factionIsHuman and listEntry.aiEligibile;
                        local validClaim = factionIsHuman or aiEligible;

                        if not factionIsNull and validClaim then
                            cm:add_faction_turn_start_listener_by_name(
                                "hol_bc_"..factionKey.."_"..buildingKey.."_characters_faction_listener",
                                factionKey,
                                function(context)
                                    local hasBuilding, region = FactionBuildingQuery(listEntry, context:faction());
                                    if hasBuilding then
                                        SpawnCharacters(listEntry, context:faction(), region);
                                        cm:set_saved_value(claimString, true);
                                        TerminateBuildingListeners(listEntry);
                                   end
                                end,
                                true
                            );
                            listenersAdded = listenersAdded + 1;
                        end
                    end
                end
            end
        end
    end

    out("#### SCEHR HOL: Added "..listenersAdded.." building/character listener(s)! ####");

end

cm:add_first_tick_callback(
    function()
        local isLOLLoaded = core:is_mod_loaded("scehr_lol_building_ancillary_framework");

        if isLOLLoaded then
            listHumans = cm:get_human_factions();
            InitLandmarkCharacterListeners();
        else
            out("#### SCEHR HOL: Prerequisites not met. Heroes of Legend script will not load! ####");
            out("   Landmarks of Legend installed: "..tostring(isLOLLoaded));
        end
    end
);