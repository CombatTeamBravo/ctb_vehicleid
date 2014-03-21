#define IDText ((vehicleid_IDSetText_Dialog select 0) displayCtrl 1400)

private ["_textEntryDialog", "_idPlate"];

_idPlate= [_this, 0, objNull, [objNull]] call BIS_fnc_param;

_textEntryDialog= createDialog "vehicleid_IDSetText_Dialog";
sleep 0.1;
// Load in existing text.
ctrlSetText [1400, _idPlate getVariable "ctb_vehicleid_plate_text"]; 

// RscEdit_1400 ctrlSetText "bleh";

waitUntil {!dialog};
[_idPlate, missionNamespace getVariable "ctb_nameplateid_newIDText"] call CTB_fnc_idPlateSetText;
