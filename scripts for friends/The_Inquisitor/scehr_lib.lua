-- SCEHR LIBRARY | scehr | 14/12/2023

local scehr_lib = {};

scehr_lib.alignmentKeys = {
    order = "Order",
    death = "Death",
    destruction = "Destruction",
    chaos = "Chaos"
}

scehr_lib.alignmentSubcultures = {
    [scehr_lib.alignmentKeys.order] =
    {
        "wh_main_sc_brt_bretonnia",
        "wh_main_sc_dwf_dwarfs",
        "wh_main_sc_emp_empire",
        "wh_main_sc_teb_teb",
        "wh_dlc05_sc_wef_wood_elves",
        "wh2_main_sc_hef_high_elves",
        "wh2_main_sc_lzd_lizardmen",
        "wh3_main_sc_cth_cathay",
        "wh3_main_sc_ksl_kislev"
    },
    [scehr_lib.alignmentKeys.death] =
    {
        "wh_main_sc_vmp_vampire_counts",
        "wh2_dlc09_sc_tmb_tomb_kings",
        "wh2_dlc11_sc_cst_vampire_coast"
    },
    [scehr_lib.alignmentKeys.destruction] =
    {
        "wh_main_sc_grn_greenskins",
        "wh_main_sc_grn_savage_orcs",
        "wh2_main_sc_def_dark_elves",
        "wh2_main_rogue",
        "wh3_main_sc_ogr_ogre_kingdoms"
    },
    [scehr_lib.alignmentKeys.chaos] =
    {
        "wh_main_sc_chs_chaos",
        "wh_dlc03_sc_bst_beastmen",
        "wh_dlc08_sc_nor_norsca",
        "wh2_main_rogue_chaos",
        "wh2_main_sc_skv_skaven",
        "wh3_main_sc_dae_daemons",
        "wh3_main_sc_kho_khorne",
        "wh3_main_sc_nur_nurgle",
        "wh3_main_sc_sla_slaanesh",
        "wh3_main_sc_tze_tzeentch",
        "wh3_dlc23_sc_chd_chaos_dwarfs"
    }
}

function scehr_lib.GetSubcultureAlignment(subcultureKey)
    for k, v in pairs(scehr_lib.alignmentSubcultures) do
        local subcultures = v;
        local subculture;
        for i = 1, #subcultures do
            subculture = subcultures[i];
            if subcultureKey == subculture then return k; end
        end
    end

    return nil;
end

function scehr_lib.DoesSubcultureMatchAlignment(subcultureKey, alignmentKey)
    local alignmentSubcultures = scehr_lib.alignmentSubculturesp[alignmentKey];
    local subculture;

    for i = 1, #alignmentSubcultures do
        subculture = alignmentSubcultures[i];
        if subcultureKey == subculture then return true; end
    end
    return false;
end

-- Checks through faction region list and finds a match to provided region key. Returns true if match is found.
function scehr_lib.FactionHasRegion(factionKey, regionKey)
    local iFaction = cm:get_faction(factionKey);
    local regionList = iFaction:region_list();

    for i = 0, regionList:num_items() - 1 do
        local region = regionList:item_at(i):name();

        if region == regionKey then return true end
    end

    return false;
end

-- Checks if faction has building. Returns true with iBuilding and iRegion.
function scehr_lib.FactionHasBuilding(factionKey, buildingKey)
    local iFaction = cm:get_faction(factionKey);

    local factionHasBuilding = cm:faction_contains_building(iFaction, buildingKey);

    if factionHasBuilding then
        local regionList = iFaction:region_list();

        for i = 0, regionList:num_items() - 1 do
            local iRegion = regionList:item_at(i);
            local regionHasBuilding = iRegion:building_exists(buildingKey);

            if regionHasBuilding then
                local regionSlots = iRegion:slot_list();

                for j = 0, regionSlots:num_items() - 1 do
                    local slot = regionSlots:item_at(j);

                    if not slot:building():is_null_interface() and slot:building():name() == buildingKey then
                        return true, slot:building(), iRegion;
                    end
                end
            end
        end
    end

    return false, nil;
end

-- Kill a character in campaign, optional if immortal, and choose whether it should show up in the event feed.
function scehr_lib.KillCharacter(iCharDetails, shouldKillForce, killEvenIfImmortal, shouldHideEvent)
    if iCharDetails == nil or iCharDetails:is_null_interface() then
        out(">>>> SCEHR LIB | Character is nil, cannot kill.");
        return;
    end

    if killEvenIfImmortal then
        if iCharDetails:is_immortal() then
            cm:suppress_immortality(iCharDetails:family_member():command_queue_index(), true);
        end
    end

    if shouldHideEvent then cm:disable_event_feed_events(true, "wh_event_category_character", "", ""); end

    cm:kill_character(cm:char_lookup_str(iCharDetails:character():command_queue_index()), shouldKillForce);

    if shouldHideEvent then cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", "") end, 0.2); end
