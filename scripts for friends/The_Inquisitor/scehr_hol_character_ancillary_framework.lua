-- Heroes of Legend: CHARACTER-TO-ANCILLARY FRAMEWORK | by scehr | 02/02/2023

local listCA = {
    {
        -- ELEMENT 1
        campaignKey = "campaign_key";
        characterKey = "wh_main_emp_karl_franz",                           -- agent_subtypes_tables key.
        ancillaryKey = "wh2_dlc17_anc_weapon_fell_axe_of_the_drakwald",    -- ancillaries_tables key.
        giftRank = 4                                                       -- desired rank for character to receive ancillary.
    }
}

local function InitCharacterAncillaryListeners()
    out("#### SCEHR HOL: Adding character/ancillary listener(s)! ####")
    local listenersAdded = 0;
    for i = 1, #listCA do
        local character = listCA[i];
        local campaignName = cm:get_campaign_name();

        if character.campaignKey == campaignName then
            
            local charHasAnc = cm:get_saved_value("hol_ca_"..character.characterKey.."_claimed_"..character.ancillaryKey);
            if not charHasAnc then
                core:add_listener(
                    "hol_ca_"..character.characterKey.."_"..character.ancillaryKey.."_listener",
                    "CharacterTurnStart",
                    function(context)
                                local charObj = context:character();
                                return charObj:character_subtype_key() == character.characterKey;
                    end,
                    function(context)
                            local charObj = context:character();
                            local charRank = charObj:rank();
                            local charFactionObj = charObj:faction();
                            if charRank >= character.giftRank then
                                cm:add_ancillary_to_faction(charFactionObj, character.ancillaryKey, false);
                                cm:set_saved_value("hol_ca_"..character.characterKey.."_claimed_"..character.ancillaryKey, true);
                                core:remove_listener("hol_ca_"..character.characterKey.."_"..character.ancillaryKey.."_listener");
                                out("SCEHR HOL: "..charObj:character_subtype_key().." claims "..character.ancillaryKey.." at rank "..character.gift_rank.."!");
                            end
                    end,
                    true
                );
                listenersAdded = listenersAdded + 1;
            end
        end
    end
    out("#### SCEHR HOL: Added "..listenersAdded.." character/ancillary listener(s)! ####")
end

cm:add_first_tick_callback(
    function()
        InitCharacterAncillaryListeners();
    end
);