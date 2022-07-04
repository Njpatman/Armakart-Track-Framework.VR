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

//Wait 3 seconds after mission start so all client-side variables load, and to give time for sub checkpoints and powerup blocks to init.
waitUntil { time > 3 };

//Adds global variable for music loop
ehID = addMusicEventHandler ["MusicStop", {music_isPlaying = false}];

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


if (!isNil "potato_safeStart_fnc_toggleSafeStart") then {

	//Removes Safestart
	[false] call potato_safeStart_fnc_toggleSafeStart;

};

//Initializes sub Checkpoints
[] execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Sub_Checkpoints.sqf";

//Initializes powerup blocks
[] execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Powerup_Blocks.sqf";

//- Handles the Customization Phase UI & ACE Self Interact -\\

//Creates Customization Menu
["Customization_Timer_Layer", ["Customization_Timer_UI", "PLAIN"]] remoteExec ["cutRsc", 0];
["Customization_Menu"] remoteExec ["createDialog", 0];

["dynamicBlur",  true] remoteExec ["ppEffectEnable", 0];
["dynamicBlur",  [6]] remoteExec ["ppEffectAdjust", 0];
["dynamicBlur",  0] remoteExec ["ppEffectCommit", 0];    
["dynamicBlur",  [0.0]] remoteExec ["ppEffectAdjust", 0];
["dynamicBlur",  3] remoteExec ["ppEffectCommit", 0];

["Black_Screen_Layer", ["", "BLACK IN", 3]] remoteExec ["cutText", 0];
[800, ["", "PLAIN"]] remoteExec ["cutText", 0];

//- Handles the Customization Phase UI, ACE Self Interact, and camera -\\

[[],"Armakart_Main\Armakart_Scripts\Pre_Race_Phase.sqf"] remoteExec ["execVM", 0];

//-\\

//- Adds a timer to the players screen, which should give the rough time until the next phase or race start -\\

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

