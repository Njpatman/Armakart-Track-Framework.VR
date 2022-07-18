/*
	Author: Njpatman

	Description:
		Involuntary Boost powerup, gives a player a Involuntary speed boost
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Involuntary Boost Status:  </t><t color='#eef441'>Forcing Boost...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 35];

			if (_Search_Array isEqualTo []) then {

				_Pos_AGl = screenToWorld [0.5,0.5];

				_Search_Array = nearestObjects [_Pos_AGl, ["Car", "Truck"], 35];

			};

			if (_Search_Array isEqualTo []) exitWith {
				
				hint parseText "<t>Involuntary Boost Status:  </t><t color='#ff0000'>Involuntary Boost Stopped, No Kart Was Found In Range Of Where You Targeted!</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			_Kart = _Search_Array select 0;

			if (!(_kart isEqualTo vehicle player) && !isNull _kart) exitwith
			{
				
				_Attacker_Name = name player;

				[_Attacker_Name, "Involuntary Boost"] remoteExec ["NJP_Client_Powerup_Additional_fnc_Tell_Victim_Attacker", _Kart];

				_vel = velocity _Kart;
				_dir = random 360;
				_speed = 48;
				["turbo"] remoteexec ["playsound", _Kart];
				[_Kart, [
					(_vel select 0) + (sin _dir * _speed), 
					(_vel select 1) + (cos _dir * _speed), 
					(_vel select 2)
				]] remoteexec ["setVelocity", _Kart];

				hint parseText "<t>Involuntary Boost Status:  </t><t color='#ff0000'>Involuntary Boost Complete</t>";
				No_item = true;
				"Crosshair_Layer" cutFadeOut 0.001;

			};

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Involuntary Boost Status:  </t><t color='#ff0000'>Involuntary Boost Stopped, Player Kart Targeted</t>";
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
		hintsilent parseText "<t>Involuntary Boost Status:  </t><t color='#eef441'>Forcing Boost...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 35];

			if (_Search_Array isEqualTo []) then {

				_Pos_AGl = screenToWorld [0.5,0.5];

				_Search_Array = nearestObjects [_Pos_AGl, ["Car", "Truck"], 35];

			};

			if (_Search_Array isEqualTo []) exitWith {
				
				hint parseText "<t>Involuntary Boost Status:  </t><t color='#ff0000'>Involuntary Boost Stopped, No Kart Was Found In Range Of Where You Targeted!</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			_Kart = _Search_Array select 0;

			if (!(_kart isEqualTo vehicle player) && !isNull _kart) exitwith
			{
				
				_Attacker_Name = name player;

				[_Attacker_Name, "Involuntary Boost"] remoteExec ["NJP_Client_Powerup_Additional_fnc_Tell_Victim_Attacker", _Kart];

				_vel = velocity _Kart;
				_dir = random 360;
				_speed = 48;
				["turbo"] remoteexec ["playsound", _Kart];
				[_Kart, [
					(_vel select 0) + (sin _dir * _speed), 
					(_vel select 1) + (cos _dir * _speed), 
					(_vel select 2)
				]] remoteexec ["setVelocity", _Kart];

				hint parseText "<t>Involuntary Boost Status:  </t><t color='#ff0000'>Involuntary Boost Complete</t>";
				No_item = true;
				"Crosshair_Layer" cutFadeOut 0.001;

			};

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Involuntary Boost Status:  </t><t color='#ff0000'>Involuntary Boost Stopped, Player Kart Targeted</t>";
		No_item = true;
		"Crosshair_Layer" cutFadeOut 0.001;
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#ff5454'>Involuntary Boost acquired!</t><br/><br/><t>Involuntary Boost Status:  </t><t color='#45f442'>Ready To Fire</t><br/><br/><t>The Involuntary Boost powerup will give a players kart under your crosshair a heavy boost in a random direction.</t><br/><br/><t>[Default Keybind: F]</t>";
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