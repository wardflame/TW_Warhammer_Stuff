-- SCEHR LIBRARY: HEROES OF LEGEND | scehr | 14/12/2023

local scehr_lib = {};

function scehr_lib.FindCharacterInWorldBySubtype(characterSubtypeKey)
    local factionList = cm:model():world():faction_list();

    for i = 0, factionList:num_items() - 1 do
        local factionObj = factionList:item_at(i);
        local factionCharacterList = factionObj:character_list();

        for j = 0, factionCharacterList:num_items() - 1 do
            local character = factionCharacterList:item_at(j);

            if character:character_subtype(characterSubtypeKey) then
                return character;
            end
        end
    end

    out(">>>> SCEHR LIB | Could not find character in world by subtype!");
    return nil;
end

function scehr_lib.FindCharacterInFactionBySubtype(factionKey, characterSubtypeKey)
    local factionObj = cm:get_faction(factionKey);
    local factionCharacterList = factionObj:character_list();

    for i = 0, factionCharacterList:num_items() - 1 do
        local character = factionCharacterList:item_at(i);

        if character:character_subtype(characterSubtypeKey) then
            return character;
        end
    end

    out(">>>> SCEHR LIB | Could not find character in faction by subtype!");
    return nil;
end

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

return scehr_lib;