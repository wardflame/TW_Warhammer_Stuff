-- HEROES OF LEGEND: JOURNEYS | BRUNNER | scehr | 14/12/2023

local scehrLib = require("scehr_lib");
local holMain = require("scehr_hol_main");

local bretonniaSubcultureKey = "wh_main_sc_brt_bretonnia";
local bretonniaCouronneKey = "wh_main_brt_bretonnia";

local messages = {
    augustineHuntingMessage = {
        title = "event_feed_strings_text_hol_brunner_augustine_hunt_title",
        primary = "event_feed_strings_text_hol_brunner_augustine_hunt_primary_detail",
        secondary = "event_feed_strings_text_hol_brunner_augustine_hunt_secondary_detail",
        index = 2013
    },
    augustineKilledMessage = {
        title = "event_feed_strings_text_hol_augustine_kill_event_title",
        primary = "event_feed_strings_text_hol_augustine_kill_event_primary_detail",
        secondary = "event_feed_strings_text_hol_augustine_kill_event_secondary_detail",
        index = 2013
    },
    augustineExiledMessage = {
        title = "event_feed_strings_text_hol_augustine_exile_event_title",
        primary = "event_feed_strings_text_hol_augustine_exile_event_primary_detail",
        secondary = "event_feed_strings_text_hol_augustine_exile_event_secondary_detail",
        index = 2013
    },
    augustineRansomMessage = {
        title = "event_feed_strings_text_hol_augustine_ransom_event_title",
        primary = "event_feed_strings_text_hol_augustine_ransom_event_primary_detail",
        secondary = "event_feed_strings_text_hol_augustine_ransom_event_secondary_detail",
        index = 2013
    },
    augustinePardonMessage = {
        title = "event_feed_strings_text_hol_augustine_pardon_event_title",
        primary = "event_feed_strings_text_hol_augustine_pardon_event_primary_detail",
        secondary = "event_feed_strings_text_hol_augustine_pardon_event_secondary_detail",
        index = 2013
    },
    brunnerAmbushEscapeMessage = {
        title = "event_feed_strings_text_hol_brunner_ambush_escape_title",
        primary = "event_feed_strings_text_hol_brunner_ambush_escape_primary_detail",
        secondary = "event_feed_strings_text_hol_brunner_ambush_escape_secondary_detail",
        index = 2013
    },
    brunnerAmbushDeathMessage = {
        title = "event_feed_strings_text_hol_brunner_ambush_death_title",
        primary = "event_feed_strings_text_hol_brunner_ambush_death_primary_detail",
        secondary = "event_feed_strings_text_hol_brunner_ambush_death_secondary_detail",
        index = 2013
    },
    brunnerFieldEscapeMessage = {
        title = "event_feed_strings_text_hol_augustine_field_flee_title",
        primary = "event_feed_strings_text_hol_augustine_field_flee_primary_detail",
        secondary = "event_feed_strings_text_hol_augustine_field_flee_secondary_detail",
        index = 2013
    },
    brunnerFieldDeathMessage = {
        title = "event_feed_strings_text_hol_augustine_field_engage_title",
        primary = "event_feed_strings_text_hol_augustine_field_engage_primary_detail",
        secondary = "event_feed_strings_text_hol_augustine_field_engage_secondary_detail",
        index = 2013
    },
    battleDefeatBothSurvive = {
        title = "event_feed_strings_text_hol_ambush_both_survive_title",
        primary = "event_feed_strings_text_hol_ambush_both_survive_primary_detail",
        secondary = "event_feed_strings_text_hol_ambush_both_survive_secondary_detail",
        index = 2013
    },
    battleDefeatLordWounded = {
        title = "event_feed_strings_text_hol_ambush_lord_wounded_title",
        primary = "event_feed_strings_text_hol_ambush_lord_wounded_primary_detail",
        secondary = "event_feed_strings_text_hol_ambush_lord_wounded_secondary_detail",
        index = 2013
    },
    battleDefeatLordKilled = {
        title = "event_feed_strings_text_hol_ambush_lord_killed_title",
        primary = "event_feed_strings_text_hol_ambush_lord_killed_primary_detail",
        secondary = "event_feed_strings_text_hol_ambush_lord_killed_secondary_detail",
        index = 2013
    }
};

