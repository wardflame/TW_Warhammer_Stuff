-- HEROES OF LEGEND: JOURNEYS | BALKRAG | scehr | 01/01/2024

local scehrLib = require("scehr_lib");
local scehrHOLMain = require("scehr_hol_main");

local messages = {
    fateOfGrimgorson0 = {
        title = "event_feed_strings_text_hol_balkrag_aid_event_title",
        primary = "event_feed_strings_text_hol_balkrag_aid_event_primary_detail",
        secondary = "event_feed_strings_text_hol_balkrag_aid_event_secondary_detail",
        index = 2013
    },
    fateOfGrimgorson1 = {
        title = "event_feed_strings_text_hol_balkrag_slay_event_title",
        primary = "event_feed_strings_text_hol_balkrag_slay_event_primary_detail",
        secondary = "event_feed_strings_text_hol_balkrag_slay_event_secondary_detail",
        index = 2013
    }
};

local listenerKeys = {
    azgalTaken = scehrHOLMain.journeysKeyPrefix.."ListenToKarakAzgalTaken",
    azgalTakenDilemma = scehrHOLMain.journeysKeyPrefix.."ListenToKarakAzgalTakenDilemma"
};

local dilemmaKeys = {
    fateOfGrimgorson = "fate_of_grimgorson"
};

local constants = {
    dwarfSubcultureKey = "wh_main_sc_dwf_dwarfs",
    azgalRegionKey = "wh3_main_combi_region_karak_azgal",
    balkragData = {
        traits = {
            aidBalkrag = "balkrag_aid_slayer_debuff",
            slayBalkrag = "balkrag_kill_slayer_buff"
        },
        character = {
            type = "champion",
            subtype = "balkrag_grimgorson",
            forename = "Balkrag",
            surname = "Grimgorson",
            clanName = ""
        }
    }
};

local saveData = {
    svKey = "sv_hol_BalkragJourney",
    aiEligible = false,
    azgalDilemmaFinished = false,
    balkragProfile = {
        isDead = false,
        factionKey = "",
        subcultureKey = "",
        journeys = {
            hasSpawned = false,
        }
    }
};

local function Load()
    saveData = cm:get_saved_value(saveData.svKey);
end

local function Save()
    cm:set_saved_value(saveData.svKey, saveData);
    Load();
end

local function ListenToAzgalTakenDilemma(faction, region)
    out("#### SCEHR HOL: JOURNEYS (Balkrag) | Listening to Azgal taken dilemma!");
    core:add_listener(
        listenerKeys.azgalTakenDilemma,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == dilemmaKeys.fateOfGrimgorson;
        end,
        function(context)
            local choice = context:choice();
            local factionLeader = faction:faction_leader();

            if factionLeader:is_null_interface() then
                out("#### SCEHR HOL: JOURNEYS (Balkrag) | ISSUE: Faction leader is null interface.");
                return;
            end

            -- AID BALKRAG
            if choice == 0 then
                scehrLib.CreateMessageEvent(faction:name(), messages.fateOfGrimgorson0);
                cm:force_add_trait(cm:char_lookup_str(factionLeader), constants.balkragData.traits.aidBalkrag, true);
                scehrLib.SpawnCharactersToFaction(
                    faction:name(),
                    { heroes = { constants.balkragData.character }, lords = {} },
                    region:name()
                );
                saveData.balkragProfile.journeys.hasSpawned = true;
                saveData.balkragProfile.factionKey = faction:name();
                saveData.balkragProfile.subcultureKey = faction:subculture();
            end

            -- SLAY BALKRAG
            if choice == 1 then
                scehrLib.CreateMessageEvent(faction:name(), messages.fateOfGrimgorson1);
                cm:force_add_trait(cm:char_lookup_str(factionLeader), constants.balkragData.traits.slayBalkrag, true);
                saveData.balkragProfile.isDead = true;
            end

            saveData.azgalDilemmaFinished = true;

            Save();
        end,
        false
    );
end

local function ListenToKarakAzgalTaken()
    out("#### SCEHR HOL: JOURNEYS (Balkrag) | Listening to Azgal taken!");
    core:add_listener(
        listenerKeys.azgalTaken,
        "RegionFactionChangeEvent",
        function(context)
            return context:region():name() == constants.azgalRegionKey;
        end,
        function(context)
            if context:region():is_abandoned() then return; end

            local owningFaction = context:region():owning_faction();
            if owningFaction:subculture() ~= constants.dwarfSubcultureKey then return; end
            if owningFaction:is_human() == false and saveData.aiEligible == false then return; end

            if saveData.aiEligible then
                scehrLib.SpawnCharactersToFaction(
                    owningFaction:name(),
                    {
                        heroes = { constants.balkragData.character },
                        lords = {}
                    },
                    constants.azgalRegionKey
                );
            else
                cm:trigger_dilemma(owningFaction:name(), dilemmaKeys.fateOfGrimgorson);
                ListenToAzgalTakenDilemma(owningFaction, context:region());
            end

            core:remove_listener(listenerKeys.azgalTaken);
        end,
        true
    );
end

local function InitJourneyBalkrag()
    if not saveData.azgalDilemmaFinished then
        ListenToKarakAzgalTaken();
    end
end

cm:add_saving_game_callback(
    function()
        Save();
    end
);

cm:add_first_tick_callback(
    function()
        local isHOLLoaded = scehrHOLMain ~= nil;
        local numPlayerDwarfs = cm:get_human_factions_of_subculture(constants.dwarfSubcultureKey);

        -- Make sure Heroes of Legend is loaded.
        if isHOLLoaded then

            if cm:get_saved_value(saveData.svKey) == nil then
                out("#### SCEHR HOL: JOURNEYS (Balkrag) | Loading first time! ####");

                saveData.aiEligible = #numPlayerDwarfs == 0;
                Save();
            end

            Load();
            InitJourneyBalkrag();
        else
            out("#### SCEHR HOL: JOURNEYS (Balkrag) | Prerequisite script(s) not loaded. This script will not load! ####");
        end
    end
);