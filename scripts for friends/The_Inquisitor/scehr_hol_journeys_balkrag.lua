-- HEROES OF LEGEND: JOURNEYS | BALKRAG | scehr | 01/01/2024

local scehrLib = require("scehr_lib");
local scehrHOLMain = require("scehr_hol_main");

local listenerKeys = {
    azgalTaken = scehrHOLMain.journeysKeyPrefix.."ListenToKarakAzgalTaken",
    azgalTakenDilemma = scehrHOLMain.journeysKeyPrefix.."ListenToKarakAzgalTakenDilemma"
};

local dilemmaKeys = {
    fateOfGrimgorson = "fate_of_grimgorson"
};

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

local balkragICharDetails;

local function UpdateCharacterDetails(iCharacter, factionKey)
    if balkragICharDetails ~= nil then return; end

    if iCharacter then
        balkragICharDetails = iCharacter:character_details();
    else
        out("#### SCEHR: Balkrag ICharacter is nil, searching... ####")
        local balkrag;

        if factionKey ~= "" then
            balkrag = scehrLib.FindCharacterInFactionBySubtype(saveData.balkragProfile.factionKey, constants.balkragData.character.agentSubtype);
        else
            balkrag = scehrLib.FindCharacterInWorldBySubtype();
        end

        if balkrag then balkragICharDetails = balkrag:character_details();
        else out("#### SCEHR: Balkrag was not found. ####");
        end
    end
end

local function LoadBalkrag()
    saveData = cm:get_saved_value(saveData.svKey);

    if saveData.balkragProfile.journeys.hasSpawned then
        UpdateCharacterDetails(nil, saveData.balkragProfile.factionKey);
    end
end

local function SaveBalkrag()
    cm:set_saved_value(saveData.svKey, saveData);
    LoadBalkrag();
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

            SaveBalkrag();
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
            local owningFaction = context:region():owning_faction();

            if owningFaction:is_null_interface() then return; end

            local factionSubculture = owningFaction:subculture();
            if owningFaction:is_human() and factionSubculture == constants.dwarfSubcultureKey then
                cm:trigger_dilemma(owningFaction:name(), dilemmaKeys.fateOfGrimgorson);
                ListenToAzgalTakenDilemma(owningFaction, context:region());
            end
        end,
        false
    );
end

local function InitJourneyBalkrag()
    if not saveData.azgalDilemmaFinished then
        ListenToKarakAzgalTaken();
    end
end

cm:add_saving_game_callback(
    function()
        SaveBalkrag();
    end
);

cm:add_first_tick_callback(
    function()
        local isHOLLoaded = scehrHOLMain ~= nil;
        local numPlayerDwarfs = cm:get_human_factions_of_subculture(constants.dwarfSubcultureKey);

        -- Make sure Heroes of Legend is loaded.
        if isHOLLoaded and #numPlayerDwarfs > 0 then

            if cm:get_saved_value(saveData.svKey) == nil then
                out("#### SCEHR HOL: JOURNEYS (Balkrag) | Loading Balkrag first time! ####");
                SaveBalkrag();
            end

            LoadBalkrag();
            InitJourneyBalkrag();
        else
            out("#### SCEHR HOL: JOURNEYS (Balkrag) | Prerequisite script(s) not loaded. This script will not load! ####");
        end
    end
);