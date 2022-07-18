if !(hasInterface) exitWith {};

#include "\a3\ui_f\hpp\defineDIKCodes.inc"

#define _Scoreboard_UI uiNamespace getVariable ["Places_UI", controlNull]

waitUntil {!isNil "Player_Finished"};

if (!Player_Finished) then {

	if (player in (fullCrew [vehicle player, "cargo", false] select 0) && count units group player isEqualTo 2) then {

		_Driver = driver vehicle player;

		_Name = profileName;
		_Name_Dos = name _Driver;

		[_Name, _Name_Dos, true] remoteExec ["NJP_Client_Fnc_Places_Pushback", 0, true];

		["|Armakart Doubles| : Race has ended, you & your buddy are DNF, make sure to notify him as he might not get this message"] remoteexec ["systemChat", vehicle player, true];

	};

	if (player in (fullCrew [vehicle player, "driver", false] select 0) && count units group player isEqualTo 1) then {

		_Name = profileName;

		[_Name, nil, true] remoteExec ["NJP_Client_Fnc_Places_Pushback", 0, true];

		systemChat "|Armakart Singles| : Race has ended, you are considered DNF";

	};

	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_R, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_R, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

	_Group = createGroup sideLogic;

	[player] joinSilent _Group;

	Player_Finished = true;

	deleteVehicle vehicle player;

	"In_Race_UI_Layer" cutFadeOut 0.001;
	"Crosshair_Layer" cutFadeOut 0.001;

	No_item = false;

	Initial_hint = false;

	[true] call ace_spectator_fnc_setSpectator;

};

uiSleep 3;

systemChat "|Armakart System| : Players still in race have been moved to spectator, calling Scoreboard...";

uiSleep 5;

Scoreboard_Active = true;

//Creates the Places Screen
createDialog "Scoreboard_UI";

//Default UI color incase player jip'd
_UI_Color_Backup = selectRandom [Light_Blue, Light_Green, Light_Red];

//Get the UI color that was used on the Customization UI and applies it
_UI_Color = profileNamespace getVariable "UI_Color";

if (!isNil "_UI_Color") then { _Scoreboard_UI ctrlSetBackgroundColor _UI_Color; } else { _Scoreboard_UI ctrlSetBackgroundColor _UI_Color_Backup; };

//Get's the places array and applies them in order to the Places Screen
{ lbAdd [1555,_x]; } forEach Places;

playMusic "";

//Plays some music
[] Spawn
{

	while {Scoreboard_Active} do
	{

		music_isPlaying = true;
		playMusic "Customization_Phase";
				
		waitUntil
		{

			uiSleep 5 ;

			not music_isPlaying

		};

	};
			
};

_pos = selectRandom [CAMERA_LOOK_POS, CAMERA_LOOK_POS_1, CAMERA_LOOK_POS_2, CAMERA_LOOK_POS_3];
_pos_object = _pos;
_pos = [getPosATL _pos select 0, getPosATL _pos select 1, getPosATL _pos select 2];

_logic_pos = [(_pos select 0), (_pos select 1), (_pos select 2)];
_logic = "Land_ClutterCutter_small_F" createVehicleLocal _logic_pos;
_logic attachTo [_pos_object, [0, 0, 0]];
detach _logic;

_logic setDir Angle_cam;
_camPos = [_pos select 0, _pos select 1, (_pos select 2) + Altitude_cam];

_cam = "camera" camCreate _camPos;
_cam camSetPos _camPos;
_cam camSetTarget _logic;
_cam camCommit 0;

waitUntil {camcommitted _cam && Scoreboard_Active};

_cam attachto [_logic, [0, Radius_cam, Altitude_cam] ];
_cam cameraEffect ["internal", "BACK"];

while {Scoreboard_Active} do
{
			
	Angle_cam = Angle_cam + Speed_cam;
	_Logic setDir Angle_cam;
	uiSleep 0.05;
			
};

camDestroy _cam;
deleteVehicle _logic;