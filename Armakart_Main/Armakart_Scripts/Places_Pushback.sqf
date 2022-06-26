/*
* 
* - Adds the player name and place to the "Places" Array to be fetched later at the places screen
* 
*/ 

Params ["_Name", "_Name_Dos"];

KARTS_FINISHED = KARTS_FINISHED + 1;

_FINISHED_KART_NUM = KARTS_FINISHED;

_FINISHED_KART_NUM_STR = [_FINISHED_KART_NUM] call BIS_fnc_ordinalNumber;

if (isNil "_Name_Dos") then {

	Places pushBack format ["%1  -  %2", _FINISHED_KART_NUM_STR, _Name];

} else {

	Places pushBack format ["%1  -  %2  &  %3", _FINISHED_KART_NUM_STR, _Name_Dos, _Name];

};