-- Be'lakor rift battle script for Nertanef | by scehr | 22/10/2022

--[[
	Rift closure army array. First, the script checks the node's template,
	then it gets the faction that should be declared war on/fought, and then
	it looks for the right army to attack. Whilst this is good for one type of force,
	it might be worth changing the script architecture to accomodate diverse armies.
]]
local NERTrift_closure_force_data = {
	["wh3_main_teleportation_node_template_belakor"] = {"wh3_main_chs_shadow_legion", "rift_army_belakor"}
};

-- Do not show the war declaration, nor the death of the enemy lord. Then, kill invasion.
local function NERTkill_rift_closure_battle_invasion()
	cm:disable_event_feed_events(true, "wh_event_category_diplomacy", "", "");
	cm:disable_event_feed_events(true, "wh_event_category_character", "", "");
	
	invasion_manager:kill_invasion_by_key("rift_closure_battle_invasion");
	
	for k, v in pairs(NERTrift_closure_force_data) do
		kill_faction(v[1]);
	end;
	
	cm:callback(
		function()
			cm:disable_event_feed_events(false, "wh_event_category_diplomacy", "", "");
			cm:disable_event_feed_events(false, "wh_event_category_character", "", "")
		end,
		0.2
	);
end;

-- Clear rift if attacker's victorious. Close the battle.
local function NERTrift_closure_battle_cleanup()
	core:add_listener(
		"NERTrift_closure_battle_cleanup",
		"BattleCompleted",
		function()
			return cm:get_saved_value("rift_closure_battle_active");
		end,
		function()
			local node_details = cm:get_saved_value("rift_closure_battle_active");
			
			-- Close the rift if the battle was won.
			if cm:pending_battle_cache_defender_victory() then
				cm:teleportation_network_close_node(node_details[1]);
				
				local char_cqi = node_details[3];
				local char = cm:get_character_by_cqi(char_cqi);
				if char then
					core:trigger_event("ScriptEventRiftClosureBattleWon", char);
				end;
			end;
			
			cm:set_saved_value("rift_closure_battle_active", false);
			
			NERTkill_rift_closure_battle_invasion();
			
			cm:callback(
				function()
					cm:disable_event_feed_events(false, "wh_event_category_diplomacy", "", "");
					cm:disable_event_feed_events(false, "wh_event_category_character", "", "");
				end,
				0.2
			);
		end,
		false
	);
end;

-- Get an army based on the node template of the rift type being closed and generate a battle.
local function NERTgenerate_rift_closure_battle_force(character, node_template)
	local mf = character:military_force();
	local faction = character:faction();
	local faction_name = faction:name();
	
	local rift_closure_battle_faction = NERTrift_closure_force_data[node_template][1];
	local rift_closure_battle_units = random_army_manager:generate_force(NERTrift_closure_force_data[node_template][2], 4);
	
	-- Guard against invasion already existing.
	invasion_manager:kill_invasion_by_key("rift_closure_battle_invasion");
	
	local invasion_1 = invasion_manager:new_invasion("rift_closure_battle_invasion", rift_closure_battle_faction, rift_closure_battle_units, {character:logical_position_x(), character:logical_position_y()});
	invasion_1:set_target("CHARACTER", character:command_queue_index(), faction_name);
	invasion_1:apply_effect("wh_main_bundle_military_upkeep_free_force", -1);
	invasion_1:start_invasion(
		function(self)
			core:add_listener(
				"NERTrift_closure_battle_war_declared",
				"FactionLeaderDeclaresWar",
				function(context)
					return context:character():faction():name() == rift_closure_battle_faction;
				end,
				function()
					cm:set_force_has_retreated_this_turn(mf);
					cm:force_attack_of_opportunity(self:get_general():military_force():command_queue_index(), mf:command_queue_index(), false);
				end,
				false
			);
			
			cm:force_declare_war(rift_closure_battle_faction, faction_name, false, false);
		end,
		false,
		false,
		false
	);
	
	core:add_listener(
		"rift_closure_battle_end_of_round_cleanup",
		"EndOfRound", 
		true,
		function()
			NERTkill_rift_closure_battle_invasion();
			cm:set_saved_value("rift_closure_battle_active", false);
		end,
		false
	);
