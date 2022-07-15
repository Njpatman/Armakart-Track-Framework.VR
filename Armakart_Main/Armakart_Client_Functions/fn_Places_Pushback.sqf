Params ["_Name", "_Name_Dos"];

KARTS_FINISHED = KARTS_FINISHED + 1;

_FINISHED_KART_NUM_ORD = [KARTS_FINISHED] call BIS_fnc_ordinalNumber;

if (isNil "_Name_Dos") then {

	Places pushBack format ["%1  -  %2", _FINISHED_KART_NUM_ORD, _Name];

} else {

	Places pushBack format ["%1  -  %2  &  %3", _FINISHED_KART_NUM_ORD, _Name_Dos, _Name];

};