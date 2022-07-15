/*
	Author: Njpatman

	Description:
		Smoke powerup, spawns vanilla smokes and attatches them to the players vic
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Smoke Status:  </t><t color='#eef441'>Smoke Deploying...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_smoke_shell_1 = selectRandom ["SmokeShell","SmokeShellRed","SmokeShellBlue","SmokeShellOrange","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple"];
			_smoke_shell_2 = selectRandom ["SmokeShell","SmokeShellRed","SmokeShellBlue","SmokeShellOrange","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple"];
			_smoke_1 = _smoke_shell_1 createVehicle position Powerup_Spawn;
			_smoke_2 = _smoke_shell_2 createVehicle position Powerup_Spawn;
			_smoke_3 = _smoke_shell_1 createVehicle position Powerup_Spawn;
			_smoke_4 = _smoke_shell_2 createVehicle position Powerup_Spawn;
			_smoke_5 = _smoke_shell_1 createVehicle position Powerup_Spawn;
			_smoke_6 = _smoke_shell_2 createVehicle position Powerup_Spawn;
			{_x attachto [vehicle player,[0.5,-0.5,-0.6]];} forEach [_smoke_1,_smoke_2];
			{_x attachto [vehicle player,[-0.5,-0.5,-0.6]];} forEach [_smoke_3,_smoke_4];
			{_x attachto [vehicle player,[0,-0.5,-0.4]];} forEach [_smoke_5,_smoke_6];
			No_item = true;
			hint parseText "<t>Smoke Status:  </t><t color='#ff0000'>Smoke Deployed</t>";
			uiSleep 18.5;
			{deleteVehicle _x;} forEach [_smoke_1,_smoke_2,_smoke_3,_smoke_4,_smoke_5,_smoke_6];

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Smoke Status:  </t><t color='#eef441'>Smoke Deploying...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_smoke_shell_1 = selectRandom ["SmokeShell","SmokeShellRed","SmokeShellBlue","SmokeShellOrange","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple"];
			_smoke_shell_2 = selectRandom ["SmokeShell","SmokeShellRed","SmokeShellBlue","SmokeShellOrange","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple"];
			_smoke_1 = _smoke_shell_1 createVehicle position Powerup_Spawn;
			_smoke_2 = _smoke_shell_2 createVehicle position Powerup_Spawn;
			_smoke_3 = _smoke_shell_1 createVehicle position Powerup_Spawn;
			_smoke_4 = _smoke_shell_2 createVehicle position Powerup_Spawn;
			_smoke_5 = _smoke_shell_1 createVehicle position Powerup_Spawn;
			_smoke_6 = _smoke_shell_2 createVehicle position Powerup_Spawn;
			{_x attachto [vehicle player,[0.5,-0.5,-0.6]];} forEach [_smoke_1,_smoke_2];
			{_x attachto [vehicle player,[-0.5,-0.5,-0.6]];} forEach [_smoke_3,_smoke_4];
			{_x attachto [vehicle player,[0,-0.5,-0.4]];} forEach [_smoke_5,_smoke_6];
			No_item = true;
			hint parseText "<t>Smoke Status:  </t><t color='#ff0000'>Smoke Deployed</t>";
			uiSleep 18.5;
			{deleteVehicle _x;} forEach [_smoke_1,_smoke_2,_smoke_3,_smoke_4,_smoke_5,_smoke_6];

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#5c0c5e'>Smoke acquired!</t><br/><br/><t>Smoke Status:  </t><t color='#45f442'>Ready To Deploy</t><br/><br/><t>Smoke deploys a trail of decently thick smoke behind the player, making it so you can blind people close behind</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 1.5;
	};
};
playsound"hint";