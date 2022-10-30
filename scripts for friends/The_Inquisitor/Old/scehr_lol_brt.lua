-- Landmarks of Legend: Bretonnia | scehr | 02/09/2022

--[[
All you should need to do here is find and replace some keywords to get the script working.
Be sure to use case-sensitive searching to get the right keywords. This is what you need to replace:

CustomAncillary - the name of the ancillary given like KnightsOfCuileuxBanner, NOT the key.
SCLT - desired subculture abbreviation, like brt for Bretonnia.
SubcultureKey - the full key for the subculture above, like wh_main_sc_brt_bretonnia for Bretonnia. Found in factions_tables.
BuildingKey - the full key for the ancillary-gifting building, like cuileux_barrows for the Cuileux Banner ancillary. Found in building_levels_tables.
AncillaryKey - the full key for the ancillary to gift, like anc_knights_of_cuileux_banner for the Cuileux Banner ancillary. Found in ancillaries_tables.
]]--

-- Currently Bretonnian. Change to the eligible faction keys of the subculture you want.
local allEligibleFactionKeys = {
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
};

-- Change 'CUSTOM' and 'ANCILLARY' in the function below to the name of the ancillary being added.
-- brt = Culture abbreviation. Bretonnia's is 'brt'.
local function add_KnightsOfCuileuxBanner_listener(isPlayersInCulture)
	out("#### scehr: LoL Adding KnightsOfCuileuxBanner Listener ####");
	core:add_listener(
        -- Custom event name.
		"lol_brt_KnightsOfCuileuxBanner_building_completed",
        -- CA event name: this building finished construction.
		"BuildingCompleted",
		function(context)
            --[[
            This check will run the code in the next function if the subculture
            that owns the new building is equal to the subculture key.
            And, if the building key is equal to the one for the ancillary.
            ]]--
            return context:building():faction():subculture() == "wh_main_sc_brt_bretonnia"
            and
            context:building():name() == "cuileux_barrows";
		end,
        function(context)
            -- Faction object, required in the add_ancillary_to_faction command.
            local giftFaction = context:building():faction();

            -- True/false statement showing if the faction is human or not.
            local giftFactionHuman = cm:is_faction_human(giftFaction:name());

            -- If this faction isn't human, but there are humans playing that culture, don't execute.
            if not giftFactionHuman and isPlayersInCulture then
                out("#### scehr: LoL non-Human faction "..giftFaction:name().." has building ".."cuileux_barrows".." but players exist in subculture! Denying. ####");
                return;

            -- If faction is human, give it. Or, if faction isn't human AND there are no humans in this culture, give it.
            else
                cm:add_ancillary_to_faction(giftFaction, "anc_knights_of_cuileux_banner", false);
                cm:set_saved_value("lolKnightsOfCuileuxBannerClaimed", true);
                out("#### scehr: LoL KnightsOfCuileuxBanner has been claimed by "..giftFaction:name()..". ####");
            end
        end,
		true
	);
end

-- Runs through the array (allEligibleFactionKeys) at the top of the script, checking if any of the subculture's factions are human.
-- If anyone is human, return true, else false.
local function brt_human_query()
    for i = 1, #allEligibleFactionKeys do
        local brtHumanQuery = cm:is_faction_human(allEligibleFactionKeys[i]);
        if brtHumanQuery then
            cm:set_saved_value("isPlayersInCulture", true);
            out("#### scehr: Players in wh_main_sc_brt_bretonnia. ####");
            return true;
        end
    end
    out("#### scehr: There are no wh_main_sc_brt_bretonnia players. ####");
    return false;
end

-- Runs through the array (allEligibleFactionKeys) at the top of the script, checking if any of the subculture's factions
-- have the building. If yes, and criteria are met, return true, else false.
local function mid_save_building_check(isPlayersInCulture)
    if cm:turn_number() > 1 then

        for i = 1, #allEligibleFactionKeys do
            local queryFaction = cm:get_faction(allEligibleFactionKeys[i]);
            local queryFactionHasBuilding = cm:faction_contains_building(queryFaction, "cuileux_barrows");
            local queryFactionIsHuman = cm:is_faction_human(allEligibleFactionKeys[i]);

            if queryFactionHasBuilding then
                if not queryFactionIsHuman and isPlayersInCulture then
                    out("#### scehr: LoL non-Human faction "..queryFaction:name().." has building ".."cuileux_barrows".." but players exist in subculture! Denying. ####");
                    break;
                
                else
                    cm:add_ancillary_to_faction(queryFaction, "anc_knights_of_cuileux_banner", false);
                    cm:set_saved_value("lolKnightsOfCuileuxBannerClaimed", true);
                    out("#### scehr: LoL KnightsOfCuileuxBanner has been claimed by "..queryFaction:name()..". ####");
                    return true;
                end
            end
        end
        return false;
    end
end

cm:add_first_tick_callback(
    function()
        -- Get value stored in game save. Have we initialised the custom ancillary?
        local lolKnightsOfCuileuxBannerInit = cm:get_saved_value("lolKnightsOfCuileuxBannerInit");
        -- Get campaign name. We want 'main_warhammer' for Immortal Empires.
        local campaignMode = cm:get_campaign_name();
        -- Returns a table with human faction strings in it.
        local playerFactions = cm:get_human_factions();
        -- Returns number of factions in the table above.
        local playerCount = #playerFactions;
        -- Get value stored in game save. Are any of the desired subculture being played by players?
        local isPlayersInCulture = cm:get_saved_value("isPlayersInCulture");
        -- Get value stored in game save. Has the desired ancillary been claimed already?
        local lolKnightsOfCuileuxBannerClaimed = cm:get_saved_value("lolKnightsOfCuileuxBannerClaimed");

        out("#### scehr: This sessions has >> "..playerCount.." << player(s). ####");

        -- If the script hasn't been initialised, do it now.
        if not lolKnightsOfCuileuxBannerInit then
            -- If Immortal Empires, run code.
            if campaignMode == "main_warhammer" then
                out("#### scehr: LoL KnightsOfCuileuxBanner initialising. ####");

                brt_human_query();

                if mid_save_building_check(isPlayersInCulture) then
                    cm:set_saved_value("lolKnightsOfCuileuxBannerInit", true);
                    out("#### scehr: LoL KnightsOfCuileuxBanner initialised. ####");
                    return;
                end
                
                add_KnightsOfCuileuxBanner_listener(isPlayersInCulture);
                cm:set_saved_value("lolKnightsOfCuileuxBannerInit", true);

                out("#### scehr: LoL KnightsOfCuileuxBanner initialised. ####");
            else
                out("#### scehr: LoL KnightsOfCuileuxBanner initialiser failed: incorrect game mode.Legend ####");
            end
        -- Otherwise, check if the ancillary has already been claimed. If not, add listeners for it.
        else
            if not lolKnightsOfCuileuxBannerClaimed then
                add_KnightsOfCuileuxBanner_listener(isPlayersInCulture);
            else
                out("#### scehr: LoL KnightsOfCuileuxBanner has been claimed already. ####");
            end
        end
    end
);