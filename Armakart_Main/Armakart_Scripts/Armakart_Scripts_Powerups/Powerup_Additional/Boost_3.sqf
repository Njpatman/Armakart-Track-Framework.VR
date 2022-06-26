/*
	Author: Njpatman

	Description:
		Boost powerup, gives players a speed boost
*/

uiSleep 0.2;
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Boost 3 Status:  </t><t color='#eef441'>Boosting...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Kart = vehicle player;
			_vel = velocity _Kart;
			_dir = direction _Kart;
			_speed = 18;
			playsound"turbo";
			[_Kart, [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				(_vel select 2)
			]] remoteexec ["setVelocity", _Kart];

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Boost 3 Status:  </t><t color='#ff0000'>Boost Complete</t>";
		No_item = true;
		playsound"hint";
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Boost 3 Status:  </t><t color='#eef441'>Boosting...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Kart = vehicle player;
			_vel = velocity _Kart;
			_dir = direction _Kart;
			_speed = 18;
			playsound"turbo";
			[_Kart, [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				(_vel select 2)
			]] remoteexec ["setVelocity", _Kart];

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Boost 3 Status:  </t><t color='#ff0000'>Boost Complete</t>";
		No_item = true;
		playsound"hint";
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
			hintsilent parseText "<t>Boost 3 Status:  </t><t color='#45f442'>Ready To Boost</t>";
			uiSleep 0.05;
	};
};
playsound"hint";

