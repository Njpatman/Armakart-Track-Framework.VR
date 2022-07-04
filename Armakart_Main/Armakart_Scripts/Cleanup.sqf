/*
* 
* - Just a simple cleanup script so there aren't any abandoned karts / Ai groups / Dead bois taking away precious frames
* 
*/ 

{

	if ( count units _x isEqualTo 0 ) then {deleteGroup _x;};

} forEach allGroups;

{

	if ( (not alive _x) || (({ alive _x } count (crew _x)) isEqualTo 0) && !(typeOf _x isEqualTo "Land_ClutterCutter_small_F")) then {deleteVehicle _x;};

} foreach Vehicles;

{

	deleteVehicle _x;

} forEach allDeadMen;