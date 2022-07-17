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

//Setsup "RACE_PHASE"
RACE_PHASE = "Customization_Phase";
publicVariable "RACE_PHASE";

//Adds global variable for music loop
ehID = addMusicEventHandler ["MusicStop", {music_isPlaying = false}];

waitUntil {time > 0};

//Initializes Checkpoints
_CP_Init = [] spawn NJP_Server_fnc_Checkpoints;

//Initializes Sub Checkpoints
_Sub_CP_Init = [] spawn NJP_Server_fnc_Sub_Checkpoints;

//Initializes Powerup Blocks
_Powerup_Block_Init = [] spawn NJP_Server_fnc_Powerup_Blocks;

["Initial_Loading_Layer", ["Loading_Screen", "PLAIN"]] remoteExec ["cutRsc", 0, false];

remoteExec ["NJP_Client_fnc_Pre_Race_Phase", 0, false];

While {!scriptDone _Powerup_Block_Init || !scriptDone _Sub_CP_Init || !scriptDone _CP_Init} do {


	["Edit_Initial_Loading_Screen", Loaded_CP_NUM, Loaded_SUB_CP_NUM, Loaded_PWR_BLK_NUM] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, true];

	uiSleep 0.225;

};

["Edit_Initial_Loading_Screen", Loaded_CP_NUM, Loaded_SUB_CP_NUM, Loaded_PWR_BLK_NUM] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, true];

if (!isNil "potato_safeStart_fnc_toggleSafeStart") then { [false] call potato_safeStart_fnc_toggleSafeStart; };

//- Handles the Customization Phase ACE Self Interact, and camera -\\

uiSleep 3.25;

["Initial_Loading_Layer", 0.001] remoteExec ["cutFadeOut", 0, true];
["Black_Screen_Layer", ["", "BLACK IN", 3]] remoteExec ["cutText", 0, true];

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

["dynamicBlur",  true] remoteExec ["ppEffectEnable", 0, false];
["dynamicBlur",  [6]] remoteExec ["ppEffectAdjust", 0, false];
["dynamicBlur",  0] remoteExec ["ppEffectCommit", 0, false];    
["dynamicBlur",  [0.0]] remoteExec ["ppEffectAdjust", 0, false];
["dynamicBlur",  3] remoteExec ["ppEffectCommit", 0, false];

["Initial_Loading_Layer", 0.001] remoteExec ["cutFadeOut", 0, true];
["Black_Screen_Layer", ["", "BLACK IN", 3]] remoteExec ["cutText", 0, true];

//put customization phase function here
call NJP_Server_fnc_Customization_Phase;

if (Voting_Phase_Enabled isEqualTo 1) then { call NJP_Server_fnc_Voting_Phase; } else {
	
    ["Customization_Timer_Layer", 0.001] remoteExec ["cutFadeOut", 0, true];

    //Remove timer display
    [( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0, true];
	
    RACE_PHASE = "Race_Started";
    publicVariable "RACE_PHASE";

    diag_log "//----------------------------------------------------------------------------\\";
    diag_log "|Armakart System| : Completed Customization Phase & skipped Voting phase.";
    diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
    diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
    diag_log "\\----------------------------------------------------------------------------//";

};

//One-off Clean up Script to make the intro look nice
call NJP_Server_fnc_Clean_Up;

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

remoteExec ["NJP_Client_fnc_Start_Race", -2];

remoteExec ["NJP_Client_fnc_Live_Place", 0];

call NJP_Client_fnc_Start_Race;

RACE_PHASE = "Race_Started";

diag_log "//----------------------------------------------------------------------------\\";
diag_log "||Armakart System| : Started Race.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

[] spawn NJP_Server_fnc_Check_End_Race;

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

		call NJP_Server_fnc_Clean_Up;
		uiSleep 32.5;

	};

};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "||Armakart System| : Completed Race init.";
diag_log format ["|Armakart System| : Time for Race to init: %1.", diag_tickTime];
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";