-- Landmarks of Legend: BUILDING-TO-CHARACTER FRAMEWORK | by scehr | 28/10/2022

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
                -- HERO 1
                type = "type_key",              -- db\agents\tables
                subtype = "subtype_key",        -- db\agent_subtypes\tables
                customName = false,             -- Set true if you want to set a custom name
                clanName = "Dame-Justice",      -- Character's title: any string
                forename = "Agatha",            -- Character's first name: any string
                surname = "Boldwin",            -- Character's last name: any string
                otherName = "the Strong"        -- An additional name AFTER surname: any string
            },
        },
        lords = {
            {
                -- LORD 1
                type = "type_key",              -- db\agents\tables
                subtype = "subtype_key",        -- db\agent_subtypes\tables
                customName = false,             -- Set true if you want to set a custom name
                title = "Emperor",              -- Any string
                forename = "Karl",              -- Any string
                surname = "Franz",              -- Any string
                suffix = "the Bold"             -- Any string
            }
        },
        aiEligibile = false,
        playersFirst = false
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

    -- Create hero and set name.
    locX, locY = GetSettlementSpawnCoords(factionObj:name(), targetRegion:name());
    local hero = cm:create_agent(
        factionObj:name(),
        "dignitary",
        "wh3_main_pro_ksl_patriarch",
        locX,
        locY
    );

    cm:change_character_custom_name(
        hero,
        "FORENAME",
        "SURNAME",
        "CLAN_NAME",
        "OTHER_NAME"
    );

    -- Create lord and set name.
    locX, locY = GetSettlementSpawnCoords(factionObj:name(), targetRegion:name());
    local lord = cm:create_agent(
        factionObj:name(),
        "general",
        "wh_dlc04_emp_volkmar",
        locX,
        locY
    );

    cm:change_character_custom_name(
        lord,
        "FORENAME",
        "SURNAME",
        "CLAN_NAME",
        "OTHER_NAME"
    );
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

local function InitLandmarkLordListeners()
    out("#### scehr: Adding LoL character listener(s)! ####");

    local listenerTotal = 0;
    for i = 1, #listBLL do
        out("SCEHR hero count: "..#listBLL[i].heroes);
        local charactersClaimed = cm:get_saved_value("lol_"..listBLL[i].buildingKey.."_characters_claimed");

        if not charactersClaimed then
            local totalSubcultures = #listBLL[i].subcultureKeys;
            local totalFactions = #listBLL[i].factionKeys;

            -- Subculture listener init.
            if totalSubcultures > 0 then
                for j = 1, totalSubcultures do
                    local subcultureKey = listBLL[i].subcultureKeys[j];
                    local buildingKey = listBLL[i].buildingKey;
                    cm:add_faction_turn_start_listener_by_subculture(
                        "lol_"..subcultureKey.."_"..buildingKey.."_characters_listener",
                        subcultureKey,
                        function(context)
                            local hasBuilding, region = FactionBuildingQuery(listBLL[i], context:faction());
                            if hasBuilding then
                                SpawnCharacters(listBLL[i], context:faction(), region);
                                cm:set_saved_value("lol_"..listBLL[i].buildingKey.."_characters_claimed", true);
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
                    local factionKey = listBLL[i].factionKeys[j];
                    local buildingKey = listBLL[i].buildingKey;
                    local factionObj = cm:get_faction(factionKey);
                    local isNull = factionObj:is_null_interface();
                    local aiNotEligible = not faction:is_human() and not listBLL.aiEligibile;

                    if isNull or aiNotEligible then
                        do break end;
                    end
                    cm:add_faction_turn_start_listener_by_name(
                        "lol_"..factionKey.."_"..buildingKey.."_characters_listener",
                        factionKey,
                        function(context)
                            local hasBuilding, region = FactionBuildingQuery(listBLL[i], context:faction());
                            if hasBuilding then
                                SpawnCharacters(listBLL[i], context:faction(), region);
                                cm:set_saved_value("lol_"..listBLL[i].buildingKey.."_characters_claimed", true);
                            end
                        end,
                        true
                    );
                    listenerTotal = listenerTotal + 1;
                end
            end
        end
    end

    out("#### scehr: Added "..listenerTotal.." LoL character listener(s)! ####");
end

cm:add_first_tick_callback(
    function()
        local hasLoL = core:is_mod_loaded("!landmarks_of_legend_wh3.pack");
        out("SCEHR LOL LOADED: "..tostring(hasLoL));
        local isIE = cm:get_campaign_name() == "main_warhammer";
        local hasInitLoL;

        -- Make sure we're in Immortal Empires.
        if isIE then
            InitLandmarkLordListeners();
        end
    end
)
