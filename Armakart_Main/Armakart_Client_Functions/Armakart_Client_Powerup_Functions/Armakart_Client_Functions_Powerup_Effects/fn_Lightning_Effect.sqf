params ["_Attacker_Name"];

uiNamespace getVariable "NJP_Block_Keys";
uiNamespace getVariable "NJP_Block_Keys_EH";

if (uiNamespace getVariable "NJP_Block_Keys" isEqualTo 0) then {

	[_Attacker_Name, "Lightning"] call NJP_Client_Powerup_Additional_fnc_Tell_Victim_Attacker;

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