end

-- Wound a character, choose whether their found should be killed.
function scehr_lib.WoundCharacter(iCharacter, shouldKillForce, isLL)
    if not isLL then cm:set_character_immortality(cm:char_lookup_str(iCharacter), true); end
    cm:kill_character(cm:char_lookup_str(iCharacter), shouldKillForce);
    if not isLL then cm:set_character_immortality(cm:char_lookup_str(iCharacter), false); end
end

-- Get a object with characters (separated into tables: lords, heroes) and spawn them to a faction. Returns a table of interfaces, broken into heroes (iCharacter) and lords (iCharDetails).
function scehr_lib.SpawnCharactersToFaction(factionKey, characterTable, targetRegionKey)
    local newCharacters = { heroes = {}, lords = {} }
    local charactersSpawned = 0;
    if #characterTable.heroes > 0 then
        -- Create heroes.
        local locX, locY;
        for i = 1, #characterTable.heroes do
            local heroEntry = characterTable.heroes[i];

            locX, locY = scehr_lib.GetSettlementSpawnCoords(factionKey, targetRegionKey);

            local heroICharacter = cm:create_agent(
                factionKey,
                heroEntry.type,
                heroEntry.subtype,
                locX,
                locY
            );

            cm:change_character_custom_name(
                heroICharacter,
                heroEntry.forename,
                heroEntry.surname,
                heroEntry.clanName,
                ""
            );

            -- Replenish action points so they can be used on-spawn.
            local heroLookUp = cm:char_lookup_str(heroICharacter);
            cm:replenish_action_points(heroLookUp);

            -- Create event message if one available.
            if heroEntry.message then
                scehr_lib.CreateMessageEvent(factionKey, heroEntry.message);
            end

            table.insert(newCharacters.heroes, heroICharacter);

            charactersSpawned = scehr_lib.IncrementNumber(charactersSpawned);
        end
    end

    if #characterTable.lords > 0 then
        -- Create lords.
        for i = 1, #characterTable.lords do
            local lordEntry = characterTable.lords[i];
            local lordICharDetails = cm:spawn_character_to_pool(
                factionKey,
                lordEntry.forename,
                lordEntry.surname,
                lordEntry.clanName,
                "",
                20,
                lordEntry.maleOrFemale,
                lordEntry.type,
                lordEntry.subtype,
                true,
                ""
            );

            -- Create event message if one available.
            if lordEntry.message then
                scehr_lib.CreateMessageEvent(factionKey, lordEntry.message);
            end

            table.insert(newCharacters.lords, lordICharDetails);

            charactersSpawned = scehr_lib.IncrementNumber(charactersSpawned);
        end
    end

    out(">>>> SCEHR LIB | Spawned "..tostring(charactersSpawned).." characters to "..factionKey.."!");

    return newCharacters;
end

-- Spawns lord into character pool of a faction. Returns the spawned lord's ICharacterDetails.
function scehr_lib.SpawnLordToFaction(factionKey, lordEntry, immortal)
    if cm:get_faction(factionKey) == nil or cm:get_faction(factionKey):is_null_interface() then
        out(">>>> SCEHR LIB | Failed to spawn character from faction key!")
        return false;
    end

    out(">>>> SCEHR LIB | Spawning "..lordEntry.forename.." to "..factionKey.."!");

    local spawnedLordDetails = cm:spawn_character_to_pool(
        factionKey,
        lordEntry.forename,
        lordEntry.surname,
        lordEntry.clanName,
        "",
        20,
        lordEntry.maleOrFemale,
        lordEntry.agentType,
        lordEntry.agentSubtype,
        immortal,
        ""
    );

    out(">>>> SCEHR LIB | Spawned "..lordEntry.forename.." to "..factionKey.."!");
    return true, spawnedLordDetails;
end

