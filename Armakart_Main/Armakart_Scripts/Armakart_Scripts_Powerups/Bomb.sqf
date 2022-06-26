/*
	Author: Njpatman

	Description:
		Bomb powerup, spawns a bomb at the front of the kart and tracks the center of the players screen right before launch
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Bomb Status:  </t><t color='#eef441'>Tracking...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;

			_bomb attachTo [vehicle player, [0,1.5,0]];
			player setVariable ["BOMB_PREP", true];


			[_bomb] Spawn {
				params ["_bomb"];
				player getVariable ["BOMB_PREP", false];
				while {player getVariable ["BOMB_PREP", true]} do {
					_Dir = getdir vehicle player;
					_Aim = screenToWorld [0.5,0.5];
					_dir_target = [_bomb, _Aim] call BIS_fnc_dirTo;
					_bomb setDir (_dir_target - _Dir);
					uiSleep 0.06;
				};
			};


			uiSleep 1.6;
			player setVariable ["BOMB_PREP", false];
			hintsilent parseText "<t>Bomb Status:  </t><t color='#ff0000'>Tracking Complete, Firing...</t>";
			"Crosshair_Layer" cutFadeOut 0.001;
			uiSleep 0.4;

			_vel = velocity _bomb;
			_speed = 175;
			playsound"toss";
			detach _bomb;
			_dir = screenToWorld [0.5,0.5];
			_dir_target = [_bomb, _dir] call BIS_fnc_dirTo;
			_bomb setVelocity [
				(_vel select 0) + (sin _dir_target * _speed), 
				(_vel select 1) + (cos _dir_target * _speed),
				(_vel select 2)
			];

		////////////////////////////////////////////////////////////////////////////////////////////////
		No_item = true;
		hint parseText "<t>Bomb Status:  </t><t color='#ff0000'>Bomb Launched</t>";
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Bomb Status:  </t><t color='#eef441'>Tracking...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;

			_bomb attachTo [vehicle player, [0,1.5,0]];
			player setVariable ["BOMB_PREP", true];


			[_bomb] Spawn {
				params ["_bomb"];
				player getVariable ["BOMB_PREP", false];
				while {player getVariable ["BOMB_PREP", true]} do {
					_Dir = getdir vehicle player;
					_Aim = screenToWorld [0.5,0.5];
					_dir_target = [_bomb, _Aim] call BIS_fnc_dirTo;
					_bomb setDir (_dir_target - _Dir);
					uiSleep 0.06;
				};
			};


			uiSleep 1.3;
			player setVariable ["BOMB_PREP", false];
			hintsilent parseText "<t>Bomb Status:  </t><t color='#ff0000'>Tracking Complete, Firing...</t>";
			"Crosshair_Layer" cutFadeOut 0.001;
			uiSleep 0.2;

			_vel = velocity _bomb;
			_speed = 175;
			playsound"toss";
			detach _bomb;
			_dir = screenToWorld [0.5,0.5];
			_dir_target = [_bomb, _dir] call BIS_fnc_dirTo;
			_bomb setVelocity [
				(_vel select 0) + (sin _dir_target * _speed), 
				(_vel select 1) + (cos _dir_target * _speed),
				(_vel select 2)
			];

		////////////////////////////////////////////////////////////////////////////////////////////////
		No_item = true;
		hint parseText "<t>Bomb Status:  </t><t color='#ff0000'>Firing Complete</t>";
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#808080'>Bomb acquired!</t><br/><br/><t>Bomb Status:  </t><t color='#45f442'>Ready To Fire</t><br/><br/><t>The Bomb powerup spawns a 250lb bomb that is slaved to the crosshair, keep in mind the bomb will stop tracking just before launch.</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 1.5;
	};
};
"Crosshair_Layer" cutRsc ["Crosshair", "PLAIN"];

#define _Crosshair_1 uiNamespace getVariable [ "Crosshair_1", controlNull ]
#define _Crosshair_2 uiNamespace getVariable [ "Crosshair_2", controlNull ]

//Gets the color value to the Crosshair
_UI_Color = profileNamespace getVariable "_UI_Color";

//Apllies the color value to the Crosshair
{
_x ctrlSetBackgroundColor _UI_Color;
} forEach [_Crosshair_1, _Crosshair_2];

playsound"hint";