/* 
*
* - Displays scoreboard with everyone's places.
* 
*/
if !(hasInterface) exitWith {};

#define _Scoreboard_UI uiNamespace getVariable ["Places_UI", controlNull]

if (!Player_Finished) then {

	Player_Finished = true;

	deleteVehicle vehicle player;

	[true] call ace_spectator_fnc_setSpectator;
	
};

Scoreboard_Active = true;

//Creates the Places Screen
createDialog "Scoreboard_UI";

//Default UI color incase player jip'd
_UI_Color = [0.133,0.349,0.522,0.65];

//Get the UI color that was used on the Customization UI and applies it
_UI_Color = profileNamespace getVariable "_UI_Color";
_Scoreboard_UI ctrlSetBackgroundColor _UI_Color;

//Get's the places array and applies them in order to the Places Screen
{

	lbAdd [1555,_x];

} forEach Places;

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

			uiSleep 1;

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