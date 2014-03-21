
class CfgPatches
{
	class ctb_vehicleid_plate
	{
		units[] = {"ctb_vehicle_idplate_tank"};
		weapons[] ={};
		requiredAddons[] = {};
		version = "0.2";
		versionStr = "0.2";
		versionDesc="Marty's CTB Vehicle ID Plates";
		versionAr[] = {0,2,0};
		author[] = {"Marty - combatteambravo.com"};

	};
};

class CfgFunctions
{
	class ctb
	{
		class vehicleid
		{
			file= "ctb_vehicleid_plate\functions";
			class idPlateRandom{};		
			class idPlateSetText{};
			class idPlateTextDialog{};
			class idPlateAddVehicle{};
		};	
	};
};

class cfgVehicles
{
	// Redeclare...so we can inherit from it.
	class Land_Noticeboard_F;
	class ctb_vehicle_idplate_tank: Land_Noticeboard_F  // Inherit properties of the Land_NoticeBoard_F...unless we overwrite them.
	{
		mapSize= "0.30";	// How large does the icon for this show in the map editor?
		author= "Marty [CTB]";
		_generalMacro= "ctb_vehicle_idplate_tank";
		scope= 2;	// Can use in the editor by its self.
		displayName= "CTB Vehicle ID Plate (Tank)";
		destrType= "DestructNo";	// Not destructable...might be an issue - need to test that out.
		model= "ctb_vehicleid_plate\ctb_vehicle_idplate_tank.p3d";
		hiddenSelections[]= {"v_id0", "v_id1", "v_id2", "v_id_plate"};
		hiddenSelectionsTextures[]= {"ctb_vehicleid_plate\data\letters\2_ca.paa", "ctb_vehicleid_plate\data\letters\1_ca.paa", "ctb_vehicleid_plate\data\letters\b_ca.paa", "#(argb,8,8,3)color(0.015,0.012,0.010,1.0,co)"};

		// Event handlers.
		// init= "[(_this select 0)] exec ""ctb_vehicleid_plate\""";
	};
	class ctb_vehicle_csplate_tank_e: Land_Noticeboard_F
	{
		mapSize= "0.30";
		author= "Marty [CTB]";
		_generalMacro= "ctb_vehicle_csplate_tank_e";
		scope= 2;
		displayName= "CTB Vehicle Callsign Plate (Tank Even)";
		destrType= "DestructNo";
		model= "ctb_vehicleid_plate\ctb_vehicle_csplate_tank.p3d";
		hiddenSelections[]= {"e0","e1","e2","e3","e4","e5","e6","e7","e8","e9"};
		hiddenSelectionsTextures[]= {"ctb_vehicleid_plate\data\letters\e_ca.paa", "ctb_vehicleid_plate\data\letters\v_ca.paa", "ctb_vehicleid_plate\data\letters\e_ca.paa","ctb_vehicleid_plate\data\letters\n_ca.paa"};
	};
	class ctb_vehicle_csplate_tank_o: ctb_vehicle_csplate_tank_e
	{
		_generalMacro= "ctb_vehicle_csplate_tank_o";
		displayName= "CTB Vehicle Callsign Plate (Tank Odd)";
		hiddenSelections[]= {"o0","o1","o2","o3","o4","o5","o6","o7","o8"};
		hiddenSelectionsTextures[]= {"ctb_vehicleid_plate\data\letters\o_ca.paa", "ctb_vehicleid_plate\data\letters\d_ca.paa", "ctb_vehicleid_plate\data\letters\d_ca.paa"};
	};
};

// Dialog stuff.
// Gives us the standard defines
#include "GUI\rscCommon.hpp"

class vehicleid_IDSetText_Dialog
{
	idd= 10569;
	movingEnable= true;
	enableSimulation= true;	
	
	class controls
	{
		class IGUIBack_2201: IGUIBack
		{
			idc = -1;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 6.5 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			idc = -1;
			text = "Plate Text"; 
			x = 12.65 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscButtonMenuOK_2600: RscButton
		{
			idc= 2600;
			text= "OK";
			default = 1;
			action= "missionNamespace setVariable ['ctb_nameplateid_newIDText', ctrlText 1400];closeDialog 0;";  
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButtonMenuCancel_2700: RscButtonMenuCancel
		{
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

	};
};

