-- Heroes of Legend: CHARACTER-TO-ANCILLARY FRAMEWORK | by scehr | 20/02/2023

--[[
    ELEMENT BREAKDOWN
    campaignKey = campaign name. (Immortal Empires = main_warhammer. Realms of Chaos = wh3_main_chaos.)
    characterKey = agent_subtypes_tables key.
    ancillaryKey = ancillaries_tables key.
    giftRank = desired rank for character to receive ancillary.
]]
local listCA = {
    --[[{
        -- Franz test
        campaignKey = "main_warhammer",
        characterKey = "wh_main_emp_karl_franz",
        ancillaryKey = "wh_main_anc_weapon_runefang",
        giftRank = 2
    }]]--
    {
        -- ELEMENT 1
        campaignKey = "main_warhammer";
        characterKey = "hermit_knight_1",
        ancillaryKey = "sword_of_virtue",
        giftRank = 8
    },
    {
        -- ELEMENT 2
        campaignKey = "main_warhammer";
        characterKey = "hermit_knight_1",
        ancillaryKey = "dragon_blood_flask",
        giftRank = 15
    },
    {
        -- ELEMENT 3
        campaignKey = "main_warhammer";
        characterKey = "lorenzo_lupo",
        ancillaryKey = "sword_of_lucan",
        giftRank = 5
    },
    {
        -- ELEMENT 4
        campaignKey = "main_warhammer";
        characterKey = "lorenzo_lupo",
        ancillaryKey = "ring_of_luccina",
        giftRank = 12
    },
    {
        -- ELEMENT 5
        campaignKey = "main_warhammer";
        characterKey = "bannaga",
        ancillaryKey = "bangstick",
        giftRank = 7
    },
    {
        -- ELEMENT 6
        campaignKey = "main_warhammer";
        characterKey = "bannaga",
        ancillaryKey = "straw_hat",
        giftRank = 16
    },
    {
        -- ELEMENT 7
        campaignKey = "main_warhammer";
        characterKey = "simaergul_0",
        ancillaryKey = "khorne_collar",
        giftRank = 6
    },
    {
        -- ELEMENT 8
        campaignKey = "main_warhammer";
        characterKey = "simaergul_0",
        ancillaryKey = "packmaster_helm",
        giftRank = 15
    },
    {
        -- ELEMENT 9
        campaignKey = "main_warhammer";
        characterKey = "amadri_ironbark",
        ancillaryKey = "augmented_bark",
        giftRank = 10
    },
    {
        -- ELEMENT 10
        campaignKey = "main_warhammer";
        characterKey = "amadri_ironbark",
        ancillaryKey = "arranoc_crown",
        giftRank = 15
    },
    {
        -- ELEMENT 11
        campaignKey = "main_warhammer";
        characterKey = "amadri_ironbark",
        ancillaryKey = "spite_talisman",
        giftRank = 20
    },
    {
        -- ELEMENT 12
        campaignKey = "main_warhammer";
        characterKey = "vile_prince",
        ancillaryKey = "twisted_hammer",
        giftRank = 12
    },
    {
        -- ELEMENT 13
        campaignKey = "main_warhammer";
        characterKey = "vile_prince",
        ancillaryKey = "doom_mask",
        giftRank = 16
    },
    {
        -- ELEMENT 14
        campaignKey = "main_warhammer";
        characterKey = "sceolan",
        ancillaryKey = "bow_of_loren",
        giftRank = 10
    },
    {
        -- ELEMENT 15
        campaignKey = "main_warhammer";
        characterKey = "sceolan",
        ancillaryKey = "the_buckler",
        giftRank = 18
    },
    {
        -- ELEMENT 16
        campaignKey = "main_warhammer";
        characterKey = "lorenzo_lupo",
        ancillaryKey = "myrmidia_shield",
        giftRank = 16
    },    
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
                    "CharacterRankUp",
                    function(context)
                        local charObj = context:character();
                        local isTarget = charObj:character_subtype(character.characterKey);
                        return isTarget;
                    end,
                    function(context)
                        local charObj = context:character();
                        local charRank = charObj:rank();
                        local charFactionObj = charObj:faction();
                        if charRank >= character.giftRank then
                            cm:add_ancillary_to_faction(charFactionObj, character.ancillaryKey, false);
                            cm:set_saved_value("hol_ca_"..character.characterKey.."_claimed_"..character.ancillaryKey, true);
                            core:remove_listener("hol_ca_"..character.characterKey.."_"..character.ancillaryKey.."_listener");
                            out("SCEHR HOL: "..charObj:character_subtype_key().." claims "..character.ancillaryKey.." at rank "..character.giftRank.."!");
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