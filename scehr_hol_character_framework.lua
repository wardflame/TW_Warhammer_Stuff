-- Heroes of Legend: BUILDING-TO-CHARACTER FRAMEWORK | by scehr | 28/10/2022

-- NOTE: Each entry should have a unique building key.
-- If not using factionKeys or subcultureKeys, leave the table blank.
-- If not wanting to add, say, otherName's to the character, leave the STRING blank: "".
local listBLL = {
    {
        -- ELEMENT 1
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_emp_empire"
        },
        buildingKey = "wh_main_special_settlement_altdorf_1_emp",
        heroes = {
            {
                -- HERO 1: CUSTOM NAME WITCH HUNTER
                type = "spy",                               -- db\agents\tables
                subtype = "wh_main_emp_witch_hunter",       -- db\agent_subtypes\tables
                maleOrFemale = true,                        -- True is male, false is female
                customName = true,                          -- Set true if you want to set a custom name
                title = "Lord",                             -- Character's title: any string
                forename = "Godrick",                       -- Character's first name: any string
                surname = "Wightsbane",                     -- Character's last name: any string
            },
        },
        lords = {
            {
                -- LORD 1: VOLKMAR THE GRIM
                type = "general",                           -- db\agents
                subtype = "wh_dlc04_emp_volkmar",           -- db\agent_subtypes
                maleOrFemale = true,                        -- True is male, false is female
                title = "names_name_10000",                 -- text\db\names__.loc
                forename = "names_name_10001",              -- text\db\names__.loc
                surname = "names_name_10002",               -- text\db\names__.loc
            }
        },
        aiEligibile = false
    }
};

local function GetSettlementSpawnCoords(factionName, regionName)
    local locX, locY = cm:find_valid_spawn_location_for_character_from_settlement(
        factionName,
        regionName,
        false,
        true,
        0
    );
    return locX, locY;
end

local function SpawnCharacters(listEntry, factionObj, targetRegion)
    local locX, locY;
    local factionKey = factionObj:name();
    local regionKey = targetRegion:name();

    -- Create heroes.
    for i = 1, #listEntry.heroes do
        local heroEntry = listEntry.heroes[i];
        locX, locY = GetSettlementSpawnCoords(factionKey, regionKey);
        local heroObj = cm:create_agent(
            factionObj:name(),
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

        out("SCEHR HOL: spawned hero");
        out("   Name: "..heroEntry.title.." "..heroEntry.forename.." "..heroEntry.surname);
        out("   Type: "..heroEntry.type);
        out("   Subtype: "..heroEntry.subtype);
    end

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

        out("SCEHR HOL: spawned lord");
        out("   Name: "..lordEntry.title.." "..lordEntry.forename.." "..lordEntry.surname);
        out("   Type: "..lordEntry.type);
        out("   Subtype: "..lordEntry.subtype);
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
            local listenerName = "hol_"..subcultureKey.."_"..buildingKey.."_characters_subculture_listener"
            cm:remove_faction_turn_start_listener_by_subculture(listenerName);
            out("SCEHR HOL: Terminated "..listenerName.."!");
        end
    end
    if totalFactions > 0 then
        for i = 1, totalFactions do
            local factionKey = listEntry.factionKeys[i];
            local listenerName = "hol_"..factionKey.."_"..buildingKey.."_characters_faction_listener"
            cm:remove_faction_turn_start_listener_by_name(listenerName);
            out("SCEHR HOL: Terminated "..listenerName.."!");
        end
    end
end

local function InitLandmarkLordListeners()
    out("#### SCEHR HOL: Adding character listener(s)! ####");

    local listenerTotal = 0;
    for i = 1, #listBLL do
        local listEntry = listBLL[i];
        local claimString = "hol_"..listEntry.buildingKey.."_characters_claimed";
        local charactersClaimed = cm:get_saved_value(claimString);

        if not charactersClaimed then
            local totalSubcultures = #listEntry.subcultureKeys;
            local totalFactions = #listEntry.factionKeys;
            local buildingKey = listEntry.buildingKey;

            -- Subculture listener init.
            if totalSubcultures > 0 then
                for j = 1, totalSubcultures do
                    local subcultureKey = listEntry.subcultureKeys[j];
                    cm:add_faction_turn_start_listener_by_subculture(
                        "hol_"..subcultureKey.."_"..buildingKey.."_characters_subculture_listener",
                        subcultureKey,
                        function(context)
                            local factionObj = context:faction();
                            local factionKey = factionObj:name();
                            local factionIsNull = factionObj:is_null_interface();
                            local aiNotEligible = not factionObj:is_human() and not listEntry.aiEligibile;

                            if factionIsNull or aiNotEligible then
                                out("#### SCEHR HOL: "..factionKey.." is ineligible for the characters. Denying.");
                            else
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
                    listenerTotal = listenerTotal + 1;
                end
            end

            -- Faction listener init.
            if totalFactions > 0 then
                for j = 1, totalFactions do
                    local factionKey = listEntry.factionKeys[j];
                    local factionObj = cm:get_faction(factionKey);
                    local factionIsNull = factionObj:is_null_interface();
                    local aiNotEligible = not faction:is_human() and not listEntry.aiEligibile;

                    if factionIsNull or aiNotEligible then
                        out("#### SCEHR HOL: "..factionKey.." is ineligible for the character listener. Denying listener.");
                    else
                        cm:add_faction_turn_start_listener_by_name(
                        "hol_"..factionKey.."_"..buildingKey.."_characters_faction_listener",
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
                    listenerTotal = listenerTotal + 1;
                    end
                end
            end
        end
    end

    out("#### SCEHR HOL: Added "..listenerTotal.." building/character listener(s)! ####");
end

cm:add_first_tick_callback(
    function()
        local isLOLLoaded = core:is_mod_loaded("scehr_lol_ancillary_framework");
        local isIE = cm:get_campaign_name() == "main_warhammer";

        -- Make sure we're in Immortal Empires and Landmarks of Legend is loaded.
        if isIE and isLOLLoaded then
            InitLandmarkLordListeners();
        else
            out("#### SCEHR HOL: Prerequisites not met. Heroes of Legend script will not load! ####");
            out("   Immortal Empires: "..tostring(isIE));
            out("   Landmarks of Legend: "..tostring(isLOLLoaded));
        end
    end
);