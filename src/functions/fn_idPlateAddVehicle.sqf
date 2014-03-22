/*

Adds the ID Plate to the passed vehicle...

If the vehicle already has an ID Plate, then this is ignored.

*/

private ["_vehicle", "_plateText", "_supportedVehicles"];

// Format is...
// [ "BaseClass (or actual class)", attachToOffset array [x,y,z], "Attach To Memory Point", VectorDirAndUp Array [[0,0,0],[0,0,0]] ]  
/// WARNING.  The code reads from the first item through to last...and finds the first match...so put
/// specific items at the top and generic "catch all" at the bottom of the array.  FUN!  
_supportedVehicles= [
["APC_Wheeled_01_base_F", [0.95, -4.74, -0.5], "trup", [[0,0.5,0.065],[0,0.5,0.5]]],		// Marshall
["APC_Tracked_01_base_F", [-1.1, -4.85, -1.15], "trup", [[0,0.5,0],[0,0.5,0.5]]],	// Panther, Cheetah
["MBT_01_base_F", [1.352,-4.405, -1.025], "trup", [[0,0.5,-0.18],[0,0.5,0.5]]],	// Sandstorm, Scorcher, Slammer
["APC_Wheeled_03_base_F", [1.53,-4.39,-0.85], "trup", [[0,0.5,0.18],[0,0.5,0.5]]],  // Gorgon
["APC_Tracked_03_base_F", [-1.1,-3.871,-0.775], "trup", [[0,0.5,0],[0,0.5,0.5]]],	// Mora
["MBT_03_base_F", [0.93,-5.7, -0.595], "trup", [[0,0.5,0],[0,0.5,0.5]]]	//Kuma  - Note no comma at the end.
];

_vehicle= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_plateText= [_this, 1, ""] call BIS_fnc_param;	// If empty, we go with the random...

// Did we get passed an object?
if !(_vehicle== objNull) then {

	private ["_posOffset", "_memPnt", "_vectorDir"];
	_posOffset= [];	// Empty array - we'll check this later to see if it's been modified, to know if the vehicle is eligible.

	// Does the vehicle already have an ID Plate - TODO wait for the attachList function coming in A3.
	// eligible vehicle?
	{
		if (_vehicle isKindOf (_x select 0)) exitWith
		{
			_posOffset= (_x select 1);
			_memPnt= (_x select 2);
			_vectorDir= (_x select 3);		
		};
	} forEach _supportedVehicles;

		// FIX UP.
		// FIX UP.
	if (count _posOffset> 0) then
	{
		private ["_newIDPlate"];
		_newIDPlate= "ctb_vehicle_idplate_tank" createVehicle [0,0,0];
		
		_newIDPlate addAction ["Set ID Text", "[_this select 0] call ctb_fnc_idPlateTextDialog;"];
		
		_newIDPlate attachTo [_vehicle, _posOffset, _memPnt];
		_newIDPlate setVectorDirAndUp _vectorDir;
		// Were we passed text?
		if (_plateText== "") then {
			// Randomly give it three characters...
			[_newIDPlate, 3] call CTB_fnc_idPlateRandom;
		} else {
			// Otherwise, set the text...
			[_newIDPlate, _plateText] call CTB_fnc_idPlateSetText;
		};	
		// Add the action...
		
	};
	

};	// end of objPlate not being null..

