/*
* 
* - Everything that happens to start the race for the players.
* 
*/

// Exit if spectator
if (hasInterface && (typeOf player isEqualTo "potato_spectate_spectator" || typeOf player isEqualTo "ace_spectator_virtual" || player in ([] call ace_spectator_fnc_players))) exitWith {  // Check if player, even a host

	uiSleep 11.6;

	//Display a countdown on players screen, with sfx to boot

	playsound"start";

	//5
	["<t color='#ff0000' size='3'>5</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

	playMusic "";

	//4
	["<t color='#ff0000' size='3'>4</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

	playsound"start";
	playsound"count";

	//3
	["<t color='#fcf403' size='3'>3</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

	//2
	["<t color='#fcf403' size='3'>2</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

	//1
	["<t color='#57de18' size='3'>1</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

	systemChat "|Armakart System| : Begin the race!";

	//GO!
	["<t color='#db9f07' size='4'>GO!</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

};

//Track orbiting shot
INTRO_1 = true;

( "Timer" call BIS_fnc_rscLayer ) cutText ["", "PLAIN"];

_Array_CAMERA_LOOK_POS = [CAMERA_LOOK_POS, CAMERA_LOOK_POS_1, CAMERA_LOOK_POS_2, CAMERA_LOOK_POS_3];

_pos = selectRandom _Array_CAMERA_LOOK_POS;
_Array_CAMERA_LOOK_POS deleteAt (_Array_CAMERA_LOOK_POS find _pos);
_pos_object = _pos;
_pos = [getPosATL _pos select 0, getPosATL _pos select 1, getPosATL _pos select 2];

_logic_pos = [(_pos select 0), (_pos select 1), (_pos select 2)];
_logic = "VR_3DSelector_01_default_F" createVehicleLocal _logic_pos;
_logic attachTo [_pos_object, [0, 0, 0]];
detach _logic;
hideObject _logic;

_logic setDir Angle_cam;
_camPos = [_pos select 0, _pos select 1, (_pos select 2) + Altitude_cam];

_cam = "camera" camCreate _camPos;
_cam camSetPos _camPos;
_cam camSetTarget _logic;
_cam camCommit 0;

waitUntil {camcommitted _cam};

_cam attachto [_logic, [0, Radius_cam, Altitude_cam] ];
_cam cameraEffect ["internal", "BACK"];

[_logic] Spawn {

	params ["_Logic"];
	private ["_Logic"];

	while {INTRO_1} do
	{

			Angle_cam = Angle_cam + Speed_cam;
			_Logic setDir Angle_cam;
			uiSleep 0.005;
				
	};
};

uiSleep 6;

INTRO_1 = false;
camDestroy _cam;
deleteVehicle _logic;

//Final player orbiting shot
INTRO_2 = true;

( "Timer" call BIS_fnc_rscLayer ) cutText ["", "PLAIN"];

_pos_2 = selectRandom _Array_CAMERA_LOOK_POS;
_pos_object_2 = _pos_2;
_pos_2 = [getPosATL _pos_2 select 0, getPosATL _pos_2 select 1, getPosATL _pos_2 select 2];

_logic_pos_2 = [(_pos_2 select 0), (_pos_2 select 1), (_pos_2 select 2)];
_logic_2 = "VR_3DSelector_01_default_F" createVehicleLocal _logic_pos_2;
_logic_2 attachTo [_pos_object_2, [0, 0, 0]];
detach _logic_2;
hideObject _logic_2;

_logic_2 setDir Angle_cam;
_camPos_2 = [_pos_2 select 0, _pos_2 select 1, _pos_2 select 2];

_cam_2 = "camera" camCreate _camPos_2;
_cam_2 camSetPos _camPos_2;
_cam_2 camSetTarget _logic_2;
_cam_2 camCommit 0;

waitUntil {camcommitted _cam_2};

_cam_2 attachto [_logic_2, [0, Radius_cam, Altitude_cam] ];
_cam_2 cameraEffect ["internal", "BACK"];

[_logic_2] Spawn {

	params ["_Logic_2"];
	private ["_Logic_2"];

	while {INTRO_2} do
	{

		Angle_cam = Angle_cam + Speed_cam;
		_logic_2 setDir Angle_cam;
		uiSleep 0.005;

	};

};

uiSleep 5;

INTRO_2 = false;

camDestroy _cam_2;
deleteVehicle _logic_2;
player cameraEffect ["terminate", "BACK"];

("Timer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

//Shows in race UI
"In_Race_UI_Layer" cutRsc ["In_Race_UI", "PLAIN"];

//Makes player/player vic invincible
player allowDamage false;
vehicle player allowDamage false;

//Sets plaver vic fuel to 0 just in case anyone jip'd 
[vehicle player, 0] remoteExec ['setfuel', vehicle player, false];

uiSleep 0.6;

//Display a countdown on players screen, with sfx to boot

playsound"start";

//5
["<t color='#ff0000' size='3'>5</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

playMusic "";

//4
["<t color='#ff0000' size='3'>4</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;


playsound"start";
playsound"count";

//3
["<t color='#fcf403' size='3'>3</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

//2
["<t color='#fcf403' size='3'>2</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

//1
["<t color='#57de18' size='3'>1</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

systemChat "|Armakart System| : Begin the race!";

//Sets players fuel to full
[vehicle player, 1] remoteexec ['setfuel', vehicle player, false];

//GO!
["<t color='#db9f07' size='4'>GO!</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

//Creates the Ace Self Interact to reset to last checkpoint
_Reset_Checkpoint = ["Reset_Checkpoint","<t color='#731717'>RESET</t>","\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",
{
	[] Spawn {

		//Creates vehicle for player, if the idiot got out
		if (isNull objectParent player) then
		{
			_veh = createVehicle [Kart_Classname, getPosASL player, [], 0, "NONE"];

			uiSleep 0.15;

			player moveInDriver _veh;
			player allowDamage false;
			vehicle player allowDamage false;
		};

		//Gets players checkpoint
		CP_str = 'CP_obj = CP_' + (str Current_Checkpoint);

		[] call compile CP_str;

		vehicle player setDamage 0;

		//have to remoteExec for doubles
		[vehicle player, (getDir CP_obj)] remoteExec ['setDir', vehicle player, true];
		[vehicle player, (surfaceNormal position vehicle player)] remoteExec ['setVectorUp', vehicle player, true];

		//Teleports players in a randomly select position in a circle around the CP, as well as faces them the direction the CP is facing
		vehicle player setPosASL ((getPosASL CP_obj) vectorAdd ([[5,0,1], random 360] call BIS_fnc_rotateVector2D));

		uiNamespace getVariable "NJP_Block_Keys";
		uiNamespace getVariable "NJP_Block_Keys_EH";

		if (uiNamespace getVariable "NJP_Block_Keys" isEqualTo 1) then {

			uiNamespace setVariable ["NJP_Block_Keys", 0];

			systemChat "|Armakart System| : Movement input will be re-enabled in a couple seconds from reset!";

			uiSleep 1.5;
					
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", (uiNamespace getVariable "NJP_Block_Keys_EH")];
			uiNamespace setVariable ["NJP_Block_Keys_EH", nil];

			if (!isNil "Lightning_Particle_Effect") then {

				deleteVehicle Lightning_Particle_Effect;
							
			};

			[vehicle player,1] remoteexec ['setfuel', vehicle player, true];

			systemChat "|Armakart System| : Movement input re-enabled from reset!";

		};

	};

},{true}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _Reset_Checkpoint] call ace_interact_menu_fnc_addActionToObject;