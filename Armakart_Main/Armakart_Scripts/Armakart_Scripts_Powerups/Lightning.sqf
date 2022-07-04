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

			_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 25];

			if (_Search_Array isEqualTo []) exitWith {
				
				hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Stopped, No Kart Was Found In Range Of Where You Targeted!</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			_Kart = _Search_Array select 0;

			if (!(_kart isEqualTo vehicle player) && !isNull _kart) exitWith 
			{
				
				_group = createGroup CIVILIAN;

				_Zap = _group createUnit ["ModuleLightning_F",getPosASL _Kart, [], 0, "CAN_COLLIDE"];

				[_Kart,0] remoteexec ['setfuel', _Kart];

				uiSleep 0.2;

				deleteGroup _group;

				[[],{

					uiNamespace getVariable "NJP_Block_Keys";
					uiNamespace getVariable "NJP_Block_Keys_EH";

					if (uiNamespace getVariable "NJP_Block_Keys" isEqualTo 0) then {
					
						_NJP_Block_Keys_Fnc = ([] call BIS_fnc_displayMission) displayAddEventHandler ["KeyDown","_this call fnc_BlockKeyDown"];
						uiNamespace setVariable ["NJP_Block_Keys_EH", _NJP_Block_Keys_Fnc];
						uiNamespace setVariable ["NJP_Block_Keys", 1];
						systemChat "|Armakart Powerups| : Movement input disabled from lightning!";

					};

					uiSleep 5;

					[vehicle player,1] remoteexec ['setfuel', vehicle player];
					
					([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", (uiNamespace getVariable "NJP_Block_Keys_EH")];
					uiNamespace setVariable ["NJP_Block_Keys_EH", nil];
					uiNamespace setVariable ["NJP_Block_Keys", 0];
					systemChat "|Armakart Powerups| : Movement input re-enabled!";

					uiSleep 1;

					{if (typeOf _x isEqualTo "#particlesource") then {deleteVehicle _x}} forEach ( position (vehicle player) nearObjects 6.5 ); 
				
				}] remoteExec ["Spawn", _kart];

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

			_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 25];

			if (_Search_Array isEqualTo []) exitWith {
				
				hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Stopped, No Kart Was Found In Range Of Where You Targeted!</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			_Kart = _Search_Array select 0;

			if (!(_kart isEqualTo vehicle player) && !isNull _kart) exitWith 
			{
				
				_group = createGroup CIVILIAN;

				_Zap = _group createUnit ["ModuleLightning_F",getPosASL _Kart, [], 0, "CAN_COLLIDE"];

				[_Kart,0] remoteexec ['setfuel', _Kart];

				uiSleep 0.2;

				deleteGroup _group;

				[[],{

					uiNamespace getVariable "NJP_Block_Keys";
					uiNamespace getVariable "NJP_Block_Keys_EH";

					if (uiNamespace getVariable "NJP_Block_Keys" isEqualTo 0) then {
					
						_NJP_Block_Keys_Fnc = ([] call BIS_fnc_displayMission) displayAddEventHandler ["KeyDown","_this call fnc_BlockKeyDown"];
						uiNamespace setVariable ["NJP_Block_Keys_EH", _NJP_Block_Keys_Fnc];
						uiNamespace setVariable ["NJP_Block_Keys", 1];
						systemChat "|Armakart Powerups| : Movement input disabled from lightning!";

					};

					uiSleep 5;

					[vehicle player,1] remoteexec ['setfuel', vehicle player];
					
					([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", (uiNamespace getVariable "NJP_Block_Keys_EH")];
					uiNamespace setVariable ["NJP_Block_Keys_EH", nil];
					uiNamespace setVariable ["NJP_Block_Keys", 0];
					systemChat "|Armakart Powerups| : Movement input re-enabled!";

					uiSleep 1;

					{if (typeOf _x isEqualTo "#particlesource") then {deleteVehicle _x}} forEach ( position (vehicle player) nearObjects 6.5 ); 
				
				}] remoteExec ["Spawn", _kart];

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

//Gets the color value to the Crosshair
_UI_Color = profileNamespace getVariable "_UI_Color";

//Apllies the color value to the Crosshair
{
_x ctrlSetBackgroundColor _UI_Color;
} forEach [_Crosshair_1, _Crosshair_2];

playsound"hint";