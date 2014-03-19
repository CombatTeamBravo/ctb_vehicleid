
class CfgPatches
{
	class ctb_vehicleid_plate
	{
		units[] = {"ctb_vehicle_idplate_tank"};
		weapons[] ={};
		requiredAddons[] = {};
		version = "0.1";
		versionStr = "0.1";
		versionDesc="Marty's CTB Vehicle ID Plates";
		versionAr[] = {0,1,0};
		author[] = {"Marty - combatteambravo.com"};

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
	};
};
