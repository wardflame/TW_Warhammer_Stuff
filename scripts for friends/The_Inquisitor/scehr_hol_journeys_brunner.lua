-- HEROES OF LEGEND: JOURNEYS | BRUNNER | scehr | 14/12/2023

local scehrLib = require("scehr_lib");
local scehrHOLMain = require("scehr_hol_main");

--#regionDatabaseKeys

-- SUBCULTURES
local bretonniaSubcultureKey = "wh_main_sc_brt_bretonnia";

-- SKILLS
local secretIdentitySkillKey = "secret_identity";

-- TRAITS
local revealedTraitKey = "brunner_identity_revealed";
local hiddenTraitKey = "brunner_identity_concealed";

-- DILEMMAS
local secretIdentityDilemmaKey = "brunner_secret_identity";
local augustineAmbushDilemmaKey = "brunner_ambushed";
local augustineDefeatedDilemmaKey = "fate_of_augustine";
local augustineDefeatedBretonniaDilemmaKey = "fate_of_augustine_bretonnia";
local augustineWonDilemmaKey = "augustine_ambush_win";

--#endregionDatabaseKeys

--#regionSavedVariables

-- BRUNNER
local saved_brunnerFactionKey = scehrHOLMain.journeysKeyPrefix.."brunner_faction_key";
local saved_brunnerFactionSubcultureKey = scehrHOLMain.journeysKeyPrefix.."brunner_faction__subculture_key"
local saved_brunnerRevealedKey = scehrHOLMain.journeysKeyPrefix.."brunner_identity_revealed";
local saved_brunnerDeadKey = scehrHOLMain.journeysKeyPrefix.."brunner_has_died";

-- AUGUSTINE
local saved_huntChanceKey = scehrHOLMain.journeysKeyPrefix.."brunner_hunt_chance";
local saved_augustineDefeatedKey = scehrHOLMain.journeysKeyPrefix.."brunner_defeated_augustine";

--#endregionSavedVariables

--#regionBrunnerVariables
local brunnerSubtypeKey = "bounty_hunter_brunner";
--#endregionBrunnerVariables

--#regionAugustineVariables
local augustineData = {
    factionKey = "mixer_brt_viscountcy_de_chegney",
    character = {
        agentType = "general",
        agentSubtype = "augustine_de_chegney",
        forename = "Augustine",
        surname = "de Chegney",
        clanName = "",
        otherName = ""
    },
    siegeForce = {
        "wh_dlc07_brt_inf_men_at_arms_1",
        "wh_dlc07_brt_inf_men_at_arms_1"
    },
    fieldForce = {
        "wh_dlc07_brt_inf_men_at_arms_1",
        "wh_dlc07_brt_inf_men_at_arms_1"
    },
    ambushRollThreshold = 60
};
--#endregionAugustineVariables

--#regionMessageEntries
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
    brunnerEscapesAmbushMessage = {
        title = "event_feed_strings_text_hol_brunner_escape_ambush_title",
        primary = "event_feed_strings_text_hol_brunner_escape_ambush_primary_detail",
        secondary = "event_feed_strings_text_hol_brunner_escape_ambush_secondary_detail",
        index = 2013
    },
    brunnerDiesMessage = {
        title = "event_feed_strings_text_hol_brunner_death_hunt_title",
        primary = "event_feed_strings_text_hol_brunner_death_primary_detail",
        secondary = "event_feed_strings_text_hol_brunner_death_secondary_detail",
        index = 2013
    }
}
--#endregionMessageEntries

--#regionListenerKeys
local listenerKeys = {
    brunnerSpawn = scehrHOLMain.journeysKeyPrefix.."ListenToBrunnerSpawn",
    brunnerSecretIdentity = scehrHOLMain.journeysKeyPrefix.."ListenToBrunnerSecretIdentity",
    augustineAmbushDilemma = scehrHOLMain.journeysKeyPrefix.."ListenToAugustineAmbushDilemma",
    augustineBattleEnded = scehrHOLMain.journeysKeyPrefix.."ListenToAugustineBattleEnded",
    augustineDefeated = scehrHOLMain.journeysKeyPrefix.."ListenToAugustineDefeatedDilemma",
    augustineDefeatedBretonnia = scehrHOLMain.journeysKeyPrefix.."ListenToAugustineDefeatedBretonniaDilemma",
    augustineBattleVictorious = scehrHOLMain.journeysKeyPrefix.."ListenToAugustineVictoriousDilemma",
}
--#endregion

