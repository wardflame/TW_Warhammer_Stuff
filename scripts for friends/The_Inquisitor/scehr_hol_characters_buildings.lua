-- HEROES OF LEGEND: CHARACTERS-TO-BUILDINGS | scehr | 14/12/2023

local scehrLib = require("scehr_lib");
local scehrHOLMain = require("scehr_hol_main");
local cbEntries = require("scehr_hol_characters_buildings_entries");

local function InitLandmarkSpawnListeners()
    out("#### SCEHR HOL: Adding building/character listener(s)! ####");
    local listenersAdded = 0;

    for i = 1, #cbEntries do
        local cbEntry = cbEntries[i];
        local svClaimKey = scehrHOLMain.charactersKeyPrefix..cbEntry.claimKey.."_claimed";
        local svStatus = cm:get_saved_value(svClaimKey);

        if cbEntry.campaignKey == cm:get_campaign_name() then
            if not svStatus then
                local aiCanClaim = scehrHOLMain.AINoHumanCheck(cbEntry);

                -- Do subcultures.
                if #cbEntry.subcultureKeys > 0 then

                    for j = 1, #cbEntry.subcultureKeys do
                        local scKey = cbEntry.subcultureKeys[j];
                        local listenerName = scehrHOLMain.charactersKeyPrefix..scKey.."_"..cbEntry.claimKey;

                        cm:add_faction_turn_start_listener_by_subculture(
                            listenerName,
                            scKey,
                            function(context)
                                local iFaction = context:faction();
                                local factionIsNull = iFaction:is_null_interface();
                                local aiEligible = not iFaction:is_human() and aiCanClaim;

                                if not factionIsNull and iFaction:is_human() or aiEligible then
                                    local hasBuilding, iBuilding, iRegion = scehrLib.FactionHasBuilding(iFaction:name(), cbEntry.buildingKey);
                                    if hasBuilding then
                                        scehrLib.SpawnCharactersToFaction(iFaction:name(), cbEntry, iRegion:name());
                                        cm:set_saved_value(svClaimKey, true);
                                        scehrHOLMain.TerminateListeners(cbEntry.claimKey);
                                    end
                                end
                            end,
                            true
                        );

                        listenersAdded = scehrLib.IncrementNumber(listenersAdded);
                    end
                end

                -- Do factions.
                if #cbEntry.factionKeys > 0 then

                    for j = 1, #cbEntry.factionKeys do
                        local fKey = cbEntry.factionKeys[j];
                        local listenerName = scehrHOLMain.charactersKeyPrefix..fKey.."_"..cbEntry.claimKey;

                        cm:add_faction_turn_start_listener_by_name(
                            listenerName,
                            fKey,
                            function(context)
                                local iFaction = context:faction();
                                local factionIsNull = iFaction:is_null_interface();
                                local aiEligible = not iFaction:is_human() and aiCanClaim;

                                if not factionIsNull and iFaction:is_human() or aiEligible then
                                    local hasBuilding, iBuilding, iRegion = scehrLib.FactionHasBuilding(iFaction:name(), cbEntry.buildingKey);
                                    if hasBuilding then
                                        scehrLib.SpawnCharactersToFaction(iFaction:name(), cbEntry, iRegion:name());
                                        cm:set_saved_value(svClaimKey, true);
                                        scehrHOLMain.TerminateListeners(cbEntry.claimKey);
                                    end
                                end
                            end,
                            true
                        );

                        listenersAdded = scehrLib.IncrementNumber(listenersAdded);
                    end
                end
            end
        end
    end

    out("#### SCEHR HOL: Added "..tostring(listenersAdded).." building/character listener(s)! ####");
end

cm:add_first_tick_callback(
    function()
        local isLOLLoaded = core:is_mod_loaded("scehr_lol_building_ancillary_framework");

        if isLOLLoaded then
            scehrHOLMain.listHumans = cm:get_human_factions();
            InitLandmarkSpawnListeners();
        else
            out("#### SCEHR HOL: Prerequisite script(s) not loaded. This script will not load! ####");
        end
    end
);