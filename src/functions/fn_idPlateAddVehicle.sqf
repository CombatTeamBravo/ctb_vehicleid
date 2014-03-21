/*

Adds the ID Plate to the passed vehicle...

If the vehicle already has an ID Plate, then this is ignored.

*/

_vehicle= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_plateText= [_this, 1, ""] call BIS_fnc_param;	// If empty, we go with the random...

// Did we get passed an object?
if !(_vehicle== objNull) then {

	private ["_posOffset", "_memPnt", "_vectorDir"];

	// Does the vehicle already have an ID Plate - TODO wait for the attachList function coming in A3.
	// eligible vehicle?
	
	// Marshall
	if (_vehicle isKindOf "APC_Wheeled_01_base_F") then {
		_posOffset= [0.95, -4.74, -0.5];
		_memPnt= "trup";
		_vectorDir= [[0,0.5,0.065],[0,0.5,0.5]];
	} else {
		// Panther, Cheetah
		if (_vehicle isKindOf "APC_Tracked_01_base_F") then {
			_posOffset= [-1.1, -4.85, -1.15];
			_memPnt= "trup";
			_vectorDir= [[0,0.5,0],[0,0.5,0.5]];
		} else {
			// Sandstorm, Scorcher, Slammer 
			if (_vehicle isKindOf "MBT_01_base_F") then {
				_posOffset= [1.352,-4.405, -1.025];
				_memPnt= "trup";
				_vectorDir= [[0,0.5,-0.18],[0,0.5,0.5]];
			} else {
				// Gorgon 
				if (_vehicle isKindOf "APC_Wheeled_03_base_F") then {
					_posOffset= [1.53,-4.39,-0.85];
					_memPnt= "trup";
					_vectorDir= [[0,0.5,0.18],[0,0.5,0.5]];
				} else {
					// Mora 
					if (_vehicle isKindOf "APC_Tracked_03_base_F") then {
						_posOffset= [-1.1,-3.871,-0.775];
						_memPnt= "trup";
						_vectorDir= [[0,0.5,0],[0,0.5,0.5]];
					} else {
						// Kuma 
						if (_vehicle isKindOf "MBT_03_base_F") then {
							_posOffset= [0.93,-5.7, -0.595];
							_memPnt= "trup";
							_vectorDir= [[0,0.5,0],[0,0.5,0.5]];
						} else {
							// nothing happens.
							
						};	// end of else APC_Tracked_03_base_F	
					
					};	// end of else APC_Tracked_03_base_F	
				};  // end of else APC_Wheeled_03_base_F
			};  // end of eld MBT_01_base_f
		};  // end of else APC_Tracked_01_base_f
	};  // end of outmost if (APC_Wheeled_01_base_F)
		
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