local function CharacterVersusAugustine()
end

local function ListenToAugustineVictoriousDilemma(pendingBattle)
    core:add_listener(
        listenerKeys.augustineBattleVictorious,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == augustineWonDilemmaKey;
        end,
        function(context)
            local choice = context:choice();

            -- BRUNNER EVADES AUGUSTINE, LORD FACES AUGUSTINE
            if choice == 0 then
                cm:set_saved_value(saved_huntChanceKey, 5);
            end

            -- BRUNNER FACES AUGUSTINE, CAN DIE HERE
            if choice == 1 then
                -- End brunner dilemmas, kill brunner.
            end
        end
    );
end

local function ListenToAugustineDefeatedBretonniaDilemma(pendingBattle)
    core:add_listener(
        listenerKeys.augustineDefeatedBretonnia,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == augustineDefeatedBretonniaDilemmaKey;
        end,
        function(context)
            local choice = context:choice();

            if choice == 0 then
                -- KILL AUGUSTINE
                scehrLib.CreateMessageEvent(messages.augustineKilledMessage);
            end

            if choice == 1 then
                -- ENLIST AUGUSTINE
                scehrLib.CreateMessageEvent(messages.augustinePardonMessage);
                return;
            end

            if choice == 2 then
                -- EXILE AUGUSTINE
                scehrLib.CreateMessageEvent(messages.augustineExiledMessage);
            end

            if pendingBattle then
                cm:kill_character(cm:char_lookup_str(pendingBattle:attacker()), true);
            end
        end
    );
end

local function ListenToAugustineDefeatedDilemma(pendingBattle)
    core:add_listener(
        listenerKeys.augustineDefeated,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == augustineDefeatedDilemmaKey;
        end,
        function(context)
            local choice = context:choice();

            if choice == 0 then
                -- KILL AUGUSTINE
                scehrLib.CreateMessageEvent(messages.augustineKilledMessage);
            end

            if choice == 1 then
                -- RANSOM AUGUSTINE
                cm:disable_event_feed_events(true, "", "wh_event_subcategory_character_deaths", "");
                scehrLib.CreateMessageEvent(messages.augustineRansomMessage);
            end

            if pendingBattle then
                cm:kill_character(cm:char_lookup_str(pendingBattle:attacker()), true);
            end
        end
    );
end

local function ListenToAugustineBattleEnded()
    core:add_listener(
        listenerKeys.augustineBattleEnded,
        "BattleCompletedCameraMove",
        function()
            return cm:pending_battle_cache_faction_is_involved(cm:get_saved_value(saved_brunnerFactionKey));
        end,
        function(context)
            local pendingBattle = cm:model():pending_battle();
            local augustineWon = pendingBattle:attacker_won();

            cm:disable_event_feed_events(true, "wh_event_category_diplomacy", "", "");

            if augustineWon then
                cm:trigger_dilemma(augustineWonDilemmaKey);
                ListenToAugustineVictoriousDilemma(pendingBattle);
                return;
            end

            local brunnerFaction = context:defender():faction();

            if cm:get_saved_value(saved_brunnerFactionSubcultureKey) == bretonniaSubcultureKey then
                cm:trigger_dilemma(brunnerFaction:name(), augustineDefeatedBretonniaDilemmaKey);
                ListenToAugustineDefeatedBretonniaDilemma(pendingBattle);
            else
                cm:trigger_dilemma(brunnerFaction:name(), augustineDefeatedDilemmaKey);
                ListenToAugustineDefeatedDilemma(pendingBattle);
            end
        end,
        false
    );
end

