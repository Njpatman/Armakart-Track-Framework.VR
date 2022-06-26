/*
	Author: Njpatman

	Description:
		Fus-Ro-Dah powerup, adds a trigger in front of the player and LAUNCHES whomever is in the trigger
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Fus-Ro-Dah Status:  </t><t color='#eef441'>Fus-Ro-Dahing...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Mark = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "NONE"];
			[_Mark, true] remoteExec ["hideObjectGlobal",0,true];
			_Scream_obj = createVehicle ["Land_Battery_F", [0,0,0], [], 0, "CAN_COLLIDE"];
			_Scream_obj attachTo [vehicle player, [0,0,0.35]];
			_Scream_obj setMass 4;
			playSound "FusRoDah";
			[player,["FusRoDah",65]] remoteExec ["say3d"];
			uiSleep 0.4;
			detach _Scream_obj;
			_Mark attachTo [vehicle player, [0, 15, 0]];
			[_Scream_obj, player] remoteexeccall ["NJP_Powerup_Effect_Fnc_FusRoDah_Effect", 0];
			_trgSpc = createTrigger ["EmptyDetector", getPosATL player];
			[_trgSpc, [3.2, 13.2, (getDir player), true, 6]] remoteExec ["setTriggerArea", 0, true];
			_trgSpc attachTo [_Mark, [0, 0, 0]];
			[_trgSpc, ["WEST", "PRESENT", false]] remoteExec ["setTriggerActivation", 0, true];
			[_trgSpc, ["vehicle player in thislist", 
			"
				_vehicle = vehicle player;
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = 225;
				_vehicle setVelocity [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				100
				];
				playSound 'FusRoDah';
			
			", ""]
			] remoteExec ["setTriggerStatements", 0, true];
			uiSleep 0.8;
			deleteVehicle _trgSpc;
			deleteVehicle _Mark;
			deleteVehicle _Scream_obj;

		////////////////////////////////////////////////////////////////////////////////////////////////
		No_item = true;
		hint parseText "<t>Fus-Ro-Dah Status:  </t><t color='#ff0000'>Fus-Ro-Dah Complete</t>";
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Fus-Ro-Dah Status:  </t><t color='#eef441'>Fus-Ro-Dahing...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Mark = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "NONE"];
			[_Mark, true] remoteExec ["hideObjectGlobal",0,true];
			_Scream_obj = createVehicle ["Land_Battery_F", [0,0,0], [], 0, "CAN_COLLIDE"];
			_Scream_obj attachTo [vehicle player, [0,0,0.35]];
			_Scream_obj setMass 4;
			playSound "FusRoDah";
			[player,["FusRoDah",65]] remoteExec ["say3d"];
			uiSleep 0.4;
			detach _Scream_obj;
			_Mark attachTo [vehicle player, [0, 15, 0]];
			[_Scream_obj, player] remoteexeccall ["NJP_Powerup_Effect_Fnc_FusRoDah_Effect", 0];
			_trgSpc = createTrigger ["EmptyDetector", getPosATL player];
			[_trgSpc, [1.2, 12, (getDir player), true, 6]] remoteExec ["setTriggerArea", 0, true];
			_trgSpc attachTo [_Mark, [0, 0, 0]];
			[_trgSpc, ["WEST", "PRESENT", false]] remoteExec ["setTriggerActivation", 0, true];
			[_trgSpc, ["vehicle player in thislist", 
			"
				_vehicle = vehicle player;
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = 225;
				_vehicle setVelocity [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				100
				];
				playSound 'FusRoDah';
			
			", ""]
			] remoteExec ["setTriggerStatements", 0, true];
			uiSleep 0.8;
			deleteVehicle _trgSpc;
			deleteVehicle _Mark;
			deleteVehicle _Scream_obj;

		////////////////////////////////////////////////////////////////////////////////////////////////
		No_item = true;
		hint parseText "<t>Fus-Ro-Dah Status:  </t><t color='#ff0000'>Fus-Ro-Dah Complete</t>";
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#11aed9'>Fus-Roh-Dah acquired!</t><br/><br/><t>Fus-Ro-Dah Status:  </t><t color='#45f442'>Ready To Fus-Ro-Dah</t><br/><br/><t>Fus-Ro-Dah LAUNCHES any player unlucky enough to be in front of your kart, keep in mind that there is a safe space of about a meter in front of your kart where someone may not be launched</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 1.5;
	};
};
playsound"hint";