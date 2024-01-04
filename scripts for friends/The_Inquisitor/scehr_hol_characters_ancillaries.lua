-- HEROES OF LEGEND: CHARACTER-TO-ANCILLARY FRAMEWORK | scehr | 14/12/2023

local caEntries = require("scehr_hol_characters_ancillaries_entries");

local function InitCharacterAncillaryListeners()

    out("#### SCEHR HOL: Adding character/ancillary listener(s)! ####");

    local listenersAdded = 0;
    for i = 1, #caEntries do
        local character = caEntries[i];
        local campaignName = cm:get_campaign_name();

        if character.campaignKey == campaignName then
            local charHasAnc = cm:get_saved_value("hol_ca_"..character.characterKey.."_claimed_"..character.ancillaryKey);

            if not charHasAnc then
                core:add_listener(
                    "hol_ca_"..character.characterKey.."_"..character.ancillaryKey.."_listener",
                    "CharacterRankUp",
                    function(context)
                        return context:character():character_subtype(character.characterKey);
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

    out("#### SCEHR HOL: Added "..listenersAdded.." character/ancillary listener(s)! ####");

end

cm:add_first_tick_callback(
    function()
        InitCharacterAncillaryListeners();
    end
);