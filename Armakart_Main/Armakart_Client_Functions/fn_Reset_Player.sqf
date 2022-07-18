//Creates vehicle for player, if the idiot got out
if (isNull objectParent player) then
{
	_veh = createVehicle [Kart_Classname, getPosASL player, [], 0, "NONE"];

	uiSleep 0.1;

	player moveInDriver _veh;

};

vehicle player setDamage 0;
player allowDamage false;
vehicle player allowDamage false;

//Gets players checkpoint
CP_str = 'CP_obj = CP_' + (str Current_Checkpoint);

[] call compile CP_str;

//have to remoteExec for doubles
[vehicle player, (getDir CP_obj)] remoteExec ['setDir', vehicle player, true];
[vehicle player, (surfaceNormal position vehicle player)] remoteExec ['setVectorUp', vehicle player, true];

//Teleports players in a randomly select position in a circle around the CP, as well as faces them the direction the CP is facing
vehicle player setPosASL ((getPosASL CP_obj) vectorAdd ([[(Reset_Diameter * 0.5),0,Reset_Height], random 360] call BIS_fnc_rotateVector2D));

uiNamespace getVariable "NJP_Block_Keys";
uiNamespace getVariable "NJP_Block_Keys_EH";

if (uiNamespace getVariable "NJP_Block_Keys" isEqualTo 1) then {

	uiNamespace setVariable ["NJP_Block_Keys", 0];

	systemChat "|Armakart System| : Movement input will be re-enabled in a couple seconds from reset!";

	uiSleep 2;
			
	([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", (uiNamespace getVariable "NJP_Block_Keys_EH")];
	uiNamespace setVariable ["NJP_Block_Keys_EH", nil];

	if (!isNil "Lightning_Particle_Effect") then {

		deleteVehicle Lightning_Particle_Effect;
					
	};

	[vehicle player,1] remoteexec ['setfuel', vehicle player, true];

	systemChat "|Armakart System| : Movement input re-enabled from reset!";

};