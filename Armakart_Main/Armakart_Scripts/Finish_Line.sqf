/*
* 
* - All the stuff that happens when a players crosses the finish line trigger
* 
*/
if !(hasInterface) exitWith {};

#include "\a3\ui_f\hpp\defineDIKCodes.inc"

//This block of code checks if the player has finished the race, if true, tell them their place then kill them
if (Current_Laps + 1 > Laps_number && Current_Checkpoint isEqualTo CP_NUM) exitWith
{

	"In_Race_UI_Layer" cutFadeOut 0.001;
	"Crosshair_Layer" cutFadeOut 0.001;

	No_item = false;

	Initial_hint = false;

	Player_Finished = true;

	_FINISHED_KART_NUM = KARTS_FINISHED + 1;

	_FINISHED_KART_NUM_STR = [_FINISHED_KART_NUM] call BIS_fnc_ordinalNumber;


	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

	hintSilent "Race completed! Enjoy watching everyone else in spectator!";

	playSound "Win";

	if (player in (fullCrew [vehicle player, "cargo", false] select 0) && count units group player isEqualTo 2) then {

		_Driver = driver vehicle player;

		[[_Name, _Name_Dos], "Armakart_Main\Armakart_Scripts\Places_Pushback.sqf"] remoteExec ["execVM", 0];

		_Name = profileName;
		_Name_Dos = name _Driver;

		[format ["|Armakart Doubles| : You & your buddy finished %1, make sure to notify him as he might not get this message", _FINISHED_KART_NUM_STR]] remoteexec ["systemChat", vehicle player];

		deleteVehicle vehicle player;

	};

	if (player in (fullCrew [vehicle player, "driver", false] select 0) && count units group player isEqualTo 1) then {

		_Name = profileName;

		[[_Name], "Armakart_Main\Armakart_Scripts\Places_Pushback.sqf"] remoteExec ["execVM", 0];

		systemChat format ["|Armakart Singles| : You finished %1", _FINISHED_KART_NUM_STR];

		deleteVehicle vehicle player;

	};

	_Group = createGroup sideLogic;

	[player] joinSilent _Group;

	[true] call ace_spectator_fnc_setSpectator;

};


//Simply adds to the Current_Laps variable and resets the Checkpoint and Sub_Checkpoint count, while also making a song and dance about it
if (Current_Laps + 1 < Laps_number && Current_Checkpoint isEqualTo CP_NUM) then
{

	systemChat "|Armakart System| : Next Lap Started!";
	playsound"Lap";

	Current_Checkpoint = 1;

	Sub_CP_obj = Sub_CP_0;

	Current_Laps = Current_Laps + 1;

	initial_Lap = false;

};

//Checks if player is on his final lap, if so, then to make a song and dance about it.
if (Current_Laps + 1 isEqualTo Laps_number && Current_Checkpoint isEqualTo CP_NUM) then
{

	systemChat "|Armakart System| : Final Lap Started!";
	playsound"Final_Lap";

	Current_Checkpoint = 1;

	Sub_CP_obj = Sub_CP_0;

	Current_Laps = Current_Laps + 1;

	initial_Lap = false;

};

//Checks if player is on his first lap, if so, then to make a song and dance about it.
if (initial_Lap) then 
{

	systemChat "|Armakart System| : First Lap Started!";

	playsound"Lap";

	Sub_CP_obj = Sub_CP_0;

	initial_Lap = false;

};
