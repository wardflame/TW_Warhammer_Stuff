-- Heroes of Legend: BUILDING-TO-CHARACTER FRAMEWORK | by scehr | 02/02/2023

-- NOTE: Each entry should have a unique building key.
-- If not using factionKeys or subcultureKeys, leave the table blank.
-- If not wanting to add, say, otherName's to the character, leave the STRING blank: "".

--[[
    //// ELEMENT BREAKDOWN
    campaignKey = campaign name. (Immortal Empires = main_warhammer. Realms of Chaos = wh3_main_chaos.)
    factionsKeys = factions_tables keys.
    subcultureKeys = cultures_subcultures_tables keys.
    buildingKey = building_levels_tables key.
    ## HEROES
        type = agents_tables key.
        subtype = agents_subtypes_tables key.
        maleOrFemale = true is male character, false is female character.
        customName = true if wanting to manually input a name, false if wanting the game to randomly generate.
        title = custom character title.
        forename = custom character first name.
        surname = custom character last name.
        messageTitle = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        messagePrimary = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        messageSecondary = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        messageIndex = irrelevant. Keep at 0.
    ## LORD
        type = agents_tables key.
        subtype = agent_subtypes_tables key.
        maleOrFemale = true is male character, false is female character.
        title = text\db\names__.loc     | character title.
        forename = text\db\names__.loc  | character first name.
        surname = text\db\names__.loc   | character last name.
        messageTitle = text\db\event_feed_strings__.loc     | Set to nil if not using an incident
        messagePrimary = text\db\event_feed_strings__.loc   | Set to nil if not using an incident
        messageSecondary = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        messageIndex = 0
    aiEligible = true if ai can claim characters, false if only players. If no players are playing an eligible faction, the ai will be able to claim regardless.
]]
local listBLL = {
    {
        -- ELEMENT 1
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_emp_empire",
            "wh_main_sc_brt_bretonnia",
            "wh_main_sc_teb_teb",
            "wh3_main_sc_ksl_kislev",
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "fort_orcal_all_HUMAN",
        heroes = {
            {
                -- HERO 1: HERMIT KNIGHT OF MALMONT
                type = "champion",
                subtype = "hermit_knight_1",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Hermit Knight",
                surname = "of Malmont",
                messageTitle = "event_feed_strings_text_hol_event_hermit_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_hermit_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_hermit_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 0  
            }
        },
        lords = {},
    },
    {
        -- ELEMENT 2
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "shang_yang_barracks",
        heroes = {
            {
                -- HERO 1: BANNAGA
                type = "wizard",
                subtype = "bannaga",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Bannaga",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_bannaga_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_bannaga_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_bannaga_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 3                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 3
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_kho_khorne",
            "wh_main_sc_chs_chaos"
        },
        buildingKey = "brazen_altar",
        heroes = {
            {
                -- HERO 1: SIMAERGUL
                type = "champion",
                subtype = "simaergul_0",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Simaergul",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_simaergul_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_simaergul_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_simaergul_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 4                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 4
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_emp_empire",
            "wh_main_sc_brt_bretonnia",
            "wh_main_sc_teb_teb",
            "wh3_main_sc_ksl_kislev",
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "HUM_luccini_palace",
        heroes = {},
        lords = {
            {
                -- LORD 1: PRINCE LORENZO LUPO
                type = "general",
                subtype = "lorenzo_lupo",
                maleOrFemale = true,
                title = "names_name_44442",
                forename = "names_name_44443",
                surname = "names_name_44444",
                messageTitle = "event_feed_strings_text_hol_event_lorenzo_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_lorenzo_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_lorenzo_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 5
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_dlc05_sc_wef_wood_elves"
        },
        buildingKey = "summerstrand",
        heroes = {},
        lords = {
            {
                -- LORD 1: AMADRI IRONBARK
                type = "general",
                subtype = "amadri_ironbark",
                maleOrFemale = true,
                title = "",
                forename = "names_name_55551",
                surname = "names_name_55552",
                messageTitle = "event_feed_strings_text_hol_event_amadri_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_amadri_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_amadri_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 1
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 6
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_dlc05_sc_wef_wood_elves"
        },
        buildingKey = "winterheart",
        heroes = {},
        lords = {
            {
                -- LORD 1: SCEOLAN
                type = "general",
                subtype = "sceolan",
                maleOrFemale = true,
                title = "",
                forename = "names_name_55558",
                surname = "names_name_55559",
                messageTitle = "event_feed_strings_text_hol_event_sceolan_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_sceolan_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_sceolan_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 6              
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 7
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_nur_nurgle",
            "wh_main_sc_chs_chaos"
        },
        buildingKey = "children_of_doom",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                title = "",
                forename = "names_name_55554",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 5
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 8
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "shang_yang_barracks",
        heroes = {
            {
                -- HERO 1: BANNAGA
                type = "wizard",
                subtype = "bannaga",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Bannaga",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_bannaga_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_bannaga_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_bannaga_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 3                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 9
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_kho_khorne",
            "wh_main_sc_chs_chaos"
        },
        buildingKey = "brazen_altar",
        heroes = {
            {
                -- HERO 1: SIMAERGUL
                type = "champion",
                subtype = "simaergul_0",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Simaergul",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_simaergul_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_simaergul_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_simaergul_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 4                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 10
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_nur_nurgle",
            "wh_main_sc_chs_chaos"
        },
        buildingKey = "children_of_doom",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                title = "",
                forename = "names_name_55554",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 5
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 11
        campaignKey = "main_warhammer",
        factionKeys = {
            "wh_main_vmp_vampire_counts"                       
        },
        subcultureKeys = {},
        buildingKey = "helmut_camp",
        heroes = {
            {
                -- HERO 1: SIMAERGUL
                type = "champion",
                subtype = "helmut_von_carstein_0",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Helmut",
                surname = "von Carstein",
                messageTitle = "event_feed_strings_text_hol_event_simaergul_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_simaergul_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_simaergul_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 4                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 12
        campaignKey = "main_warhammer",
        factionKeys = {
            "wh_main_vmp_vampire_counts"                       
        },
        subcultureKeys = {},
        buildingKey = "gorgivich_camp",
        heroes = {
            {
                -- HERO 1: SIMAERGUL
                type = "champion",
                subtype = "gorgivich_krakvald_0",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Gorgivich",
                surname = "Krakvald",
                messageTitle = "event_feed_strings_text_hol_event_simaergul_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_simaergul_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_simaergul_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 4                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 13
        campaignKey = "main_warhammer",
        factionKeys = {
            "wh_main_vmp_vampire_counts"                       
        },
        subcultureKeys = {},
        buildingKey = "gunther_camp",
        heroes = {
            {
                -- HERO 1: SIMAERGUL
                type = "champion",
                subtype = "gunther_von_grecht_0",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Gunther",
                surname = "von Grecht",
                messageTitle = "event_feed_strings_text_hol_event_simaergul_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_simaergul_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_simaergul_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 4                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    }    
};
local listHumans = {};

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

local function CreateCharacterEventMessage(characterEntry, factionKey)
    cm:show_message_event(
        factionKey,
        characterEntry.messageTitle,
        characterEntry.messagePrimary,
        characterEntry.messageSecondary,
        true,
        characterEntry.messageIndex
    );
end

local function SpawnCharacters(listEntry, factionObj, targetRegion)
    local locX, locY;
    local factionKey = factionObj:name();
    local regionKey = targetRegion:name();

    if #listEntry.heroes > 0 then
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

            -- Create event message if one available.
            if heroEntry.messageTitle ~= nil then
                CreateCharacterEventMessage(heroEntry, factionKey);
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
            if lordEntry.messageTitle ~= nil then
                CreateCharacterEventMessage(lordEntry, factionKey);
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
    for i = 1, #listBLL do
        local listEntry = listBLL[i];

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

        -- Make sure Landmarks of Legend is loaded.
        if isLOLLoaded then
            listHumans = cm:get_human_factions();
            InitLandmarkCharacterListeners();
        else
            out("#### SCEHR HOL: Prerequisites not met. Heroes of Legend script will not load! ####");
            out("   Landmarks of Legend installed: "..tostring(isLOLLoaded));
        end
    end
);