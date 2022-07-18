/*
	Author: Njpatman

	Description:
		Change Mass powerup, life is a smaller lie
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;

	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Change Mass Status:  </t><t color='#eef441'>Changing Mass...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 35];

			if (_Search_Array isEqualTo []) then {

				_Pos_AGl = screenToWorld [0.5,0.5];

				_Search_Array = nearestObjects [_Pos_AGl, ["Car", "Truck"], 35];

			};

			if (_Search_Array isEqualTo []) exitWith {
				
				hint parseText "<t>Change Mass Status:  </t><t color='#ff0000'>Change Mass Stopped, No Kart Was Found In Range Of Where You Targeted</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			_Kart = _Search_Array select 0;

			if (_kart isEqualTo vehicle player) exitWith {
				
				hint parseText "<t>Change Mass Status:  </t><t color='#ff0000'>Mass Change Stopped, Your Own Kart Was Targeted!</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			_Kart_array = fullCrew [_Kart, "driver", false];
			_driver_array = _Kart_array select 0;
			_driver = _driver_array select 0;

			_Attacker_Name = name player;

			[_Attacker_Name] remoteExec ["NJP_Client_Powerup_Effect_Fnc_Change_Mass_Effect", _driver];

		////////////////////////////////////////////////////////////////////////////////////////////////

		hint parseText "<t>Change Mass Status:  </t><t color='#ff0000'>Change Mass Completed!</t>";

		No_item = true;

		"Crosshair_Layer" cutFadeOut 0.001;

	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Change Mass Status:  </t><t color='#eef441'>Changing Mass...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 35];

			if (_Search_Array isEqualTo []) then {

				_Pos_AGl = screenToWorld [0.5,0.5];

				_Search_Array = nearestObjects [_Pos_AGl, ["Car", "Truck"], 35];

			};

			if (_Search_Array isEqualTo []) exitWith {
				
				hint parseText "<t>Change Mass Status:  </t><t color='#ff0000'>Change Mass Stopped, No Kart Was Found In Range Of Where You Targeted</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			_Kart = _Search_Array select 0;

			if (_kart isEqualTo vehicle player) exitWith {
				
				hint parseText "<t>Change Mass Status:  </t><t color='#ff0000'>Mass Change Stopped, Your Own Kart Was Targeted!</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			_Kart_array = fullCrew [_Kart, "driver", false];
			_driver_array = _Kart_array select 0;
			_driver = _driver_array select 0;

			_Attacker_Name = name player;

			[_Attacker_Name] remoteExec ["NJP_Client_Powerup_Effect_Fnc_Change_Mass_Effect", _driver];

		////////////////////////////////////////////////////////////////////////////////////////////////

		hint parseText "<t>Change Mass Status:  </t><t color='#ff0000'>Change Mass Completed!</t>";

		No_item = true;

		"Crosshair_Layer" cutFadeOut 0.001;

	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#5c8694'>Change Mass acquired!</t><br/><br/><t>Change Mass Status:  </t><t color='#45f442'>Ready To Change Some Mass</t><br/><br/><t>The Change Mass powerup will briefly change the mass of the vehicle under your crosshair to 10000kg, then we let PhysX take the wheel.</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 1.5;
	};
};
"Crosshair_Layer" cutRsc ["Crosshair", "PLAIN"];

#define _Crosshair_1 uiNamespace getVariable [ "Crosshair_1", controlNull ]
#define _Crosshair_2 uiNamespace getVariable [ "Crosshair_2", controlNull ]

//Apllies the color value to the Crosshair
{
_x ctrlSetBackgroundColor UI_Color;
} forEach [_Crosshair_1, _Crosshair_2];

playsound"hint";