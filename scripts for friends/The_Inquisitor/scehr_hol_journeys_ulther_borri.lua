-- HEROES OF LEGEND: JOURNEYS | ULTHER & BORRI | scehr | 04/01/2024

local scehrLib = require("scehr_lib");
local scehrHOLMain = require("scehr_hol_main");

local listenerKeys = {
    gnashrakTaken = scehrHOLMain.journeysKeyPrefix.."ListenToGnashraksLairTaken",
    gnashrakTakenDilemma = scehrHOLMain.journeysKeyPrefix.."ListenToGnashraksLairTakenDilemma",
    dragonCompanyDelay = scehrHOLMain.journeysKeyPrefix.."ListenToGnashrakTakenDelay",
    dragonCompanyDilemma2 = scehrHOLMain.journeysKeyPrefix.."ListenToDragonCompanyDilemma2",
    ungorTaken = scehrHOLMain.journeysKeyPrefix.."ListenToUngorTaken",
    ungorPostBattle = scehrHOLMain.journeysKeyPrefix.."ListenToUngorPostBattle"
};

local messages = {
    ultherDragonCompany1_0 = {
        title = "event_feed_strings_text_hol_ulther_aid_event_recruit_title",
        primary = "event_feed_strings_text_hol_ulther_aid_event_primary_detail",
        secondary = "event_feed_strings_text_hol_ulther_aid_event_secondary_detail",
        index = 2013
    },
    ultherDragonCompany1_1 = {
        title = "event_feed_strings_text_hol_ulther_refuse_event_title",
        primary = "event_feed_strings_text_hol_ulther_refuse_event_primary_detail",
        secondary = "event_feed_strings_text_hol_ulther_refuse_event_secondary_detail",
        index = 2013
    },
    karakUngorFateOfUlther = {
        title = "event_feed_strings_text_hol_ulther_refuse_fate2_event_title",
        primary = "event_feed_strings_text_hol_ulther_refuse_fate2_event_primary_detail",
        secondary = "event_feed_strings_text_hol_ulther_refuse_fate2_event_secondary_detail",
        index = 2013
    }
};

local dilemmaKeys = {
    ultherDragonCompany1 = "ulther_dragon_company_1",
    ultherDragonCompany2 = "ulther_dragon_company_2"
};

local constants = {
    dwarfSubcultureKey = "wh_main_sc_dwf_dwarfs",
    regionKeys = {
        gnashraksLair = "wh3_main_combi_region_gnashraks_lair", -- wh3_main_combi_region_the_pillars_of_grungni
        karakUngor = "wh3_main_combi_region_karak_ungor" -- wh3_main_combi_region_mount_squighorn
    },
    campaignKeys = {
        oldWorld = "cr_oldworld"
    },
    ultherData = {
        character = {
            type = "general",
            subtype = "ulther_stonehammer",
            forename = "names_name_444450",
            surname = "names_name_444451",
            clanName = "",
            maleOrFemale = true
        },
        forces = {
            aided = {
                "ulthers_dragon_company"
            },
            refused = {
                "ulthers_dragon_company"
            },
            delayed = {
                "ulthers_dragon_company"
            }
        },
        ownFactionKey = "mixer_dwf_clan_durazgrund",
    },
    borriData = {
        character = {
            type = "champion",
            subtype = "borri_forkbeard",
            forename = "Borri",
            surname = "Forkbeard",
            clanName = ""
        }
    },
    dragonCompanyTurnsDelay = 10
};

