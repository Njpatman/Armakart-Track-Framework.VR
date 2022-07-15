/*
	Author: Njpatman

	Description:
		Banana powerup, Simply spawns a banana and attatches a trigger to it
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Tele Status:  </t><t color='#eef441'>Teleporting...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			if (Current_Checkpoint isEqualTo CP_NUM) exitwith {

				hint parseText "<t>Teleport Status:  </t><t color='#ff0000'>Unable To Teleport, Past Last Checkpoint</t>";
				No_item = true;

			};

			//Gets players next checkpoint
			Target_CP = Current_Checkpoint + 1;

			CP_Powerup_str = 'CP_Powerup_obj = CP_' + (str Target_CP);

			[] call compile CP_Powerup_str;

			_blur_sonic = "#particlesource" createVehicle (getPosATL vehicle player);
			_blur_sonic setParticleCircle [1, [0, 0, 2]];
			_blur_sonic setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_blur_sonic setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0], 12, 12, 6, 0.002, [7, 5, 1], [[1, 1, 1, 0.5], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", vehicle player];
			_blur_sonic setDropInterval 0.005;

			uiSleep 2.5;

			//Teleports players in a randomly select position in a circle around the CP, as well as faces them the direction the CP is facing
			vehicle player setPosASL ((getPosASL CP_Powerup_obj) vectorAdd ([[5,0,1], random 360] call BIS_fnc_rotateVector2D));

			//have to remoteExec for doubles
			[vehicle player, (getDir CP_Powerup_obj)] remoteexec ['setDir', vehicle player];
			[vehicle player, (surfaceNormal position vehicle player)] remoteexec ['setVectorUp', vehicle player];

			uiSleep 1.6;

			deleteVehicle _blur_sonic;

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Teleport Status:  </t><t color='#ff0000'>Teleport Complete</t>";
		playsound"hint";
		No_item = true;
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Teleport Status:  </t><t color='#eef441'>Teleporting...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////


			if (Current_Checkpoint isEqualTo CP_NUM) exitwith {

				hint parseText "<t>Teleport Status:  </t><t color='#ff0000'>Unable To Teleport, Past Last Checkpoint</t>";
				No_item = true;

			};

			//Gets players next checkpoint
			Target_CP = Current_Checkpoint + 1;

			CP_Powerup_str = 'CP_Powerup_obj = CP_' + (str Target_CP);

			[] call compile CP_Powerup_str;

			_blur_sonic = "#particlesource" createVehicle (getPosATL vehicle player);
			_blur_sonic setParticleCircle [1, [0, 0, 2]];
			_blur_sonic setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_blur_sonic setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0], 12, 12, 6, 0.002, [7, 5, 1], [[1, 1, 1, 0.5], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", vehicle player];
			_blur_sonic setDropInterval 0.005;

			uiSleep 2.5;

			//Teleports players in a randomly select position in a circle around the CP, as well as faces them the direction the CP is facing
			vehicle player setPosASL ((getPosASL CP_Powerup_obj) vectorAdd ([[5,0,1], random 360] call BIS_fnc_rotateVector2D));

			//have to remoteExec for doubles
			[vehicle player, (getDir CP_Powerup_obj)] remoteexec ['setDir', vehicle player];
			[vehicle player, (surfaceNormal position vehicle player)] remoteexec ['setVectorUp', vehicle player];

			uiSleep 1.6;

			deleteVehicle _blur_sonic;

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Teleport Status:  </t><t color='#ff0000'>Teleport Complete</t>";
		playsound"hint";
		No_item = true;
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#cd7f32'>Checkpoint Teleport acquired!</t><br/><br/><t>Teleport Status:  </t><t color='#45f442'>Ready To Teleport</t><br/><br/><t>Simply teleports you to your next checkpoint. NOTE that you CANNOT teleport when you're past the last checkpoint.</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 1.5;
	};
};
playsound"hint";

