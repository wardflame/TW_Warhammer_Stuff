-- HEROES OF LEGEND: JOURNEYS | BALKRAG | scehr | 04/01/2024

-- cm:add_character_model_override(owningFaction:faction_leader(), "ulther_stonehammer")

local scehrLib = require("scehr_lib");
local scehrHOLMain = require("scehr_hol_main");

local listenerKeys = {
    alembenconSpawned = scehrHOLMain.journeysKeyPrefix.."ListenToAlembenconSpawned",
    empBuildTancred = scehrHOLMain.journeysKeyPrefix.."ListenToTancredBuiltEmpire",
    empInheritTancred = scehrHOLMain.journeysKeyPrefix.."ListenToTancredInheritedEmpire",
    empTancredDilemma = scehrHOLMain.journeysKeyPrefix.."ListenToTancredBuiltDilemma",
    empTancredSiegeDilemma = scehrHOLMain.journeysKeyPrefix.."ListenToFateOfAlembenconDilemma"
};

local messages = {
    fateOfAlembencon0 = {
        title = "event_feed_strings_text_hol_tancred_execute_event_title",
        primary = "event_feed_strings_text_hol_tancred_execute_event_primary_detail",
        secondary = "event_feed_strings_text_hol_tancred_execute_event_secondary_detail",
        index = 2013
    },
    fateOfAlembencon1 = {
        title = "event_feed_strings_text_hol_tancred_ransom_event_title",
        primary = "event_feed_strings_text_hol_tancred_ransom_event_primary_detail",
        secondary = "event_feed_strings_text_hol_tancred_ransom_event_secondary_detail",
        index = 2013
    },
    fateOfAlembencon2 = {
        title = "event_feed_strings_text_hol_tancred_release_event_title",
        primary = "event_feed_strings_text_hol_tancred_release_event_primary_detail",
        secondary = "event_feed_strings_text_hol_tancred_release_event_secondary_detail",
        index = 2013
    }
};

local dilemmaKeys = {
    tancredClaimed = "tancred_castle_dilemma",
    fateOfAlembencon = "fate_of_viscount_dalembençon"
};

local constants = {
    factions = {
        couronne = "wh_main_brt_bretonnia"
    },
    subcultures = {
        empire = "wh_main_sc_emp_empire",
        bretonnia = "wh_main_sc_brt_bretonnia"
    },
    regions = {
        marienburg = "wh3_main_combi_region_marienburg"
    },
    effectBundles = {
        tancredCastle0 = "tancred_castle_dilemma_besiege_castle",
        tancredCastle1 = "tancred_castle_dilemma_reinforce_claim",
        tancredCastle2 = "tancred_castle_dilemma_tribute",
        tancredCastle2Tax = "tancred_castle_dilemma_shared_tax",
        tancredGarrisonExecuted = "tancred_garrison_executed",
        tancredGarrisonReturned = "tancred_garrison_returned_safely"
    },
    empTancredKey = "wh_main_emp_industry_basic_1", -- emp_tancred_castle
    tancredRegionKey = "wh3_main_combi_region_marienburg",
    alembenconData = {
        couronneKey = "wh_main_brt_bretonnia",
        character = {
            type = "champion",
            subtype = "the_viscount",
            forename = "Viscount",
            surname = "d'Alembençon",
            clanName = ""
        }
    }
};

local saveData = {
    svKey = "sv_hol_AlembenconJourney",
    aiEligible = false,
    journeys = {
        fateOfAlembencon = {
            alembenconSpawned = false,
            claimFaction = ""
        }
    },
    profiles = {
    }
};

local function Load()
    saveData = cm:get_saved_value(saveData.svKey);
end

local function Save()
    cm:set_saved_value(saveData.svKey, saveData);
    Load();
end