local listenerKeys = {
    brunnerSpawn = holMain.journeysKeyPrefix.."ListenToBrunnerSpawn",
    brunnerContracts = holMain.journeysKeyPrefix.."ListenToBrunnerFindContracts",
    brunnerContractHandler = holMain.journeysKeyPrefix.."ListenToBrunnerContractHandler",
    brunnerSecretIdentity = holMain.journeysKeyPrefix.."ListenToBrunnerSecretIdentity",
    augustineHuntListener = holMain.journeysKeyPrefix.."ListenToHuntForBrunner",
    augustineAmbushDilemma = holMain.journeysKeyPrefix.."ListenToAugustineAmbushDilemma",
    augustineBattleEnded = holMain.journeysKeyPrefix.."ListenToAugustineBattleEnded",
    augustineDefeated = holMain.journeysKeyPrefix.."ListenToAugustineDefeatedDilemma",
    augustineDefeatedBretonnia = holMain.journeysKeyPrefix.."ListenToAugustineDefeatedBretonniaDilemma",
    augustineBattleVictorious = holMain.journeysKeyPrefix.."ListenToAugustineVictoriousDilemma",
};

local dilemmaKeys = {
    secretIdentity = "brunner_secret_identity";
    augustineAmbush = "brunner_ambushed";
    augustineDefeated = "fate_of_augustine";
    augustineDefeatedBretonnia = "fate_of_augustine_bretonnia";
    augustineVictorious = "augustine_ambush_win";
};

local constants = {
    rollDeathThreshold = -40, -- If a character rolls this difference from a combat threshold, we should kill them.
    augustineData = {
        factionKey = "mixer_brt_viscountcy_de_chegney",
        character = {
            agentType = "general",
            agentSubtype = "augustine_de_chegney",
            forename = "names_name_444457",
            surname = "names_name_444458",
            clanName = "",
            maleOrFemale = true
        },
        siegeForce = {
            "wh_dlc07_brt_inf_men_at_arms_1",
            "wh_dlc07_brt_inf_men_at_arms_1",
            "wh_dlc07_brt_cav_royal_hippogryph_knights_0",
            "wh_dlc07_brt_cav_royal_pegasus_knights_0",
            "wh_dlc07_brt_cav_royal_pegasus_knights_0",
            "wh_main_brt_cav_knights_of_the_realm",
            "wh_dlc07_brt_cav_knights_errant_0",
            "wh_dlc07_brt_cav_knights_errant_0",
            "wh_dlc07_brt_inf_foot_squires_0",
            "wh_main_brt_art_field_trebuchet",
            "wh_dlc07_brt_peasant_mob_0",
            "wh_dlc07_brt_peasant_mob_0",
            "wh_dlc04_emp_inf_free_company_militia_0",
            "wh_dlc04_emp_inf_free_company_militia_0",
            "wh_dlc04_emp_inf_free_company_militia_0",
            "wh3_main_ogr_inf_maneaters_2",
            "wh3_main_ogr_inf_maneaters_2",
            "gutbusters_gutbusters",
            "wh_main_emp_art_helstorm_rocket_battery"

        },
        fieldForce = {
            "wh_dlc07_brt_inf_men_at_arms_1",
            "wh_dlc07_brt_inf_men_at_arms_1",
            "wh_dlc07_brt_cav_royal_hippogryph_knights_0",
            "wh_dlc07_brt_cav_royal_pegasus_knights_0",
            "wh_dlc07_brt_cav_royal_pegasus_knights_0",
            "wh_main_brt_cav_knights_of_the_realm",
            "wh_dlc07_brt_cav_knights_errant_0",
            "wh_dlc07_brt_cav_knights_errant_0",
            "wh_dlc07_brt_inf_foot_squires_0",
            "wh_dlc07_brt_peasant_mob_0",
            "wh_dlc07_brt_peasant_mob_0",
            "wh_dlc04_emp_inf_free_company_militia_0",
            "wh_dlc04_emp_inf_free_company_militia_0",
            "wh_dlc04_emp_inf_free_company_militia_0",
            "wh3_main_ogr_inf_maneaters_2",
            "wh3_main_ogr_inf_maneaters_2",
            "gutbusters_gutbusters",
            "wh_main_brt_inf_peasant_bowmen",            
            "wh_main_brt_inf_peasant_bowmen"

        },
        defeatTrait = "augustine_defeat_trait",
        recruitedTrait = "augustine_enlisted",
        exileSubcultures = {
            "wh_main_sc_teb_teb",
            "wh3_main_sc_ksl_kislev",
            "wh_main_sc_vmp_vampire_counts",
            "wh2_dlc11_sc_cst_vampire_coast"
        },
        combatDifficultyThreshold = 60,
        baseHuntChance = 5
    },
    brunnerData = {
        skills = {
            secretIdentity = "secret_identity",
            findContracts = "infamous_bounty_hunter"
        },
        character = {
            agentType = "champion",
            agentSubtype = "bounty_hunter_brunner",
            forename = "Brunner",
            surname = "",
            clanName = ""
        },
        traits = {
            identityRevealed = "brunner_identity_revealed",
            identityConcealed = "brunner_identity_concealed",
            augustineRecruited = "brunner_identity_revealed_augustine_enlisted"
        },
        turnsToNextContract = 8,
        contractMissions = {
            "brunner_qb_1",
            "brunner_qb_2",
            "brunner_qb_3"
        }
    }
};