//Remove timer display
[( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0];

if (Voting_Phase_Enabled isEqualTo 1) then {

	diag_log "//----------------------------------------------------------------------------\\";
	diag_log "|Armakart System| : Completed Customization Phase & Begun Voting Phase.";
	diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
	diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
	diag_log "\\----------------------------------------------------------------------------//";

	//- Voting Phase -\\

	//Removes Customization Menu Rest option
	[[],{ [player, 1,["ACE_SelfActions","Reset_Menu"]] call ace_interact_menu_fnc_removeActionFromObject; }] remoteExec ["Spawn", 0];

	//Closes Customization Menu
	[1234] remoteExec ["closeDialog", 0];

	//Creates the Voting menu
	["Voting_Menu"] remoteExec ["createDialog", 0];

	//- Adds a timer to the players screen, which should give time until the next phase or race start -\\
	[[],{

		disableSerialization;

		#define _Pre_Race_UI_Bottom uiNamespace getVariable ["Pre_Race_UI_Bottom", controlNull]
		#define _Timer_Title uiNamespace getVariable ["Timer_Title", controlNull]

		_Voting_UI = findDisplay 123456;
		_Voting = _Voting_UI displayCtrl 1008;

		//Get the UI color that was used on the Customization UI and applies it
		_Voting ctrlSetBackgroundColor UI_Color;

		_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'>If you exit the voting menu, you will not be able to open it again!</t>";

		_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Voting Time Left ---</t>";

	}] remoteExec [ "Spawn", 0 ];
	
	[( "Timer" call BIS_fnc_rscLayer ), ["Timer", "PLAIN"]] remoteExec ["cutRsc", 0];

	_color = "#45f442";//green

	//default
	_Time_left = 25;

	_Voting_time_Left = Voting_Phase_Time + time;

	while {_Time_left > 0} do {

		uiSleep 1;

		_Time_left = _Voting_time_Left - time;

		if (_Time_left < 21) then {_color = "#eef441";};//yellow

		if (_Time_left < 11) then {_color = "#ff0000";};//red

		[_color, _Time_left] remoteExec ["NJP_UPDATE_TIMER", 0];

	};

	//Remove timer display
	[( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0];

	//-\\

	//Closes Voting Menu
	["Customization_Timer_Layer", 0.001] remoteExec ["cutFadeOut", 0];

	[1235] remoteExec [ "closeDialog", 0 ];

	["Black_Screen_Layer", ["", "BLACK FADED", 150]]  remoteExec ["cutText", 0];

	[] Spawn 
	{

		[parseText "<t color='#c77518' size='1.15'>Track is initializing, keep in mind that you have a GPS and MicroDAGR, and you have to ACE self-interact to reset to your last checkpoint. Otherwise, good luck!</t>",-1,-1,6.5,0,0,750] remoteExec ["BIS_fnc_dynamicText", 0];

	};


	//Begin tallying and applying weather effects and time
	diag_log "//----------------------------------------------------------------------------\\";
	diag_log "|Armakart System| : Completed Voting Phase, tallying votes";
	diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
	diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
	diag_log "\\----------------------------------------------------------------------------//";

	_Time = selectMax [TIME_E_MORNING, TIME_NOON, TIME_L_AFTERNOON, TIME_NIGHT, TIME_NIGHT_F_MOON];

	switch (_Time) do {

		case TIME_E_MORNING: {
		
			"|Armakart Track Time| : Early Morning won the vote!" remoteExec ["systemChat", 0];
			skipTime ((4.45 - daytime + 24) % 24);

		};
		
		case TIME_NOON: {
		
			"|Armakart Track Time| : Noon won the vote!" remoteExec ["systemChat", 0];
			skipTime ((12 - daytime + 24) % 24);

		};

		case TIME_L_AFTERNOON: {

			"|Armakart Track Time| : Late Afternoon won the vote!" remoteExec ["systemChat", 0];
			skipTime ((19.15 - daytime + 24) % 24);
		
		};

		case TIME_NIGHT: {

			"|Armakart Track Time| : Night won the vote!" remoteExec ["systemChat", 0];
			[[2000, 7, 8, 24, 0]] remoteExec ["setDate"];
		
		};

		case TIME_NIGHT_F_MOON: {

			"|Armakart Track Time| : Night (Full Moon) won the vote!" remoteExec ["systemChat", 0];
			skipTime ((24 - daytime + 24) % 24);

		};

		default {TIME_NOON};

	};

	diag_log "//----------------------------------------------------------------------------\\";
	diag_log "|Armakart Voting| : Tallied Time votes.";
	diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
	diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
	diag_log "\\----------------------------------------------------------------------------//";

	uiSleep 3;

	_Weather = selectMax [WEATHER_CLEAR, WEATHER_CLOUDY, WEATHER_FOGGY, WEATHER_LIGHT_RAIN, WEATHER_STORMY];

	switch (_Weather) do {

		case WEATHER_CLEAR: {
		
			"|Armakart Track Weather| : Clear won the vote!" remoteExec ["systemChat", 0];
			0 setOvercast 0;
			0 setFog 0;
			0 setRain 0;
			0 setLightnings 0;
			0 setWaves 0;
			forceWeatherChange;

		};

		case WEATHER_CLOUDY: {
		
			"|Armakart Track Weather| : Cloudy won the vote!" remoteExec ["systemChat", 0];
			0 setOvercast 0.95;
			0 setFog 0;
			0 setRain 0;
			0 setLightnings 0;
			0 setWaves 0;
			_init_dir = random 360;
			setWind [_init_dir, _init_dir ];
			forceWeatherChange;

		};

		case WEATHER_FOGGY: {

			"|Armakart Track Weather| : Foggy won the vote!" remoteExec ["systemChat", 0];
			0 setOvercast 0.42;
			0 setFog 0.75;
			0 setRain 0;
			0 setLightnings 0;
			0 setWaves 0;
			forceWeatherChange;
		
		};

		case WEATHER_LIGHT_RAIN: {

			"|Armakart Track Weather| : Light Rain won the vote!" remoteExec ["systemChat", 0];
			0 setOvercast 0.85;
			0 setFog 0;
			0 setRain 0.35;
			0 setLightnings 0;
			0 setWaves 0;
			_init_dir = random 360;
			setWind [_init_dir, _init_dir ];
			forceWeatherChange;
		
		};

		case WEATHER_STORMY: {

			"|Armakart Track Weather| : Stormy won the vote!" remoteExec ["systemChat", 0];
			0 setOvercast 1;
			0 setFog 0;
			0 setRain 1;
			0 setLightnings 1;
			0 setWaves 1;
			_init_dir = random 360;
			setWind [_init_dir, _init_dir ];
			0 setGusts 0.85;
			forceWeatherChange;

		};

		default {WEATHER_CLEAR};

	};

	
	uiSleep 5;

	["dynamicBlur",  true] remoteExec ["ppEffectEnable", 0];
	["dynamicBlur",  [6]] remoteExec ["ppEffectAdjust", 0];
	["dynamicBlur",  0] remoteExec ["ppEffectCommit", 0];    
	["dynamicBlur",  [0.0]] remoteExec ["ppEffectAdjust", 0];
	["dynamicBlur",  3] remoteExec ["ppEffectCommit", 0];

	["Black_Screen_Layer", ["", "BLACK IN", 3]] remoteExec ["cutText", 0];
	[750, ["", "PLAIN"]] remoteExec ["cutText", 0];

	diag_log "//----------------------------------------------------------------------------\\";
	diag_log "|Armakart Voting| : Tallied weather votes & applied weather effects to the server.";
	diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
	diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
	diag_log "\\----------------------------------------------------------------------------//";

} else {

	diag_log "//----------------------------------------------------------------------------\\";
	diag_log "|Armakart System| : Completed Customization Phase & skipped Voting phase.";
	diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
	diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
	diag_log "\\----------------------------------------------------------------------------//";

};

PRE_RACE_PHASE = false;
publicVariable "PRE_RACE_PHASE";

//One-off Cleanup Script to make the intro look nice
[[],"Armakart_Main\Armakart_Scripts\Cleanup.sqf"] remoteExec ["execVM", 0];

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

if (Voting_Phase_Enabled isEqualTo 2) then {
	//Removes Customization Menu Rest option
	[[],{ [player, 1,["ACE_SelfActions","Reset_Menu"]] call ace_interact_menu_fnc_removeActionFromObject; }] remoteExec ["Spawn", 0];

	//Closes Customization Menu
	[1234] remoteExec ["closeDialog", 0];
	["Customization_Timer_Layer", 0.001] remoteExec ["cutFadeOut", 0];
};

[""] remoteExec ["playMusic", 0];
["Intro"] remoteExec ["playMusic", 0];

[[],"Armakart_Main\Armakart_Scripts\Start_Race.sqf"] remoteExec ["execVM", 0];

[[],"Armakart_Main\Armakart_Scripts\Live_Place.sqf"] remoteExec ["execVM", 0];

//-\\

diag_log "//----------------------------------------------------------------------------\\";
diag_log "||Armakart System| : Started Race.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

[] execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Check_End_Race.sqf";

waitUntil {BEGUN_RACE};

//for Jips
publicVariable "BEGUN_RACE";

"" remoteExec ["playMusic", 0 ];

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

		[[],"Armakart_Main\Armakart_Scripts\Cleanup.sqf"] remoteExec ["execVM", 0];
		uiSleep 65;

	};

};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "||Armakart System| : Completed Race init.";
diag_log format ["|Armakart System| : Time for Race to init: %1.", diag_tickTime];
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";