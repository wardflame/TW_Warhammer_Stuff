-- Landmarks of Legend: BUILDING-to-ANCILLARY FRAMEWORK | scehr | 02/09/2022

local listBA = {
    {
        -- BRETONNIA: KNIGHTS OF CUILEUX BANNER
        -- Eligible faction keys of the desired subculture.
        factionKeys = {
            "wh2_dlc14_brt_chevaliers_de_lyonesse",
            "wh2_main_brt_knights_of_origo",
            "wh2_main_brt_knights_of_the_flame",
            "wh2_main_brt_thegans_crusaders",
            "wh3_main_brt_aquitaine",
            "wh_main_brt_artois",
            "wh_main_brt_bastonne",
            "wh_main_brt_bordeleaux",
            "wh_main_brt_bretonnia",
            "wh_main_brt_carcassonne",
            "wh_main_brt_lyonesse",
            "wh_main_brt_parravon"
        },
        -- Subculture abbreviation, which can be found in any subculture related key (ex. brt is Bretonnia).
        subcultureAbbreviation = "brt",
        -- Subculture key from factions_tables.
        subcultureKey = "wh_main_sc_brt_bretonnia",
        -- Building key from building_levels_tables.
        buildingKey = "cuileux_barrows",
        -- Ancillary key from ancillaries_tables.
        ancillaryKey = "anc_knights_of_cuileux_banner",
        -- If true, AI factions can get the ancillary. If false, they can't.
        aiEligible = false
    },
    {
        -- PROUT'S FINEST BREW ANCILLARY
        -- Eligible faction keys of the desired subculture.
        factionKeys = {
            "wh2_dlc14_brt_chevaliers_de_lyonesse",
            "wh2_main_brt_knights_of_origo",
            "wh2_main_brt_knights_of_the_flame",
            "wh2_main_brt_thegans_crusaders",
            "wh3_main_brt_aquitaine",
            "wh_main_brt_artois",
            "wh_main_brt_bastonne",
            "wh_main_brt_bordeleaux",
            "wh_main_brt_bretonnia",
            "wh_main_brt_carcassonne",
            "wh_main_brt_lyonesse",
            "wh_main_brt_parravon",
            "wh2_dlc13_emp_golden_order",
            "wh2_dlc13_emp_the_huntmarshals_expedition",
            "wh2_main_emp_new_world_colonies",
            "wh2_main_emp_sudenburg",
            "wh2_dlc11_cst_pirates_of_sartosa",
            "wh_main_emp_empire",
            "wh3_main_emp_cult_of_sigmar",
            "wh_main_emp_averland",
            "wh_main_emp_hochland",
            "wh_main_emp_marienburg",
            "wh_main_emp_middenland",
            "wh_main_emp_nordland",    
            "wh_main_emp_ostermark",
            "wh_main_emp_ostland",
            "wh_main_emp_stirland",
            "wh_main_emp_talabecland",
            "wh_main_emp_wissenland",
            "wh_main_emp_empire_separatists",
            "wh2_dlc11_vmp_the_barrow_legion",
            "wh3_main_vmp_lahmian_sisterhood",
            "wh3_main_ie_vmp_sires_of_mourkain",
            "wh2_main_vmp_necrarch_brotherhood",
            "wh2_main_vmp_strygos_empire",
            "wh2_main_vmp_the_silver_host",
            "wh3_dlc21_vmp_jiangshi_rebels",  
            "wh3_main_vmp_caravan_of_blue_roses",
            -- "wh3_main_vmp_nagashizzar",                      NOT YET FEATURED
            "wh_main_vmp_mousillon",
            "wh_main_vmp_rival_sylvanian_vamps",
            "wh_main_vmp_schwartzhafen",
            "wh_main_vmp_vampire_counts",
            "wh_main_vmp_waldenhof",    
            "wh2_dlc11_cst_noctilus",
            "wh2_dlc11_cst_pirates_of_sartosa",
            "wh2_dlc11_cst_the_drowned",
            "wh2_dlc11_cst_vampire_coast",
            "wh3_dlc21_cst_dead_flag_fleet",
            "wh2_dlc15_dwf_clan_helhein",
            "wh2_dlc17_dwf_thorek_ironbrow",
            "wh2_main_dwf_greybeards_prospectors",
            "wh2_main_dwf_karak_zorn",
            "wh2_main_dwf_spine_of_sotek_dwarfs",
            "wh3_main_dwf_karak_azorn",
            "wh3_main_dwf_the_ancestral_throng",      
            "wh_main_dwf_barak_varr",
            "wh_main_dwf_dwarfs",
            "wh_main_dwf_karak_azul",
            "wh_main_dwf_karak_hirn",
            "wh_main_dwf_karak_izor",
            "wh_main_dwf_karak_kadrin",
            "wh_main_dwf_karak_norn",  
            "wh_main_dwf_karak_ziflin",
            "wh_main_dwf_kraka_drak",
            "wh_main_dwf_zhufbar",
            "wh_main_teb_border_princes",
            "wh_main_teb_estalia",
            "wh_main_teb_tilea",
            "wh2_dlc09_tmb_dune_kingdoms",    
            "wh2_dlc09_tmb_exiles_of_nehek",
            "wh2_dlc09_tmb_followers_of_nagash",
            "wh2_dlc09_tmb_khemri",
            "wh2_dlc09_tmb_lybaras",
            "wh2_dlc09_tmb_numas",
            "wh2_dlc09_tmb_rakaph_dynasty",
            "wh2_dlc09_tmb_the_sentinels",
            -- "wh2_dlc09_tmb_tomb_kings",                      REPLACED BY KHEMRI, I THINK
            "wh3_main_tmb_deserters_of_khatep",
            "wh3_main_ksl_brotherhood_of_the_bear",
            "wh3_main_ksl_druzhina_enclave",
            -- "wh3_main_ksl_kislev",    
            "wh3_main_ksl_ropsmenn_clan",    
            "wh3_main_ksl_the_great_orthodoxy",
            "wh3_main_ksl_the_ice_court",
            "wh3_main_ksl_ungol_kindred",
            "wh3_main_ksl_ursun_revivalists",
            "wh3_main_cth_burning_wind_nomads",
            "wh3_main_cth_celestial_loyalists",
            "wh3_main_cth_dissenter_lords_of_jinshen",
            "wh3_main_cth_eastern_river_lords",
            "wh3_main_cth_imperial_wardens",
            "wh3_main_cth_rebel_lords_of_nan_yang",
            "wh3_main_cth_the_jade_custodians",
            "wh3_main_cth_the_northern_provinces",            
            "wh3_main_cth_the_western_provinces",   
            "wh3_main_ogr_blood_guzzlers",
            "wh3_main_ogr_bloodmaw",
            "wh3_main_ogr_crossed_clubs",    
            "wh3_main_ogr_disciples_of_the_maw",    
            "wh3_main_ogr_eyebiter",
            "wh3_main_ogr_feastmaster",
            "wh3_main_ogr_fleshgreeders",
            "wh3_main_ogr_fulg",
            "wh3_main_ogr_goldtooth",
            "wh3_main_ogr_lazarghs",
            "wh3_main_ogr_loose_tooth",
            "wh3_main_ogr_mountaineaters",
            -- "wh3_main_ogr_ogre_kingdoms",                    NOT USED IN IMMORTAL EMPIRES
            "wh3_main_ogr_rock_skulls",
            "wh3_main_ogr_sabreskin",
            "wh3_main_ogr_sons_of_the_mountain",            
            "wh3_main_ogr_thunderguts",       
            "wh3_main_ogr_treehammers",
            "wh3_main_ogre_flamegullets",
            "wh3_main_ogre_sharktooth",    
            "wh3_main_ogre_the_famished",    
            "wh2_dlc12_lzd_cult_of_sotek",
            "wh2_dlc16_lzd_wardens_of_the_living_pools",
            "wh2_dlc17_lzd_oxyotl",
            "wh2_main_lzd_hexoatl",
            "wh2_main_lzd_itza",
            "wh2_main_lzd_last_defenders",
            -- "wh2_main_lzd_lizardmen",                        NOT USED IN IMMORTAL EMPIRES
            "wh2_main_lzd_sentinels_of_xeti",
            "wh2_main_lzd_southern_sentinels",
            "wh2_main_lzd_teotiqua",
            "wh2_main_lzd_tlaqua",
            "wh2_main_lzd_tlaxtlan",            
            "wh2_main_lzd_xlanhuapec",    
            "wh2_main_lzd_zlatan",
            "wh3_main_lzd_tepoks_spawn",   
            "wh2_dlc15_hef_imrik",
            "wh2_main_hef_avelorn",
            "wh2_main_hef_caledor",
            "wh2_main_hef_chrace",
            "wh2_main_hef_citadel_of_dusk",
            "wh2_main_hef_cothique",
            "wh2_main_hef_eataine",
            "wh2_main_hef_ellyrion",
            "wh2_main_hef_fortress_of_dawn",
            -- "wh2_main_hef_high_elves",                      NOT USED IN IMMORTAL EMPIRES
            "wh2_main_hef_nagarythe",
            "wh2_main_hef_order_of_loremasters",            
            "wh2_main_hef_saphery",    
            "wh2_main_hef_tiranoc",
            "wh2_main_hef_tor_elasor", 
            "wh2_main_hef_yvresse", 
            "wh2_dlc11_def_the_blessed_dread",
            "wh2_main_def_bleak_holds",
            "wh2_main_def_blood_hall_coven",
            "wh2_main_def_clar_karond",
            "wh2_main_def_cult_of_excess",
            "wh2_main_def_cult_of_pleasure",
            -- "wh2_main_def_dark_elves",                      NOT USED IN IMMORTAL EMPIRES
            "wh2_main_def_deadwood_sentinels",
            "wh2_main_def_drackla_coven",
            "wh2_main_def_ghrond",
            "wh2_main_def_hag_graef",
            "wh2_main_def_har_ganeth",            
            "wh2_main_def_karond_kar",    
            "wh2_main_def_naggarond",
            "wh2_main_def_scourge_of_khaine", 
            "wh2_main_def_ssildra_tor",    
            "wh2_main_def_the_forgebound",            
            "wh3_main_wef_laurelorn",
            "wh2_dlc16_wef_drycha",    
            "wh2_dlc16_wef_sisters_of_twilight",
            "wh2_main_wef_bowmen_of_oreon", 
            "wh3_dlc21_wef_spirits_of_shanlin",    
            "wh_dlc05_wef_argwylon",            
            "wh_dlc05_wef_torgovann",   
            "wh_dlc05_wef_wood_elves", 
            "wh_dlc05_wef_wydrioth"                        
        },
        -- Subculture abbreviation, which can be found in any subculture related key (ex. brt is Bretonnia).
        subcultureAbbreviation = "any",
        -- Subculture key from factions_tables.
        subcultureKey = "all",
        -- Building key from building_levels_tables.
        buildingKey = "aragon_saloon",
        -- Ancillary key from ancillaries_tables.
        ancillaryKey = "anc_prout_brew",
        -- If true, AI factions can get the ancillary. If false, they can't.
        aiEligible = false
    },
    {
        -- KISLEV & VCOUNTS: HORN OF THE LOST EXPEDITION
        -- Eligible faction keys of the desired subculture.
        factionKeys = {
            "wh3_main_ksl_brotherhood_of_the_bear",
            "wh3_main_ksl_druzhina_enclave",
            -- "wh3_main_ksl_kislev",                          NOT IN IMMORTAL EMPIRES
            "wh3_main_ksl_ropsmenn_clan",    
            "wh3_main_ksl_the_great_orthodoxy",
            "wh3_main_ksl_the_ice_court",
            "wh3_main_ksl_ungol_kindred",
            "wh3_main_ksl_ursun_revivalists",
            "wh2_dlc11_vmp_the_barrow_legion",
            "wh3_main_vmp_lahmian_sisterhood",
            "wh3_main_ie_vmp_sires_of_mourkain",
            "wh2_main_vmp_necrarch_brotherhood",
            "wh2_main_vmp_strygos_empire",
            "wh2_main_vmp_the_silver_host",
            "wh3_dlc21_vmp_jiangshi_rebels",  
            "wh3_main_vmp_caravan_of_blue_roses",
            -- "wh3_main_vmp_nagashizzar",
            "wh_main_vmp_mousillon",
            "wh_main_vmp_rival_sylvanian_vamps",
            "wh_main_vmp_schwartzhafen",
            "wh_main_vmp_vampire_counts",
            "wh_main_vmp_waldenhof"
        },
        -- Subculture abbreviation, which can be found in any subculture related key (ex. brt is Bretonnia).
        subcultureAbbreviation = "ksl",
        -- Subculture key from factions_tables.
        subcultureKey = "wh3_main_sc_ksl_kislev",
        -- Building key from building_levels_tables.
        buildingKey = "lost_expedition_grave",
        -- Ancillary key from ancillaries_tables.
        ancillaryKey = "ethereal_tsar_horn",
        -- If true, AI factions can get the ancillary. If false, they can't.
        aiEligible = false
    }
};


