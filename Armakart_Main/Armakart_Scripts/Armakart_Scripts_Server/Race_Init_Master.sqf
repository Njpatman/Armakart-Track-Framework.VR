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

["Black_Screen_Layer", ["", "BLACK FADED", 150]] remoteExec ["cutText", 0];

[parseText "<t color='#c77518' size='1.15'>Armakart is initializing, keep in mind that you have to ACE self-interact to reset to your last checkpoint!</t>",-1,-1,99,0,0,800] remoteExec ["BIS_fnc_dynamicText", 0];

//Setsup "RACE_IN_PROGRESS", which most of the while loops use
RACE_IN_PROGRESS = false;

//Setsup "PRE_RACE_PHASE"
PRE_RACE_PHASE = true;

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

"|Armakart System| : Armakart initialization completed, Starting Pre Race Phase..." remoteExec ["systemChat", 0];

if (!isNil "potato_safeStart_fnc_toggleSafeStart") then {

	//Removes Safestart
	[false] call potato_safeStart_fnc_toggleSafeStart;

};

//- Handles the Customization Phase ACE Self Interact, and camera -\\

remoteExec ["NJP_Client_Fnc_Pre_Race_Phase", 0];

uiSleep 1.65;

//Starts Customization Phase music and loops it
[] Spawn
{

	while {PRE_RACE_PHASE} do
	{

		music_isPlaying = true;
		"Customization_Phase" remoteExec ["playMusic", 0];
		waitUntil
		{
			uiSleep 5;

			not music_isPlaying
		};

	};
	
};

//- Handles the Customization Phase UI -\\

["Black_Screen_Layer", ["", "BLACK IN", 3]] remoteExec ["cutText", 0];

//Creates Customization Menu
["Customization_Timer_Layer", ["Customization_Timer_UI", "PLAIN"]] remoteExec ["cutRsc", 0];
["Customization_Menu"] remoteExec ["createDialog", 0];

["dynamicBlur",  true] remoteExec ["ppEffectEnable", 0];
["dynamicBlur",  [6]] remoteExec ["ppEffectAdjust", 0];
["dynamicBlur",  0] remoteExec ["ppEffectCommit", 0];    
["dynamicBlur",  [0.0]] remoteExec ["ppEffectAdjust", 0];
["dynamicBlur",  3] remoteExec ["ppEffectCommit", 0];
[800, ["", "PLAIN"]] remoteExec ["cutText", 0];

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

//Removes Customization Menu Rest option
[[],{ [player, 1,["ACE_SelfActions","Reset_Menu"]] call ace_interact_menu_fnc_removeActionFromObject; }] remoteExec ["Spawn", 0];

//Closes Customization Menu
[1234] remoteExec ["closeDialog", 0];

if (Voting_Phase_Enabled isEqualTo 1) then {

	call NJP_Server_Voting_Phase;

} else {
	
    ["Customization_Timer_Layer", 0.001] remoteExec ["cutFadeOut", 0];
    
    //Remove timer display
    [( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0];

    diag_log "//----------------------------------------------------------------------------\\";
    diag_log "|Armakart System| : Completed Customization Phase & skipped Voting phase.";
    diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
	diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
	diag_log "\\----------------------------------------------------------------------------//";

};

PRE_RACE_PHASE = false;

//One-off Clean up Script to make the intro look nice
call NJP_CLEAN_UP;

//- Sets plaver vic fuel to 0 -\\
[[],{ [vehicle player, 0] remoteExec ['setfuel', vehicle player]; }] remoteExec ["Spawn", 0];
//-\\

//Do title
_author = getMissionConfigValue ["Author", 0];
_ATF_Version = getText (missionConfigFile >> "ATF_Version");

[

	[

		[Track_Title,"<t align = 'center' shadow = '1' size = '1.5' font = 'PuristaBold' >%1</t><br/>",12],

		["By: " + _author,"<t align = 'center' shadow = '1' size = '1.2'>%1</t><br/>",12],

		[_ATF_Version,"<t align = 'center' shadow = '1' size = '1'>%1</t><br/>",32]

	] , 1, 0.8

] remoteExec ["BIS_fnc_typeText", 0];

[""] remoteExec ["playMusic", 0];
["Intro"] remoteExec ["playMusic", 0];

["Armakart_Main\Armakart_Scripts\Start_Race.sqf"] remoteExec ["execVM", 0];

["Armakart_Main\Armakart_Scripts\Live_Place.sqf"] remoteExec ["execVM", 0];

//-\\

waitUntil {RACE_IN_PROGRESS};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "||Armakart System| : Started Race.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

[] execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Check_End_Race.sqf";

"" remoteExec ["playMusic", 0];

[] Spawn 
{

	while {RACE_IN_PROGRESS} do
	{

		music_isPlaying = true;
		"Track_music" remoteExec ["playMusic", 0 ];

		waitUntil
		{

			uiSleep 8.5;

			not music_isPlaying

		};

	};

};

[] Spawn 
{

	while {RACE_IN_PROGRESS} do 
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
