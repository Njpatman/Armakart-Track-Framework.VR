/*
	Author: Njpatman

	Description:
		Kitchen Sink powerup, simply launches 2 invisible GBUs with a kitchen sink on top
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Kitchen Sink Status: </t><t color='#eef441'>Launching Forwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;
			_bomb_2 = "Bomb_03_F" createvehicle position Powerup_Spawn;
			_sink = "CUP_sink" createvehicle position Powerup_Spawn;

			_smoke_1 = "SmokeShellYellow" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_sink, [0,0,0]];

			_bomb attachTo [vehicle player, [1,1,0.05]];
			_bomb_2 attachTo [_sink, [0,0.5,0]];
			_sink attachTo [_bomb, [0,0.5,0]];
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			[_bomb_2, true] remoteExec ["hideObjectGlobal",0,true];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];

			sleep 1.5;

			_vehicle = _bomb; 
			_vel = velocity _vehicle;
			_speed = 185;
			playsound"toss";
			detach _bomb;
			_dir = direction _vehicle;
			_vehicle setVelocity [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed),
				(_vel select 2)
			];
			No_item = true;
			hint parseText "<t>Kitchen Sink Status:  </t><t color='#ff0000'>Launched</t>";
			sleep 2.5;
			deleteVehicle _sink;
			deleteVehicle _smoke_1;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;


}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Kitchen Sink Status: </t><t color='#eef441'>Launching Forwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;
			_bomb_2 = "Bomb_03_F" createvehicle position Powerup_Spawn;
			_sink = "CUP_sink" createvehicle position Powerup_Spawn;

			_smoke_1 = "SmokeShellYellow" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_sink, [0,0,0]];

			_bomb attachTo [vehicle player, [1,1,0.05]];
			_bomb_2 attachTo [_sink, [0,0.5,0]];
			_sink attachTo [_bomb, [0,0.5,0]];
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			[_bomb_2, true] remoteExec ["hideObjectGlobal",0,true];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];

			sleep 1.5;

			_vehicle = _bomb; 
			_vel = velocity _vehicle;
			_speed = 185;
			playsound"toss";
			detach _bomb;
			_dir = direction _vehicle;
			_vehicle setVelocity [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed),
				(_vel select 2)
			];
			No_item = true;
			hint parseText "<t>Kitchen Sink Status:  </t><t color='#ff0000'>Launched</t>";
			sleep 2.5;
			deleteVehicle _sink;
			deleteVehicle _smoke_1;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;


}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyRKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Kitchen Sink Status: </t><t color='#eef441'>Launching Backwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;
			_bomb_2 = "Bomb_03_F" createvehicle position Powerup_Spawn;
			_sink = "CUP_sink" createvehicle position Powerup_Spawn;

			_smoke_1 = "SmokeShellYellow" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_sink, [0,0,0]];

			_bomb attachTo [vehicle player, [1,1,0.05]];
			_bomb_2 attachTo [_sink, [0,0.5,0]];
			_sink attachTo [_bomb, [0,0.5,0]];
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			[_bomb_2, true] remoteExec ["hideObjectGlobal",0,true];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];

			sleep 1.5;

			_vehicle = _bomb; 
			_vel = velocity _vehicle;
			_speed = 185;
			playsound"toss";
			detach _bomb;
			_dir = direction _vehicle;
			_vehicle setVelocity [
			(_vel select 0) + (sin (_dir - 180) * _speed), 
			(_vel select 1) + (cos (_dir - 180) * _speed),
			(_vel select 2)
			];
			No_item = true;
			hint parseText "<t>Kitchen Sink Status:  </t><t color='#ff0000'>Launched</t>";
			sleep 2.5;
			deleteVehicle _sink;
			deleteVehicle _smoke_1;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_R, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyRKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Kitchen Sink Status: </t><t color='#eef441'>Launching Backwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;
			_bomb_2 = "Bomb_03_F" createvehicle position Powerup_Spawn;
			_sink = "CUP_sink" createvehicle position Powerup_Spawn;

			_smoke_1 = "SmokeShellYellow" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_sink, [0,0,0]];

			_bomb attachTo [vehicle player, [1,1,0.05]];
			_bomb_2 attachTo [_sink, [0,0.5,0]];
			_sink attachTo [_bomb, [0,0.5,0]];
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			[_bomb_2, true] remoteExec ["hideObjectGlobal",0,true];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];

			sleep 1.5;

			_vehicle = _bomb; 
			_vel = velocity _vehicle;
			_speed = 185;
			playsound"toss";
			detach _bomb;
			_dir = direction _vehicle;
			_vehicle setVelocity [
			(_vel select 0) + (sin (_dir - 180) * _speed), 
			(_vel select 1) + (cos (_dir - 180) * _speed),
			(_vel select 2)
			];
			No_item = true;
			hint parseText "<t>Kitchen Sink Status:  </t><t color='#ff0000'>Launched</t>";
			sleep 2.5;
			deleteVehicle _sink;
			deleteVehicle _smoke_1;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_R, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;


[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#e68f0e'>Kitchen Sink acquired!</t><br/><br/><t>Kitchen Sink Status:  </t><t color='#45f442'>Ready To Launch</t><br/><br/><t>The Kitchen Sink powerup spawns a kitchen sink that is launched to the front/back of your kart.</t><br/><br/><t>[Default Forward Keybind: F]</t><br/><t>[Default Backward Keybind: R]</t>";
		uiSleep 1.5;
	};
};
playsound"hint";