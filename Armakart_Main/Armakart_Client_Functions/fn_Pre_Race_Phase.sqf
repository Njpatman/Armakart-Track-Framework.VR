if (!hasInterface || (typeOf player isEqualTo "potato_spectate_spectator" || typeOf player isEqualTo "ace_spectator_virtual" || player in ([] call ace_spectator_fnc_players))) exitWith {};

if (RACE_PHASE isEqualTo "Customization_Phase") then {

	//Creates Ace Self interact to reset the UI
	_Reset_Menu = ["Reset_Menu","<t color='#225985'>Reset Menu</t>","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	{
		
		createDialog "Customization_Menu";

		_Customization_Menu_UI = findDisplay 1286;
		_UI_Display_1 = _Customization_Menu_UI displayCtrl 1060;
		_UI_Display_2 = _Customization_Menu_UI displayCtrl 1061;
		_UI_Display_3 = _Customization_Menu_UI displayCtrl 1062;

		{
		_x ctrlSetBackgroundColor UI_Color;
		} forEach [_UI_Display_1, _UI_Display_2, _UI_Display_3];

	},{true}] call ace_interact_menu_fnc_createAction;

	[player, 1, ["ACE_SelfActions"], _Reset_Menu] call ace_interact_menu_fnc_addActionToObject;

};

//- Handles the creation and orbiting of the Pre-race camera -\\

//Makes player/player vic invincible
player allowDamage false;
vehicle player allowDamage false;

//Creates a small arrow local to the player then attaches it above the players kart so they can tell which cart is theirs
Arrow = "VR_3DSelector_01_default_F" createVehicleLocal [0,0,0];
Arrow attachto [vehicle player, [0, 0, 1.35] ];
Arrow setObjectScale 0.5;

_Angle_Player_cam = random 360;

_pos = vehicle player;
_pos_object = _pos;
_pos = [getPosATL _pos select 0, getPosATL _pos select 1, getPosATL _pos select 2];

_logic_pos = [(_pos select 0), (_pos select 1), (_pos select 2)];
logic = "VR_3DSelector_01_default_F" createVehicleLocal _logic_pos;
logic attachTo [_pos_object, [0, 0, 0]];
detach logic;
hideObject logic;

logic setDir _Angle_Player_cam;
_camPos = [_pos select 0, _pos select 1, (_pos select 2) +  4.2];

cam = "camera" camCreate _camPos;
cam camSetPos _camPos;
cam camSetTarget logic;
cam camCommit 0;

waitUntil {camcommitted cam};

cam attachTo [logic, [0, 5.6, 4.2] ];
cam cameraEffect ["internal", "BACK"];

// Handles the actual orbiting of the cam
while {!(RACE_PHASE isEqualTo "Race_Started")} do
{

	_Angle_Player_cam = _Angle_Player_cam + 0.065;
	logic setDir _Angle_Player_cam;
	uiSleep 0.0085;

};

camDestroy cam;
deleteVehicle logic;
deleteVehicle Arrow;
