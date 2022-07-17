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
		hintsilent parseText "<t>Miller Lite Status:  </t><t color='#eef441'>Miller Lite Tracking Forwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Miller_group = createGroup CIVILIAN;
			_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
			_Miller_Lite = _Miller_group createUnit ["B_CTRG_Miller_F", position Powerup_Spawn, [], 0, "FORM"];
			[_Miller_Lite, "TransAnimBase"] remoteExec ["switchMove",0,true];
			[_Miller_Lite, false] remoteExec ["enableSimulationGlobal",0,true];

			_spark = "#particlesource" createVehicle (getPosASL _Miller_Lite);

			[_spark, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
			[_spark, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
			[_spark, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _Miller_Lite]] remoteExec ["setParticleParams",0,true];
			[_spark, 0.005] remoteExec ["setDropInterval",0,true];

			_Miller_Lite_Look_Obj = "Sign_Sphere10cm_F" createvehicle position Powerup_Spawn;
			_Miller_Lite_Look_Obj attachTo [vehicle player, [0,55,0.1]];
			[_Miller_Lite_Look_Obj, true] remoteExec ["hideObjectGlobal",0,true];

			_bomb attachTo [vehicle player, [1,1,0]];
			_Miller_Lite attachTo [_bomb, [0,0,0]];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
			_Dir = getdir vehicle player;
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			[_Miller_Lite, 0.45] remoteExec ["setObjectScale",0,true];

			uiSleep 2;
			_Search_Array = nearestObjects [getPos _Miller_Lite_Look_Obj, ["Car", "Truck"], 50];
			_kart = _Search_Array select 0;
			uiSleep 0.1;
			No_item = true;
			hint parseText "<t>Miller Lite Status:  </t><t color='#ff0000'>Miller Lite Launched!</t>";

			if (_Search_Array isEqualTo []) then {
				_vehicle = _bomb; 
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = 200;
				playsound"toss";
				detach _bomb;
				_vehicle setVelocity [
					(_vel select 0) + (sin _dir * _speed), 
					(_vel select 1) + (cos _dir * _speed), 
					(_vel select 2)
				];
			} else {
				_vel = velocity _bomb;
				_speed = 200;
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
			uiSleep 1.25;

			deleteVehicle _Miller_Lite_Look_Obj;

			_Search_Array = nearestObjects [getPos _Miller_Lite, ["Car", "Truck"], 20];

			if (_Search_Array isEqualTo []) exitWith {
				
				hint parseText "<t>Miller Lite Lightning Status:  </t><t color='#ff0000'>Zaps Stopped, No Karts Were Found In Range Of Miller Lite!</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			{
				_Kart = _x;

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
						
							_NJP_Block_Keys_Fnc = ([] call BIS_fnc_displayMission) displayAddEventHandler ["KeyDown","_this call NJP_Client_Fnc_Block_Key_Input"];
							uiNamespace setVariable ["NJP_Block_Keys_EH", _NJP_Block_Keys_Fnc];
							uiNamespace setVariable ["NJP_Block_Keys", 1];

							Lightning_Particle_Effect = "#particlesource" createVehicle (getPosASL vehicle player);

							[Lightning_Particle_Effect, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
							[Lightning_Particle_Effect, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
							[Lightning_Particle_Effect, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", vehicle player]] remoteExec ["setParticleParams",0,true];
							[Lightning_Particle_Effect, 0.005] remoteExec ["setDropInterval",0,true];

							systemChat "|Armakart Powerups| : Movement input disabled from lightning!";

						};

						uiSleep 5;

						[vehicle player,1] remoteexec ['setfuel', vehicle player];

						uiNamespace getVariable "NJP_Block_Keys";
						uiNamespace getVariable "NJP_Block_Keys_EH";

						if (uiNamespace getVariable "NJP_Block_Keys" isEqualTo 1) then {
						
							([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", (uiNamespace getVariable "NJP_Block_Keys_EH")];
							uiNamespace setVariable ["NJP_Block_Keys_EH", nil];
							uiNamespace setVariable ["NJP_Block_Keys", 0];

							if (!isNil "Lightning_Particle_Effect") then {

								deleteVehicle Lightning_Particle_Effect;
								
							};

							systemChat "|Armakart Powerups| : Movement input re-enabled!";

						};
						
					
					}] remoteExec ["Spawn", _kart];

					deleteVehicle _Zap;

				};

			} forEach _Search_Array;

			hint parseText "<t>Miller Lite Lightning Status:  </t><t color='#ff0000'>Zaps Complete!</t>";
			No_item = true;

			"Crosshair_Layer" cutFadeOut 0.001;
		
			deleteVehicle _Miller_Lite;
			deleteVehicle _spark;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Miller Lite Status:  </t><t color='#eef441'>Miller Lite Tracking Forwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Miller_group = createGroup CIVILIAN;
			_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
			_Miller_Lite = _Miller_group createUnit ["B_CTRG_Miller_F", position Powerup_Spawn, [], 0, "FORM"];
			[_Miller_Lite, "TransAnimBase"] remoteExec ["switchMove",0,true];
			[_Miller_Lite, false] remoteExec ["enableSimulationGlobal",0,true];

			_spark = "#particlesource" createVehicle (getPosASL _Miller_Lite);

			[_spark, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
			[_spark, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
			[_spark, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _Miller_Lite]] remoteExec ["setParticleParams",0,true];
			[_spark, 0.005] remoteExec ["setDropInterval",0,true];

			_Miller_Lite_Look_Obj = "Sign_Sphere10cm_F" createvehicle position Powerup_Spawn;
			_Miller_Lite_Look_Obj attachTo [vehicle player, [0,55,0.1]];
			[_Miller_Lite_Look_Obj, true] remoteExec ["hideObjectGlobal",0,true];

			_bomb attachTo [vehicle player, [1,1,0]];
			_Miller_Lite attachTo [_bomb, [0,0,0]];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
			_Dir = getdir vehicle player;
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			[_Miller_Lite, 0.45] remoteExec ["setObjectScale",0,true];

			uiSleep 2;
			_Search_Array = nearestObjects [getPos _Miller_Lite_Look_Obj, ["Car", "Truck"], 50];
			_kart = _Search_Array select 0;
			uiSleep 0.1;
			No_item = true;
			hint parseText "<t>Miller Lite Status:  </t><t color='#ff0000'>Miller Lite Launched!</t>";

			if (_Search_Array isEqualTo []) then {
				_vehicle = _bomb; 
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = 200;
				playsound"toss";
				detach _bomb;
				_vehicle setVelocity [
					(_vel select 0) + (sin _dir * _speed), 
					(_vel select 1) + (cos _dir * _speed), 
					(_vel select 2)
				];
			} else {
				_vel = velocity _bomb;
				_speed = 200;
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
			uiSleep 1.25;

			deleteVehicle _Miller_Lite_Look_Obj;

			_Search_Array = nearestObjects [getPos _Miller_Lite, ["Car", "Truck"], 20];

			if (_Search_Array isEqualTo []) exitWith {
				
				hint parseText "<t>Miller Lite Lightning Status:  </t><t color='#ff0000'>Zaps Stopped, No Karts Were Found In Range Of Miller Lite!</t>";

				No_item = true;

				"Crosshair_Layer" cutFadeOut 0.001;
				
			};

			{
				_Kart = _x;

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
						
							_NJP_Block_Keys_Fnc = ([] call BIS_fnc_displayMission) displayAddEventHandler ["KeyDown","_this call NJP_Client_Fnc_Block_Key_Input"];
							uiNamespace setVariable ["NJP_Block_Keys_EH", _NJP_Block_Keys_Fnc];
							uiNamespace setVariable ["NJP_Block_Keys", 1];

							Lightning_Particle_Effect = "#particlesource" createVehicle (getPosASL vehicle player);

							[Lightning_Particle_Effect, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
							[Lightning_Particle_Effect, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
							[Lightning_Particle_Effect, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", vehicle player]] remoteExec ["setParticleParams",0,true];
							[Lightning_Particle_Effect, 0.005] remoteExec ["setDropInterval",0,true];

							systemChat "|Armakart Powerups| : Movement input disabled from lightning!";

						};

						uiSleep 5;

						[vehicle player,1] remoteexec ['setfuel', vehicle player];

						uiNamespace getVariable "NJP_Block_Keys";
						uiNamespace getVariable "NJP_Block_Keys_EH";

						if (uiNamespace getVariable "NJP_Block_Keys" isEqualTo 1) then {
						
							([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", (uiNamespace getVariable "NJP_Block_Keys_EH")];
							uiNamespace setVariable ["NJP_Block_Keys_EH", nil];
							uiNamespace setVariable ["NJP_Block_Keys", 0];

							if (!isNil "Lightning_Particle_Effect") then {

								deleteVehicle Lightning_Particle_Effect;
								
							};

							systemChat "|Armakart Powerups| : Movement input re-enabled!";

						};
						
					
					}] remoteExec ["Spawn", _kart];

					deleteVehicle _Zap;

				};

			} forEach _Search_Array;

			hint parseText "<t>Miller Lite Lightning Status:  </t><t color='#ff0000'>Zaps Complete!</t>";
			No_item = true;

			"Crosshair_Layer" cutFadeOut 0.001;
		
			deleteVehicle _Miller_Lite;
			deleteVehicle _spark;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;


[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#25910d'>Miller Lite acquired!</t><br/><br/><t>Miller Status:  </t><t color='#45f442'>Ready To Lite Some Miller</t><br/><br/><t>Miller Lite will fire forwards toward anyone within a 50m cone forwards of the player kart, and triggers a lighting strike at any players near his landing location; Miller Lite will NOT stop at one person but will zap any players in a 25m circle around his landing location.</t><br/><br/><t>[Default Forward Keybind: F]</t>";
		uiSleep 1.5;
	};
};
playsound"hint";