/*
	Author: Njpatman

	Description:
		Lightning powerup, life is a lie
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;

	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Lightning Status:  </t><t color='#eef441'>Zapping...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 35];

			if (_Search_Array isEqualTo []) then {

				_Pos_AGl = screenToWorld [0.5,0.5];

				_Search_Array = nearestObjects [_Pos_AGl, ["Car", "Truck"], 35];

			};

			if (_Search_Array isEqualTo []) exitWith {
				
				hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Stopped, No Kart Was Found In Range Of Where You Targeted!</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			_Kart = _Search_Array select 0;

			if (!(_Kart isEqualTo vehicle player) && !isNull _Kart) exitWith 
			{

				_Attacker_Name = name player;
				
				_group = createGroup CIVILIAN;

				_Zap = _group createUnit ["ModuleLightning_F",getPosASL _Kart, [], 0, "CAN_COLLIDE"];

				deleteGroup _group;

				[_Attacker_Name] remoteExec ["NJP_Client_Powerup_Effect_Fnc_Lightning_Effect", _kart];

				deleteVehicle _Zap;
				hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Complete</t>";
				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;

			};

		////////////////////////////////////////////////////////////////////////////////////////////////

		if (_kart isEqualTo vehicle player) then {hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Stopped, Your Own Kart Was Targeted!</t>";};

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
		hintsilent parseText "<t>Lightning Status:  </t><t color='#eef441'>Zapping...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 35];

			if (_Search_Array isEqualTo []) then {

				_Pos_AGl = screenToWorld [0.5,0.5];

				_Search_Array = nearestObjects [_Pos_AGl, ["Car", "Truck"], 35];

			};

			if (_Search_Array isEqualTo []) exitWith {
				
				hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Stopped, No Kart Was Found In Range Of Where You Targeted!</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			_Kart = _Search_Array select 0;

			if (!(_Kart isEqualTo vehicle player) && !isNull _Kart) exitWith 
			{

				_Attacker_Name = name player;
				
				_group = createGroup CIVILIAN;

				_Zap = _group createUnit ["ModuleLightning_F",getPosASL _Kart, [], 0, "CAN_COLLIDE"];

				deleteGroup _group;

				[_Attacker_Name] remoteExec ["NJP_Client_Powerup_Effect_Fnc_Lightning_Effect", _kart];

				deleteVehicle _Zap;
				hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Complete</t>";
				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;

			};

		////////////////////////////////////////////////////////////////////////////////////////////////

		if (_kart isEqualTo vehicle player) then {hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Stopped, Your Own Kart Was Targeted!</t>";};;

		No_item = true;

		"Crosshair_Layer" cutFadeOut 0.001;

	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#04378f'>Lightning acquired!</t><br/><br/><t>Lightning Status:  </t><t color='#45f442'>Ready To Zap</t><br/><br/><t>The Lightning powerup will disable the kart of the person under your corsshairs for a short period of time.</t><br/><br/><t>[Default Keybind: F]</t>";
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