-- Gets random faction from subcultures and spawns a lord into the character pool of that faction. Returns the spawned lord's ICharacterDetails.
function scehr_lib.SpawnLordToRandomFactionBySubcultures(subcultureList, lordEntry, immortal)
    local factionList = {};

    for i = 1, #subcultureList do
        local subcultureFactions = scehr_lib.GetAllFactionsOfSubculture(subcultureList[i]);
        for _, value in pairs(subcultureFactions) do
            table.insert(factionList, value);
        end
    end

    local chosenFaction = factionList[scehr_lib.GenerateRandomNumbers(1, #factionList, 10)];

    if not chosenFaction or chosenFaction:is_null_interface() then
        out(">>>> SCEHR LIB | Failed to spawn character from subcultures!")
        return false;
    end

    out(">>>> SCEHR LIB | Spawning "..lordEntry.forename.." to "..chosenFaction:name().."!");

    local spawnedLordDetails = cm:spawn_character_to_pool(
        chosenFaction:name(),
        lordEntry.forename,
        lordEntry.surname,
        lordEntry.clanName,
        "",
        20,
        lordEntry.maleOrFemale,
        lordEntry.agentType,
        lordEntry.agentSubtype,
        immortal,
        ""
    );

    out(">>>> SCEHR LIB | Spawned "..lordEntry.forename.." to "..chosenFaction:name().."!");
    return true, spawnedLordDetails;
end

-- Returns all valid faction interfaces of a subculture.
function scehr_lib.GetAllFactionsOfSubculture(subcultureKey)
    local validfactions = {};
    local factionList = cm:model():world():faction_list();

    for i = 0, factionList:num_items() - 1 do
        local iFaction = factionList:item_at(i);

        if iFaction:subculture() == subcultureKey then
            if not iFaction:is_null_interface() and not iFaction:is_dead() then
                table.insert(validfactions, iFaction);
            end
        end
    end

    return validfactions;
end

-- Iterate through world faction list and find first character of a subtype key. Returns first ICharacter found, nil if not found.
function scehr_lib.FindCharacterInWorldBySubtype(characterSubtypeKey)
    local factionList = cm:model():world():faction_list();

    for i = 0, factionList:num_items() - 1 do
        local factionObj = factionList:item_at(i);
        local iCharacter = scehr_lib.FindCharacterInFactionBySubtype(factionObj:name(), characterSubtypeKey, false);

        if iCharacter ~= nil and iCharacter:is_null_interface() == false then return iCharacter; end
    end

    out(">>>> SCEHR LIB | Could not find character in world by subtype!");
    return nil;
end

-- Iterates through a faction's character list and find first character of a subtype key. Returns first ICharacter found, nil if not found.
function scehr_lib.FindCharacterInFactionBySubtype(factionKey, characterSubtypeKey, shouldOut)
    local factionObj = cm:get_faction(factionKey);
    local factionCharacterList = factionObj:character_list();

    for i = 0, factionCharacterList:num_items() - 1 do
        local character = factionCharacterList:item_at(i);

        if character:character_subtype(characterSubtypeKey) then
            return character;
        end
    end

    if shouldOut then out(">>>> SCEHR LIB | Could not find character in faction by subtype!"); end
    return nil;
end

-- Create an message event for a faction with supplied message data.
function scehr_lib.CreateMessageEvent(factionKey, message)
    cm:show_message_event(
        factionKey,
        message.title,
        message.primary,
        message.secondary,
        true,
        message.index
    );
end

-- Get character spawn coordinates for a faction from a region key. Returns an X and Y coordinate.
function scehr_lib.GetSettlementSpawnCoords(factionKey, regionKey)
    local locX, locY = cm:find_valid_spawn_location_for_character_from_settlement(
        factionKey,
        regionKey,
        false,
        true,
        0
    );
    return locX, locY;
end

-- Get float and truncate to desired decimal places. Returns truncated float.
function scehr_lib.TruncateNumber(number, decimals)
    number = number * (10 ^ decimals);
    number = math.floor(number);
    number = number / (10 ^ decimals);
    return number;
end

-- Increases input value by 1. Returns increased value.
function scehr_lib.IncrementNumber(value)
    return value + 1;
end

-- Reduces input value by 1. Returns reduced value.
function scehr_lib.DecrementNumber(value)
    return value - 1;
end


-- >>>>>> REDUNDANT: IMPLEMENTED BETTER BY CA <<<<<< --

-- USE cm:random_number(100, 1) INSTEAD | Generate random numbers {iterations} times from 1-100, choose one. Returns random number + mod.
function scehr_lib.D100RollWithFlatModifier(iterations, mod)
    local roll = scehr_lib.GenerateRandomNumbers(1, 100, iterations, false);
    local rollModified = roll + mod;
    return rollModified;
end

-- USE cm:random_number(max, min) INSTEAD | Generate random numbers within min/max range for {iterations} amount of times, added to a table. Returns table, or one random number from the table.
function scehr_lib.GenerateRandomNumbers(min, max, iterations, returnAll)
    local rolls = {};
    local randomNumber;

    for _ = 1, iterations do
        randomNumber = math.random(min, max)
        table.insert(rolls, randomNumber);
    end

    if returnAll then
        return rolls;
    else
        return rolls[math.random(1, #rolls)];
    end
end

return scehr_lib;