local saveData = {
    svKey = "sv_hol_BrunnerJourney",
    aiEligible = false,
    profiles = {
        augustine = {
            isDead = false,
            huntChance = 100,
        },
        brunner = {
            isDead = false,
            factionKey = "",
            subcultureKey = "",
            journeys = {
                hasSpawned = false,
                hasContracts = false,
                contractsTurnsElapsed = 0,
                contractsMissionIndex = 1,
                isRevealed = false,
                evadedAugustineCount = 1,
                hasDefeatedAugustine = false
            }
        }
    }
};

local brunnerICharDetails;

local function UpdateBrunnerDetails(iCharacter, factionKey)
    if brunnerICharDetails ~= nil then return; end

    if iCharacter then
        brunnerICharDetails = iCharacter:character_details();
    else
        out("#### SCEHR: Brunner ICharacter is nil, searching... ####")
        local brunner;

        if factionKey ~= "" then
            brunner = scehrLib.FindCharacterInFactionBySubtype(saveData.profiles.brunner.factionKey, constants.brunnerData.character.agentSubtype);
        else
            brunner = scehrLib.FindCharacterInWorldBySubtype();
        end

        if brunner then brunnerICharDetails = brunner:character_details();
        else out("#### SCEHR: Brunner was not found. ####");
        end
    end
end

local function Load()
    saveData = cm:get_saved_value(saveData.svKey);

    if saveData.profiles.brunner.journeys.hasSpawned then
        UpdateBrunnerDetails(nil, saveData.profiles.brunner.factionKey);
    end
end

local function Save()
    cm:set_saved_value(saveData.svKey, saveData);
    Load();
end

-- Dice roll against Augustine difficulty threshold. Returns bool for success or failure, and the roll difference.
local function CharacterVersusAugustine(charRank, isDisadvantaged)
    out("#### SCEHR HOL: JOURNEYS (Brunner) | A character is facing Augustine!");

    local multiplier = 2;

    if isDisadvantaged then multiplier = 1; end

    local roll = cm:random_number(100, 1) + charRank * multiplier;
    local difference = roll - constants.augustineData.combatDifficultyThreshold;

    if roll >= constants.augustineData.combatDifficultyThreshold then
        return true, difference;
    end

    return false, difference;
end

local function EscapeFromAugustine()
    saveData.profiles.brunner.journeys.evadedAugustineCount = scehrLib.IncrementNumber(saveData.profiles.brunner.journeys.evadedAugustineCount);
    saveData.profiles.augustine.huntChance = constants.augustineData.baseHuntChance * saveData.profiles.brunner.journeys.evadedAugustineCount;

    Save();

    out("#### SCEHR HOL: JOURNEYS (Brunner) | Brunner evades Augustine! | Evade Count: "..tostring(saveData.profiles.brunner.journeys.evadedAugustineCount).." ####");
end

