// Exit if spectator
if (hasInterface && (typeOf player isEqualTo "potato_spectate_spectator" || typeOf player isEqualTo "ace_spectator_virtual")) exitWith {  // Check if player, even a host

	Player_Finished = true;
	UI_Color = [0.133,0.349,0.522,0.65];
	UI_Color_int = [0,11] call BIS_fnc_randomInt;

	systemChat "|Armakart System| : Spectator Client initialization completed!";

};

//Sets up local variables
Current_Laps = 1;
initial_Lap = true;
Current_Checkpoint = 1;
Sub_CP_obj = FINISH_LINE;
No_item = true;
UI_Color_int = [0,11] call BIS_fnc_randomInt;
UI_Color = [0.133,0.349,0.522,0.65];
Next_Sub_CP_Num = 0;
Loc_Array = [0, 0, 0, 0];
Player_Finished = false;
Current_Place = "N/A";
Lightning_Particle_Effect = false;

uiNamespace setVariable ["NJP_Block_Keys", 0];
uiNamespace setVariable ["NJP_Block_Keys_EH", nil];

//Sets player vic fuel to 0
vehicle player setFuel 0;
			
//Makes player/player vic invincible
player allowDamage false;
vehicle player allowDamage false;

// NAMETAGS
WHA_NAMETAGS_TESTLOOP = [{{WHA_NAMETAGS_PLAYER reveal [_x,4]} forEach allUnits;}, 10, []] call CBA_fnc_addPerFrameHandler;

//Sets group name for spectator boys
group player setGroupIdGlobal [name player];

//Player markers for GPS
[] spawn NJP_Client_fnc_Player_Markers;
openGPS true; // Opens GPS by default - Added 12JULY2022

//Sets players initial character
["Farmer"] call NJP_Client_fnc_Character_Swap;

systemChat "|Armakart System| : Client initialization completed!";

call NJP_Client_fnc_JIP_Check;