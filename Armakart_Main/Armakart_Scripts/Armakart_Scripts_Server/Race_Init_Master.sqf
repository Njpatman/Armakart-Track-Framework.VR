/* 
*
* - Initializes the race.
* 
*/

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Begun Race init & started Customization Phase.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

["Black_Screen_Layer", ["", "BLACK FADED", 150]] remoteExec ["cutText", 0, false];

[parseText "<t color='#c77518' size='1.15'>Armakart is initializing, keep in mind that you have to ACE self-interact to reset to your last checkpoint!</t>",-1,-1,99,0,0,800] remoteExec ["BIS_fnc_dynamicText", 0, false];

//Setsup "RACE_PHASE"
RACE_PHASE = "Customization_Phase";
publicVariable "RACE_PHASE";

//Adds global variable for music loop
ehID = addMusicEventHandler ["MusicStop", {music_isPlaying = false}];

waitUntil {time > 0};

//Initializes Checkpoints
_CP_Init = execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Checkpoints.sqf";

//Initializes Sub Checkpoints
_Sub_CP_Init = execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Sub_Checkpoints.sqf";

//Initializes Powerup Blocks
_Powerup_Block_Init = execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Powerup_Blocks.sqf";

waitUntil {scriptDone _Powerup_Block_Init && scriptDone _Sub_CP_Init && scriptDone _CP_Init};

"|Armakart System| : Armakart initialization completed, Starting Pre Race Phase..." remoteExec ["systemChat", 0, false];

if (!isNil "potato_safeStart_fnc_toggleSafeStart") then { [false] call potato_safeStart_fnc_toggleSafeStart; };

//- Handles the Customization Phase ACE Self Interact, and camera -\\

remoteExec ["NJP_Client_Fnc_Pre_Race_Phase", 0];

uiSleep 1.65;

//Starts Customization Phase music and loops it
[] Spawn
{

	while {!(RACE_PHASE isEqualTo "Race_Started")} do
	{

		music_isPlaying = true;
		"Customization_Phase" remoteExec ["playMusic", 0, true];
		waitUntil
		{
			uiSleep 5;

			not music_isPlaying
		};

	};
	
};

//- Handles the Customization Phase UI -\\

["Black_Screen_Layer", ["", "BLACK IN", 3]] remoteExec ["cutText", 0, true];

//Creates Customization Menu
["Customization_Timer_Layer", ["Customization_Timer_UI", "PLAIN"]] remoteExec ["cutRsc", 0, true];
["Customization_Menu"] remoteExec ["createDialog", 0];

["dynamicBlur",  true] remoteExec ["ppEffectEnable", 0, false];
["dynamicBlur",  [6]] remoteExec ["ppEffectAdjust", 0, false];
["dynamicBlur",  0] remoteExec ["ppEffectCommit", 0, false];    
["dynamicBlur",  [0.0]] remoteExec ["ppEffectAdjust", 0, false];
["dynamicBlur",  3] remoteExec ["ppEffectCommit", 0, false];

[800, ["", "PLAIN"]] remoteExec ["cutText", 0, true];

remoteExec ["NJP_Client_Fnc_UI_Color_Swap", 0];

//- Adds a timer to the players screen, which should give the time until the next phase or race start -\\

[( "Timer" call BIS_fnc_rscLayer ), ["Timer", "PLAIN"]] remoteExec ["cutRsc", 0];

_color = "#45f442";//green

//Default
_Time_left = 45;

_Customization_time_Left = Customization_Phase_Time + time;

while {_Time_left > 0} do {

	uiSleep 1;

	_Time_left = _Customization_time_Left - time;

	if (_Time_left < 31) then {_color = "#eef441";};//yellow

	if (_Time_left < 16) then {_color = "#ff0000";};//red

	[_color, _Time_left] remoteExec ["NJP_UPDATE_TIMER", 0, true];

};

//Removes Customization Menu Reset option
[[],{ [player, 1,["ACE_SelfActions","Reset_Menu"]] call ace_interact_menu_fnc_removeActionFromObject; }] remoteExec ["Spawn", 0, true];

//Closes Customization Menu
[1234] remoteExec ["closeDialog", 0, true];

if (Voting_Phase_Enabled isEqualTo 1) then { call NJP_Server_Voting_Phase; } else {
	
    ["Customization_Timer_Layer", 0.001] remoteExec ["cutFadeOut", 0, true];

	//Remove timer display
  	[( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0, true];

    diag_log "//----------------------------------------------------------------------------\\";
    diag_log "|Armakart System| : Completed Customization Phase & skipped Voting phase.";
    diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
	diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
	diag_log "\\----------------------------------------------------------------------------//";

};

//One-off Clean up Script to make the intro look nice
call NJP_CLEAN_UP;

//- Sets plaver vic fuel to 0
[[],{ [vehicle player, 0] remoteExec ['setfuel', vehicle player]; }] remoteExec ["Spawn", 0, false];

//Do title
_author = getMissionConfigValue ["Author", 0];
_ATF_Version = getText (missionConfigFile >> "ATF_Version");

[
	[
		[Track_Title,"<t align = 'center' shadow = '1' size = '1.5' font = 'PuristaBold' >%1</t><br/>",12],
		["By: " + _author,"<t align = 'center' shadow = '1' size = '1.2'>%1</t><br/>",12],
		[_ATF_Version,"<t align = 'center' shadow = '1' size = '1'>%1</t><br/>",32]
	] , 1, 0.8
] remoteExec ["BIS_fnc_typeText", 0, true];

[""] remoteExec ["playMusic", 0, false];
["Intro"] remoteExec ["playMusic", 0, false];

//Removes Customization Menu Reset option
[[],{ [player, 1,["ACE_SelfActions","Reset_Menu"]] call ace_interact_menu_fnc_removeActionFromObject; }] remoteExec ["Spawn", 0, true];

["Armakart_Main\Armakart_Scripts\Start_Race.sqf"] remoteExec ["execVM", -2, false];

_Start_Race_Server_Side = execVM "Armakart_Main\Armakart_Scripts\Start_Race.sqf";

["Armakart_Main\Armakart_Scripts\Live_Place.sqf"] remoteExec ["execVM", 0, false];

RACE_PHASE = "Race_Started";

waitUntil {scriptDone _Start_Race_Server_Side};

RACE_PHASE = "Race_Started";
publicVariable "RACE_PHASE";

diag_log "//----------------------------------------------------------------------------\\";
diag_log "||Armakart System| : Started Race.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

[] execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Check_End_Race.sqf";

"" remoteExec ["playMusic", 0, false];

[] Spawn 
{

	while {(RACE_PHASE isEqualTo "Race_Started")} do
	{

		music_isPlaying = true;
		"Track_music" remoteExec ["playMusic", 0, true];

		waitUntil
		{

			uiSleep 8.5;

			not music_isPlaying

		};

	};

};

[] Spawn 
{

	while {(RACE_PHASE isEqualTo "Race_Started")} do 
	{

		call NJP_CLEAN_UP;
		uiSleep 65;

	};

};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "||Armakart System| : Completed Race init.";
diag_log format ["|Armakart System| : Time for Race to init: %1.", diag_tickTime];
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";