local function ListenToAugustineVictoriousDilemma(pendingBattle)
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening to Augustine battle victory dilemma!");
    core:add_listener(
        listenerKeys.augustineBattleVictorious,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == dilemmaKeys.augustineVictorious;
        end,
        function(context)
            local choice = context:choice();
            local playerLord = pendingBattle:defender();

            -- LORD/AUGUSTINE INTERVENTION
            if choice == 0 then
                local lordBeatAugustine, difference = CharacterVersusAugustine(playerLord:rank(), true);

                local isLL = cm:is_agent_transformation_available(playerLord:character_subtype_key());

                if lordBeatAugustine then
                    scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.battleDefeatBothSurvive);
                else
                    if difference <= constants.rollDeathThreshold and not isLL then
                        out("#### SCEHR HOL: DILEMMAS | Augustine defeats normal Lord, will be killed. ####");
                        scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.battleDefeatLordKilled);
                        scehrLib.KillCharacter(playerLord:character_details(), false, false, false);
                    else
                        out("#### SCEHR HOL: DILEMMAS | Augustine defeats LL, will be wounded. ####");
                        scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.battleDefeatLordWounded);
                        scehrLib.WoundCharacter(playerLord, false, isLL);
                    end
                end

                EscapeFromAugustine();
            end

            -- BRUNNER FACES AUGUSTINE, CAN DIE HERE
            if choice == 1 then
                local brunnerBeatAugustine, difference = CharacterVersusAugustine(brunnerICharDetails:character():rank(), true);

                if brunnerBeatAugustine then
                    scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.brunnerFieldEscapeMessage);
                    EscapeFromAugustine();
                else
                    scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.brunnerFieldDeathMessage);

                    scehrLib.KillCharacter(brunnerICharDetails, false, true, false);

                    saveData.profiles.brunner.isDead = true;
                    saveData.profiles.augustine.isDead = true;
                end
            end

            Save();
        end,
        false
    );
end

local function ListenToAugustineDefeatedBretonniaDilemma(pendingBattle)
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening to Augustine defeat Bretonnian dilemma!");
    core:add_listener(
        listenerKeys.augustineDefeatedBretonnia,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == dilemmaKeys.augustineDefeatedBretonnia;
        end,
        function(context)
            local choice = context:choice();

            -- KILL AUGUSTINE
            if choice == 0 then
                scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.augustineKilledMessage);

                cm:force_remove_trait(cm:char_lookup_str(brunnerICharDetails:character()), constants.brunnerData.traits.identityRevealed);
                cm:force_add_trait(cm:char_lookup_str(brunnerICharDetails:character()), constants.augustineData.defeatTrait, true);
            end

            -- ENLIST AUGUSTINE
            if choice == 1 then
                scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.augustinePardonMessage);

                cm:force_remove_trait(cm:char_lookup_str(brunnerICharDetails:character()), constants.brunnerData.traits.identityRevealed);
                cm:force_add_trait(cm:char_lookup_str(brunnerICharDetails:character()), constants.brunnerData.traits.augustineRecruited, true);

                local success, augustine = scehrLib.SpawnLordToFaction(
                    saveData.profiles.brunner.factionKey,
                    constants.augustineData.character,
                    true
                );

                if success then
                    cm:force_add_trait_to_character_details(augustine, constants.augustineData.recruitedTrait);
                end
            end

            -- EXILE AUGUSTINE
            if choice == 2 then
                scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.augustineExiledMessage);

                cm:force_remove_trait(cm:char_lookup_str(brunnerICharDetails:character()), constants.brunnerData.traits.identityRevealed);

                scehrLib.SpawnLordToRandomFactionBySubcultures(
                    constants.augustineData.exileSubcultures,
                    constants.augustineData.character,
                    true
                );
            end
        end,
        false
    );
end