local saveData = {
    svKey = "sv_hol_UltherBorriJourney",
    aiEligible = false,
    journeys = {
        dragonCompany = {
            claimFaction = "",
            gnashrakTaken = false,
            delayed = false,
            delayElapsed = 0
        }
    },
    profiles = {
        ulther = {
            isDead = false,
            hasSpawned = false,
            factionKey = "",
            subcultureKey = "",
            ungorTaken = false
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

local function SpawnUltherAndBorriAtLocation(factionKey, regionKey, units)
    saveData.profiles.ulther.hasSpawned = true;
    saveData.profiles.ulther.factionKey = saveData.journeys.dragonCompany.claimFaction;
    Save();

    local ultherICharacter;
    local borriICharacter;
    local ultherIMilitaryForce;
    local ultherUnits = table.concat(units, ",")

    local x, y = scehrLib.GetSettlementSpawnCoords(factionKey, regionKey);
    cm:create_force_with_general(
        factionKey,
        ultherUnits,
        regionKey,
        x,
        y,
        constants.ultherData.character.type,
        constants.ultherData.character.subtype,
        "",
        "",
        "",
        "",
        false,
        function(ulther_cqi)
            ultherICharacter = cm:get_character_by_cqi(ulther_cqi);
            cm:change_character_custom_name(
                ultherICharacter,
                "Prince Ulther",
                "Stonehammer",
                "",
                ""
            );

            ultherIMilitaryForce = ultherICharacter:military_force();

            x, y = scehrLib.GetSettlementSpawnCoords(factionKey, regionKey);

            borriICharacter = cm:create_agent(
                factionKey,
                constants.borriData.character.type,
                constants.borriData.character.subtype,
                x,
                y
            );

            cm:change_character_custom_name(
                borriICharacter,
                constants.borriData.character.forename,
                constants.borriData.character.surname,
                constants.borriData.character.clanName,
                ""
            );

            cm:replenish_action_points(cm:char_lookup_str(ultherICharacter));
            cm:replenish_action_points(cm:char_lookup_str(borriICharacter));

            cm:embed_agent_in_force(borriICharacter, ultherIMilitaryForce);
        end
    );

    return ultherICharacter, borriICharacter, ultherIMilitaryForce;
end

local function ListenToUngorPostBattle()
    out("#### SCEHR HOL: JOURNEYS (Ulther/Borri) | Listening to Ungor post battle!");
    core:add_listener(
        listenerKeys.ungorPostBattle,
        "BattleCompleted",
        function()
            return cm:pending_battle_cache_faction_is_involved(constants.ultherData.ownFactionKey);
        end,
        function(context)
            local pendingBattle = context:model():pending_battle();
            local ulther = pendingBattle:attacker();

            if pendingBattle:defender_won() then
                if not ulther:is_null_interface() then
                    scehrLib.KillCharacter(ulther:character_details(), true, true, true);
                end

                if cm:get_faction(saveData.journeys.dragonCompany.claimFaction):is_human() then
                    scehrLib.CreateMessageEvent(saveData.journeys.dragonCompany.claimFaction, messages.karakUngorFateOfUlther);
                end
            else
                saveData.profiles.ulther.ungorTaken = true;
                Save();

                cm:add_character_model_override(ulther, "ulther_stonehammer_1");
            end
        end,
        false
    );
end

local function ListenToUngorTaken()
    out("#### SCEHR HOL: JOURNEYS (Ulther/Borri) | Listening to Ungor taken!");
    core:add_listener(
        listenerKeys.ungorTaken,
        "RegionFactionChangeEvent",
        function(context)
            return context:region():name() == constants.regionKeys.karakUngor;
        end,
        function(context)
            local owningFaction = context:region():owning_faction();

            if owningFaction:is_null_interface() or owningFaction:name() ~= saveData.profiles.ulther.factionKey then return; end

            saveData.profiles.ulther.ungorTaken = true;
            Save();

            local ulther = scehrLib.FindCharacterInFactionBySubtype(saveData.profiles.ulther.factionKey, constants.ultherData.character.subtype, true);

            cm:add_character_model_override(ulther, "ulther_stonehammer_1");

            core:remove_listener(listenerKeys.ungorTaken);
        end,
        true
    );
end

local function UltherAndBorriAttackUngor(units)
    local ulther, borri, ultherMF = SpawnUltherAndBorriAtLocation(constants.ultherData.ownFactionKey, constants.regionKeys.karakUngor, units);
    local ungor = cm:get_region(constants.regionKeys.karakUngor);
    local owningFaction = ungor:owning_faction();
    local noInhabitants = ungor:is_abandoned();

    saveData.profiles.ulther.hasSpawned = true;
    saveData.profiles.ulther.factionKey = constants.ultherData.ownFactionKey;
    Save();

    cm:treasury_mod(ulther:faction():name(), 8000);

    if noInhabitants or owningFaction:subculture() == constants.dwarfSubcultureKey then
        cm:transfer_region_to_faction(ungor:name(), ulther:faction():name());
    else
        ListenToUngorPostBattle();
        cm:force_declare_war(ulther:faction():name(), owningFaction:name(), false, false);
        local armedCitizenry = cm:get_armed_citizenry_from_garrison(ungor:garrison_residence());
        cm:force_attack_of_opportunity(ultherMF:command_queue_index(), armedCitizenry:command_queue_index(), false);
    end
end

local function ListenToDragonCompanyDilemma2(factionKey)
    out("#### SCEHR HOL: JOURNEYS (Ulther/Borri) | Listening to Dragon Company dilemma 2!");
    core:add_listener(
        listenerKeys.dragonCompanyDilemma2,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == dilemmaKeys.ultherDragonCompany2;
        end,
        function(context)
            local choice = context:choice();

            -- Ulther joins player faction.
            if choice == 0 then
                saveData.profiles.ulther.hasSpawned = true;
                saveData.profiles.ulther.factionKey = factionKey;
                Save();

                SpawnUltherAndBorriAtLocation(factionKey, constants.regionKeys.gnashraksLair, constants.ultherData.forces.delayed);
            end

            -- Ulther goes it on his own.
            if choice == 1 then
                UltherAndBorriAttackUngor(constants.ultherData.forces.delayed);
            end
        end,
        false
    );
end

local function ListenToDragonCompanyDelay()
    out("#### SCEHR HOL: JOURNEYS (Ulther/Borri) | Listening to Dragon Company delay!");
    core:add_listener(
        listenerKeys.dragonCompanyDelay,
        "FactionTurnStart",
        function(context)
            return context:faction():name() == saveData.journeys.dragonCompany.claimFaction;
        end,
        function(context)
            saveData.journeys.dragonCompany.delayElapsed = scehrLib.IncrementNumber(saveData.journeys.dragonCompany.delayElapsed);

            if saveData.journeys.dragonCompany.delayElapsed >= constants.dragonCompanyTurnsDelay then
                cm:trigger_dilemma(saveData.journeys.dragonCompany.claimFaction, dilemmaKeys.ultherDragonCompany2);
                ListenToDragonCompanyDilemma2(saveData.journeys.dragonCompany.claimFaction);
                core:remove_listener(listenerKeys.dragonCompanyDelay);
            end

            Save();
        end,
        true
    );
end

local function ListenToGnashraksLairTakenDilemma()
    out("#### SCEHR HOL: JOURNEYS (Ulther/Borri) | Listening to Gnashrak's Lair taken dilemma!");
    core:add_listener(
        listenerKeys.gnashrakTakenDilemma,
        "DilemmaChoiceMadeEvent",
        function(context)
            return context:dilemma() == dilemmaKeys.ultherDragonCompany1;
        end,
        function(context)
            local choice = context:choice();

            -- Ulther joins player faction.
            if choice == 0 then
                scehrLib.CreateMessageEvent(saveData.journeys.dragonCompany.claimFaction, messages.ultherDragonCompany1_0);
                saveData.profiles.ulther.hasSpawned = true;
                saveData.profiles.ulther.factionKey = saveData.journeys.dragonCompany.claimFaction;
                SpawnUltherAndBorriAtLocation(saveData.journeys.dragonCompany.claimFaction, constants.regionKeys.gnashraksLair, constants.ultherData.forces.aided);
                ListenToUngorTaken();
            end

            -- Ulther goes it on his own.
            if choice == 1 then
                scehrLib.CreateMessageEvent(saveData.journeys.dragonCompany.claimFaction, messages.ultherDragonCompany1_1);
                UltherAndBorriAttackUngor(constants.ultherData.forces.refused);
            end

            -- Delay dilemma for 10 turns.
            if choice == 2 then
                saveData.journeys.dragonCompany.delayed = true;
                ListenToDragonCompanyDelay();
            end

            Save();
        end,
        false
    );
end

local function GnashrakTakenByAI()
    local diceRoll = cm:random_number(100, 1);

    if diceRoll > 50 then
        SpawnUltherAndBorriAtLocation(saveData.journeys.dragonCompany.claimFaction, constants.regionKeys.gnashraksLair, constants.ultherData.forces.aided);
        ListenToUngorTaken();
    else
        UltherAndBorriAttackUngor(constants.ultherData.forces.delayed);
    end

end

local function ListenToGnashraksLairTaken()
    out("#### SCEHR HOL: JOURNEYS (Ulther/Borri) | Listening to Gnashrak's Lair taken!");
    core:add_listener(
        listenerKeys.gnashrakTaken,
        "RegionFactionChangeEvent",
        function(context)
            return context:region():name() == constants.regionKeys.gnashraksLair;
        end,
        function(context)
            local owningFaction = context:region():owning_faction();

            if owningFaction:subculture() ~= constants.dwarfSubcultureKey then return; end
            if owningFaction:is_human() == false and saveData.aiEligible == false then return; end

            saveData.journeys.dragonCompany.gnashrakTaken = true;
            saveData.journeys.dragonCompany.claimFaction = owningFaction:name();
            Save();

            if saveData.aiEligible then
                GnashrakTakenByAI()
            else
                cm:trigger_dilemma(owningFaction:name(), dilemmaKeys.ultherDragonCompany1);
                ListenToGnashraksLairTakenDilemma();
            end

            core:remove_listener(listenerKeys.gnashrakTaken);
        end,
        true
    );
end

local function InitJourneyUltherBorri()
    if cm:get_campaign_name() == constants.campaignKeys.oldWorld then
        if not saveData.profiles.ulther.ungorTaken then
            ListenToUngorTaken();
            return;
        end
    end

    if saveData.profiles.ulther.hasSpawned then
        if not saveData.profiles.ulther.ungorTaken then
            ListenToUngorTaken();
            return;
        end
    end

    if saveData.journeys.dragonCompany.delayed then
        if saveData.journeys.dragonCompany.delayElapsed < constants.dragonCompanyTurnsDelay then
            ListenToDragonCompanyDelay();
            return;
        end
    end

    if not saveData.journeys.dragonCompany.gnashrakTaken then
        ListenToGnashraksLairTaken();
        return;
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
                out("#### SCEHR HOL: JOURNEYS (Ulther/Borri) | Loading first time! ####");

                saveData.aiEligible = #numPlayerDwarfs == 0;
                Save();
            end

            Load();
            InitJourneyUltherBorri();
        else
            out("#### SCEHR HOL: JOURNEYS (Ulther/Borri) | Prerequisite script(s) not loaded. This script will not load! ####");
        end
    end
);