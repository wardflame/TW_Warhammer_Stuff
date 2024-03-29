-- HEROES OF LEGEND: CHARACTERS-TO-BUILDINGS | scehr | 14/12/2023

-- NOTE: Each entry should have a unique building key.
-- If not using factionKeys or subcultureKeys, leave the table blank, e.g. "factionsKeys = {},"
-- If not wanting to add otherName's to the character, leave the STRING blank: "".

--[[
    //// ELEMENT BREAKDOWN
    claimKey = id for spawn. Use for multiple elements if you want them affected by it.
    campaignKey = campaign name. (Immortal Empires = main_warhammer. Realms of Chaos = wh3_main_chaos.)
    factionsKeys = factions_tables keys.
    subcultureKeys = cultures_subcultures_tables keys.
    buildingKey = building_levels_tables key.
    ## HEROES
        type = agents_tables key.
        subtype = agents_subtypes_tables key.
        maleOrFemale = true is male character, false is female character.
        customName = true if wanting to manually input a name, false if wanting the game to randomly generate.
        clanName = custom character title.
        forename = custom character first name.
        surname = custom character last name.
        title = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        primary = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        secondary = text\db\event_feed_strings__.loc | Set to nil if not using an incident
        index = irrelevant. Keep at 0.
    ## LORD
        type = agents_tables key.
        subtype = agent_subtypes_tables key.
        maleOrFemale = true is male character, false is female character.
        title = text\db\names__.loc     | character title.
        forename = text\db\names__.loc  | character first name.
        surname = text\db\names__.loc   | character last name.
        message = {
            title = text\db\event_feed_strings__.loc     | Set to nil if not using an incident
            primary = text\db\event_feed_strings__.loc   | Set to nil if not using an incident
            secondary = text\db\event_feed_strings__.loc | Set to nil if not using an incident
            index = 0
        }
        
    aiEligible = true if ai can claim characters, false if only players. If no players are playing an eligible faction, the ai will be able to claim regardless.
]]