end

-- Add listeners to check if a rift is being closed/a battle should commence.
local function SetupRiftInteractions()
	if cm:get_campaign_name() == "main_warhammer" then
        -- Spawn an army to fight when closing a rift.
        core:add_listener(
            "NERTarmy_closes_rift",
            "QueryTeleportationNetworkShouldHandoverCharacterNodeClosure",
            function(context)
                local closing_character = context:character_family_member();

                if not closing_character:is_null_interface() then
                    local character = closing_character:character();
					local isBelakor = character:faction():name() == "wh3_main_chs_shadow_legion";

                    if not character:is_null_interface() then
                        if not isBelakor and character:has_military_force() then
                            return true;
                        else
                            -- Hero closed the rift, trigger event to complete rift closure narrative mission.
                            core:trigger_event("ScriptEventRiftClosureBattleWon", character);
                        end;
                    end;
                end;
            end,
            function(context)
                context:flag_for_script_handover();
            end,
            true
        );

        core:add_listener(
            "NERTarmy_closes_rift_battle",
            "TeleportationNetworkCharacterNodeClosureHandedOver",
            function(context)
                local closing_character = context:character_family_member();

                if not closing_character:is_null_interface() then
                    local character = closing_character:character();

                    return not character:is_null_interface() and character:has_military_force();
                end;
            end,
            function(context)
                local character = context:character_family_member():character();

                cm:disable_event_feed_events(true, "wh_event_category_diplomacy", "", "");
                cm:disable_event_feed_events(true, "wh_event_category_character", "", "");

                cm:set_saved_value("rift_closure_battle_active", {context:node_key(), context:template_key(), character:command_queue_index()});
                NERTgenerate_rift_closure_battle_force(character, context:template_key());
                NERTrift_closure_battle_cleanup();
            end,
            true
        );

		-- Restore cleanup listener if saved on pre battle screen.
		if cm:get_saved_value("rift_closure_battle_active") then
			NERTrift_closure_battle_cleanup();
		end;
    end

	-- Spawn chaos armies/heroes out of rifts.
	local ram = random_army_manager;

	-- Create a new army template to be used in the generation of rift forces.
	ram:new_force("rift_army_belakor");

	ram:add_mandatory_unit("rift_army_belakor",		"wh3_main_kho_inf_bloodletters_0",		1);
	ram:add_unit("rift_army_belakor",				"wh3_main_kho_inf_bloodletters_0",		2);
	ram:add_unit("rift_army_belakor",				"wh3_main_kho_inf_chaos_warhounds_0",	1);
	ram:add_unit("rift_army_belakor",				"wh3_main_kho_inf_chaos_warriors_0",	1);
	ram:add_unit("rift_army_belakor",				"wh3_main_nur_inf_plaguebearers_0",		3);
	ram:add_unit("rift_army_belakor",				"wh3_main_nur_inf_nurglings_0",			1);
	ram:add_unit("rift_army_belakor",				"wh3_main_nur_mon_rot_flies_0",			1);
	ram:add_unit("rift_army_belakor",				"wh3_main_sla_inf_daemonette_0",		2);
	ram:add_unit("rift_army_belakor",				"wh3_main_tze_inf_pink_horrors_0",		3);
	ram:add_unit("rift_army_belakor",				"wh3_main_tze_inf_blue_horrors_0",		1);
	ram:add_unit("rift_army_belakor",				"wh3_main_tze_mon_screamers_0",			1);
	ram:add_unit("rift_army_belakor",				"wh3_main_kho_mon_soul_grinder_0",		1);
end

cm:add_first_tick_callback(
    function()
		SetupRiftInteractions();
    end
)