local function SpawnAlembenconForBretonnia()
    if saveData.journeys.fateOfAlembencon.alembenconSpawned then return; end

    local charTable = {
        heroes = { constants.alembenconData.character },
        lords = {}
    }

    local couronneIFaction = cm:get_faction(constants.factions.couronne);

    if couronneIFaction:is_null_interface() == false then
        local couronneHome = cm:get_faction(constants.factions.couronne):home_region():name();
        scehrLib.SpawnCharactersToFaction(constants.factions.couronne, charTable, couronneHome);

    else
        local bretonnians = scehrLib.GetAllFactionsOfSubculture(constants.subcultures.bretonnia);

        if #bretonnians > 0 then
            local randomBretonnian = bretonnians[cm:random_number(#bretonnians, 1)];
            local bretonnianHome = cm:get_faction(randomBretonnian):home_region():name();
            scehrLib.SpawnCharactersToFaction(randomBretonnian, charTable, bretonnianHome);
        end
    end
end

local function ListenToFateOfAlembenconDilemma()
    out("#### SCEHR HOL: JOURNEYS (Alembencon) | Listening to Fate of Alembencon Dilemma!");
    core:add_listener(
        listenerKeys.empTancredSiegeDilemma,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == dilemmaKeys.fateOfAlembencon;
        end,
        function(context)
            local choice = context:choice();

            -- Slaughter the captives.
            if choice == 0 then
                scehrLib.CreateMessageEvent(saveData.journeys.fateOfAlembencon.claimFaction, messages.fateOfAlembencon0);
                cm:apply_effect_bundle(constants.effectBundles.tancredGarrisonExecuted, saveData.journeys.fateOfAlembencon.claimFaction, cm:random_number(100, 50));

                local bretonnians = scehrLib.GetAllFactionsOfSubculture(constants.subcultures.bretonnia);

                if #bretonnians > 0 then
                    for i = 1, #bretonnians do
                        cm:force_declare_war(bretonnians[i]:name(), saveData.journeys.fateOfAlembencon.claimFaction, true, true);
                    end
                end
            end

            -- Ransom the captives.
            if choice == 1 then
                scehrLib.CreateMessageEvent(saveData.journeys.fateOfAlembencon.claimFaction, messages.fateOfAlembencon1);
                cm:apply_effect_bundle(constants.effectBundles.tancredCastle0, saveData.journeys.fateOfAlembencon.claimFaction, cm:random_number(50, 25));
                SpawnAlembenconForBretonnia();
            end

            -- Spare the captives.
            if choice == 2 then
                scehrLib.CreateMessageEvent(saveData.journeys.fateOfAlembencon.claimFaction, messages.fateOfAlembencon2);
                cm:apply_effect_bundle(constants.effectBundles.tancredGarrisonReturned, saveData.journeys.fateOfAlembencon.claimFaction, cm:random_number(30, 15));
                SpawnAlembenconForBretonnia();
            end
        end,
        false
    );
end

local function ListenToTancredClaimedDilemma()
    out("#### SCEHR HOL: JOURNEYS (Alembencon) | Listening to Tancred Claimed Dilemma!");
    core:add_listener(
        listenerKeys.empTancredDilemma,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == dilemmaKeys.tancredClaimed;
        end,
        function(context)
            local choice = context:choice();

            -- Attack Tancred.
            if choice == 0 then
                cm:trigger_dilemma(saveData.journeys.fateOfAlembencon.claimFaction, dilemmaKeys.fateOfAlembencon);
                ListenToFateOfAlembenconDilemma();
            end

            -- Annex Tancred.
            if choice == 1 then
                cm:apply_effect_bundle(constants.effectBundles.tancredCastle1, saveData.journeys.fateOfAlembencon.claimFaction, cm:random_number(30, 15));
                SpawnAlembenconForBretonnia();
            end

            -- Give autonomy to Tancred.
            if choice == 2 then
                cm:apply_effect_bundle(constants.effectBundles.tancredCastle2, saveData.journeys.fateOfAlembencon.claimFaction, cm:random_number(100, 50));
                cm:apply_effect_bundle_to_region(constants.effectBundles.tancredCastle2Tax, constants.regions.marienburg, 0);
                SpawnAlembenconForBretonnia();

                cm:add_unit_to_faction_mercenary_pool(
                    cm:get_faction(saveData.journeys.fateOfAlembencon.claimFaction),
                    "wh_pro04_brt_cav_knights_of_the_realm_ror_0",
                    "renown",
                    2,
                    0.25,
                    2,
                    1,
                    "",
                    "",
                    "",
                    true,
                    "wh_pro04_brt_cav_knights_of_the_realm_ror_0"
                );
            end
        end,
        false
    );
end

local function ListenToTancredClaimed()
    out("#### SCEHR HOL: JOURNEYS (Alembencon) | Adding Empire Tancred claim listeners!");
    core:add_listener(
        listenerKeys.empBuildTancred,
        "FactionTurnStart",
        function(context)
            return context:faction():subculture() == constants.subcultures.empire;
        end,
        function(context)
            local empFaction = context:faction();
            if empFaction:is_human() == false and saveData.aiEligible == false then return; end

            if cm:faction_contains_building(empFaction, constants.empTancredKey) then

                if saveData.aiEligible then
                    local couronneIFaction = cm:get_faction(constants.factions.couronne);
                    if couronneIFaction:is_null_interface() == false then
                        scehrLib.SpawnCharactersToFaction(
                            constants.factions.couronne,
                            { heroes = { constants.alembenconData.character }, lords = {} },
                            couronneIFaction:home_region()
                        );
                    else
                        local bretonnians = scehrLib.GetAllFactionsOfSubculture(constants.subcultures.bretonnia);

                        if #bretonnians > 0 then
                            local bretonnian = cm:get_faction(bretonnians[cm:random_number(#bretonnians, 1)]);

                            scehrLib.SpawnCharactersToFaction(
                                bretonnian:name(),
                                { heroes = { constants.alembenconData.character }, lords = {} },
                                bretonnian:home_region()
                            );
                        end
                    end
                else
                    cm:trigger_dilemma(empFaction:name(), dilemmaKeys.tancredClaimed);
                    ListenToTancredClaimedDilemma();
                end

                saveData.journeys.fateOfAlembencon.claimFaction = empFaction:name();
                Save();

                core:remove_listener(listenerKeys.empBuildTancred);
            end
        end,
        true
    );
end

local function ListenToAlembenconSpawned()
    out("#### SCEHR HOL: JOURNEYS (Alembencon) | Listening to Alembencon spawn!");
    core:add_listener(
        listenerKeys.alembenconSpawned,
        "CharacterCreated",
        function(context)
            return context:character():character_subtype(constants.alembenconData.character.subtype);
        end,
        function(context)
            saveData.journeys.fateOfAlembencon.alembenconSpawned = true;
            Save();
        end,
        false
    );
end

local function InitJourneyAlembencon()
    if saveData.journeys.fateOfAlembencon.alembenconSpawned == false then
        ListenToAlembenconSpawned();
    end

    if saveData.journeys.fateOfAlembencon.claimFaction == "" then
        ListenToTancredClaimed();
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
        local numEmpirePlayers = cm:get_human_factions_of_subculture(constants.subcultures.empire);

        -- Make sure Heroes of Legend is loaded.
        if isHOLLoaded then

            if cm:get_saved_value(saveData.svKey) == nil then
                out("#### SCEHR HOL: JOURNEYS (Alembencon) | Loading first time! ####");

                saveData.aiEligible = #numEmpirePlayers == 0;
                Save();
            end

            Load();
            InitJourneyAlembencon();
        else
            out("#### SCEHR HOL: JOURNEYS (Alembencon) | Prerequisite script(s) not loaded. This script will not load! ####");
        end
    end
);