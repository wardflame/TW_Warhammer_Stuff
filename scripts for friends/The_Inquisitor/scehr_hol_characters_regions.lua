-- HEROES OF LEGEND: CHARACTERS-TO-REGIONS | scehr | 14/12/2023

local scehrLib = require("scehr_lib");
local scehrHOLMain = require("scehr_hol_main");
local crEntries = require("scehr_hol_characters_regions_entries");

local function InitRegionSpawnListeners()

    out("#### SCEHR HOL: Adding region/character listener(s)! ####");
    local listenersAdded = 0;

    for i = 1, #crEntries do
        local crEntry = crEntries[i];

        if crEntry.campaignKey == cm:get_campaign_name() then
            local svClaimKey = scehrHOLMain.charactersKeyPrefix..crEntry.claimKey.."_claimed";
            local svStatus = cm:get_saved_value(svClaimKey);

            if not svStatus then
                local aiCanClaim = scehrHOLMain.AINoHumanCheck(crEntry);

                -- Do subcultures.
                if #crEntry.subcultureKeys > 0 then

                    for j = 1, #crEntry.subcultureKeys do
                        local scKey = crEntry.subcultureKeys[j];
                        local listenerName = scehrHOLMain.charactersKeyPrefix..scKey.."_"..crEntry.claimKey;

                        cm:add_faction_turn_start_listener_by_subculture(
                            listenerName,
                            scKey,
                            function(context)
                                local iFaction = context:faction();
                                local factionIsNull = iFaction:is_null_interface();
                                local aiEligible = not iFaction:is_human() and aiCanClaim;

                                if not factionIsNull and iFaction:is_human() or aiEligible then
                                    if scehrLib.FactionHasRegion(iFaction:name(), crEntry.regionKey) then
                                        scehrLib.SpawnCharactersToFaction(iFaction:name(), crEntry, crEntry.regionKey);
                                        cm:set_saved_value(svClaimKey, true);
                                        scehrHOLMain.TerminateListeners(crEntry.claimKey);
                                    end
                                end
                            end,
                            true
                        );

                        listenersAdded = scehrLib.IncrementNumber(listenersAdded)
                    end
                end

                -- Do factions.
                if #crEntry.factionKeys > 0 then

                    for j = 1, #crEntry.factionKeys do
                        local fKey = crEntry.factionKeys[j];
                        local listenerName = scehrHOLMain.charactersKeyPrefix..fKey.."_"..crEntry.claimKey;

                        cm:add_faction_turn_start_listener_by_name(
                            listenerName,
                            fKey,
                            function(context)
                                local iFaction = context:faction();
                                local factionIsNull = iFaction:is_null_interface();
                                local aiEligible = not iFaction:is_human() and aiCanClaim;

                                if not factionIsNull and iFaction:is_human() or aiEligible then
                                    if scehrLib.FactionHasRegion(iFaction:name(), crEntry.regionKey) then
                                        scehrLib.SpawnCharactersToFaction(iFaction:name(), crEntry, crEntry.regionKey);
                                        cm:set_saved_value(svClaimKey, true);
                                        scehrHOLMain.TerminateListeners(crEntry.claimKey);
                                    end
                                end
                            end,
                            true
                        );

                        listenersAdded = scehrLib.IncrementNumber(listenersAdded)
                    end
                end
            end
        end
    end

    out("#### SCEHR HOL: Added "..tostring(listenersAdded).." region/character listener(s)! ####");
end

cm:add_first_tick_callback(
    function()
        local isLOLLoaded = core:is_mod_loaded("scehr_lol_building_ancillary_framework");

        if isLOLLoaded then
            InitRegionSpawnListeners();
        else
            out("#### SCEHR HOL: Prerequisite script(s) not loaded. This script will not load! ####");
        end
    end
);