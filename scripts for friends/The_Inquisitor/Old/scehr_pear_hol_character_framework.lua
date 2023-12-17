-- Heroes of Legend: BUILDING-TO-CHARACTER FRAMEWORK | by scehr & Pear

-- NOTE: Each entry should have a unique building key.
-- If not using factionKeys or subcultureKeys, leave the table blank.
-- If not wanting to add, say, otherName's to the character, leave the STRING blank: "".

--[[
    //// ELEMENT BREAKDOWN
    campaignKey = campaign name. (Immortal Empires = main_warhammer. Realms of Chaos = wh3_main_chaos.)
    factionsKeys = factions_tables keys.
    subcultureKeys = cultures_subcultures_tables keys.
    buildingKey = building_levels_tables key.
    regionKey = regions_tables
    dilemmaKey = dilemmas_tables
    spawnOnCharacterSubtype = agents_subtypes_tables key
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
local listBLL = {
    {
        -- ELEMENT 1
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_emp_empire",
            "wh_main_sc_brt_bretonnia",
            "wh_main_sc_teb_teb",
            "wh3_main_sc_ksl_kislev",
            "wh3_main_sc_cth_cathay"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "fort_orcal_all_HUMAN",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: HERMIT KNIGHT OF MALMONT
                type = "champion",
                subtype = "hermit_knight_1",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Hermit Knight",
                surname = "of Malmont",
                messageTitle = "event_feed_strings_text_hol_event_hermit_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_hermit_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_hermit_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2000  
            }
        },
        lords = {},
    },
    {
        -- ELEMENT 2
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "shang_yang_barracks",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: BANNAGA
                type = "wizard",
                subtype = "bannaga",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Bannaga",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_bannaga_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_bannaga_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_bannaga_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2003                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 3
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_kho_khorne",
            "wh_main_sc_chs_chaos"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "brazen_altar",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: SIMAERGUL
                type = "champion",
                subtype = "simaergul_0",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Simaergul",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_simaergul_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_simaergul_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_simaergul_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2004                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 4
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_emp_empire",
            "wh_main_sc_brt_bretonnia",
            "wh_main_sc_teb_teb",
            "wh3_main_sc_ksl_kislev",
            "wh3_main_sc_cth_cathay"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "HUM_luccini_palace",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {},
        lords = {
            {
                -- LORD 1: PRINCE LORENZO LUPO
                type = "general",
                subtype = "lorenzo_lupo",
                maleOrFemale = true,
                title = "names_name_44442",
                forename = "names_name_44443",
                surname = "names_name_44444",
                messageTitle = "event_feed_strings_text_hol_event_lorenzo_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_lorenzo_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_lorenzo_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2002
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 5
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_dlc05_sc_wef_wood_elves"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "summerstrand",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {},
        lords = {
            {
                -- LORD 1: AMADRI IRONBARK
                type = "general",
                subtype = "amadri_ironbark",
                maleOrFemale = true,
                title = "",
                forename = "names_name_55551",
                surname = "names_name_55552",
                messageTitle = "event_feed_strings_text_hol_event_amadri_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_amadri_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_amadri_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2001
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 6
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_dlc05_sc_wef_wood_elves"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "winterheart",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {},
        lords = {
            {
                -- LORD 1: SCEOLAN
                type = "general",
                subtype = "sceolan",
                maleOrFemale = true,
                title = "",
                forename = "names_name_55558",
                surname = "names_name_55559",
                messageTitle = "event_feed_strings_text_hol_event_sceolan_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_sceolan_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_sceolan_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2006              
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 7
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_nur_nurgle"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "children_of_doom",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                title = "",
                forename = "names_name_55554",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2005
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 8
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "shang_yang_barracks",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: BANNAGA
                type = "wizard",
                subtype = "bannaga",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Bannaga",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_bannaga_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_bannaga_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_bannaga_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2003                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 9
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_kho_khorne",
            "wh_main_sc_chs_chaos"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "brazen_altar",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: SIMAERGUL
                type = "champion",
                subtype = "simaergul_0",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Simaergul",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_simaergul_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_simaergul_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_simaergul_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2004                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 10
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_nur_nurgle"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "children_of_doom",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                title = "",
                forename = "names_name_55554",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2005
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 11
        campaignKey = "main_warhammer",
        factionKeys = {
            "wh_main_vmp_vampire_counts"                       
        },
        subcultureKeys = {},
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "helmut_camp",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: Helmut von Carstein
                type = "champion",
                subtype = "helmut_von_carstein_0",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Helmut",
                surname = "von Carstein",
                messageTitle = "event_feed_strings_text_hol_event_helmut_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_helmut_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_helmut_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2007                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 12
        campaignKey = "main_warhammer",
        factionKeys = {
            "wh_main_vmp_vampire_counts"                       
        },
        subcultureKeys = {},
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "gorgivich_camp",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: Gorgivich Krakvald
                type = "champion",
                subtype = "gorgivich_krakvald_0",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Gorgivich",
                surname = "Krakvald",
                messageTitle = "event_feed_strings_text_hol_event_krakvald_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_krakvald_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_krakvald_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2008                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 13
        campaignKey = "main_warhammer",
        factionKeys = {
            "wh_main_vmp_vampire_counts"                       
        },
        subcultureKeys = {},
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "gunther_camp",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: Gunther von Grecht
                type = "champion",
                subtype = "gunther_von_grecht_0",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Gunther",
                surname = "von Grecht",
                messageTitle = "event_feed_strings_text_hol_event_gunther_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_gunther_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_gunther_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2009                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 14
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_vmp_vampire_counts"  
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "wh2_main_special_altdorf_imperial_palace_vmp",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {},
        lords = {
            {
                -- LORD 1: Emperor Wilhelm I
                type = "general",
                subtype = "emperor_wilhelm_1",
                maleOrFemale = true,
                title = "names_name_55566",
                forename = "names_name_55567",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_wilhelm_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_wilhelm_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_wilhelm_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2010
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 16
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia"  
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {
            "wh_main_sc_emp_empire"
        },
        buildingKey = "tancred_castle",
        regionKey = "",
        dilemmaKey = "fate_of_viscount_dalembençon",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: Viscount d'Alembençon 
                type = "champion",
                subtype = "the_viscount",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Viscount",
                surname = "d'Alembençon",
                messageTitle = "event_feed_strings_text_hol_event_viscount_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_viscount_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_viscount_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2011                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 17
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia"  
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "chalotte_chapel",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: Agravain de Beau Quest 
                type = "champion",
                subtype = "agravain_de_beau_quest",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Agravain",
                surname = "de Beau Quest",
                messageTitle = "event_feed_strings_text_hol_event_agravain_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_agravain_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_agravain_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2012                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 18
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
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "",
        regionKey = "wh3_main_combi_region_marienburg",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
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
                messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2005
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 19
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
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "",
        regionKey = "wh3_main_chaos_region_marienburg",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
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
                messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2005
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 20
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia"  
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "tancred_castle",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: Viscount d'Alembençon 
                type = "champion",
                subtype = "the_viscount",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Viscount",
                surname = "d'Alembençon",
                messageTitle = "event_feed_strings_text_hol_event_viscount_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_viscount_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_viscount_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2011                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 21
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_dae_daemons"  
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "",
        regionKey = "wh3_main_combi_region_marienburg",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
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
                messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2005
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 22
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_dae_daemons"  
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "",
        regionKey = "wh3_main_chaos_region_marienburg",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
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
                messageTitle = "event_feed_strings_text_hol_event_vile_prince_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2005
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 23
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia",
            "wh_main_sc_emp_empire",
            "wh3_main_sc_ksl_kislev",
            "wh3_main_sc_cth_cathay",
            "wh_main_sc_teb_teb",
            "wh_main_sc_dwf_dwarfs",
            "wh2_main_sc_hef_high_elves"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "hundred_sins_street",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: BRUNNER THE BOUNTY HUNTER
                type = "champion",
                subtype = "bounty_hunter_brunner",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Brunner",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_brunner_recruit_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_brunner_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_brunner_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2013                                                                            -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 24
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "nan_gau_forges",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: SHI-HONG
                type = "champion",
                subtype = "shi_hong",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Shi-Hong",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_shi_hong_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_shi_hong_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_shi_hong_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2014                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident                                                                       -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 25
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {},
        buildingKey = "nan_gau_forges",
        regionKey = "",
        dilemmaKey = "",
        spawnOnCharacterSubtype = "",
        heroes = {
            {
                -- HERO 1: SHI-HONG
                type = "champion",
                subtype = "shi_hong",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Shi-Hong",
                surname = "",
                messageTitle = "event_feed_strings_text_hol_event_shi_hong_recruit_title",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "event_feed_strings_text_hol_event_shi_hong_recruit_primary_detail",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "event_feed_strings_text_hol_event_shi_hong_recruit_secondary_detail",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 2014                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident                                                                         -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    }
,
    {
        -- ELEMENT 26
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {},
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {
            "wh_main_sc_dwf_dwarfs"  
        },
        buildingKey = "",
        regionKey = "wh3_main_combi_region_gnashraks_lair",
        dilemmaKey = "ulther_dragon_company_1",
        spawnOnCharacterSubtype = "",
        heroes = {},
        lords = {
            {
                -- LORD 1: Ulther Stonehammer
                type = "general",
                subtype = "ulther_stonehammer",
                maleOrFemale = true,
                title = "",
                forename = "names_name_444450",
                surname = "names_name_444451",
                messageTitle = "",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 0
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 27
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {},
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {
            "wh_main_sc_dwf_dwarfs"  
        },
        buildingKey = "",
        regionKey = "wh3_main_combi_region_gnashraks_lair",
        dilemmaKey = "ulther_dragon_company_1",
        spawnOnCharacterSubtype = "ulther_stonehammer",
        heroes = {
            {
                -- HERO 1: Borri Forkbeard
                type = "champion",
                subtype = "borri_forkbeard",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Borri",
                surname = "Forkbeard",
                messageTitle = "",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 0                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident                                                                       -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 28
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {},
        dilemmaFactionKeys = {},
        dilemmaSubcultureKeys = {
            "wh_main_sc_dwf_dwarfs"  
        },
        buildingKey = "",
        regionKey = "wh3_main_combi_region_karak_azgal",
        dilemmaKey = "fate_of_grimgorson",
        spawnOnCharacterSubtype = "faction_leader",
        heroes = {
            {
                -- HERO 1: Balkrag Grimgorson
                type = "champion",
                subtype = "balkrag_grimgorson",
                maleOrFemale = true,
                customName = true,
                title = "",
                forename = "Balkrag",
                surname = "Grimgorson",
                messageTitle = "",                       -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messagePrimary = "",            -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageSecondary = "",        -- text\db\event_feed_strings__.loc | Set to nil if not using an incident
                messageIndex = 0                                                                           -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident                                                                       -- db\campaign_group_member_criteria_values_tables | Set to nil if not using an incident
            }
        },
        lords = {},
        aiEligibile = false
    }                  
};
local listHumans = {};

local function GetSettlementSpawnCoords(factionKey, regionKey)
    local locX, locY = cm:find_valid_spawn_location_for_character_from_settlement(
        factionKey,
        regionKey,
        false,
        true,
        0
    );
    out("#### SCEHR / PEAR HOL - GetSettlementSpawnCoords: locX: "..tostring(locX)..", locY: "..tostring(locY))
    return locX, locY;
end

local function GetSpawnCoordsFromCharacter(factionObj, characterSubtype)
    local factionKey = factionObj:name()
    local characterList = factionObj:character_list()
    for i = 0, characterList:num_items() - 1 do
        local currentCharacter = characterList:item_at(i)
        local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()
        local characterLookupString = cm:char_lookup_str(currentCharacter);
        if characterSubtype == currentCharacterSubtype then
            local locX, locY = cm:find_valid_spawn_location_for_character_from_character(
                factionKey,
                characterLookupString,
                true
                )
            out("#### SCEHR / PEAR HOL - GetSpawnCoordsFromCharacter: locX: "..tostring(locX)..", locY: "..tostring(locY))
            return locX, locY;
        end
    end
end

local function AINoHumanCheck(listEntry)
    local noHumans = false;
    local numSubcultures = #listEntry.subcultureKeys;
    local numFactions = #listEntry.factionKeys;

    if numSubcultures > 0 then
        local aiCultures = numSubcultures;
        for i = 1, #listEntry.subcultureKeys do
            local subKey = listEntry.subcultureKeys[i];
            for j = 1, #listHumans do
                local isHumanEligible = cm:get_faction(listHumans[j]):subculture() == subKey;
                if isHumanEligible then
                    aiCultures = aiCultures - 1;
                end
            end
        end
        if aiCultures >= numSubcultures then
            noHumans = true;
        end
    end

    if numFactions > 0 then
        local aiFactions = numFactions;
        for i = 1, #listEntry.factionKeys do
            local facKey = listEntry.factionKeys[i];
            for j = 1, #listHumans do
                if listHumans[i] == facKey then
                    aiFactions = aiFactions - 1;
                end
            end
        end
        if aiFactions >= numFactions then
            noHumans = true;
        end
    end

    if noHumans then
        return true;
    end
    return listEntry.aiEligibile;
end

local function CreateCharacterEventMessage(characterEntry, factionKey)
    cm:show_message_event(
        factionKey,
        characterEntry.messageTitle,
        characterEntry.messagePrimary,
        characterEntry.messageSecondary,
        true,
        characterEntry.messageIndex
    );
end

local function SpawnCharacters(listEntry, factionObj, regionKey)

    out("#### SCEHR / PEAR HOL - Visualising listEntry table from SpawnCharacters function:")
    out("\n\n----------------------------------------------------------------------")
    out(table.tostring(listEntry, true))
    out("\n\n----------------------------------------------------------------------")

    local locX, locY;
    local factionKey = factionObj:name();

    if #listEntry.heroes > 0 then
        -- Create heroes.
        for i = 1, #listEntry.heroes do

            local heroEntry = listEntry.heroes[i];
            local spawnOnCharacterSubtype = listEntry.spawnOnCharacterSubtype
            if #spawnOnCharacterSubtype ~= 0 then
                
                if spawnOnCharacterSubtype == "faction_leader" then
                    local factionLeaderSubtype = factionObj:faction_leader():character_details():character_subtype_key()
                    spawnOnCharacterSubtype = factionLeaderSubtype
                end
                locX, locY = GetSpawnCoordsFromCharacter(factionObj, spawnOnCharacterSubtype)
            else
                locX, locY = GetSettlementSpawnCoords(factionKey, regionKey);
            end
            local heroObj = cm:create_agent(
                factionObj:name(),
                heroEntry.type,
                heroEntry.subtype,
                locX,
                locY
            );

            -- Set custom name.
            if heroEntry.customName then
                cm:change_character_custom_name(
                heroObj,
                heroEntry.forename,
                heroEntry.surname,
                heroEntry.title,
                ""
                );
            end

            -- Replenish action points so they can be used on-spawn.
            local heroLookUp = cm:char_lookup_str(heroObj);
            cm:replenish_action_points(heroLookUp);

            -- Create event message if one available.
            if heroEntry.messageTitle ~= nil then
                CreateCharacterEventMessage(heroEntry, factionKey);
            end
        end
    end

    if #listEntry.lords > 0 then
        -- Lord subculture name changes
        for i = 1, #listEntry.lords do
            local lordEntry = listEntry.lords[i];

            -- The names included in the listBLL table are ommitted from this table
            local lord_subculture_names = {
                {lord_subtype = "lorenzo_lupo", subculture = "wh_main_sc_brt_bretonnia", forename = "names_name_444431", surname = "names_name_444441"},
                {lord_subtype = "lorenzo_lupo", subculture = "wh3_main_sc_ksl_kislev", forename = "names_name_444432", surname = "names_name_444442"},
                {lord_subtype = "lorenzo_lupo", subculture = "wh3_main_sc_cth_cathay", forename = "names_name_444433", surname = "names_name_444443"},
                {lord_subtype = "lorenzo_lupo", subculture = "wh_main_sc_teb_teb", forename = "names_name_444434", surname = "names_name_444444"}
            };

            for g = 1, #lord_subculture_names do
                local lord_subtype = lord_subculture_names[g].lord_subtype

                if lordEntry.subtype == lord_subtype then 
                    local subculture = lord_subculture_names[g].subculture;

                    if factionObj:subculture() == subculture then
                        lordEntry.forename = lord_subculture_names[g].forename
                        lordEntry.surname = lord_subculture_names[g].surname
                        out("#### SCEHR / PEAR HOL - Replaced the names for the lord_subtype: " ..lord_subtype .." for the subculture: " ..subculture)
                    end
                end
            end
            out("#### SCEHR / PEAR HOL - Visualising listEntry table after names change:")
            out("\n\n----------------------------------------------------------------------")
            out(table.tostring(listEntry, true))
            out("\n\n----------------------------------------------------------------------")
        end
    end

    if #listEntry.lords > 0 then
        -- Create lords.
        for i = 1, #listEntry.lords do
            local lordEntry = listEntry.lords[i];

            cm:spawn_character_to_pool(
                factionKey,
                lordEntry.forename,
                lordEntry.surname,
                lordEntry.title,
                "",
               20,
                lordEntry.maleOrFemale,
               lordEntry.type,
               lordEntry.subtype,
                true,
                ""
            );

            -- Create event message if one available.
            if lordEntry.messageTitle ~= nil then
                CreateCharacterEventMessage(lordEntry, factionKey);
            end
        end
    end
end

local function FactionBuildingQuery(listEntry, factionObj)
    local buildingKey = listEntry.buildingKey;
    local factionHasBuilding = cm:faction_contains_building(factionObj, buildingKey);

    if not factionHasBuilding then
        return;
    else
        local regionList = factionObj:region_list();
        local targetRegion;

        for i = 0, regionList:num_items() - 1 do
            local region = regionList:item_at(i);
            local regionHasBuilding = region:building_exists(buildingKey);
            if regionHasBuilding then
                targetRegion = region;
                return true, targetRegion;
            end
        end
    end
end

local function getAliveFactionsOfSubculture(subcultureKey)
    local alive_factions_of_subculture = {}
    local factionList = cm:model():world():faction_list();
    for i = 0, factionList:num_items() - 1 do
		local faction = factionList:item_at(i);
        if faction:subculture() == subcultureKey then
            if cm:faction_is_alive(faction) then
                local factionKey = faction:name()
                table.insert(alive_factions_of_subculture, factionKey);
            end
        end
    end
    return alive_factions_of_subculture;
end

local function SpawnCharacterDilemmaBypass(factionKey, dilemmaKey)
    out("#### SCEHR / PEAR HOL: Running SpawnCharacterDilemmaBypass function. ####")
    local factionObj = cm:get_faction(factionKey)
    for i = 1, #listBLL do
        local listEntry = listBLL[i];

        if listEntry.campaignKey == cm:get_campaign_name() then

            local heroEntry = listEntry.heroes[i]
            local lordEntry = listEntry.lords[i]
            local characterSubtype = ""
            if heroEntry ~= nil and lordEntry == nil then
                characterSubtype = heroEntry.subtype
            elseif heroEntry == nil and lordEntry ~= nil then
                characterSubtype = lordEntry.subtype
            end
            local claimString = "hol_bc_"..characterSubtype.."_claimed";
            local charactersClaimed = cm:get_saved_value(claimString);

            if not charactersClaimed then
                local characterDilemmaKey = listEntry.dilemmaKey;
                listEntry.aiEligibile = AINoHumanCheck(listEntry);
                local factionIsNull = factionObj:is_null_interface();
                local factionIsHuman = factionObj:is_human();
                local aiEligible = not factionIsHuman and listEntry.aiEligibile;
                local validClaim = factionIsHuman or aiEligible;

                if #characterDilemmaKey ~= 0 and characterDilemmaKey == dilemmaKey then -- if the requirement is a building
                    if not factionIsNull and validClaim then
                        local hasBuilding, region = FactionBuildingQuery(listEntry, factionObj);
                        if hasBuilding then
                            SpawnCharacters(listEntry, factionObj, region:name());
                            cm:set_saved_value(claimString, true);
                        end
                    end
                else
                    out("#### SCEHR / PEAR HOL: recruitment requirement error! ####")
                end
            end
        end
    end
end

local function HandleDilemmaTancredCastle(factionKey, dilemmaKey, choice, targetFactionKey)
    local faction = cm:get_faction(factionKey)
    if choice == 0 then
        local randomNumber = cm:random_number(100,1)
        if randomNumber >= 51 then
            cm:force_declare_war(factionKey, targetFactionKey, false, false)
        end

    elseif choice == 1 then
        SpawnCharacterDilemmaBypass(targetFactionKey, dilemmaKey)

    elseif choice == 2 then
        SpawnCharacterDilemmaBypass(targetFactionKey, dilemmaKey)
        cm:apply_effect_bundle("tancred_garrison_returned_safely", factionKey, 0)
        cm:add_unit_to_faction_mercenary_pool(faction, "wh_main_brt_cav_knights_of_the_realm", 2, 1, 100, 1, "", "", "", true);
    end    
end

local function HandleDilemmaKarakAzgal(factionKey, dilemmaKey, choice)
    local faction = cm:get_faction(factionKey)
    local factionLeader = faction:faction_leader()
    if choice == 0 then
        cm:force_add_trait(cm:char_lookup_str(factionLeader), "balkrag_kill_slayer_buff", true)
        cm:trigger_incident(factionKey, "hol_balkrag_slay_event", true)

    elseif choice == 1 then
        cm:force_add_trait(cm:char_lookup_str(factionLeader), "balkrag_aid_slayer_debuff", true)
        SpawnCharacterDilemmaBypass(factionKey, dilemmaKey)
    end
end

local function HandleDilemmaGnashraksLair(factionKey, choice)
    if choice == 0 then
        cm:trigger_incident(factionKey, "hol_ulther_aid_event", true)
        local locX, locY = cm:find_valid_spawn_location_for_character_from_settlement(factionKey, "wh3_main_combi_region_gnashraks_lair", false, true)
        cm:create_force_with_general(
            factionKey,
            "ulthers_dragon_company",
            "wh3_main_combi_region_gnashraks_lair",
            locX,
            locY,
            "general",
            "ulther_stonehammer",
            "names_name_444450",
            "",
            "names_name_444451",
            "",
            false,
            function(cqi)
                local militaryForce = cm:get_character_by_cqi(cqi):military_force()
                cm:add_experience_to_units_commanded_by_character(cm:char_lookup_str(cqi), 5)
                local agent = cm:create_agent(factionKey, "champion", "borri_forkbeard", locX, locY)
                local forename = common:get_localised_string("names_name_444452")
                local surname = common:get_localised_string("names_name_444453")
                cm:change_character_custom_name(agent, forename, surname,"","")
                cm:embed_agent_in_force(agent, militaryForce);   
                cm:replenish_action_points(cm:char_lookup_str(cqi))     
            end
        );

    elseif choice == 1 then
        cm:trigger_incident(factionKey, "hol_ulther_refuse_event", true)
        cm:add_event_restricted_unit_record_for_faction("ulthers_dragon_company", factionKey, "ulther_dragon_company_restriction_text")

    elseif choice == 2 then
        cm:set_saved_value("hol_gnashraks_lair_dilemma_counter_"..factionKey, 1)
    end
end

local function AugustineDefeatedListener()
    core:add_listener(
        "hol_dilemma_augustine_defeated",
        "CharacterConvalescedOrKilled",
        true,
        function(context)
            local characterSubtype = context:character():character_details():character_subtype_key()
            local subtypeAugustine = "augustine_de_chegney"
            local isComplete = false
            -- We declare our loop variables outside the loop for better performance.
            local subtype  = nil

            if characterSubtype == subtypeAugustine then

                local humanFactions = cm:get_human_factions()
                for h = 1, #humanFactions do
                    local factionKey = humanFactions[h]
                    local faction = cm:get_faction(factionKey)

                    if cm:pending_battle_cache_faction_is_involved(factionKey) then

                        -- See if we beat Augustine when he was defending.
                        if cm:pending_battle_cache_faction_is_attacker("mixer_brt_viscountcy_de_chegney") then
                            -- Loop over every defending character to check their subtype.
                            for i = 1, cm:pending_battle_cache_num_defenders() do
                                subtype = cm:pending_battle_cache_get_defender_subtype(i)
                                if subtype == subtypeAugustine then
                                    isComplete = true
                                    break
                                end
                            end
                        end

                        -- See if we beat Augustine when he was attacking.
                        if cm:pending_battle_cache_faction_is_defender("mixer_brt_viscountcy_de_chegney") then

                            -- Loop over every attacking character to check their subtype.
                            for i = 1, cm:pending_battle_cache_num_attackers() do
                                subtype = cm:pending_battle_cache_get_attacker_subtype(i)
                                if subtype == subtypeAugustine then
                                    isComplete = true
                                    break
                                end
                            end
                        end

                        if isComplete then
                            if faction:subculture() ~= "wh_main_sc_brt_bretonnia" then
                                cm:trigger_dilemma(factionKey, "fate_of_augustine_bretonnia")
                            else
                                cm:trigger_dilemma(factionKey, "fate_of_augustine")
                            end
                        end
                    end
                end
            end
        end,
        true
    );
end

local function SpawnBrunnerViscountArmy(faction)
    local factionKey = faction:name()
    local characterList = faction:character_list()
    for i = 0, characterList:num_items() - 1 do
        local currentCharacter = characterList:item_at(i)
        local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()

        if currentCharacterSubtype == "bounty_hunter_brunner" then
            if currentCharacter:is_embedded_in_military_force() then
                local brunnerForceGeneral = currentCharacter:embedded_in_military_force():general_character()
                local brunnerGeneralLookupString = cm:char_lookup_str(brunnerForceGeneral)
                local randomNumber = cm:random_number(100,1)
                local viscountAugustineSpawnChance = cm:get_saved_value("viscount_augustine_spawn_chance")

                if randomNumber >= viscountAugustineSpawnChance then
                    local regionKey = currentCharacter:region():name()
                    local forceFactionKey = "mixer_brt_viscountcy_de_chegney"
                    local forceFaction = cm:get_faction(forceFactionKey)
                    cm:change_localised_faction_name(forceFactionKey, "factions_screen_name_wh3_inq_viscountcy_chegney")
                    cm:disable_event_feed_events(true, "wh_event_category_diplomacy", "", "")
                    cm:disable_event_feed_events(true, "wh_event_category_character", "", "")
                    
                    if faction:at_war_with(forceFaction) == false then
                        cm:force_declare_war(factionKey, forceFactionKey, false, false)
                        local callbackDelay = 0.2
                        cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_diplomacy", "", "") end, callbackDelay)
                        cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", "") end, callbackDelay)
                    end

                    AugustineDefeatedListener()
                    local locX, locY = cm:find_valid_spawn_location_for_character_from_settlement(forceFactionKey, regionKey, false, true)
                    cm:create_force_with_general(
                        forceFactionKey,
                        "wh_main_brt_cav_knights_of_the_realm, wh_main_brt_cav_knights_of_the_realm, wh_dlc04_emp_inf_free_company_militia_0,wh_dlc04_emp_inf_free_company_militia_0, wh_dlc04_emp_inf_free_company_militia_0, wh_dlc04_emp_inf_free_company_militia_0, wh_dlc04_emp_inf_free_company_militia_0, wh_dlc04_emp_inf_free_company_militia_0, wh_dlc07_brt_peasant_mob_0, wh_dlc07_brt_peasant_mob_0, wh_main_brt_art_field_trebuchet, wh_dlc07_brt_inf_foot_squires_0, wh_dlc07_brt_inf_foot_squires_0, wh_dlc07_brt_inf_foot_squires_0, wh_dlc07_brt_cav_knights_errant_0, wh_dlc07_brt_cav_knights_errant_0, wh_dlc07_brt_cav_questing_knights_0, wh_dlc07_brt_cav_royal_pegasus_knights_0, wh_dlc07_brt_cav_royal_pegasus_knights_0, wh_dlc07_brt_cav_royal_hippogryph_knights_0",
                        regionKey,
                        locX,
                        locY,
                        "general",
                        "augustine_de_chegney",
                        "names_name_444457",
                        "",
                        "names_name_444458",
                        "",
                        false,
                        function(cqi)
                            cm:set_saved_value("hol_brunner_skill_dilemma_"..factionKey, false)
                            local characterLookupString = cm:char_lookup_str(cqi);
                            cm:set_character_immortality(characterLookupString, false)
                            cm:replenish_action_points(characterLookupString)
                            cm:add_experience_to_units_commanded_by_character(cm:char_lookup_str(cqi), 7)
                            cm:attack_queued(characterLookupString, brunnerGeneralLookupString)
                        end
                    );
                end
            end
        end
    end
end

local function HandleDilemmaBrunnerSkill(factionKey, choice)
    local faction = cm:get_faction(factionKey)
    if choice == 0 then
        local characterList = faction:character_list()
        for i = 0, characterList:num_items() - 1 do
            local currentCharacter = characterList:item_at(i)
            local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()

            if currentCharacterSubtype == "bounty_hunter_brunner" then
                cm:force_add_trait(cm:char_lookup_str(currentCharacter), "brunner_identity_revealed", true)
                
                local randomNumber = cm:random_number(100,1)
                cm:set_saved_value("viscount_augustine_spawn_chance", 5)
                local viscountAugustineSpawnChance = cm:get_saved_value("viscount_augustine_spawn_chance")
                if randomNumber >= viscountAugustineSpawnChance then
                    SpawnBrunnerViscountArmy(faction)
                end
            end
        end
    elseif choice == 1 then
        local characterList = faction:character_list()

        for i = 0, characterList:num_items() - 1 do
            local currentCharacter = characterList:item_at(i)
            local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()

            if currentCharacterSubtype == "bounty_hunter_brunner" then
                cm:force_add_trait(cm:char_lookup_str(currentCharacter), "brunner_identity_concealed", true)
            end
        end
    end
end

local function HandleDilemmaAugustineDefeatedNonBrt(factionKey, dilemmaKey, choice, targetFactionKey)
    local faction = cm:get_faction(factionKey)
    if choice == 0 then
        cm:trigger_incident(factionKey, "hol_augustine_kill_event", true)

        local characterList = faction:character_list()
        for i = 0, characterList:num_items() - 1 do
            local currentCharacter = characterList:item_at(i)
            local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()

            if currentCharacterSubtype == "bounty_hunter_brunner" then
                cm:force_remove_trait(cm:char_lookup_str(currentCharacter), "brunner_identity_revealed")
            end
        end
    elseif choice == 1 then
        cm:trigger_incident(factionKey, "hol_augustine_ransom_event", true)
        SpawnCharacterDilemmaBypass(targetFactionKey, dilemmaKey)
    end
end

local function HandleDilemmaAugustineDefeatedBrt(factionKey, dilemmaKey, choice)
    local faction = cm:get_faction(factionKey)
    if choice == 0 then
        cm:trigger_incident(factionKey, "hol_augustine_kill_event", true)

        local characterList = faction:character_list()
        for i = 0, characterList:num_items() - 1 do
            local currentCharacter = characterList:item_at(i)
            local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()

            if currentCharacterSubtype == "bounty_hunter_brunner" then
                cm:force_remove_trait(cm:char_lookup_str(currentCharacter), "brunner_identity_revealed")
            end
        end
    elseif choice == 1 then
        local characterList = faction:character_list()
        for i = 0, characterList:num_items() - 1 do
            local currentCharacter = characterList:item_at(i)
            local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()

            if currentCharacterSubtype == "bounty_hunter_brunner" then
                cm:force_remove_trait(cm:char_lookup_str(currentCharacter), "brunner_identity_revealed")
                cm:force_add_trait(cm:char_lookup_str(currentCharacter), "brunner_identity_revealed_augustine_enlisted", true)
            end
        end

        SpawnCharacterDilemmaBypass(factionKey, dilemmaKey)

        local callbackDelay = 0.2
        cm:callback(
            function() 
                local newCharacterList = faction:character_list()
                for i = 0, newCharacterList:num_items() - 1 do
                    local currentCharacter = newCharacterList:item_at(i)
                    local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()

                    if currentCharacterSubtype == "augustine_de_chegney" then
                        cm:force_add_trait(cm:char_lookup_str(currentCharacter), "augustine_enlisted", true)
                    end
                end
            end, 
            callbackDelay
        )

        local newCharacterList = faction:character_list()
        for i = 0, newCharacterList:num_items() - 1 do
            local currentCharacter = newCharacterList:item_at(i)
            local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()

            if currentCharacterSubtype == "augustine_de_chegney" then
                cm:force_add_trait(cm:char_lookup_str(currentCharacter), "augustine_enlisted", true)
            end
        end
    elseif choice == 2 then
        cm:trigger_incident(factionKey, "hol_augustine_exile_event", true)

        local characterList = faction:character_list()
        for i = 0, characterList:num_items() - 1 do
            local currentCharacter = characterList:item_at(i)
            local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()

            if currentCharacterSubtype == "bounty_hunter_brunner" then
                cm:force_remove_trait(cm:char_lookup_str(currentCharacter), "brunner_identity_revealed")
            end
        end

        local oldWorldSubcultures = {
            "wh2_main_sc_hef_high_elves", 
            "wh3_main_sc_cth_cathay", 
            "wh3_main_sc_ksl_kislev", 
            "wh_main_sc_dwf_dwarfs", 
            "wh_main_sc_teb_teb", 
            "wh_main_sc_brt_bretonnia"
        }

        local randomSubcultureKey = cm:random_number(#oldWorldSubcultures, 1)
        local subcultureKey = oldWorldSubcultures[randomSubcultureKey]
        local factionsInSubculture = getAliveFactionsOfSubculture(subcultureKey)
        local randomFactionKey = cm:random_number(#factionsInSubculture, 1)
        SpawnCharacterDilemmaBypass(randomFactionKey, dilemmaKey)
    end
end

local function HandleDilemmaInterface(factionKey, dilemmaKey, choice)
    if dilemmaKey == "fate_of_viscount_dalembençon" then
        local couronneFactionKey = "wh_main_brt_bretonnia"
        local bretonniaSubculture = "wh_main_sc_brt_bretonnia"
        local couronneFaction = cm:get_faction(couronneFactionKey)

        if cm:faction_is_alive(couronneFaction) then
            local targetFactionKey = couronneFactionKey
            HandleDilemmaTancredCastle(factionKey, dilemmaKey, choice, targetFactionKey)
        else
            local aliveBretonniaFactions = getAliveFactionsOfSubculture(bretonniaSubculture)
            local randomNumber = cm:random_number(#aliveBretonniaFactions, 1)
            local targetFactionKey = aliveBretonniaFactions[randomNumber]
            HandleDilemmaTancredCastle(factionKey, dilemmaKey, choice, targetFactionKey)
        end

    elseif dilemmaKey == "fate_of_grimgorson" then
        HandleDilemmaKarakAzgal(factionKey, dilemmaKey, choice)

    elseif dilemmaKey == "ulther_dragon_company_1" or dilemmaKey == "ulther_dragon_company_2" then
        HandleDilemmaGnashraksLair(factionKey, choice)

    elseif dilemmaKey == "brunner_secret_identity" then
        HandleDilemmaBrunnerSkill(factionKey, choice)

    elseif dilemmaKey == "fate_of_augustine" then
        local couronneFactionKey = "wh_main_brt_bretonnia"
        local bretonniaSubculture = "wh_main_sc_brt_bretonnia"
        local couronneFaction = cm:get_faction(couronneFactionKey)

        if cm:faction_of_subculture_is_alive(bretonniaSubculture) then
            if cm:faction_is_alive(couronneFaction) then
                local targetFactionKey = couronneFactionKey
                HandleDilemmaAugustineDefeatedNonBrt(factionKey, dilemmaKey, choice, targetFactionKey)
            else
                local aliveBretonniaFactions = getAliveFactionsOfSubculture(bretonniaSubculture)
                local randomNumber = cm:random_number(#aliveBretonniaFactions, 1)
                local targetFactionKey = aliveBretonniaFactions[randomNumber]
                HandleDilemmaAugustineDefeatedNonBrt(factionKey, dilemmaKey, choice, targetFactionKey)
            end
        end
    elseif dilemmaKey == "fate_of_augustine_bretonnia" then
        HandleDilemmaAugustineDefeatedBrt(factionKey, dilemmaKey, choice)
    end
end

local function TriggerDilemma(faction, dilemmaKey) 
    local isFactionHuman = faction:is_human()
    local factionKey = faction:name()
    if dilemmaKey == "fate_of_viscount_dalembençon" then
        local couronneFactionKey = "wh_main_brt_bretonnia"
        local bretonniaSubculture = "wh_main_sc_brt_bretonnia"
        local couronneFaction = cm:get_faction(couronneFactionKey)

        if cm:faction_of_subculture_is_alive(bretonniaSubculture) then
            if isFactionHuman then
                cm:trigger_dilemma(factionKey, dilemmaKey)
            else
                if cm:faction_is_alive(couronneFaction) then
                    local targetFactionKey = couronneFactionKey
                    SpawnCharacterDilemmaBypass(targetFactionKey, dilemmaKey)
                else
                    local aliveBretonniaFactions = getAliveFactionsOfSubculture(bretonniaSubculture)
                    local randomNumber = cm:random_number(#aliveBretonniaFactions, 1)
                    local targetFactionKey = aliveBretonniaFactions[randomNumber]
                    SpawnCharacterDilemmaBypass(targetFactionKey, dilemmaKey)
                end
            end
        end
    elseif dilemmaKey == "fate_of_grimgorson" then
        cm:trigger_dilemma(factionKey, dilemmaKey)

    elseif dilemmaKey == "ulther_dragon_company_1" then
        cm:trigger_dilemma(factionKey, dilemmaKey)
    end
end

local function TerminateCharacterListeners(listEntry)
    local totalSubcultures = #listEntry.subcultureKeys;
    local totalDilemmaSubculture = #listEntry.dilemmaSubcultureKeys;
    local totalFactions = #listEntry.factionKeys;
    local totalDilemmaFactions = #listEntry.dilemmaFactionKeys;
    local heroEntry = listEntry.heroes
    local lordEntry = listEntry.lords
    local characterSubtype = ""
    if heroEntry ~= nil and lordEntry == nil then
        characterSubtype = heroEntry.subtype
    elseif heroEntry == nil and lordEntry ~= nil then
        characterSubtype = lordEntry.subtype
    end
    
    if totalSubcultures > 0 then
        for i = 1, totalSubcultures do
            local subcultureKey = listEntry.subcultureKeys[i];
            local listenerName = "hol_bc_"..subcultureKey.."_"..characterSubtype.."_subculture_listener"
            cm:remove_faction_turn_start_listener_by_subculture(listenerName);
            out("#### SCEHR / PEAR HOL: Terminated "..listenerName.."! ####");
        end
    end

    if totalFactions > 0 then
        for i = 1, totalFactions do
            local factionKey = listEntry.factionKeys[i];
            local listenerName = "hol_bc_"..factionKey.."_"..characterSubtype.."_faction_listener"
            cm:remove_faction_turn_start_listener_by_name(listenerName);
            out("#### SCEHR / PEAR HOL: Terminated "..listenerName.."! ####");
        end
    end

    if totalDilemmaSubculture > 0 then
        for i = 1, totalSubcultures do
            local dilemmaSubcultureKey = listEntry.dilemmaSubcultureKeys[i];
            local listenerName = "hol_bc_"..dilemmaSubcultureKey.."_"..characterSubtype.."_subculture_listener"
            cm:remove_faction_turn_start_listener_by_subculture(listenerName);
            out("#### SCEHR / PEAR HOL: Terminated "..listenerName.."! ####");
        end
    end
    
    if totalDilemmaFactions > 0 then
        for i = 1, totalFactions do
            local dilemmaFactionKey = listEntry.dilemmaFactionKeys[i];
            local listenerName = "hol_bc_"..dilemmaFactionKey.."_"..characterSubtype.."_faction_listener"
            cm:remove_faction_turn_start_listener_by_name(listenerName);
            out("#### SCEHR / PEAR HOL: Terminated "..listenerName.."! ####");
        end
    end
end

local function InitListeners()
    out("#### SCEHR / PEAR HOL: Adding listener(s)! ####");

    core:add_listener(
		"hol_dilemma_choice_made",
		"DilemmaChoiceMadeEvent",
		function(context)
            return context:faction():is_human()
        end,
        function(context)
            local factionKey = context:faction():name()
            local dilemmaKey = context:dilemma()
            local choice = context:choice()
			HandleDilemmaInterface(factionKey, dilemmaKey, choice)
		end,
		true
	);

    core:add_listener(
		"hol_gnashrak_lair_counter",
		"FactionTurnStart",
		function(context)
            local faction = context:faction()
            local factionKey = faction:name()
            local gnashraksLairCounter = cm:get_saved_value("hol_gnashraks_lair_dilemma_counter_"..factionKey)
            local counterFactionKey = ""
            if gnashraksLairCounter ~= nil then
                counterFactionKey = gnashraksLairCounter:match("hol_gnashraks_lair_dilemma_counter_(.*)$")
            end
            return faction:is_human() and gnashraksLairCounter ~= nil and factionKey == counterFactionKey
        end,
        function(context)
            local factionKey = context:faction():name()
            local gnashraksLairCounter = cm:get_saved_value("hol_gnashraks_lair_dilemma_counter_"..factionKey)
            if gnashraksLairCounter == 10 then
                cm:trigger_dilemma(factionKey, "ulther_dragon_company_2")
            elseif gnashraksLairCounter < 10 and gnashraksLairCounter >= 1 then
                cm:set_saved_value("hol_gnashraks_lair_dilemma_counter_"..factionKey, gnashraksLairCounter + 1)
            end
		end,
		true
	);

    cm:trigger_dilemma("wh_main_dwf_dwarfs", "ulther_dragon_company")
    cm:trigger_dilemma("wh_main_dwf_dwarfs", "wh3_dlc24_the_changeling_badlands_grand_scheme")

    

    core:add_listener(
		"hol_brunner_skill_dilemma",
		"FactionTurnStart",
		function(context)
            local faction = context:faction()
            local subculture = faction:subculture()
            return faction:is_human() and (subculture == "wh2_main_sc_hef_high_elves" or subculture == "wh3_main_sc_cth_cathay" or subculture == "wh3_main_sc_ksl_kislev"
             or subculture == "wh_main_sc_dwf_dwarfs" or subculture == "wh_main_sc_emp_empire" or subculture == "wh_main_sc_teb_teb" or subculture == "wh_main_sc_brt_bretonnia")
        end,
        function(context)
            local faction = context:faction()
            local factionKey = faction:name()
            local brunnerdilemmaKey = cm:get_saved_value("hol_brunner_skill_dilemma_"..factionKey)
            local brunnerFactionKey = ""

            if brunnerdilemmaKey ~= nil then
                brunnerFactionKey = brunnerdilemmaKey:match("hol_brunner_skill_dilemma_(.*)$")
            elseif brunnerdilemmaKey == false then
                return
            end

            local characterList = faction:character_list()
            for i = 0, characterList:num_items() - 1 do
                local currentCharacter = characterList:item_at(i)
                local currentCharacterSubtype = currentCharacter:character_details():character_subtype_key()
                if currentCharacterSubtype == "bounty_hunter_brunner" then
                    if currentCharacter:has_skill("secret_identity") then
                        if currentCharacter:is_embedded_in_military_force() then
                            if brunnerdilemmaKey == nil then
                                cm:trigger_dilemma(factionKey, "brunner_secret_identity")
                                cm:set_saved_value("hol_brunner_skill_dilemma_"..factionKey, true)

                            elseif brunnerdilemmaKey then
                                if factionKey == brunnerFactionKey then
                                    local randomNumber = cm:random_number(100,1)
                                    local viscountAugustineSpawnChance = cm:get_saved_value("viscount_augustine_spawn_chance")
                                    
                                    if randomNumber >= viscountAugustineSpawnChance then
                                        cm:set_saved_value("viscount_augustine_spawn_chance", viscountAugustineSpawnChance + 5)
                                        SpawnBrunnerViscountArmy(faction)
                                    end
                                end
                            end
                        end
                    end
                end
            end
		end,
		true
	);

    local listenersAdded = 0;

    for i = 1, #listBLL do
        local listEntry = listBLL[i];

        if listEntry.campaignKey == cm:get_campaign_name() then

            local heroEntry = listEntry.heroes[i]
            local lordEntry = listEntry.lords[i]
            local characterSubtype = ""
            if heroEntry ~= nil and lordEntry == nil then
                characterSubtype = heroEntry.subtype
            elseif heroEntry == nil and lordEntry ~= nil then
                characterSubtype = lordEntry.subtype
            end
            local claimString = "hol_bc_"..characterSubtype.."_claimed";
            local charactersClaimed = cm:get_saved_value(claimString);

            if not charactersClaimed then
                local totalSubcultures = #listEntry.subcultureKeys;
                local totalFactions = #listEntry.factionKeys;
                local totalDilemmaSubcultures = #listEntry.dilemmaSubcultureKeys;
                local totalDilemmaFactions = #listEntry.dilemmaFactionKeys;
                local buildingKey = listEntry.buildingKey;
                local regionKey = listEntry.regionKey;
                local dilemmaKey = listEntry.dilemmaKey;
                listEntry.aiEligibile = AINoHumanCheck(listEntry);

                -- Subculture listener init.
                if totalSubcultures > 0 then
                    for j = 1, totalSubcultures do
                        local subcultureKey = listEntry.subcultureKeys[j];

                        if #buildingKey ~= 0 and #regionKey == 0 and #dilemmaKey == 0 then -- requirement is a building
                            cm:add_faction_turn_start_listener_by_subculture(
                            "hol_bc_"..subcultureKey.."_"..characterSubtype.."_subculture_listener",
                            subcultureKey,
                            function(context)
                                local factionObj = context:faction();
                                local factionIsNull = factionObj:is_null_interface();
                                local factionIsHuman = factionObj:is_human();
                                local aiEligible = not factionIsHuman and listEntry.aiEligibile;
                                local validClaim = factionIsHuman or aiEligible;

                                if not factionIsNull and validClaim then
                                    local hasBuilding, region = FactionBuildingQuery(listEntry, factionObj);
                                    if hasBuilding then
                                        SpawnCharacters(listEntry, context:faction(), region:name());
                                        cm:set_saved_value(claimString, true);
                                        TerminateCharacterListeners(listEntry);
                                    end
                                end
                            end,
                            true
                            );
                            listenersAdded = listenersAdded + 1;

                        elseif #buildingKey == 0 and #regionKey ~= 0 and #dilemmaKey == 0 then -- requirement is a region
                            cm:add_faction_turn_start_listener_by_subculture(
                            "hol_bc_"..subcultureKey.."_"..characterSubtype.."_subculture_listener",
                            subcultureKey,
                            function(context)
                                local factionObj = context:faction();
                                local factionIsNull = factionObj:is_null_interface();
                                local factionIsHuman = factionObj:is_human();
                                local aiEligible = not factionIsHuman and listEntry.aiEligibile;
                                local validClaim = factionIsHuman or aiEligible;

                                if not factionIsNull and validClaim then
                                    if cm:is_region_owned_by_faction(regionKey, context:faction():name()) then
                                        local region = cm:get_region(regionKey)
                                        SpawnCharacters(listEntry, context:faction(), region);
                                        cm:set_saved_value(claimString, true);
                                        TerminateCharacterListeners(listEntry);
                                    end
                                end
                            end,
                            true
                            );
                            listenersAdded = listenersAdded + 1;
                        else
                            out("#### SCEHR / PEAR HOL: recruitment requirement error! ####")
                        end
                    end
                end

                -- Dilemma subculture listener init
                if totalDilemmaSubcultures > 0 then
                    for j = 1, totalDilemmaSubcultures do
                        local dilemmaSubcultureKey = listEntry.dilemmaSubcultureKeys[j];
        
                        if #buildingKey ~= 0 and #regionKey == 0 and #dilemmaKey ~= 0 then -- requirement is a building and dilemma
                            cm:add_faction_turn_start_listener_by_subculture(
                            "hol_bc_"..dilemmaSubcultureKey.."_"..characterSubtype.."_subculture_listener",
                            dilemmaSubcultureKey,
                            function(context)
                                local factionObj = context:faction();
                                local factionIsNull = factionObj:is_null_interface();
                                local factionIsHuman = factionObj:is_human();
                                local aiEligible = not factionIsHuman and listEntry.aiEligibile;
                                local validClaim = factionIsHuman or aiEligible;

                                if not factionIsNull and validClaim then
                                    local hasBuilding, region = FactionBuildingQuery(listEntry, factionObj);
                                    if hasBuilding then
                                        TriggerDilemma(factionObj, dilemmaKey) 
                                        TerminateCharacterListeners(listEntry);
                                    end
                                end
                            end,
                            true
                            );
                            listenersAdded = listenersAdded + 1;
                        
                        elseif #buildingKey == 0 and #regionKey ~= 0 and #dilemmaKey ~= 0 then -- requirement is a region and dilemma
                            cm:add_faction_turn_start_listener_by_subculture(
                            "hol_bc_"..dilemmaSubcultureKey.."_"..characterSubtype.."_subculture_listener",
                            dilemmaSubcultureKey,
                            function(context)
                                local factionObj = context:faction();
                                local factionKey = factionObj:name();
                                local factionIsNull = factionObj:is_null_interface();
                                local factionIsHuman = factionObj:is_human();
                                local aiEligible = not factionIsHuman and listEntry.aiEligibile;
                                local validClaim = factionIsHuman or aiEligible;

                                if not factionIsNull and validClaim then
                                    if cm:is_region_owned_by_faction(regionKey, factionKey) then
                                        TriggerDilemma(factionObj, dilemmaKey) 
                                        TerminateCharacterListeners(listEntry);
                                    end
                                end
                            end,
                            true
                            );
                            listenersAdded = listenersAdded + 1;
                        else
                            out("#### SCEHR / PEAR HOL: recruitment requirement error! ####")
                        end
                    end
                end

                -- Faction listener init.
                if totalFactions > 0 then
                    for j = 1, totalFactions do
                        local factionKey = listEntry.factionKeys[j];
                        local factionObj = cm:get_faction(factionKey);
                        local factionIsNull = factionObj:is_null_interface();
                        local factionIsHuman = factionObj:is_human();
                        local aiEligible = not factionIsHuman and listEntry.aiEligibile;
                        local validClaim = factionIsHuman or aiEligible;

                        if #buildingKey ~= 0 and #regionKey == 0 then -- if the requirement is a building
                            if not factionIsNull and validClaim then
                                cm:add_faction_turn_start_listener_by_name(
                                    "hol_bc_"..factionKey.."_"..characterSubtype.."_faction_listener",
                                    factionKey,
                                    function(context)
                                        local hasBuilding, region = FactionBuildingQuery(listEntry, factionObj);
                                        if hasBuilding then
                                            SpawnCharacters(listEntry, context:faction(), region:name());
                                            cm:set_saved_value(claimString, true);
                                            TerminateCharacterListeners(listEntry);
                                        end
                                    end,
                                    true
                                );
                                listenersAdded = listenersAdded + 1;
                            end

                        elseif #buildingKey == 0 and #regionKey ~= 0 then -- if the requirement is a region
                            if not factionIsNull and validClaim then
                                cm:add_faction_turn_start_listener_by_name(
                                    "hol_bc_"..factionKey.."_"..characterSubtype.."_faction_listener",
                                    factionKey,
                                    function(context)
                                        if cm:is_region_owned_by_faction(regionKey, context:faction():name()) then
                                            local region = cm:get_region(regionKey)
                                            SpawnCharacters(listEntry, context:faction(), region);
                                            cm:set_saved_value(claimString, true);
                                            TerminateCharacterListeners(listEntry);
                                        end
                                    end,
                                    true
                                );
                                listenersAdded = listenersAdded + 1;
                            end
                        else
                            out("#### SCEHR / PEAR HOL: recruitment requirement error! ####")
                        end
                    end
                end

                -- Dilemma faction listener init
                if totalDilemmaFactions > 0 then
                    for j = 1, totalDilemmaFactions do
                        local dilemmaFactionKey = listEntry.dilemmaFactionKeys[j];
                        local dilemmaFactionObj = cm:get_faction(dilemmaFactionKey);
                        local dilemmaFactionIsNull = dilemmaFactionObj:is_null_interface();
                        local dilemmaFactionIsHuman = dilemmaFactionObj:is_human();
                        local dilemmaAiEligible = not dilemmaFactionIsHuman and listEntry.dilemmaAiEligible;
                        local dilemmaValidClaim = dilemmaFactionIsHuman or dilemmaAiEligible;

                        if #buildingKey ~= 0 and #regionKey == 0 and #dilemmaKey ~= 0 then -- if the requirement is a building and dilemma
                            if not dilemmaFactionIsNull and dilemmaValidClaim then
                                local dilemmaFaction = cm:get_faction(dilemmaFactionKey)
                                cm:add_faction_turn_start_listener_by_name(
                                    "hol_bc_"..dilemmaFactionKey.."_"..characterSubtype.."_faction_listener",
                                    dilemmaFactionKey,
                                    function(context)
                                        local hasBuilding, region = FactionBuildingQuery(listEntry, dilemmaFaction);
                                        if hasBuilding then
                                            TriggerDilemma(dilemmaFactionObj, dilemmaKey) 
                                            TerminateCharacterListeners(listEntry);
                                        end
                                    end,
                                    true
                                );
                                listenersAdded = listenersAdded + 1;
                            end

                        elseif #buildingKey == 0 and #regionKey ~= 0 and #dilemmaKey ~= 0 then -- if the requirement is a region and dilemma
                            if not dilemmaFactionIsNull and dilemmaValidClaim then
                                cm:add_faction_turn_start_listener_by_name(
                                    "hol_bc_"..dilemmaFactionKey.."_"..characterSubtype.."_faction_listener",
                                    dilemmaFactionKey,
                                    function(context)
                                        if cm:is_region_owned_by_faction(regionKey, dilemmaFactionKey) then
                                            TriggerDilemma(dilemmaFactionObj, dilemmaKey) 
                                            TerminateCharacterListeners(listEntry);
                                        end
                                    end,
                                    true
                                );
                                listenersAdded = listenersAdded + 1;
                            end
                        else
                            out("#### SCEHR / PEAR HOL: recruitment requirement error! ####")
                        end
                    end
                end
            end
        end
    end
    out("#### SCEHR / PEAR HOL: Added "..listenersAdded.." building/character listener(s)! ####");
end

cm:add_first_tick_callback(
    function()
        local isLOLLoaded = core:is_mod_loaded("scehr_lol_building_ancillary_framework");

        -- Make sure Landmarks of Legend is loaded.
        if isLOLLoaded then
            listHumans = cm:get_human_factions();
            InitListeners();
        else
            out("#### SCEHR / PEAR HOL: Prerequisites not met. Heroes of Legend script will not load! ####");
            out("   Landmarks of Legend installed: "..tostring(isLOLLoaded));
        end
    end
);