local function AugustineBattleQuery(brunnerObj)
    local brunnerForce = brunnerObj:embedded_in_military_force();
    local brunnerRegion = brunnerObj:region():name();

    local spawnX, spawnY;
    local augustineForceUnits;

    if brunnerForce:has_garrison_residence() then
        spawnX, spawnY = cm:find_valid_spawn_location_for_character_from_settlement(
            augustineData.factionKey,
            brunnerRegion,
            false,
            true,
            5
        );
        augustineForceUnits = table.concat(augustineData.siegeForce, ",");
    else
        spawnX, spawnY = cm:find_valid_spawn_location_for_character_from_position(
            augustineData.factionKey,
            brunnerObj:logical_position_x(),
            brunnerObj:logical_position_y(),
            true,
            5
        );
        augustineForceUnits = table.concat(augustineData.fieldForce, ",");
    end

    cm:create_force_with_general(
        augustineData.factionKey,
        augustineForceUnits,
        brunnerRegion,
        spawnX,
        spawnY,
        augustineData.character.agentType,
        augustineData.character.agentSubtype,
        "",
        "",
        "",
        "",
        true,
        function(augustine_cqi)
            local augustineCharacter = cm:get_character_by_cqi(augustine_cqi);
            cm:change_character_custom_name(
                augustineCharacter,
                augustineData.character.forename,
                augustineData.character.surname,
                augustineData.character.clanName,
                augustineData.character.otherName
            );

            local augustineFaction = augustineCharacter:faction():name();
            local augustineForce = augustineCharacter:military_force();

            cm:disable_event_feed_events(true, "wh_event_category_diplomacy", "", "");
            cm:force_declare_war(augustineFaction, brunnerObj:faction():name(), false, false);

            cm:force_attack_of_opportunity(augustineForce:command_queue_index(), brunnerForce:command_queue_index(), false);

            ListenToAugustineBattleEnded();
        end
    );
end

local function ListenToAugustineAmbushDilemma(brunnerObj)
    core:add_listener(
        listenerKeys.augustineAmbushDilemma,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == augustineAmbushDilemmaKey;
        end,
        function(context)
            local choice = context:choice();

            -- BRUNNER FLEES AUGUSTINE
            if choice == 0 then
                scehrLib.CreateMessageEvent(brunnerObj:faction():name(), messages.brunnerEscapesAmbushMessage);
                cm:set_saved_value(saved_huntChanceKey, 5);
            end

            -- BRUNNER FIGHTS AUGUSTINE
            if choice == 1 then
                local brunnerRank = brunnerObj:rank();
                local diceRoll = scehrLib.DiceRollWithFlatModifier(10, brunnerRank * 2);

                out("#### SCEHR HOL: DILEMMAS | Brunner rolls "..tostring(diceRoll).." (Bonus: "..tostring(brunnerRank * 2)") against Augustine! ####");

                if diceRoll >= augustineData.ambushRollThreshold then
                    if brunnerObj:faction():subculture() == bretonniaSubcultureKey then
                        cm:trigger_dilemma(brunnerObj:faction():name(), augustineDefeatedBretonniaDilemmaKey);
                    else
                        cm:trigger_dilemma(brunnerObj:faction():name(), augustineDefeatedDilemmaKey);
                    end
                    out("#### SCEHR HOL: DILEMMAS | Brunner beats Augustine! ####");
                else
                    local brunnerLookupStr = cm:char_lookup_str(brunnerObj);
                    cm:kill_character(brunnerLookupStr, false);
                    scehrLib.CreateMessageEvent(brunnerObj:faction():name(), messages.brunnerDiesMessage);
                    out("#### SCEHR HOL: DILEMMAS | Brunner loses to Augustine and dies!");
                end
            end
        end,
        false
    );
end

local function ListenToHuntForBrunner()
    core:add_listener(
        scehrHOLMain.journeysKeyPrefix.."ListenToHuntForBrunner",
        "FactionTurnStart",
        function(context)
            return context:faction():name() == cm:get_saved_value(saved_brunnerFactionKey);
        end,
        function(context)
            local diceRoll = math.random(0, 100);
            out("#### SCEHR HOL: JOURNEYS | Augustine Hunt Brunner Chance = "..tostring(cm:get_saved_value(saved_huntChanceKey).." ####"))

            if diceRoll <= cm:get_saved_value(saved_huntChanceKey) then
                local brunnerObj = scehrLib.FindCharacterInFactionBySubtype(cm:get_saved_value(saved_brunnerFactionKey), brunnerSubtypeKey);

                if not brunnerObj:is_embedded_in_military_force() then
                    cm:trigger_dilemma(cm:get_saved_value(saved_brunnerFactionKey), augustineAmbushDilemmaKey);
                    ListenToAugustineAmbushDilemma(brunnerObj);
                    return;
                end

                AugustineBattleQuery(brunnerObj);
            else
                local huntChance = cm:get_saved_value(saved_huntChanceKey) + 5;

                if not huntChance > 100 then
                    cm:set_saved_value(saved_huntChanceKey, huntChance);

                    if huntChance % 25 == 0 then
                        scehrLib.CreateMessageEvent(cm:get_saved_value(saved_brunnerFactionKey), messages.augustineHuntingMessage);
                    end
                end
            end
        end,
        true
    );
