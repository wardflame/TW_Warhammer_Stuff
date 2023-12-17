-- HEROES OF LEGEND: CHARACTERS-TO-REGIONS ENTRIES | scehr | 14/12/2023

-- NOTE: Each entry should have a unique region key.
-- If not using factionKeys or subcultureKeys, leave the table blank, e.g. "factionsKeys = {},"
-- If not wanting to add otherName's to the character, leave the STRING blank: "".

--[[
    //// ELEMENT BREAKDOWN
    campaignKey = campaign name. (Immortal Empires = main_warhammer. Realms of Chaos = wh3_main_chaos.)
    factionsKeys = factions_tables keys.
    subcultureKeys = cultures_subcultures_tables keys.
    regionKey = regions_tables key.
    ## HEROES
        type = agents_tables key.
        subtype = agents_subtypes_tables key.
        maleOrFemale = true is male character, false is female character.
        customName = true if wanting to manually input a name, false if wanting the game to randomly generate.
        title = custom character title.
        forename = custom character first name.
        surname = custom character last name.
        messageTitle = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        messagePrimary = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        messageSecondary = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        messageIndex = irrelevant. Keep at 0.
    ## LORD
        type = agents_tables key.
        subtype = agent_subtypes_tables key.
        maleOrFemale = true is male character, false is female character.
        title = text\db\names__.loc     | character title.
        forename = text\db\names__.loc  | character first name.
        surname = text\db\names__.loc   | character last name.
        messageTitle = text\db\event_feed_strings__.loc     | Set to nil if not using an incident
        messagePrimary = text\db\event_feed_strings__.loc   | Set to nil if not using an incident
        messageSecondary = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        messageIndex = 0
    aiEligible = true if ai can claim characters, false if only players. If no players are playing an eligible faction, the ai will be able to claim regardless.
]]

local listCR = {
    {
        -- ELEMENT 1
        campaignKey = "main_warhammer",
        factionKeys = {
            "wh_main_chs_chaos",
            "wh3_main_chs_shadow_legion",
            "wh3_main_chs_tong",
            "wh3_main_chs_kvellig",
            "wh3_main_chs_khazag",
            "wh3_main_chs_gharhar",
            "wh3_main_chs_dreaded_wo",
            "wh3_dlc20_chs_sigvald", 
            "wh3_dlc20_chs_kholek",
            "wh3_dlc20_chs_festus"
        },
        subcultureKeys = {},
        regionKey = "wh3_main_combi_region_marienburg",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                title = "",
                forename = "names_name_444449",
                surname = "",
                message = {
                    messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",
                    messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",
                    messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",
                    messageIndex = 2005
                }
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 2
        campaignKey = "wh3_main_chaos",
        factionKeys = {
            "wh_main_chs_chaos",
            "wh3_main_chs_shadow_legion",
            "wh3_main_chs_tong",
            "wh3_main_chs_kvellig",
            "wh3_main_chs_khazag",
            "wh3_main_chs_gharhar",
            "wh3_main_chs_dreaded_wo",
            "wh3_dlc20_chs_sigvald", 
            "wh3_dlc20_chs_kholek",
            "wh3_dlc20_chs_festus"
        },
        subcultureKeys = {},
        regionKey = "wh3_main_chaos_region_marienburg",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                title = "",
                forename = "names_name_444449",
                surname = "",
                message = {
                    messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",
                    messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",
                    messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",
                    messageIndex = 2005
                }
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 3
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_dae_daemons"
        },
        regionKey = "wh3_main_combi_region_marienburg",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                title = "",
                forename = "names_name_444449",
                surname = "",
                message = {
                    messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",
                    messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",
                    messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",
                    messageIndex = 2005
                }
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 4
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_dae_daemons"
        },
        regionKey = "wh3_main_chaos_region_marienburg",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                title = "",
                forename = "names_name_444449",
                surname = "",
                message = {
                    messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",
                    messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",
                    messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",
                    messageIndex = 2005
                }
            }
        },
        aiEligibile = false
    }
}