local function ListenToAugustineDefeatedDilemma()
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening to Augustine defeat dilemma!");
    core:add_listener(
        listenerKeys.augustineDefeated,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == dilemmaKeys.augustineDefeated;
        end,
        function(context)
            local choice = context:choice();

            -- KILL AUGUSTINE
            if choice == 0 then
                scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.augustineKilledMessage);

                cm:force_remove_trait(cm:char_lookup_str(brunnerICharDetails:character()), constants.brunnerData.traits.identityRevealed);
                cm:force_add_trait(cm:char_lookup_str(brunnerICharDetails:character()), constants.augustineData.defeatTrait, true);

                saveData.profiles.augustine.isDead = true;
            end

            -- RANSOM AUGUSTINE
            if choice == 1 then
                scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.augustineRansomMessage);

                local ransomSuccess;
                local augustineDetails;

                ransomSuccess, augustineDetails = scehrLib.SpawnLordToFaction(
                    bretonniaCouronneKey,
                    constants.augustineData.character,
                    true
                );

                if not ransomSuccess then
                    ransomSuccess, augustineDetails = scehrLib.SpawnLordToRandomFactionBySubcultures(
                        { bretonniaSubcultureKey },
                        constants.augustineData.character,
                        true
                    );
                end

                if augustineDetails ~= nil then
                    out("#### SCEHR HOL: JOURNEYS (Brunner) | "..tostring(augustineDetails:get_forename().." ransomed to: "..tostring(augustineDetails:faction():name())));
                end
            end

            saveData.profiles.brunner.journeys.hasDefeatedAugustine = true;
            Save();
        end,
        false
    );
end

local function ListenToAugustineBattleEnded()
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening to Brunner/Augustine battle ended!");
    core:add_listener(
        listenerKeys.augustineBattleEnded,
        "BattleCompleted",
        function()
            return cm:pending_battle_cache_faction_is_involved(saveData.profiles.brunner.factionKey);
        end,
        function(context)
            local pendingBattle = cm:model():pending_battle();
            local augustineWon = pendingBattle:attacker_won();

            local playerLord = pendingBattle:defender();

            if pendingBattle:attacker():is_null_interface() == false then
                scehrLib.KillCharacter(pendingBattle:attacker():character_details(), true, true, true);
            end

            if augustineWon then

                if playerLord:is_null_interface() or playerLord:is_wounded() then
                    out("#### SCEHR HOL: JOURNEYS (Brunner) | Brunner has no lord after battle and must defend himself!");

                    local brunnerWon, difference = CharacterVersusAugustine(brunnerICharDetails:character():rank(), true);

                    if brunnerWon then
                        scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.battleDefeatLordKilled);
                        EscapeFromAugustine();

                        out("#### SCEHR HOL: JOURNEYS (Brunner) | Brunner defends himself and escapes Augustine!");
                    else
                        scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.brunnerFieldDeathMessage);
                        scehrLib.KillCharacter(brunnerICharDetails, false, true, false);

                        saveData.profiles.brunner.isDead = true;
                        saveData.profiles.augustine.isDead = true;

                        Save();

                        core:remove_listener(listenerKeys.augustineHuntListener);

                        out("#### SCEHR HOL: JOURNEYS (Brunner) | Brunner fails and dies with Augustine!");
                    end
                else
                    cm:trigger_dilemma(saveData.profiles.brunner.factionKey, dilemmaKeys.augustineVictorious);
                    ListenToAugustineVictoriousDilemma(pendingBattle);
                end

                return;
            end

            if saveData.profiles.brunner.subcultureKey == bretonniaSubcultureKey then
                cm:trigger_dilemma(saveData.profiles.brunner.factionKey, dilemmaKeys.augustineDefeatedBretonnia);
                ListenToAugustineDefeatedBretonniaDilemma();
            else
                cm:trigger_dilemma(saveData.profiles.brunner.factionKey, dilemmaKeys.augustineDefeated);
                ListenToAugustineDefeatedDilemma();
            end

            core:remove_listener(listenerKeys.augustineHuntListener);
        end,
        false
    );
end

