-- HEROES OF LEGEND: MAIN SCRIPT | scehr | 17/12/2023

local scehrLib = require("scehr_lib");

local holEntries = {
    require("scehr_hol_characters_buildings_entries"),
    require("scehr_hol_characters_regions_entries")
};

local scehr_hol_main = {};

scehr_hol_main.listHumans = {};

scehr_hol_main.mainKeyPrefix = "scehr_hol_";
scehr_hol_main.charactersKeyPrefix = scehr_hol_main.mainKeyPrefix.."characters_"
scehr_hol_main.journeysKeyPrefix = scehr_hol_main.mainKeyPrefix.."journeys_";

function scehr_hol_main.AINoHumanCheck(listEntry)
    local noHumans = false;
    local numSubcultures = #listEntry.subcultureKeys;
    local numFactions = #listEntry.factionKeys;

    if numSubcultures > 0 then
        local aiCultures = numSubcultures;
        for i = 1, #listEntry.subcultureKeys do
            local subKey = listEntry.subcultureKeys[i];
            for j = 1, #scehr_hol_main.listHumans do
                local isHumanEligible = cm:get_faction(scehr_hol_main.listHumans[j]):subculture() == subKey;
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
            for j = 1, #scehr_hol_main.listHumans do
                if scehr_hol_main.listHumans[i] == facKey then
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

    return false;
end

function scehr_hol_main.TerminateListeners(claimKey)
    local listenersRemoved = 0;
    for i = 1, #holEntries do
        local entriesTable = holEntries[i];

        for j = 1, #entriesTable do
            local entry = entriesTable[j];

            if entry.claimKey == claimKey then

                if #entry.subcultureKeys > 0 then
                    for k = 1, #entry.subcultureKeys do
                        local scKey = entry.subcultureKeys[k];
                        cm:remove_faction_turn_start_listener_by_subculture(scehr_hol_main.charactersKeyPrefix..scKey.."_"..entry.claimKey);

                        listenersRemoved = scehrLib.IncrementNumber(listenersRemoved);
                    end
                end

                if #entry.factionKeys > 0 then
                    for k = 1, #entry.factionKeys do
                        local fKey = entry.factionKeys[k];
                        cm:remove_faction_turn_start_listener_by_name(scehr_hol_main.charactersKeyPrefix..fKey.."_"..entry.claimKey);

                        listenersRemoved = scehrLib.IncrementNumber(listenersRemoved);
                    end
                end
            end
        end
    end
    out("#### SCEHR HOL | Removed "..tostring(listenersRemoved).." listeners! ####");
end

return scehr_hol_main;