/*
	Author: Njpatman
*/

params ["_bomb", "_Bunny"];

_i = 1;

while {alive _bomb} do {

_i = _i + 1;

	if (_i isEqualTo 125) then {

		_bomb setDamage 1;
						
	};

	uiSleep 1;

};

deleteVehicle _bomb;
deleteVehicle _Bunny;