local function AugustineBattleQuery()
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Running Augustine battle query!");
    local brunnerForce = brunnerICharDetails:character():embedded_in_military_force();
    local brunnerRegion = brunnerICharDetails:character():region():name();

    local spawnX, spawnY;
    local augustineForceUnits;

    if brunnerForce:has_garrison_residence() then
        spawnX, spawnY = cm:find_valid_spawn_location_for_character_from_settlement(
            constants.augustineData.factionKey,
            brunnerRegion,
            false,
            true,
            5
        );
        augustineForceUnits = table.concat(constants.augustineData.siegeForce, ",");
    else
        spawnX, spawnY = cm:find_valid_spawn_location_for_character_from_position(
            constants.augustineData.factionKey,
            brunnerICharDetails:character():logical_position_x(),
            brunnerICharDetails:character():logical_position_y(),
            true,
            5
        );
        augustineForceUnits = table.concat(constants.augustineData.fieldForce, ",");
    end

    cm:create_force_with_general(
        constants.augustineData.factionKey,
        augustineForceUnits,
        brunnerRegion,
        spawnX,
        spawnY,
        constants.augustineData.character.agentType,
        constants.augustineData.character.agentSubtype,
        "",
        "",
        "",
        "",
        true,
        function(augustine_cqi)
            local augustineCharacter = cm:get_character_by_cqi(augustine_cqi);
            cm:change_character_custom_name(
                augustineCharacter,
                "Augustine",
                "de Chegney",
                "",
                ""
            );

            local augustineFaction = augustineCharacter:faction():name();
            local augustineForce = augustineCharacter:military_force();

            cm:treasury_mod(augustineFaction, 8000);

            out("#### SCEHR HOL: JOURNEYS (Brunner) | Augustine attacking Brunner! | Augustine Faction: "..tostring(augustineFaction).." | Augustine Force: "..tostring(augustineForce).." ####");

            cm:disable_event_feed_events(true, "wh_event_category_diplomacy", "", "");

            cm:force_declare_war(augustineFaction, saveData.profiles.brunner.factionKey, false, false);
            cm:force_attack_of_opportunity(augustineForce:command_queue_index(), brunnerForce:command_queue_index(), false);

            ListenToAugustineBattleEnded();
        end
    );
end

local function ListenToAugustineAmbushDilemma()
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening to Brunner ambush dilemma!");
    core:add_listener(
        listenerKeys.augustineAmbushDilemma,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == dilemmaKeys.augustineAmbush;
        end,
        function(context)
            local choice = context:choice();

            -- BRUNNER FLEES AUGUSTINE
            if choice == 0 then
                scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.brunnerAmbushEscapeMessage);
                EscapeFromAugustine();
            end

            -- BRUNNER FIGHTS AUGUSTINE
            if choice == 1 then
                out("#### SCEHR HOL: JOURNEYS (Brunner) | Brunner takes Augustine to the grave with him!");
                scehrLib.KillCharacter(brunnerICharDetails, false, true, false);

                scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.brunnerAmbushDeathMessage);

                saveData.profiles.brunner.isDead = true;
                saveData.profiles.augustine.isDead = true;

                core:remove_listener(listenerKeys.augustineHuntListener);
            end

            Save();
        end,
        false
    );
end

local function ListenToHuntForBrunner()
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening for hunt for Brunner!");
    core:add_listener(
        listenerKeys.augustineHuntListener,
        "FactionTurnStart",
        function(context)
            return context:faction():name() == saveData.profiles.brunner.factionKey;
        end,
        function(context)
            local diceRoll = cm:random_number(100, 1);
            local huntChance = saveData.profiles.augustine.huntChance + constants.augustineData.baseHuntChance;

            out("#### SCEHR HOL: JOURNEYS (Brunner) | Augustine is hunting! | Hunt Chance: "..tostring(huntChance).." | Roll: "..tostring(diceRoll).." ####")

            if diceRoll <= huntChance then

                if brunnerICharDetails:character():is_embedded_in_military_force() == false then
                    cm:trigger_dilemma(saveData.profiles.brunner.factionKey, dilemmaKeys.augustineAmbush);
                    ListenToAugustineAmbushDilemma();
                    return;
                end

                AugustineBattleQuery();
            else
                if huntChance <= 100 then
                    saveData.profiles.augustine.huntChance = huntChance;

                    Save();

                    if huntChance % 15 == 0 then
                        scehrLib.CreateMessageEvent(saveData.profiles.brunner.factionKey, messages.augustineHuntingMessage);
                    end
                end
            end
        end,
        true
    );
end

local function ListenToSecretIdentityDilemma()
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening to Brunner secret identity dilemma!");
    core:add_listener(
        holMain.journeysKeyPrefix.."ListenToSecretIdentityDilemma",
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == dilemmaKeys.secretIdentity;
        end,
        function(context)
            local choice = context:choice();

            if choice == 0 then
                cm:force_add_trait(cm:char_lookup_str(brunnerICharDetails:character()), constants.brunnerData.traits.identityRevealed, true);
                saveData.profiles.brunner.journeys.isRevealed = true;
                ListenToHuntForBrunner();
            end

            if choice == 1 then
                cm:force_add_trait(cm:char_lookup_str(brunnerICharDetails:character()), constants.brunnerData.traits.identityConcealed, true);
                saveData.profiles.brunner.journeys.isRevealed = false;
            end

            Save();
        end,
        false
    );