end

local function ListenToSecretIdentityDilemma(brunnerLookup, brunnerObj)
    core:add_listener(
        scehrHOLMain.journeysKeyPrefix.."ListenToSecretIdentityDilemma",
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == secretIdentityDilemmaKey;
        end,
        function(context)
            local choice = context:choice();
            local revealed;

            if choice == 0 then
                cm:force_add_trait(brunnerLookup, revealedTraitKey, true);
                cm:set_saved_value(saved_huntChanceKey, 100);
                revealed = true;
                ListenToHuntForBrunner();
            end

            if choice == 1 then
                cm:force_add_trait(brunnerLookup, hiddenTraitKey, true);
                revealed = false;
            end

            cm:set_saved_value(saved_brunnerRevealedKey, revealed);
        end,
        false
    );
end

local function ListenToBrunnerSecretIdentity()
    core:add_listener(
        listenerKeys.brunnerSecretIdentity,
        "CharacterSkillPointAllocated",
        function(context)
            return context:character():character_subtype(brunnerSubtypeKey) and context:skill_point_spent_on() == secretIdentitySkillKey;
        end,
        function(context)
            local brunnerLookup = cm:char_lookup_str(context:character());

            cm:trigger_dilemma(cm:get_saved_value(saved_brunnerFactionKey), secretIdentityDilemmaKey);
            ListenToSecretIdentityDilemma(brunnerLookup, context:character());
        end,
        false
    );
end

local function ListenToBrunnerSpawn()
    core:add_listener(
        listenerKeys.brunnerSpawn,
        "CharacterCreated",
        function(context)
            return context:character():character_subtype(brunnerSubtypeKey);
        end,
        function(context)
            local brunnerLookUp = cm:char_lookup_str(context:character());
            local brunnerContextFactionKey = context:character():faction():name();
            local brunnerContextFactionSubcultureKey = context:character():faction():subculture();

            cm:add_agent_experience(brunnerLookUp, 7, true);

            cm:set_saved_value(saved_brunnerFactionKey, brunnerContextFactionKey);
            cm:set_saved_value(saved_brunnerFactionSubcultureKey, brunnerContextFactionSubcultureKey);

            out("#### SCEHR HOL: JOURNEYS | Brunner spawned, faction: "..tostring(cm:get_saved_value(saved_brunnerFactionKey)));

            ListenToBrunnerSecretIdentity();
        end,
        false
    );
end

-- Guard clause from the last stage to the first stage of journeys for the character.
local function InitJourneyBrunner()
    local brunnerIsDead = cm:get_saved_value(saved_brunnerDeadKey);

    if brunnerIsDead then
        return;
    end

    local augustineDefeated = cm:get_saved_value(saved_augustineDefeatedKey);

    if augustineDefeated then
        return;
    end

    local brunnerRevealed = cm:get_saved_value(saved_brunnerRevealedKey);

    if brunnerRevealed then
        if brunnerRevealed == true then
            ListenToHuntForBrunner();
        end
        return;
    end

    local brunnerFaction = cm:get_saved_value(saved_brunnerFactionKey);

    if brunnerFaction then
        ListenToBrunnerSecretIdentity();
        return;
    end

    local brunnerObj = scehrLib.FindCharacterInWorldBySubtype(brunnerSubtypeKey);

    if not brunnerObj then
        ListenToBrunnerSpawn();
        return;
    end
end

cm:add_first_tick_callback(
    function()
        local isHOLLoaded = scehrHOLMain ~= nil;

        -- Make sure Heroes of Legend is loaded.
        if isHOLLoaded then
            InitJourneyBrunner();
        else
            out("#### SCEHR HOL: JOURNEYS | Prerequisites not met. Script will not load! ####");
            out("    > Heroes of Legend installed: "..tostring(isHOLLoaded));
        end
    end
);