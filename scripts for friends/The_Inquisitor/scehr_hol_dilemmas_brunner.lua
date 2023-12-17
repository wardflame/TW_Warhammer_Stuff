-- HEROES OF LEGEND: BRUNNER DILEMMAS | scehr | 14/12/2023

local scehrHOLLib = require("scehr_hol_lib");

local brunnerSubtypeKey = "bounty_hunter_brunner";
local saved_brunnerFactionKey = scehrHOLLib.dilemmasKeyPrefix.."brunner_faction_key";

local secretIdentitySkillKey = "secret_identity";
local secretIdentityDilemmaKey = "brunner_secret_identity";
local saved_brunnerRevealedKey = scehrHOLLib.dilemmasKeyPrefix.."brunner_identity_revealed";

local revealedTraitKey = "brunner_identity_revealed";
local hiddenTraitKey = "brunner_identity_concealed";

local saved_huntChanceKey = scehrHOLLib.dilemmasKeyPrefix.."brunner_hunt_chance";
local saved_augustineDefeatedKey = scehrHOLLib.dilemmasKeyPrefix.."brunner_defeated_augustine";

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
    huntMessage = {
        messageTitle = "event_feed_strings_text_hol_brunner_augustine_hunt_title",
        messagePrimary = "event_feed_strings_text_hol_brunner_augustine_hunt_primary_detail",
        messageSecondary = "event_feed_strings_text_hol_brunner_augustine_hunt_secondary_detail"
    }
}

local function ListenToAugustineBattleEnded()
    core:add_listener(
        scehrHOLLib.dilemmasKeyPrefix.."ListenToAugustineBattleEnded",
        "BattleCompleted",
        function()
            return cm:pending_battle_cache_faction_is_involved(cm:get_saved_value(saved_brunnerFactionKey));
        end,
        function(context)
            local pendingBattle = cm:model():pending_battle();
            local augustineWon = pendingBattle:attacker_won();

            out("#### SCEHR HOL: DILEMMAS | Augustine fought Brunner! Augustine Won = "..tostring(augustineWon));
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

local function ListenToHuntForBrunner()
    core:add_listener(
        "SCEHR_HOL_ListenToHuntForBrunner",
        "FactionTurnStart",
        function(context)
            return context:faction():name() == cm:get_saved_value(saved_brunnerFactionKey);
        end,
        function(context)
            local diceRoll = math.random(0, 100);
            out("#### SCEHR HOL: DILEMMAS | Augustine Hunt Brunner Chance = "..tostring(cm:get_saved_value(saved_huntChanceKey).." ####"))

            if diceRoll <= cm:get_saved_value(saved_huntChanceKey) then
                local brunnerObj = scehrHOLLib.FindCharacterInFactionBySubtype(cm:get_saved_value(saved_brunnerFactionKey), brunnerSubtypeKey);

                if not brunnerObj:is_embedded_in_military_force() then
                    -- if brunner isn't in an army, trigger none-army dilemma and listen to event.
                    return;
                end

                AugustineBattleQuery(brunnerObj);
            else
                local huntChance = cm:get_saved_value(saved_huntChanceKey) + 5;

                if not huntChance > 100 then
                    cm:set_saved_value(saved_huntChanceKey, huntChance);

                    if huntChance % 25 == 0 then
                        scehrHOLLib.CreateMessageEvent(cm:get_saved_value(saved_brunnerFactionKey), augustineData.huntMessage);
                    end
                end
            end
        end,
        true
    );
end

local function ListenToSecretIdentityDilemma(brunnerLookup, brunnerObj)
    core:add_listener(
        "SCEHR_HOL_ListenToSecretIdentityDilemma",
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

local function ListenForBrunnerSecretIdentity()
    core:add_listener(
        "SCEHR_HOL_ListenForBrunnerSecretIdentity",
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

local function ListenForBrunnerSpawn()
    core:add_listener(
        "SCEHR_HOL_ListenForBrunnerSpawn",
        "CharacterCreated",
        function(context)
            return context:character():character_subtype(brunnerSubtypeKey);
        end,
        function(context)
            local brunnerLookUp = cm:char_lookup_str(context:character());
            local brunnerContextFactionKey = context:character():faction():name();

            cm:add_agent_experience(brunnerLookUp, 7, true);

            cm:set_saved_value(saved_brunnerFactionKey, brunnerContextFactionKey);

            out("#### SCEHR HOL: DILEMMAS | Brunner spawned, faction: "..tostring(cm:get_saved_value(saved_brunnerFactionKey)));

            ListenForBrunnerSecretIdentity();
        end,
        false
    );
end

-- Guard clause from the last stage to the first stage of dilemmas for the character.
local function InitDilemmasBrunner()
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
        ListenForBrunnerSecretIdentity();
        return;
    end

    local brunnerObj = scehrHOLLib.FindCharacterInWorldBySubtype(brunnerSubtypeKey);

    if not brunnerObj then
        ListenForBrunnerSpawn();
        return;
    end
end

cm:add_first_tick_callback(
    function()
        local isHOLLoaded = core:is_mod_loaded("scehr_hol_characters_buildings");

        -- Make sure Heroes of Legend is loaded.
        if isHOLLoaded then
            InitDilemmasBrunner();
        else
            out("#### SCEHR HOL: DILEMMAS | Prerequisites not met. Script will not load! ####");
            out("    > Heroes of Legend installed: "..tostring(isHOLLoaded));
        end
    end
);