end

local function ListenToBrunnerSecretIdentity()
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening to Brunner secret identity!");
    core:add_listener(
        listenerKeys.brunnerSecretIdentity,
        "CharacterSkillPointAllocated",
        function(context)
            return context:skill_point_spent_on() == constants.brunnerData.skills.secretIdentity;
        end,
        function(context)
            if saveData.aiEligible then
                local spawnSuccess = scehrLib.SpawnLordToFaction(
                    bretonniaCouronneKey,
                    constants.augustineData.character,
                    true
                );

                if not spawnSuccess then
                    scehrLib.SpawnLordToRandomFactionBySubcultures(
                        { bretonniaSubcultureKey },
                        constants.augustineData.character,
                        true
                    );
                end

                saveData.profiles.brunner.journeys.isRevealed = true;
                Save();
            else
                cm:trigger_dilemma(saveData.profiles.brunner.factionKey, dilemmaKeys.secretIdentity);
                ListenToSecretIdentityDilemma();
            end
        end,
        false
    );
end

local function BrunnerContractHandler()
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening to Brunner contract handler!");
    core:add_listener(
        listenerKeys.brunnerContractHandler,
        "FactionTurnStart",
        function(context)
            return context:faction():name() == saveData.profiles.brunner.factionKey;
        end,
        function(context)
            local turnsElapsed = scehrLib.IncrementNumber(saveData.profiles.brunner.journeys.contractsTurnsElapsed);
            local turnsToNextContract = constants.brunnerData.turnsToNextContract;

            if turnsElapsed > turnsToNextContract * #constants.brunnerData.contractMissions then
                out("#### SCEHR HOL: JOURNEYS (Brunner) | Brunner's contracts have ended!");
                core:remove_listener(listenerKeys.brunnerContractHandler);
                return;
            end

            saveData.profiles.brunner.journeys.contractsTurnsElapsed = turnsElapsed;

            if turnsElapsed % turnsToNextContract == 0 then
                saveData.profiles.brunner.journeys.contractsMissionIndex = scehrLib.IncrementNumber(saveData.profiles.brunner.journeys.contractsMissionIndex);

                cm:trigger_mission(
                    saveData.profiles.brunner.factionKey,
                    constants.brunnerData.contractMissions[saveData.profiles.brunner.journeys.contractsMissionIndex]
                );
            end

            Save();
        end,
        true
    );
end

local function ListenToBrunnerFindContracts()
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening to Brunner contracts!");
    core:add_listener(
        listenerKeys.brunnerContracts,
        "CharacterSkillPointAllocated",
        function(context)
            return context:skill_point_spent_on() == constants.brunnerData.skills.findContracts;
        end,
        function(context)
            saveData.profiles.brunner.journeys.hasContracts = true;
            Save();

            cm:trigger_mission(
                saveData.profiles.brunner.factionKey,
                constants.brunnerData.contractMissions[saveData.profiles.brunner.journeys.contractsMissionIndex]
            );

            BrunnerContractHandler();
        end,
        false
    );
end

local function ListenToBrunnerSpawn()
    out("#### SCEHR HOL: JOURNEYS (Brunner) | Listening to Brunner spawn!");
    core:add_listener(
        listenerKeys.brunnerSpawn,
        "CharacterCreated",
        function(context)
            return context:character():character_subtype(constants.brunnerData.character.agentSubtype);
        end,
        function(context)
            local brunnerFactionKey = context:character():faction():name()

            UpdateBrunnerDetails(context:character(), brunnerFactionKey);
            saveData.profiles.brunner.factionKey = brunnerFactionKey;
            saveData.profiles.brunner.subcultureKey = context:character(): faction():subculture();
            saveData.profiles.brunner.journeys.hasSpawned = true;

            Save();

            -- cm:add_agent_experience(cm:char_lookup_str(context:character()), 11, true);

            if not saveData.aiEligible then ListenToBrunnerFindContracts(); end
            ListenToBrunnerSecretIdentity();
        end,
        false
    );
end

