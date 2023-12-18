-- Landmarks of Legend: Kislev Imperial Throne, by scehr | v0.0.0.1 | 02.05.2022

local function add_katarin_imperial_throne_listener()
    out("#### LoL: Adding Katarin Imperial Throne Listener ####")
    cm:add_faction_turn_start_listener_by_name(
		"lol_ksl_katarin_imperial_throne_FactionTurnStart",
		"wh3_main_ksl_the_ice_court",
		function()
            local iceCourt = cm:get_faction("wh3_main_ksl_the_ice_court");
            local kataThrone = cm:faction_contains_building(iceCourt, "ksl_imperial_throne");
            if kataThrone then
                out("#### LoL: KATARIN HAS IMPERIAL THRONE! ####");
            end
		end,
		true
	);
end

local function add_kostaltyn_imperial_throne_listener()
    out("#### LoL: Adding Katarin Imperial Throne Listener ####")
    cm:add_faction_turn_start_listener_by_name(
		"lol_ksl_katarin_imperial_throne_FactionTurnStart",
		"wh3_main_ksl_the_ice_court",
		function()
            local greatOrtho = cm:get_faction("wh3_main_ksl_the_great_orthodoxy");
            local kostThrone = cm:faction_contains_building(greatOrtho, "ksl_imperial_throne");
            if kostThrone then
                out("#### LoL: KOSTALTYN HAS IMPERIAL THRONE! ####")
            end
		end,
		true
	);
end

local function add_boris_imperial_throne_listener()
    out("#### LoL: Adding Katarin Imperial Throne Listener ####")
    cm:add_faction_turn_start_listener_by_name(
		"lol_ksl_katarin_imperial_throne_FactionTurnStart",
		"wh3_main_ksl_the_ice_court",
		function()
            local ursunReviv = cm:get_faction("wh3_main_ksl_ursun_revivalists");
            local boriThrone = cm:faction_contains_building(ursunReviv, "ksl_imperial_throne");
            if boriThrone then
                out("#### LoL: BORIS HAS IMPERIAL THRONE! ####");
            end
		end,
		true
	);
end

cm:add_first_tick_callback(
    function()
        local kataThrone = cm:get_saved_value("katarinHasThrone");
        local kostThrone = cm:get_saved_value("kostaltynHasThrone");
        local boriThrone = cm:get_saved_value("borisHasThrone");

        local iceCourt = cm:get_faction("wh3_main_ksl_the_ice_court");
        local greatOrtho = cm:get_faction("wh3_main_ksl_the_great_orthodoxy");
        local ursunReviv = cm:get_faction("wh3_main_ksl_ursun_revivalists");

        if iceCourt:is_human() then
            add_katarin_imperial_throne_listener();
        end
        if greatOrtho:is_human() then
            add_kostaltyn_imperial_throne_listener();
        end
        if ursunReviv:is_human() then
            add_boris_imperial_throne_listener();
        end
    end
)
