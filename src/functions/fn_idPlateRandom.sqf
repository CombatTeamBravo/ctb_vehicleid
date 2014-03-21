/*

Sets up random characters for the passed in ID plate.

*/

private ["_idPlate", "_characters"];

_idPlate= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_characters= [_this, 1, 3] call BIS_fnc_param;	// Desired string length.

// Did we get passed an object?
if !(_idPlate== objNull) then {
	// TODO We should probably check the type...	
	private ["_loopChars", "_charList", "_numList", "_textValue"];
	// Create the array of available characters.
	_charList= ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","X","Y","Z"];
	_numList= ["0","1","2","3","4","5","6","7","8","9"];
	_textValue= "";
	
	for [{_loopChars= 0}, {_loopChars< _characters}, {_loopChars= _loopChars+ 1}] do
	{
		// First character is a letter!  Yay!
		if (_loopChars== 0) then {
			_textValue= (_charList select (floor random 25));	// Note the new assignment here....
		} else {
			_textValue= _textValue+ (_numList select (floor random 9));
		};
	};
	
	// Update the plate...
	[_idPlate, _textValue] call ctb_fnc_idPlateSetText;

};