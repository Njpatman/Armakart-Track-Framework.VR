/*
	Author: Njpatman

	Description:
		Blue Shell powerup, meant to fuck up first place boi
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Blue Shell Status:  </t><t color='#eef441'>Launching...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_First_Boi_local_array = Places_Live select 0;
			_Is_First_Boi_Fin = _First_Boi_local_array select 0;

			if (_Is_First_Boi_Fin isEqualTo 999) exitWith {

				hint parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>Person in first place has already finished, as such Blue Shell is unable to lock what doesn't exist.</t>";

				No_item = true;
				
			};

			_First_Boi = _First_Boi_local_array select 4;
			_First_Boi_vic = vehicle _First_Boi;
			_First_Boi_vic_pos_x = getPosASL _First_Boi_vic select 0;
			_First_Boi_vic_pos_y = getPosASL _First_Boi_vic select 1;
			_First_Boi_vic_pos_z = getPosASL _First_Boi_vic select 2;
			_First_Boi_vic_pos_z = _First_Boi_vic_pos_z + 485;

			_x_pos = random 2;
			_y_pos = random 4;

			[[_First_Boi_vic_pos_x,_First_Boi_vic_pos_y,_First_Boi_vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_vic, 50, false, [_x_pos,_y_pos,2]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

			[format ["|Armakart System| : A Blue Shell has been launched by %1!", name player]] remoteExec ["systemChat", 0];

			

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>Blue Shell Launched!</t>";
		No_item = true;
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Blue Shell Status:  </t><t color='#eef441'>Launching...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_First_Boi_local_array = Places_Live select 0;
			_Is_First_Boi_Fin = _First_Boi_local_array select 0;

			if (_Is_First_Boi_Fin isEqualTo 999) exitWith {

				hint parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>Person in first place has already finished, as such Blue Shell is unable to lock what doesn't exist.</t>";

				No_item = true;
				
			};

			_First_Boi = _First_Boi_local_array select 4;
			_First_Boi_vic = vehicle _First_Boi;
			_First_Boi_vic_pos_x = getPosASL _First_Boi_vic select 0;
			_First_Boi_vic_pos_y = getPosASL _First_Boi_vic select 1;
			_First_Boi_vic_pos_z = getPosASL _First_Boi_vic select 2;
			_First_Boi_vic_pos_z = _First_Boi_vic_pos_z + 485;

			_x_pos = random 2;
			_y_pos = random 4;

			[[_First_Boi_vic_pos_x,_First_Boi_vic_pos_y,_First_Boi_vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_vic, 50, false, [_x_pos,_y_pos,2]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

			[format ["|Armakart System| : A Blue Shell has been launched by %1!", name player]] remoteExec ["systemChat", 0];

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>Blue Shell Launched!</t>";
		No_item = true;
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#69f0ff'>Blue Shell acquired!</t><br/><br/><t>Blue Shell Status:  </t><t color='#45f442'>Ready To Fuck Over The First Place Boi</t><br/><br/><t>The Blue Shell powerup will hit the person in first place with a orbital cruise missile strike.</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 1.5;
	};
};

playsound"hint";