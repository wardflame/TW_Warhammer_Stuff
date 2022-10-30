-- Landmarks of Legend: BUILDING-to-ANCILLARY FRAMEWORK | scehr | 03/09/2022

local listBA = {
    {
        -- BRETONNIA: KNIGHTS OF CUILEUX BANNER
        -- Eligible faction keys of the desired subculture.
        factionKeys = {
            "wh2_dlc14_brt_chevaliers_de_lyonesse",
            "wh2_main_brt_knights_of_origo",
            "wh2_main_brt_knights_of_the_flame",
            "wh2_main_brt_thegans_crusaders",
            "wh3_main_brt_aquitaine",
            "wh_main_brt_artois",
            "wh_main_brt_bastonne",
            "wh_main_brt_bordeleaux",
            "wh_main_brt_bretonnia",
            "wh_main_brt_carcassonne",
            "wh_main_brt_lyonesse",
            "wh_main_brt_parravon"
        },
        -- Subculture abbreviation, which can be found in any subculture related key (ex. brt is Bretonnia).
        subcultureAbbreviation = "brt",
        -- Subculture key from factions_tables.
        subcultureKey = "wh_main_sc_brt_bretonnia",
        -- Building key from building_levels_tables.
        buildingKey = "cuileux_barrows",
        -- Ancillary key from ancillaries_tables.
        ancillaryKey = "anc_knights_of_cuileux_banner",
        -- If true, AI factions can get the ancillary. If false, they can't.
        aiEligible = false,
        -- If ^ is true and this is true, only players can initially claim the ancillary. If false, the AI and players are equally capable.
        playersFirst = true,
    }
};


local function ba_status()

    for i = 1, #listBA do
        local currentBA = listBA[i];
        local currentBAClaimed = cm:get_saved_value("lol_"..currentBA.ancillaryKey.."_claimed");

        if not currentBAClaimed then
            out("#### scehr LoL: Adding Building/Ancillary listeners. ####");

            for j = 1, #currentBA.factionKeys do
                local targetFaction = cm:get_faction(currentBA.factionKeys[j]);
                local targetIsHuman = cm:is_faction_human(currentBA.factionKeys[j]);

                if not currentBA.aiEligible and not targetIsHuman then
                    out("#### scehr LoL: "..currentBA.factionKeys[j].." is ineligible for the "..currentBA.ancillaryKey..". Denying.");
                else
                    cm:add_faction_turn_start_listener_by_name(
                    "lol_"..currentBA.factionKeys[j].."_"..currentBA.buildingKey.."_"..currentBA.ancillaryKey.."_listener",
                    currentBA.factionKeys[j],
                    function()
                        local targetHasBuilding = cm:faction_contains_building(targetFaction, currentBA.buildingKey);
                        if targetHasBuilding then
                            if currentBA.playersFirst and not targetIsHuman then
                                return
                            end
                            cm:add_ancillary_to_faction(targetFaction, currentBA.ancillaryKey, false);
                            cm:set_saved_value("lol_"..currentBA.ancillaryKey.."_claimed", true);
                            out("#### scehr LoL: "..currentBA.factionKeys[j].." claims "..currentBA.ancillaryKey.."! ####");
                            cm:remove_faction_turn_start_listener_by_name("lol_"..currentBA.factionKeys[j].."_"..currentBA.buildingKey.."_listener");
                        end
                    end,
                    true
                );
                end
            end
        end
    end
end

cm:add_first_tick_callback(
    function()
        local gameMode = cm:get_campaign_name();

        if gameMode == "main_warhammer" then
            ba_status();
        end
    end
);