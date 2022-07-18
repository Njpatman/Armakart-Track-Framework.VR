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

			Places_Live sort false;
			_First_Boi_local_array_num = Places_Live findIf {(_x select 5) isEqualTo 1};
			_First_Boi_local_array = Places_Live select _First_Boi_local_array_num;

			if (isNil "_First_Boi_local_array") then { _First_Boi_local_array = Places_Live select 0; };

			_First_Boi = _First_Boi_local_array select 4;
			_First_Boi_Vic = vehicle _First_Boi;

			if (isNil "_First_Boi_Vic" || (_First_Boi_local_array select 0) isEqualTo 999) exitWith {

				hint parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>First place has already finished, as such Blue Shell is unable to lock what doesn't exist.</t>";

				No_item = true;
				
			};

			_First_Boi_Vic_Check_Obj = lineIntersectsSurfaces 
			[
				[(getPosASL _First_Boi_Vic select 0), (getPosASL _First_Boi_Vic select 1), (getPosASL _First_Boi_Vic select 2) + 5], 
				[(getPosASL _First_Boi_Vic select 0), (getPosASL _First_Boi_Vic select 1), (getPosASL _First_Boi_Vic select 2) + 500], 
				objNull, 
				objNull, 
				true, 
				1, 
				"GEOM", 
				"PHYSX"
			];

			if (_First_Boi_Vic_Check_Obj isEqualTo []) exitWith {

				_First_Boi_Vic_pos_x = getPosASL _First_Boi_Vic select 0;
				_First_Boi_Vic_pos_y = getPosASL _First_Boi_Vic select 1;
				_First_Boi_Vic_pos_z = getPosASL _First_Boi_Vic select 2;
				_First_Boi_Vic_pos_z = _First_Boi_Vic_pos_z + 485;

				_Speed = 100;

				_x_pos = random 2;
				_y_pos = random 2;

				[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

				uiSleep 0.35;

				_x_pos = random 2;
				_y_pos = random 2;

				[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

				[format ["|Armakart System| : A Blue Shell has been launched by %1 against %2!", name player, name _First_Boi]] remoteExec ["systemChat", 0];

				No_item = true;

				hint parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>Blue Shell Launched!</t>";
				
			};

			_First_Boi_Vic_Check_Obj_Intersect_Array = _First_Boi_Vic_Check_Obj select 0;
			_First_Boi_Vic_Check_Obj_Intersect = _First_Boi_Vic_Check_Obj_Intersect_Array select 0;

			_First_Boi_Vic_pos_x = _First_Boi_Vic_Check_Obj_Intersect select 0;
			_First_Boi_Vic_pos_y = _First_Boi_Vic_Check_Obj_Intersect select 1;
			_First_Boi_Vic_pos_z = _First_Boi_Vic_Check_Obj_Intersect select 2;
			_First_Boi_Vic_pos_z = _First_Boi_Vic_pos_z - 6.5;

			_Speed = 65;		

			_x_pos = random 2;
			_y_pos = random 2;

			[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

			uiSleep 0.35;

			_x_pos = random 2;
			_y_pos = random 2;

			[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

			[format ["|Armakart System| : A Blue Shell has been launched by %1 against %2!", name player, name _First_Boi]] remoteExec ["systemChat", 0];

			No_item = true;

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

			Places_Live sort false;
			_First_Boi_local_array_num = Places_Live findIf {(_x select 5) isEqualTo 1};
			_First_Boi_local_array = Places_Live select _First_Boi_local_array_num;

			if (isNil "_First_Boi_local_array") then { _First_Boi_local_array = Places_Live select 0; };

			_First_Boi = _First_Boi_local_array select 4;
			_First_Boi_Vic = vehicle _First_Boi;

			if (isNil "_First_Boi_Vic" || (_First_Boi_local_array select 0) isEqualTo 999) exitWith {

				hint parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>First place has already finished, as such Blue Shell is unable to lock what doesn't exist.</t>";

				No_item = true;
				
			};

			_First_Boi_Vic_Check_Obj = lineIntersectsSurfaces 
			[
				[(getPosASL _First_Boi_Vic select 0), (getPosASL _First_Boi_Vic select 1), (getPosASL _First_Boi_Vic select 2) + 5], 
				[(getPosASL _First_Boi_Vic select 0), (getPosASL _First_Boi_Vic select 1), (getPosASL _First_Boi_Vic select 2) + 500], 
				objNull, 
				objNull, 
				true, 
				1, 
				"GEOM", 
				"PHYSX"
			];

			if (_First_Boi_Vic_Check_Obj isEqualTo []) exitWith {

				_First_Boi_Vic_pos_x = getPosASL _First_Boi_Vic select 0;
				_First_Boi_Vic_pos_y = getPosASL _First_Boi_Vic select 1;
				_First_Boi_Vic_pos_z = getPosASL _First_Boi_Vic select 2;
				_First_Boi_Vic_pos_z = _First_Boi_Vic_pos_z + 485;

				_Speed = 100;

				_x_pos = random 2;
				_y_pos = random 2;

				[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

				uiSleep 0.35;

				_x_pos = random 2;
				_y_pos = random 2;

				[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

				[format ["|Armakart System| : A Blue Shell has been launched by %1 against %2!", name player, name _First_Boi]] remoteExec ["systemChat", 0];

				No_item = true;

				hint parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>Blue Shell Launched!</t>";
				
			};

			_First_Boi_Vic_Check_Obj_Intersect_Array = _First_Boi_Vic_Check_Obj select 0;
			_First_Boi_Vic_Check_Obj_Intersect = _First_Boi_Vic_Check_Obj_Intersect_Array select 0;

			_First_Boi_Vic_pos_x = _First_Boi_Vic_Check_Obj_Intersect select 0;
			_First_Boi_Vic_pos_y = _First_Boi_Vic_Check_Obj_Intersect select 1;
			_First_Boi_Vic_pos_z = _First_Boi_Vic_Check_Obj_Intersect select 2;
			_First_Boi_Vic_pos_z = _First_Boi_Vic_pos_z - 6.5;

			_Speed = 65;		

			_x_pos = random 2;
			_y_pos = random 2;

			[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

			uiSleep 0.35;

			_x_pos = random 2;
			_y_pos = random 2;

			[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

			[format ["|Armakart System| : A Blue Shell has been launched by %1 against %2!", name player, name _First_Boi]] remoteExec ["systemChat", 0];

			No_item = true;

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>Blue Shell Launched!</t>";
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