-- Landmarks of Legend: BUILDING-to-ANCILLARY FRAMEWORK | scehr | 12/02/2023

--[[
    //// ELEMENT BREAKDOWN
    campaignKey = campaign name. (Immortal Empires = main_warhammer. Realms of Chaos = wh3_main_chaos.)
    factionKeys = factions_tables key.
    subcultureKeys = cultures_subcultures_tables key.
    buildingKey = building_levels_tables key.
    ancillaryKey = ancillaries_tables key.
    aiEligible = true if ai can claim characters, false if only players. If no players are playing an eligible faction, the ai will be able to claim regardless.
]]
local listBA = {
    {
        -- BRETONNIA: KNIGHTS OF CUILEUX BANNER
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia"
        },
        buildingKey = "cuileux_barrows",
        ancillaryKey = "anc_knights_of_cuileux_banner",
        aiEligible = false
    },
    {
        -- PROUT'S FINEST BREW ANCILLARY
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia",
            "wh_main_sc_emp_empire",
            "wh_main_sc_vmp_vampire_counts",
            "wh2_dlc11_sc_cst_vampire_coast",
            "wh_main_sc_dwf_dwarfs",
            "wh_main_sc_teb_teb",
            "wh2_main_sc_hef_high_elves",
            "wh2_main_sc_def_dark_elves",
            "wh2_dlc09_sc_tmb_tomb_kings",
            "wh_dlc05_sc_wef_wood_elves",
            "wh3_main_sc_ogr_ogre_kingdoms",
            "wh2_main_sc_lzd_lizardmen",
            "wh3_main_sc_ksl_kislev",
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "aragon_saloon",
        ancillaryKey = "anc_prout_brew",
        aiEligible = false
    },
    {
        -- KISLEV & VCOUNTS: HORN OF THE LOST EXPEDITION
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_ksl_kislev",
            "wh_main_sc_vmp_vampire_counts"
        },
        buildingKey = "lost_expedition_grave",
        ancillaryKey = "ethereal_tsar_horn",
        aiEligible = false
    },
    {
        -- KISLEV & VCOUNTS: HORN OF THE LOST EXPEDITION
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_ksl_kislev",
            "wh_main_sc_vmp_vampire_counts"
        },
        buildingKey = "lost_expedition_grave",
        ancillaryKey = "ethereal_tsar_horn",
        aiEligible = false
    }
};

local function CheckForHumans(currentEntry)
    local factions = currentEntry.factionKeys;
    local totalHumans = 0;
    for i = 1, #factions do
        if cm:get_faction(factions[i]):is_human() then
            totalHumans = totalHumans + 1;
        end
    end
    if totalHumans <= 0 then
        return true;
    end
    return currentEntry.aiEligible;
end

local function ba_status()
    out("#### SCEHR LOL: Adding building/ancillary listener(s)! ####");
    local listenersAdded = 0;
    for i = 1, #listBA do
        local currentBA = listBA[i];
        local campaignName = cm:get_campaign_name();

        if currentBA.campaignKey == campaignName then

            local currentBAClaimed = cm:get_saved_value("lol_"..currentBA.ancillaryKey.."_claimed");
            currentBA.aiEligible = CheckForHumans(currentBA);

            if not currentBAClaimed then

                if #currentBA.factionKeys > 0 then

                    for j = 1, #currentBA.factionKeys do
                        local factionObj = cm:get_faction(currentBA.factionKeys[j]);
                        local factionKey = factionObj:name();
                        local factionIsHuman = factionObj:is_human();
                        local aiCanClaim = not factionIsHuman and currentBA.aiEligible;

                        if factionIsHuman or aiCanClaim then
                            cm:add_faction_turn_start_listener_by_name(
                            "lol_"..factionKey.."_"..currentBA.buildingKey.."_"..currentBA.ancillaryKey.."_listener",
                            factionKey,
                            function()
                                local targetHasBuilding = cm:faction_contains_building(factionObj, currentBA.buildingKey);
                                if targetHasBuilding then
                                    cm:add_ancillary_to_faction(factionObj, currentBA.ancillaryKey, false);
                                    cm:set_saved_value("lol_"..currentBA.ancillaryKey.."_claimed", true);
                                    out("#### SCEHR LOL: "..factionObj:name().." claims "..currentBA.ancillaryKey.."! ####");
                                    cm:remove_faction_turn_start_listener_by_name("lol_"..factionKey.."_"..currentBA.buildingKey.."_"..currentBA.ancillaryKey.."_listener");
                                end
                            end,
                            true
                            );
                            listenersAdded = listenersAdded + 1;
                        end
                    end
                end

                if #currentBA.subcultureKeys > 0 then

                    for j = 1, #currentBA.subcultureKeys do
                        local subcultureKey = currentBA.subcultureKeys[j];
                        cm:add_faction_turn_start_listener_by_subculture(
                            "lol_"..subcultureKey.."_"..currentBA.buildingKey.."_"..currentBA.ancillaryKey.."_listener",
                            subcultureKey,
                            function(context)
                                local factionObj = context:faction();
                                local factionKey = factionObj:name();
                                local factionIsHuman = factionObj:is_human();
                                local aiCanClaim = not factionIsHuman and currentBA.aiEligible;

                                if factionIsHuman or aiCanClaim then
                                    local targetHasBuilding = cm:faction_contains_building(factionObj, currentBA.buildingKey);
                                    if targetHasBuilding then
                                        cm:add_ancillary_to_faction(factionObj, currentBA.ancillaryKey, false);
                                        cm:set_saved_value("lol_"..currentBA.ancillaryKey.."_claimed", true);
                                        out("#### SCEHR LOL: "..factionKey.." claims "..currentBA.ancillaryKey.."! ####");
                                        cm:remove_faction_turn_start_listener_by_subculture("lol_"..subcultureKey.."_"..currentBA.buildingKey.."_"..currentBA.ancillaryKey.."_listener");
                                    end
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
    out("#### SCEHR LOL: Added "..listenersAdded.." building/ancillary listener(s)! ####");
end

cm:add_first_tick_callback(
    function()
        ba_status();
    end
);