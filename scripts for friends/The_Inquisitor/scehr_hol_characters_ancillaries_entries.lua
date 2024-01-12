-- HEROES OF LEGEND: CHARACTER-TO-ANCILLARY ENTRIES | scehr | 14/12/2023

--[[
    ELEMENT BREAKDOWN
    campaignKey = campaign name. (Immortal Empires = main_warhammer. Realms of Chaos = wh3_main_chaos.)
    characterKey = agent_subtypes_tables key.
    ancillaryKey = ancillaries_tables key.
    giftRank = desired rank for character to receive ancillary.
]]

local listCA = {
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
    {
        -- ELEMENT 17
        campaignKey = "wh3_main_chaos";
        characterKey = "bannaga",
        ancillaryKey = "bangstick",
        giftRank = 7
    },
    {
        -- ELEMENT 18
        campaignKey = "wh3_main_chaos";
        characterKey = "bannaga",
        ancillaryKey = "straw_hat",
        giftRank = 16
    },
    {
        -- ELEMENT 19
        campaignKey = "wh3_main_chaos";
        characterKey = "simaergul_0",
        ancillaryKey = "khorne_collar",
        giftRank = 6
    },
    {
        -- ELEMENT 20
        campaignKey = "wh3_main_chaos";
        characterKey = "simaergul_0",
        ancillaryKey = "packmaster_helm",
        giftRank = 15
    },  
    {
        -- ELEMENT 21
        campaignKey = "main_warhammer";
        characterKey = "helmut_von_carstein_0",
        ancillaryKey = "von_carstein_banner",
        giftRank = 6
    },
    {
        -- ELEMENT 22
        campaignKey = "main_warhammer";
        characterKey = "helmut_von_carstein_0",
        ancillaryKey = "necromancy_talisman",
        giftRank = 15
    },
    {
        -- ELEMENT 23
        campaignKey = "main_warhammer";
        characterKey = "gorgivich_krakvald_0",
        ancillaryKey = "flaming_butchers",
        giftRank = 8
    },
    {
        -- ELEMENT 24
        campaignKey = "main_warhammer";
        characterKey = "gorgivich_krakvald_0",
        ancillaryKey = "blood_armour",
        giftRank = 18
    },   
    {
        -- ELEMENT 25
        campaignKey = "main_warhammer";
        characterKey = "gunther_von_grecht_0",
        ancillaryKey = "sweeping_razor",
        giftRank = 7
    },   
    {
        -- ELEMENT 26
        campaignKey = "main_warhammer";
        characterKey = "gunther_von_grecht_0",
        ancillaryKey = "drakenhof_black_armour",
        giftRank = 16
    },
    {
        -- ELEMENT 27
        campaignKey = "main_warhammer";
        characterKey = "emperor_wilhelm_1",
        ancillaryKey = "emperor_crown",
        giftRank = 12
    },   
    {
        -- ELEMENT 29
        campaignKey = "main_warhammer";
        characterKey = "emperor_wilhelm_1",
        ancillaryKey = "light_blade",
        giftRank = 19
    },
    {
        -- ELEMENT 30
        campaignKey = "main_warhammer";
        characterKey = "the_viscount",
        ancillaryKey = "viscount_longsword",
        giftRank = 8
    },    
    {
        -- ELEMENT 31
        campaignKey = "main_warhammer";
        characterKey = "agravain_de_beau_quest",
        ancillaryKey = "tress_of_melisande",
        giftRank = 10
    },   
    {
        -- ELEMENT 32
        campaignKey = "main_warhammer";
        characterKey = "agravain_de_beau_quest",
        ancillaryKey = "chalice_of_chanterelle",
        giftRank = 17
    },
    {
        -- ELEMENT 33
        campaignKey = "main_warhammer";
        characterKey = "bounty_hunter_brunner",
        ancillaryKey = "drakemalice_headsmen",
        giftRank = 8
    },
    {
        -- ELEMENT 34
        campaignKey = "main_warhammer";
        characterKey = "bounty_hunter_brunner",
        ancillaryKey = "gromril_plate",
        giftRank = 13
    },    
    {
        -- ELEMENT 35
        campaignKey = "main_warhammer";
        characterKey = "bounty_hunter_brunner",
        ancillaryKey = "fell_fang",
        giftRank = 22
    },   
    {
        -- ELEMENT 36
        campaignKey = "main_warhammer";
        characterKey = "bounty_hunter_brunner",
        ancillaryKey = "hidden_blade",
        giftRank = 16
    },
    {
        -- ELEMENT 37
        campaignKey = "main_warhammer";
        characterKey = "shi_hong",
        ancillaryKey = "artificer_tools",
        giftRank = 7
    },
    {
        -- ELEMENT 38
        campaignKey = "main_warhammer";
        characterKey = "shi_hong",
        ancillaryKey = "yang_gem",
        giftRank = 13
    },    
    {
        -- ELEMENT 39
        campaignKey = "wh3_main_chaos";
        characterKey = "shi_hong",
        ancillaryKey = "artificer_tools",
        giftRank = 7
    },   
    {
        -- ELEMENT 40
        campaignKey = "wh3_main_chaos";
        characterKey = "shi_hong",
        ancillaryKey = "yang_gem",
        giftRank = 13
    },
    {
        -- ELEMENT 41
        campaignKey = "main_warhammer";
        characterKey = "ulther_stonehammer",
        ancillaryKey = "durazgrund_battleaxe",
        giftRank = 9
    },   
    {
        -- ELEMENT 42
        campaignKey = "main_warhammer";
        characterKey = "ulther_stonehammer",
        ancillaryKey = "dragon_company_banner",
        giftRank = 14
    },
    {
        -- ELEMENT 43
        campaignKey = "main_warhammer";
        characterKey = "borri_forkbeard",
        ancillaryKey = "runic_greataxe",
        giftRank = 11
    },
    {
        -- ELEMENT 44
        campaignKey = "main_warhammer";
        characterKey = "borri_forkbeard",
        ancillaryKey = "gromril_heavy_plate",
        giftRank = 13
    },    
    {
        -- ELEMENT 45
        campaignKey = "main_warhammer";
        characterKey = "balkrag_grimgorson",
        ancillaryKey = "undeath_dual_axes",
        giftRank = 7
    },
    {
        -- ELEMENT 46
        campaignKey = "wh3_main_chaos";
        characterKey = "ulther_stonehammer",
        ancillaryKey = "durazgrund_battleaxe",
        giftRank = 9
    },   
    {
        -- ELEMENT 47
        campaignKey = "wh3_main_chaos";
        characterKey = "ulther_stonehammer",
        ancillaryKey = "dragon_company_banner",
        giftRank = 14
    },
    {
        -- ELEMENT 48
        campaignKey = "wh3_main_chaos";
        characterKey = "borri_forkbeard",
        ancillaryKey = "runic_greataxe",
        giftRank = 11
    },
    {
        -- ELEMENT 49
        campaignKey = "wh3_main_chaos";
        characterKey = "borri_forkbeard",
        ancillaryKey = "gromril_heavy_plate",
        giftRank = 13
    },

    -- CR: OLD WORLD
    {
        -- ELEMENT 1
        campaignKey = "cr_oldworld";
        characterKey = "hermit_knight_1",
        ancillaryKey = "sword_of_virtue",
        giftRank = 8
    },
    {
        -- ELEMENT 2
        campaignKey = "cr_oldworld";
        characterKey = "hermit_knight_1",
        ancillaryKey = "dragon_blood_flask",
        giftRank = 15
    },
    {
        -- ELEMENT 3
        campaignKey = "cr_oldworld";
        characterKey = "lorenzo_lupo",
        ancillaryKey = "sword_of_lucan",
        giftRank = 5
    },
    {
        -- ELEMENT 4
        campaignKey = "cr_oldworld";
        characterKey = "lorenzo_lupo",
        ancillaryKey = "ring_of_luccina",
        giftRank = 12
    },
    {
        -- ELEMENT 5
        campaignKey = "cr_oldworld";
        characterKey = "bannaga",
        ancillaryKey = "bangstick",
        giftRank = 7
    },
    {
        -- ELEMENT 6
        campaignKey = "cr_oldworld";
        characterKey = "bannaga",
        ancillaryKey = "straw_hat",
        giftRank = 16
    },
    {
        -- ELEMENT 7
        campaignKey = "cr_oldworld";
        characterKey = "simaergul_0",
        ancillaryKey = "khorne_collar",
        giftRank = 6
    },
    {
        -- ELEMENT 8
        campaignKey = "cr_oldworld";
        characterKey = "simaergul_0",
        ancillaryKey = "packmaster_helm",
        giftRank = 15
    },
    {
        -- ELEMENT 9
        campaignKey = "cr_oldworld";
        characterKey = "amadri_ironbark",
        ancillaryKey = "augmented_bark",
        giftRank = 10
    },
    {
        -- ELEMENT 10
        campaignKey = "cr_oldworld";
        characterKey = "amadri_ironbark",
        ancillaryKey = "arranoc_crown",
        giftRank = 15
    },
    {
        -- ELEMENT 11
        campaignKey = "cr_oldworld";
        characterKey = "amadri_ironbark",
        ancillaryKey = "spite_talisman",
        giftRank = 20
    },
    {
        -- ELEMENT 12
        campaignKey = "cr_oldworld";
        characterKey = "vile_prince",
        ancillaryKey = "twisted_hammer",
        giftRank = 12
    },
    {
        -- ELEMENT 13
        campaignKey = "cr_oldworld";
        characterKey = "vile_prince",
        ancillaryKey = "doom_mask",
        giftRank = 16
    },
    {
        -- ELEMENT 14
        campaignKey = "cr_oldworld";
        characterKey = "sceolan",
        ancillaryKey = "bow_of_loren",
        giftRank = 10
    },
    {
        -- ELEMENT 15
        campaignKey = "cr_oldworld";
        characterKey = "sceolan",
        ancillaryKey = "the_buckler",
        giftRank = 18
    },
    {
        -- ELEMENT 16
        campaignKey = "cr_oldworld";
        characterKey = "lorenzo_lupo",
        ancillaryKey = "myrmidia_shield",
        giftRank = 16
    },
    {
        -- ELEMENT 17
        campaignKey = "cr_oldworld";
        characterKey = "helmut_von_carstein_0",
        ancillaryKey = "von_carstein_banner",
        giftRank = 6
    },
    {
        -- ELEMENT 18
        campaignKey = "cr_oldworld";
        characterKey = "helmut_von_carstein_0",
        ancillaryKey = "necromancy_talisman",
        giftRank = 15
    },
    {
        -- ELEMENT 19
        campaignKey = "cr_oldworld";
        characterKey = "gorgivich_krakvald_0",
        ancillaryKey = "flaming_butchers",
        giftRank = 8
    },
    {
        -- ELEMENT 20
        campaignKey = "cr_oldworld";
        characterKey = "gorgivich_krakvald_0",
        ancillaryKey = "blood_armour",
        giftRank = 18
    },
    {
        -- ELEMENT 21
        campaignKey = "cr_oldworld";
        characterKey = "gunther_von_grecht_0",
        ancillaryKey = "sweeping_razor",
        giftRank = 7
    },
    {
        -- ELEMENT 22
        campaignKey = "cr_oldworld";
        characterKey = "gunther_von_grecht_0",
        ancillaryKey = "drakenhof_black_armour",
        giftRank = 16
    },
    {
        -- ELEMENT 23
        campaignKey = "cr_oldworld";
        characterKey = "emperor_wilhelm_1",
        ancillaryKey = "emperor_crown",
        giftRank = 12
    },
    {
        -- ELEMENT 24
        campaignKey = "cr_oldworld";
        characterKey = "emperor_wilhelm_1",
        ancillaryKey = "light_blade",
        giftRank = 19
    },
    {
        -- ELEMENT 25
        campaignKey = "cr_oldworld";
        characterKey = "the_viscount",
        ancillaryKey = "viscount_longsword",
        giftRank = 8
    },
    {
        -- ELEMENT 26
        campaignKey = "cr_oldworld";
        characterKey = "agravain_de_beau_quest",
        ancillaryKey = "tress_of_melisande",
        giftRank = 10
    },
    {
        -- ELEMENT 27
        campaignKey = "cr_oldworld";
        characterKey = "agravain_de_beau_quest",
        ancillaryKey = "chalice_of_chanterelle",
        giftRank = 17
    },
    {
        -- ELEMENT 28
        campaignKey = "cr_oldworld";
        characterKey = "bounty_hunter_brunner",
        ancillaryKey = "drakemalice_headsmen",
        giftRank = 8
    },
    {
        -- ELEMENT 29
        campaignKey = "cr_oldworld";
        characterKey = "bounty_hunter_brunner",
        ancillaryKey = "gromril_plate",
        giftRank = 13
    },
    {
        -- ELEMENT 30
        campaignKey = "cr_oldworld";
        characterKey = "bounty_hunter_brunner",
        ancillaryKey = "fell_fang",
        giftRank = 22
    },
    {
        -- ELEMENT 31
        campaignKey = "cr_oldworld";
        characterKey = "bounty_hunter_brunner",
        ancillaryKey = "hidden_blade",
        giftRank = 16
    },
    {
        -- ELEMENT 32
        campaignKey = "cr_oldworld";
        characterKey = "shi_hong",
        ancillaryKey = "artificer_tools",
        giftRank = 7
    },
    {
        -- ELEMENT 33
        campaignKey = "cr_oldworld";
        characterKey = "shi_hong",
        ancillaryKey = "yang_gem",
        giftRank = 13
    },
    {
        -- ELEMENT 34
        campaignKey = "cr_oldworld";
        characterKey = "ulther_stonehammer",
        ancillaryKey = "durazgrund_battleaxe",
        giftRank = 9
    },
    {
        -- ELEMENT 35
        campaignKey = "cr_oldworld";
        characterKey = "ulther_stonehammer",
        ancillaryKey = "dragon_company_banner",
        giftRank = 14
    },
    {
        -- ELEMENT 36
        campaignKey = "cr_oldworld";
        characterKey = "borri_forkbeard",
        ancillaryKey = "runic_greataxe",
        giftRank = 11
    },
    {
        -- ELEMENT 37
        campaignKey = "cr_oldworld";
        characterKey = "borri_forkbeard",
        ancillaryKey = "gromril_heavy_plate",
        giftRank = 13
    },
    {
        -- ELEMENT 38
        campaignKey = "cr_oldworld";
        characterKey = "balkrag_grimgorson",
        ancillaryKey = "undeath_dual_axes",
        giftRank = 7
    }
}

return listCA;