local listBLL = {
    {
        -- ELEMENT 1
        claimKey = "mainMalmont",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_emp_empire",
            "wh_main_sc_brt_bretonnia",
            "wh_main_sc_teb_teb",
            "wh3_main_sc_ksl_kislev",
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "fort_orcal_all_HUMAN",
        heroes = {
            {
                -- HERO 1: HERMIT KNIGHT OF MALMONT
                type = "champion",
                subtype = "hermit_knight_1",
                maleOrFemale = true,
                clanName = "",
                forename = "Hermit Knight",
                surname = "of Malmont",
                message = {
                    title = "event_feed_strings_text_hol_event_hermit_recruit_title",
                    primary = "event_feed_strings_text_hol_event_hermit_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_hermit_recruit_secondary_detail",
                    index = 2000
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 2
        claimKey = "mainBannaga",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "shang_yang_barracks",
        heroes = {
            {
                -- HERO 1: BANNAGA
                type = "wizard",
                subtype = "bannaga",
                maleOrFemale = true,
                clanName = "",
                forename = "Bannaga",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_bannaga_recruit_title",
                    primary = "event_feed_strings_text_hol_event_bannaga_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_bannaga_recruit_secondary_detail",
                    index = 2003
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 3
        claimKey = "mainSimaergul",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_kho_khorne",
            "wh_main_sc_chs_chaos"
        },
        buildingKey = "brazen_altar",
        heroes = {
            {
                -- HERO 1: SIMAERGUL
                type = "champion",
                subtype = "simaergul_0",
                maleOrFemale = true,
                clanName = "",
                forename = "Simaergul",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_simaergul_recruit_title",
                    primary = "event_feed_strings_text_hol_event_simaergul_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_simaergul_recruit_secondary_detail",
                    index = 2004
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 4
        claimKey = "mainLorenzo",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_emp_empire",
            "wh_main_sc_brt_bretonnia",
            "wh_main_sc_teb_teb",
            "wh3_main_sc_ksl_kislev",
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "HUM_luccini_palace",
        heroes = {},
        lords = {
            {
                -- LORD 1: PRINCE LORENZO LUPO
                type = "general",
                subtype = "lorenzo_lupo",
                maleOrFemale = true,
                clanName = "names_name_44442",
                forename = "names_name_44443",
                surname = "names_name_44444",
                message = {
                    title = "event_feed_strings_text_hol_event_lorenzo_recruit_title",
                    primary = "event_feed_strings_text_hol_event_lorenzo_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_lorenzo_recruit_secondary_detail",
                    index = 2002
                }
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 5
        claimKey = "mainAmadri",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_dlc05_sc_wef_wood_elves"
        },
        buildingKey = "summerstrand",
        heroes = {},
        lords = {
            {
                -- LORD 1: AMADRI IRONBARK
                type = "general",
                subtype = "amadri_ironbark",
                maleOrFemale = true,
                clanName = "",
                forename = "names_name_55551",
                surname = "names_name_55552",
                message = {
                    title = "event_feed_strings_text_hol_event_amadri_recruit_title",
                    primary = "event_feed_strings_text_hol_event_amadri_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_amadri_recruit_secondary_detail",
                    index = 2001
                }
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 6
        claimKey = "mainSceolan",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_dlc05_sc_wef_wood_elves"
        },
        buildingKey = "winterheart",
        heroes = {},
        lords = {
            {
                -- LORD 1: SCEOLAN
                type = "general",
                subtype = "sceolan",
                maleOrFemale = true,
                clanName = "",
                forename = "names_name_55558",
                surname = "names_name_55559",
                message = {
                    title = "event_feed_strings_text_hol_event_sceolan_recruit_title",
                    primary = "event_feed_strings_text_hol_event_sceolan_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_sceolan_recruit_secondary_detail",
                    index = 2006
                }
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 7
        claimKey = "mainVilePrince",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_nur_nurgle"
        },
        buildingKey = "children_of_doom",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                clanName = "",
                forename = "names_name_55554",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_vile_prince_recruit_title",
                    primary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",
                    index = 2005
                }
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 8
        claimKey = "chaosBannaga",
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "shang_yang_barracks",
        heroes = {
            {
                -- HERO 1: BANNAGA
                type = "wizard",
                subtype = "bannaga",
                maleOrFemale = true,
                clanName = "",
                forename = "Bannaga",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_bannaga_recruit_title",
                    primary = "event_feed_strings_text_hol_event_bannaga_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_bannaga_recruit_secondary_detail",
                    index = 2003
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 9
        claimKey = "chaosSimaergul",
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_kho_khorne",
            "wh_main_sc_chs_chaos"
        },
        buildingKey = "brazen_altar",
        heroes = {
            {
                -- HERO 1: SIMAERGUL
                type = "champion",
                subtype = "simaergul_0",
                maleOrFemale = true,
                clanName = "",
                forename = "Simaergul",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_simaergul_recruit_title",
                    primary = "event_feed_strings_text_hol_event_simaergul_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_simaergul_recruit_secondary_detail",
                    index = 2004
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 10
        claimKey = "chaosVilePrince",
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_nur_nurgle"
        },
        buildingKey = "children_of_doom",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                clanName = "",
                forename = "names_name_55554",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_vile_prince_recruit_title",
                    primary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",
                    index = 2005
                }
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 11
        claimKey = "mainHelmutVonCarstein",
        campaignKey = "main_warhammer",
        factionKeys = {
            "wh_main_vmp_vampire_counts"                       
        },
        subcultureKeys = {},
        buildingKey = "helmut_camp",
        heroes = {
            {
                -- HERO 1: Helmut von Carstein
                type = "champion",
                subtype = "helmut_von_carstein_0",
                maleOrFemale = true,
                clanName = "",
                forename = "Helmut",
                surname = "von Carstein",
                message = {
                    title = "event_feed_strings_text_hol_event_helmut_recruit_title",
                    primary = "event_feed_strings_text_hol_event_helmut_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_helmut_recruit_secondary_detail",
                    index = 2007
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 12
        claimKey = "mainGorgivichKrakvald",
        campaignKey = "main_warhammer",
        factionKeys = {
            "wh_main_vmp_vampire_counts"                       
        },
        subcultureKeys = {},
        buildingKey = "gorgivich_camp",
        heroes = {
            {
                -- HERO 1: Gorgivich Krakvald
                type = "champion",
                subtype = "gorgivich_krakvald_0",
                maleOrFemale = true,
                clanName = "",
                forename = "Gorgivich",
                surname = "Krakvald",
                message = {
                    title = "event_feed_strings_text_hol_event_krakvald_recruit_title",
                    primary = "event_feed_strings_text_hol_event_krakvald_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_krakvald_recruit_secondary_detail",
                    index = 2008
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 13
        claimKey = "mainGuntherVonGrecht",
        campaignKey = "main_warhammer",
        factionKeys = {
            "wh_main_vmp_vampire_counts"                       
        },
        subcultureKeys = {},
        buildingKey = "gunther_camp",
        heroes = {
            {
                -- HERO 1: Gunther von Grecht
                type = "champion",
                subtype = "gunther_von_grecht_0",
                maleOrFemale = true,
                clanName = "",
                forename = "Gunther",
                surname = "von Grecht",
                message = {
                    title = "event_feed_strings_text_hol_event_gunther_recruit_title",
                    primary = "event_feed_strings_text_hol_event_gunther_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_gunther_recruit_secondary_detail",
                    index = 2009
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 14
        claimKey = "mainEmperorWilhelmI",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_vmp_vampire_counts"  
        },
        buildingKey = "wh2_main_special_altdorf_imperial_palace_vmp",
        heroes = {},
        lords = {
            {
                -- LORD 1: Emperor Wilhelm I
                type = "general",
                subtype = "emperor_wilhelm_1",
                maleOrFemale = true,
                clanName = "names_name_55566",
                forename = "names_name_55567",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_wilhelm_recruit_title",
                    primary = "event_feed_strings_text_hol_event_wilhelm_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_wilhelm_recruit_secondary_detail",
                    index = 2010
                }
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 16
        claimKey = "mainViscountDAlembencon",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia"
        },
        buildingKey = "tancred_castle",
        heroes = {
            {
                -- HERO 1: Viscount d'Alembençon 
                type = "champion",
                subtype = "the_viscount",
                maleOrFemale = true,
                clanName = "",
                forename = "Viscount",
                surname = "d'Alembençon",
                message = {
                    title = "event_feed_strings_text_hol_event_viscount_recruit_title",
                    primary = "event_feed_strings_text_hol_event_viscount_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_viscount_recruit_secondary_detail",
                    index = 2011
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 17
        claimKey = "mainAgravainDeBeauQuest",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia"  
        },
        buildingKey = "chalotte_chapel",
        heroes = {
            {
                -- HERO 1: Agravain de Beau Quest 
                type = "champion",
                subtype = "agravain_de_beau_quest",
                maleOrFemale = true,
                clanName = "",
                forename = "Agravain",
                surname = "de Beau Quest",
                message = {
                    title = "event_feed_strings_text_hol_event_agravain_recruit_title",
                    primary = "event_feed_strings_text_hol_event_agravain_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_agravain_recruit_secondary_detail",
                    index = 2012
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 20
        claimKey = "chaosViscountDAlembencon",
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia"  
        },
        buildingKey = "tancred_castle",
        heroes = {
            {
                -- HERO 1: Viscount d'Alembençon 
                type = "champion",
                subtype = "the_viscount",
                maleOrFemale = true,
                clanName = "",
                forename = "Viscount",
                surname = "d'Alembençon",
                message = {
                    title = "event_feed_strings_text_hol_event_viscount_recruit_title",
                    primary = "event_feed_strings_text_hol_event_viscount_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_viscount_recruit_secondary_detail",
                    index = 2011
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 23
        claimKey = "mainBrunner",
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
        buildingKey = "hundred_sins_street", -- wh_main_brt_farm_1
        heroes = {
            {
                -- HERO 1: BRUNNER THE BOUNTY HUNTER
                type = "champion",
                subtype = "bounty_hunter_brunner",
                maleOrFemale = true,
                clanName = "",
                forename = "Brunner",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_brunner_recruit_title",
                    primary = "event_feed_strings_text_hol_event_brunner_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_brunner_recruit_secondary_detail",
                    index = 2013
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 24
        claimKey = "mainShiHong",
        campaignKey = "main_warhammer",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "nan_gau_forges",
        heroes = {
            {
                -- HERO 1: SHI-HONG
                type = "champion",
                subtype = "shi_hong",
                maleOrFemale = true,
                clanName = "",
                forename = "Shi-Hong",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_shi_hong_recruit_title",
                    primary = "event_feed_strings_text_hol_event_shi_hong_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_shi_hong_recruit_secondary_detail",
                    index = 2014
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 25
        claimKey = "chaosShiHong",
        campaignKey = "wh3_main_chaos",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "nan_gau_forges",
        heroes = {
            {
                -- HERO 1: SHI-HONG
                type = "champion",
                subtype = "shi_hong",
                maleOrFemale = true,
                clanName = "",
                forename = "Shi-Hong",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_shi_hong_recruit_title",
                    primary = "event_feed_strings_text_hol_event_shi_hong_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_shi_hong_recruit_secondary_detail",
                    index = 2014
                }
            }
        },
        lords = {},
        aiEligibile = false
    },

    -- CR: OLD WORLD
    {
        -- ELEMENT 1
        claimKey = "towMalmont",
        campaignKey = "cr_oldworld",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_emp_empire",
            "wh_main_sc_brt_bretonnia",
            "wh_main_sc_teb_teb",
            "wh3_main_sc_ksl_kislev",
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "fort_orcal_all_HUMAN",
        heroes = {
            {
                -- HERO 1: HERMIT KNIGHT OF MALMONT
                type = "champion",
                subtype = "hermit_knight_1",
                maleOrFemale = true,
                clanName = "",
                forename = "Hermit Knight",
                surname = "of Malmont",
                message = {
                    title = "event_feed_strings_text_hol_event_hermit_recruit_title",
                    primary = "event_feed_strings_text_hol_event_hermit_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_hermit_recruit_secondary_detail",
                    index = 2000
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 2
        claimKey = "towBannaga",
        campaignKey = "cr_oldworld",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "shang_yang_barracks",
        heroes = {
            {
                -- HERO 1: BANNAGA
                type = "wizard",
                subtype = "bannaga",
                maleOrFemale = true,
                clanName = "",
                forename = "Bannaga",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_bannaga_recruit_title",
                    primary = "event_feed_strings_text_hol_event_bannaga_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_bannaga_recruit_secondary_detail",
                    index = 2003
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 3
        claimKey = "towSimaergul",
        campaignKey = "cr_oldworld",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_kho_khorne",
            "wh_main_sc_chs_chaos"
        },
        buildingKey = "brazen_altar",
        heroes = {
            {
                -- HERO 1: SIMAERGUL
                type = "champion",
                subtype = "simaergul_0",
                maleOrFemale = true,
                clanName = "",
                forename = "Simaergul",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_simaergul_recruit_title",
                    primary = "event_feed_strings_text_hol_event_simaergul_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_simaergul_recruit_secondary_detail",
                    index = 2004
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 4
        claimKey = "towVilePrince",
        campaignKey = "cr_oldworld",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_nur_nurgle"
        },
        buildingKey = "children_of_doom",
        heroes = {},
        lords = {
            {
                -- LORD 1: VILE PRINCE
                type = "general",
                subtype = "vile_prince",
                maleOrFemale = true,
                clanName = "",
                forename = "names_name_55554",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_vile_prince_recruit_title",
                    primary = "event_feed_strings_text_hol_event_vile_prince_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_vile_prince_recruit_secondary_detail",
                    index = 2005
                }
            }
        },
        aiEligibile = false
    },
    {
        -- ELEMENT 5
        claimKey = "towHelmutVonCarstein",
        campaignKey = "cr_oldworld",
        factionKeys = {
            "wh_main_vmp_vampire_counts"
        },
        subcultureKeys = {},
        buildingKey = "helmut_camp",
        heroes = {
            {
                -- HERO 1: Helmut von Carstein
                type = "champion",
                subtype = "helmut_von_carstein_0",
                maleOrFemale = true,
                clanName = "",
                forename = "Helmut",
                surname = "von Carstein",
                message = {
                    title = "event_feed_strings_text_hol_event_helmut_recruit_title",
                    primary = "event_feed_strings_text_hol_event_helmut_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_helmut_recruit_secondary_detail",
                    index = 2007
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 6
        claimKey = "towGorgivichKrakvald",
        campaignKey = "cr_oldworld",
        factionKeys = {
            "wh_main_vmp_vampire_counts"
        },
        subcultureKeys = {},
        buildingKey = "gorgivich_camp",
        heroes = {
            {
                -- HERO 1: Gorgivich Krakvald
                type = "champion",
                subtype = "gorgivich_krakvald_0",
                maleOrFemale = true,
                clanName = "",
                forename = "Gorgivich",
                surname = "Krakvald",
                message = {
                    title = "event_feed_strings_text_hol_event_krakvald_recruit_title",
                    primary = "event_feed_strings_text_hol_event_krakvald_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_krakvald_recruit_secondary_detail",
                    index = 2008
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 7
        claimKey = "towGuntherVonGrecht",
        campaignKey = "cr_oldworld",
        factionKeys = {
            "wh_main_vmp_vampire_counts"
        },
        subcultureKeys = {},
        buildingKey = "gunther_camp",
        heroes = {
            {
                -- HERO 1: Gunther von Grecht
                type = "champion",
                subtype = "gunther_von_grecht_0",
                maleOrFemale = true,
                clanName = "",
                forename = "Gunther",
                surname = "von Grecht",
                message = {
                    title = "event_feed_strings_text_hol_event_gunther_recruit_title",
                    primary = "event_feed_strings_text_hol_event_gunther_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_gunther_recruit_secondary_detail",
                    index = 2009
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 8
        claimKey = "towEmperorWilhelmI",
        campaignKey = "cr_oldworld",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_vmp_vampire_counts"
        },
        buildingKey = "wh2_main_special_altdorf_imperial_palace_vmp",
        heroes = {},
        lords = {
            {
                -- LORD 1: Emperor Wilhelm I
                type = "general",
                subtype = "emperor_wilhelm_1",
                maleOrFemale = true,
                clanName = "names_name_55566",
                forename = "names_name_55567",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_wilhelm_recruit_title",
                    primary = "event_feed_strings_text_hol_event_wilhelm_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_wilhelm_recruit_secondary_detail",
                    index = 2010
                }
            }
        },
        aiEligibile = false
    },
    --[[{
        -- ELEMENT 9
        claimKey = "towViscountDAlembencon",
        campaignKey = "cr_oldworld",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia"
        },
        buildingKey = "tancred_castle",
        heroes = {
            {
                -- HERO 1: Viscount d'Alembençon 
                type = "champion",
                subtype = "the_viscount",
                maleOrFemale = true,
                clanName = "",
                forename = "Viscount",
                surname = "d'Alembençon",
                message = {
                    title = "event_feed_strings_text_hol_event_viscount_recruit_title",
                    primary = "event_feed_strings_text_hol_event_viscount_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_viscount_recruit_secondary_detail",
                    index = 2011
                }
            }
        },
        lords = {},
        aiEligibile = false
    },]]--
    {
        -- ELEMENT 10
        claimKey = "towAgravainDeBeauQuest",
        campaignKey = "cr_oldworld",
        factionKeys = {},
        subcultureKeys = {
            "wh_main_sc_brt_bretonnia"
        },
        buildingKey = "chalotte_chapel",
        heroes = {
            {
                -- HERO 1: Agravain de Beau Quest 
                type = "champion",
                subtype = "agravain_de_beau_quest",
                maleOrFemale = true,
                clanName = "",
                forename = "Agravain",
                surname = "de Beau Quest",
                message = {
                    title = "event_feed_strings_text_hol_event_agravain_recruit_title",
                    primary = "event_feed_strings_text_hol_event_agravain_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_agravain_recruit_secondary_detail",
                    index = 2012
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 11
        claimKey = "towBrunner",
        campaignKey = "cr_oldworld",
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
        buildingKey = "hundred_sins_street", -- wh_main_brt_farm_1
        heroes = {
            {
                -- HERO 1: BRUNNER THE BOUNTY HUNTER
                type = "champion",
                subtype = "bounty_hunter_brunner",
                maleOrFemale = true,
                clanName = "",
                forename = "Brunner",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_brunner_recruit_title",
                    primary = "event_feed_strings_text_hol_event_brunner_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_brunner_recruit_secondary_detail",
                    index = 2013
                }
            }
        },
        lords = {},
        aiEligibile = false
    },
    {
        -- ELEMENT 12
        claimKey = "towShiHong",
        campaignKey = "cr_oldworld",
        factionKeys = {},
        subcultureKeys = {
            "wh3_main_sc_cth_cathay"
        },
        buildingKey = "nan_gau_forges",
        heroes = {
            {
                -- HERO 1: SHI-HONG
                type = "champion",
                subtype = "shi_hong",
                maleOrFemale = true,
                clanName = "",
                forename = "Shi-Hong",
                surname = "",
                message = {
                    title = "event_feed_strings_text_hol_event_shi_hong_recruit_title",
                    primary = "event_feed_strings_text_hol_event_shi_hong_recruit_primary_detail",
                    secondary = "event_feed_strings_text_hol_event_shi_hong_recruit_secondary_detail",
                    index = 2014
                }
            }
        },
        lords = {},
        aiEligibile = false
    }
};

return listBLL;