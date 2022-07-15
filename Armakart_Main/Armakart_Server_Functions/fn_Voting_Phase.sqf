diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Customization Phase & Begun Voting Phase.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

RACE_PHASE = "Voting_Phase";
publicVariable "RACE_PHASE";

//Creates the Voting menu
["Voting_Menu"] remoteExec ["createDialog", 0, false];

remoteExec ["NJP_Client_Fnc_Voting_Phase_Client_Edit", 0, true];

_color = "#45f442";//green

//default
_Time_left = 25;

_Voting_time_Left = Voting_Phase_Time + time;

while {_Time_left > 0} do {

	uiSleep 1;

	_Time_left = _Voting_time_Left - time;

	if (_Time_left < 21) then {_color = "#eef441";};//yellow

	if (_Time_left < 11) then {_color = "#ff0000";};//red

	[_color, _Time_left] remoteExec ["NJP_Client_fnc_Update_Timer", 0, true];

};

//Remove timer display
[( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0, true];

//Closes Voting Menu
["Customization_Timer_Layer", 0.001] remoteExec ["cutFadeOut", 0, true];

[1235] remoteExec [ "closeDialog", 0, true];

RACE_PHASE = "Race_Started";
publicVariable "RACE_PHASE";

[( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0, true];

["Black_Screen_Layer", ["", "BLACK FADED", 150]]  remoteExec ["cutText", 0, false];

[parseText "<t color='#c77518' size='1.15'>Track Weather and Time are initializing, keep in mind that you have a GPS and MicroDAGR, and you have to ACE self-interact to reset to your last checkpoint. Otherwise, good luck!</t>",-1,-1,99,0,0,750] remoteExec ["BIS_fnc_dynamicText", 0, false];

//Begin tallying and applying weather effects and time
diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Voting Phase, tallying votes";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

uiSleep 2;

_Weather = selectMax [Weather_Clear, Weather_Cloudy, Weather_Foggy, Weather_Light_Rain, Weather_Stormy];

switch (_Weather) do {

	case Weather_Clear: {
		
		"|Armakart Track Weather| : Clear won the vote!" remoteExec ["systemChat", 0, true];

		NJP_Server_Fnc_Weather = {

			0 setOvercast 0;
			0 setFog 0;
			0 setRain 0;
			0 setLightnings 0;
			0 setWaves 0;
			forceWeatherChange;

		};

	};

	case Weather_Cloudy: {
		
		"|Armakart Track Weather| : Cloudy won the vote!" remoteExec ["systemChat", 0, true];

		NJP_Server_Fnc_Weather = {

			0 setOvercast 0.95;
			0 setFog 0;
			0 setRain 0;
			0 setLightnings 0;
			0 setWaves 0;
			_init_dir = random 360;
			setWind [_init_dir, _init_dir ];
			forceWeatherChange;

		};

	};

	case Weather_Foggy: {

		"|Armakart Track Weather| : Foggy won the vote!" remoteExec ["systemChat", 0, true];

		NJP_Server_Fnc_Weather = {

			0 setOvercast 0.42;
			0 setFog 0.75;
			0 setRain 0;
			0 setLightnings 0;
			0 setWaves 0;
			forceWeatherChange;

		};
		
	};

	case Weather_Light_Rain: {

		"|Armakart Track Weather| : Light Rain won the vote!" remoteExec ["systemChat", 0, true];

		NJP_Server_Fnc_Weather = {

			0 setOvercast 0.85;
			0 setFog 0;
			0 setRain 0.35;
			0 setLightnings 0;
			0 setWaves 0;
			_init_dir = random 360;
			setWind [_init_dir, _init_dir ];
			forceWeatherChange;

		};
		
	};

	case Weather_Stormy: {

		"|Armakart Track Weather| : Stormy won the vote!" remoteExec ["systemChat", 0, true];

		NJP_Server_Fnc_Weather = {

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

	};

	default {Weather_Clear};

};

uiSleep 3;

_Time = selectMax [Time_Early_Morning, Time_Noon, Time_Late_Afternoon, Time_Night, Time_Night_Full_Moon];

switch (_Time) do {

	case Time_Early_Morning: {
		
		"|Armakart Track Time| : Early Morning won the vote!" remoteExec ["systemChat", 0, true];
		skipTime ((6.45 - daytime + 24) % 24);

	};
		
	case Time_Noon: {
		
		"|Armakart Track Time| : Noon won the vote!" remoteExec ["systemChat", 0, true];
		skipTime ((12 - daytime + 24) % 24);

	};

	case Time_Late_Afternoon: {

		"|Armakart Track Time| : Late Afternoon won the vote!" remoteExec ["systemChat", 0, true];
		skipTime ((19.15 - daytime + 24) % 24);
		
	};

	case Time_Night: {

		"|Armakart Track Time| : Night won the vote!" remoteExec ["systemChat", 0, true];
		[[2000, 7, 8, 24, 0]] remoteExec ["setDate"];
		
	};

	case Time_Night_Full_Moon: {

		"|Armakart Track Time| : Night (Full Moon) won the vote!" remoteExec ["systemChat", 0, true];
		skipTime ((24 - daytime + 24) % 24);

	};

	default {Time_Noon};

};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart Voting| : Tallied Time votes.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

uiSleep 2;

call NJP_Server_Fnc_Weather;

"|Armakart System| : Track Weather & Time Initialization completed, beginning the race..." remoteExec ["systemChat", 0, true];

uiSleep 2;

["dynamicBlur",  true] remoteExec ["ppEffectEnable", 0, false];
["dynamicBlur",  [4]] remoteExec ["ppEffectAdjust", 0, false];
["dynamicBlur",  0] remoteExec ["ppEffectCommit", 0, false];    
["dynamicBlur",  [0.0]] remoteExec ["ppEffectAdjust", 0, false];
["dynamicBlur",  2] remoteExec ["ppEffectCommit", 0, false];

["Black_Screen_Layer", ["", "BLACK IN", 3]] remoteExec ["cutText", 0, true];
[750, ["", "PLAIN"]] remoteExec ["cutText", 0, true];

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart Voting| : Tallied weather votes & applied weather effects to the server.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";