local function QueryBrunnerStatus(brunnerICharacter)
    brunnerICharDetails = brunnerICharacter:character_details();

    saveData.profiles.brunner.factionKey = brunnerICharacter:faction():name();
    saveData.profiles.brunner.subcultureKey = brunnerICharacter:faction():subculture();
    saveData.profiles.brunner.journeys.hasSpawned = true;

    if brunnerICharacter:has_skill(constants.brunnerData.skills.findContracts) then
        saveData.profiles.brunner.journeys.hasContracts = true;
    end

    if brunnerICharacter:has_skill(constants.brunnerData.skills.secretIdentity) then
        if brunnerICharacter:has_trait(constants.brunnerData.traits.identityRevealed) then
            saveData.profiles.brunner.journeys.isRevealed = true;
        end
    end
end

-- Guard clause from the last stage to the first stage of journeys for the character.
local function InitJourneyBrunner()
    if saveData.profiles.brunner.isDead then return; end

    -- If brunner exists but isn't set up, check his interface and assign his current values.
    if saveData.profiles.brunner.journeys.hasSpawned == false then
        local brunnerICharacter = scehrLib.FindCharacterInWorldBySubtype(constants.brunnerData.character.agentSubtype);
        if brunnerICharacter ~= nil then
            QueryBrunnerStatus(brunnerICharacter);
            Save();
        else
            ListenToBrunnerSpawn();
            return;
        end
    end

    if saveData.profiles.brunner.journeys.hasContracts then
        if saveData.profiles.brunner.journeys.contractsMissionIndex < #constants.brunnerData.contractMissions then
            BrunnerContractHandler();
        end
    else
        ListenToBrunnerFindContracts();
    end

    if saveData.profiles.brunner.journeys.hasDefeatedAugustine then return; end

    local pendingBattle = cm:model():pending_battle();
    if pendingBattle:is_null_interface() == false and pendingBattle:is_active() then
        if pendingBattle:attacker():character_subtype(constants.augustineData.character.agentSubtype) then
            local charList = pendingBattle:defender():military_force():character_list();

            for i = 0, charList:num_items() - 1 do
                local char = charList:item_at(i);

                if char:character_subtype(constants.brunnerData.character.agentSubtype) then
                    ListenToAugustineBattleEnded();
                end
            end
        end
    end

    if saveData.profiles.brunner.journeys.isRevealed then
        ListenToHuntForBrunner();
        return;
    end

    if brunnerICharDetails ~= nil and brunnerICharDetails:has_skill(constants.brunnerData.skills.secretIdentity) == false then
        ListenToBrunnerSecretIdentity();
        return;
    end
end

local function AIInit()
    if not saveData.profiles.brunner.journeys.hasSpawned then
        ListenToBrunnerSpawn();
        return;
    end

    if not saveData.profiles.brunner.journeys.isRevealed then
        if brunnerICharDetails ~= nil and brunnerICharDetails:has_skill(constants.brunnerData.skills.secretIdentity) == false then
            ListenToBrunnerSecretIdentity();
        end
    end
end

cm:add_saving_game_callback(
    function()
        Save();
    end
);

cm:add_first_tick_callback(
    function()
        local isHOLLoaded = holMain ~= nil;
        local aiEligible = holMain.AINoHumanCheck(
            {
                factionKeys = {},
                subcultureKeys = {
                    "wh_main_sc_brt_bretonnia",
                    "wh_main_sc_emp_empire",
                    "wh3_main_sc_ksl_kislev",
                    "wh3_main_sc_cth_cathay",
                    "wh_main_sc_teb_teb",
                    "wh_main_sc_dwf_dwarfs",
                    "wh2_main_sc_hef_high_elves"
                }
            }
        );

        -- Make sure Heroes of Legend is loaded.
        if isHOLLoaded then

            if cm:get_saved_value(saveData.svKey) == nil then
                out("#### SCEHR HOL: JOURNEYS (Brunner) | Loading first time! ####");

                saveData.aiEligible = aiEligible;
                Save();
            end

            Load();

            if aiEligible then
                AIInit();
            else
                InitJourneyBrunner();
            end
        else
            out("#### SCEHR HOL: JOURNEYS (Brunner) | Prerequisite script(s) not loaded. This script will not load! ####");
        end
    end
);