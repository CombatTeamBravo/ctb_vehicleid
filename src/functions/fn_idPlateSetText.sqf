/*

Sets the text value for the plate...

*/

private ["_plateText", "_idPlate", "_loopChars", "_plateArray"];

_idPlate= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_plateText= [_this, 1, ""] call BIS_fnc_param;
_plateArray= toArray _plateText;

_idPlate setVariable ["ctb_vehicleid_plate_text", _plateText, true];

for [{_loopChars= 0}, {_loopChars< count _plateArray}, {_loopChars= _loopChars+ 1}] do {	
	_idPlate setObjectTextureGlobal [_loopChars, "ctb_vehicleid_plate\data\letters\"+ toString([_plateArray select _loopChars]) +"_ca.paa"];
};