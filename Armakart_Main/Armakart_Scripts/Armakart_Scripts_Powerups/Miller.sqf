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
		hintsilent parseText "<t>Miller Status:  </t><t color='#eef441'>Miller Tracking Forwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_group = createGroup CIVILIAN;
			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			_Miller = _group createUnit ["B_CTRG_Miller_F", position Powerup_Spawn, [], 0, "FORM"];

			_smoke_1 = "SmokeShellGreen" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_Miller, [0,0,0]];

			_Miller_Look_Obj = "Sign_Sphere10cm_F" createvehicle position Powerup_Spawn;
			_Miller_Look_Obj attachTo [vehicle player, [0,55,0.1]];
			[_Miller_Look_Obj, true] remoteExec ["hideObjectGlobal",0,true];

			[_Miller, "TransAnimBase"] remoteExec ["switchMove",0,true];
			_bomb attachTo [vehicle player, [1,1,0]];
			_Miller attachTo [_bomb, [0,-0.5,0]];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
			_Dir = getdir vehicle player;

			uiSleep 2;
			_Search_Array = nearestObjects [getPos _Miller_Look_Obj, ["Car", "Truck"], 50];
			_kart = _Search_Array select 0;
			uiSleep 0.1;
			No_item = true;
			hint parseText "<t>Miller Status:  </t><t color='#ff0000'>Miller Launched!</t>";

			if (_Search_Array isEqualTo []) then {
				_vehicle = _bomb; 
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = 175;
				playsound"toss";
				detach _bomb;
				_vehicle setVelocity [
					(_vel select 0) + (sin _dir * _speed), 
					(_vel select 1) + (cos _dir * _speed), 
					(_vel select 2)
				];
			} else {
				_vel = velocity _bomb;
				_speed = 175;
				playsound"toss";
				detach _bomb;
				_dir_target = [_bomb, _kart] call BIS_fnc_dirTo;
				_bomb setDir _dir_target;
				_bomb setVelocity [
					(_vel select 0) + (sin _dir_target * _speed), 
					(_vel select 1) + (cos _dir_target * _speed),
					(_vel select 2)
				];
			};
			uiSleep 1.2;
			[1] remoteExec ["BIS_fnc_earthquake",0,true];
			deleteVehicle _Miller;
			deleteVehicle _Miller_Look_Obj;

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
		hintsilent parseText "<t>Miller Status:  </t><t color='#eef441'>Miller Tracking Forwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_group = createGroup CIVILIAN;
			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			_Miller = _group createUnit ["B_CTRG_Miller_F", position Powerup_Spawn, [], 0, "FORM"];

			_smoke_1 = "SmokeShellGreen" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_Miller, [0,0,0]];

			_Miller_Look_Obj = "Sign_Sphere10cm_F" createvehicle position Powerup_Spawn;
			_Miller_Look_Obj attachTo [vehicle player, [0,55,0.1]];
			[_Miller_Look_Obj, true] remoteExec ["hideObjectGlobal",0,true];

			[_Miller, "TransAnimBase"] remoteExec ["switchMove",0,true];
			_bomb attachTo [vehicle player, [1,1,0]];
			_Miller attachTo [_bomb, [0,-0.5,0]];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
			_Dir = getdir vehicle player;

			uiSleep 2;
			_Search_Array = nearestObjects [getPos _Miller_Look_Obj, ["Car", "Truck"], 50];
			_kart = _Search_Array select 0;
			uiSleep 0.1;
			No_item = true;
			hint parseText "<t>Miller Status:  </t><t color='#ff0000'>Miller Launched!</t>";

			if (_Search_Array isEqualTo []) then {
				_vehicle = _bomb; 
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = 175;
				playsound"toss";
				detach _bomb;
				_vehicle setVelocity [
					(_vel select 0) + (sin _dir * _speed), 
					(_vel select 1) + (cos _dir * _speed), 
					(_vel select 2)
				];
			} else {
				_vel = velocity _bomb;
				_speed = 175;
				playsound"toss";
				detach _bomb;
				_dir_target = [_bomb, _kart] call BIS_fnc_dirTo;
				_bomb setDir _dir_target;
				_bomb setVelocity [
					(_vel select 0) + (sin _dir_target * _speed), 
					(_vel select 1) + (cos _dir_target * _speed),
					(_vel select 2)
				];
			};
			uiSleep 1.2;
			[1] remoteExec ["BIS_fnc_earthquake",0,true];
			deleteVehicle _Miller;
			deleteVehicle _Miller_Look_Obj;
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
		hintsilent parseText "<t>Miller Status:  </t><t color='#eef441'>Miller Tracking Backwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_group = createGroup CIVILIAN;
			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			_Miller = _group createUnit ["B_CTRG_Miller_F", position Powerup_Spawn, [], 0, "FORM"];

			_smoke_1 = "SmokeShellGreen" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_Miller, [0,0,0]];

			_Miller_Look_Obj = "Sign_Sphere10cm_F" createvehicle position Powerup_Spawn;
			_Miller_Look_Obj attachTo [vehicle player, [0,-55,0.1]];
			[_Miller_Look_Obj, true] remoteExec ["hideObjectGlobal",0,true];

			[_Miller, "TransAnimBase"] remoteExec ["switchMove",0,true];
			_bomb attachTo [vehicle player, [1,1,0]];
			_Miller attachTo [_bomb, [0,-0.5,0]];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
			_Dir = getdir vehicle player;

			uiSleep 2;
			_Search_Array = nearestObjects [getPos _Miller_Look_Obj, ["Car", "Truck"], 50];
			_kart = _Search_Array select 0;
			uiSleep 0.1;
			No_item = true;
			hint parseText "<t>Miller Status:  </t><t color='#ff0000'>Miller Launched!</t>";

			if (_Search_Array isEqualTo []) then {
				_vehicle = _bomb; 
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = 175;
				playsound"toss";
				detach _bomb;
				_vehicle setVelocity [
					(_vel select 0) + (sin (_dir - 180) * _speed), 
					(_vel select 1) + (cos (_dir - 180) * _speed), 
					(_vel select 2)
				];
			} else {
				_vel = velocity _bomb;
				_speed = 175;
				playsound"toss";
				detach _bomb;
				_dir_target = [_bomb, _kart] call BIS_fnc_dirTo;
				_bomb setDir _dir_target;
				_bomb setVelocity [
					(_vel select 0) + (sin _dir_target * _speed), 
					(_vel select 1) + (cos _dir_target * _speed),
					(_vel select 2)
				];
			};
			uiSleep 1.2;
			[1] remoteExec ["BIS_fnc_earthquake",0,true];
			deleteVehicle _Miller;
			deleteVehicle _Miller_Look_Obj;
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
		hintsilent parseText "<t>Miller Status:  </t><t color='#eef441'>Miller Tracking Backwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_group = createGroup CIVILIAN;
			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			_Miller = _group createUnit ["B_CTRG_Miller_F", position Powerup_Spawn, [], 0, "FORM"];

			_smoke_1 = "SmokeShellGreen" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_Miller, [0,0,0]];

			_Miller_Look_Obj = "Sign_Sphere10cm_F" createvehicle position Powerup_Spawn;
			_Miller_Look_Obj attachTo [vehicle player, [0,-55,0.1]];
			[_Miller_Look_Obj, true] remoteExec ["hideObjectGlobal",0,true];

			[_Miller, "TransAnimBase"] remoteExec ["switchMove",0,true];
			_bomb attachTo [vehicle player, [1,1,0]];
			_Miller attachTo [_bomb, [0,-0.5,0]];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
			_Dir = getdir vehicle player;

			uiSleep 2;
			_Search_Array = nearestObjects [getPos _Miller_Look_Obj, ["Car", "Truck"], 50];
			_kart = _Search_Array select 0;
			uiSleep 0.1;
			No_item = true;
			hint parseText "<t>Miller Status:  </t><t color='#ff0000'>Miller Launched!</t>";

			if (_Search_Array isEqualTo []) then {
				_vehicle = _bomb; 
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = 175;
				playsound"toss";
				detach _bomb;
				_vehicle setVelocity [
					(_vel select 0) + (sin (_dir - 180) * _speed), 
					(_vel select 1) + (cos (_dir - 180) * _speed), 
					(_vel select 2)
				];
			} else {
				_vel = velocity _bomb;
				_speed = 175;
				playsound"toss";
				detach _bomb;
				_dir_target = [_bomb, _kart] call BIS_fnc_dirTo;
				_bomb setDir _dir_target;
				_bomb setVelocity [
					(_vel select 0) + (sin _dir_target * _speed), 
					(_vel select 1) + (cos _dir_target * _speed),
					(_vel select 2)
				];
			};
			uiSleep 1.2;
			[1] remoteExec ["BIS_fnc_earthquake",0,true];
			deleteVehicle _Miller;
			deleteVehicle _Miller_Look_Obj;
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
		hintsilent parseText "<t color='#25910d'>Miller acquired!</t><br/><br/><t>Miller Status:  </t><t color='#45f442'>Ready To Miller</t><br/><br/><t>Miller will fire forwards/backwards toward anyone within a 50m cone forwards/backwards of the player kart, and triggers a small earthquake after he lands.</t><br/><br/><t>[Default Forward Keybind: F]</t><br/><t>[Default Backward Keybind: R]</t>";
		uiSleep 1.5;
	};
};
playsound"hint";