local function ba_status()
    out("#### SCEHR LOL: Adding building/ancillary listener(s)! ####");

    local totalListeners = 0;
    for i = 1, #listBA do
        local currentBA = listBA[i];
        local currentBAClaimed = cm:get_saved_value("lol_"..currentBA.ancillaryKey.."_claimed");

        if not currentBAClaimed then

            for j = 1, #currentBA.factionKeys do
                local targetFaction = cm:get_faction(currentBA.factionKeys[j]);
                local targetIsHuman = cm:is_faction_human(currentBA.factionKeys[j]);

                if not currentBA.aiEligible and not targetIsHuman then
                    out("#### SCEHR LOL: "..currentBA.factionKeys[j].." is ineligible for the "..currentBA.ancillaryKey..". Denying.");
                else
                    cm:add_faction_turn_start_listener_by_name(
                    "lol_"..currentBA.factionKeys[j].."_"..currentBA.buildingKey.."_listener",
                    currentBA.factionKeys[j],
                    function()
                        local targetHasBuilding = cm:faction_contains_building(targetFaction, currentBA.buildingKey);
                        if targetHasBuilding then
                            cm:add_ancillary_to_faction(targetFaction, currentBA.ancillaryKey, false);
                            cm:set_saved_value("lol_"..currentBA.ancillaryKey.."_claimed", true);
                            out("#### SCEHR LOL: "..currentBA.factionKeys[j].." has claimed "..currentBA.ancillaryKey.."! ####");
                            cm:remove_faction_turn_start_listener_by_name("lol_"..currentBA.factionKeys[j].."_"..currentBA.buildingKey.."_listener");
                        end
                    end,
                    true
                    );
                    totalListeners = totalListeners + 1;
                end
            end
        end
    end

    out("#### SCEHR LOL: Added "..totalListeners.." building/ancillary listener(s)! ####");
end

cm:add_first_tick_callback(
    function()
        local isIE = cm:get_campaign_name() == "main_warhammer";

        -- Make sure we're in Immortal Empires.
        if isIE then
            ba_status();
        end
    end
);