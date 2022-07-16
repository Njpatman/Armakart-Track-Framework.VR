diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Customization Phase & Begun Voting Phase.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

RACE_PHASE = "Voting_Phase";
publicVariable "RACE_PHASE";

//Creates the Voting menu
["Voting_Menu"] remoteExec ["createDialog", 0, false];

["Edit_Voting_Phase"] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];

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

["Track_Loading_Layer", ["Loading_Screen", "PLAIN"]] remoteExec ["cutRsc", 0, false];

["Edit_Track_Loading_Screen", false] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];

//Begin tallying and applying weather effects and time
diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Voting Phase, tallying votes";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

uiSleep 1.65;

_Weather = selectMax [Weather_Clear, Weather_Cloudy, Weather_Foggy, Weather_Light_Rain, Weather_Stormy];

switch (_Weather) do {

	case Weather_Clear: {

		GUI_Weather = 'Clear';

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

		GUI_Weather = 'Cloudy';

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

		GUI_Weather = 'Foggy';

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

		GUI_Weather = 'Light Rain';

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

		GUI_Weather = 'Stormy';

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

[format ["|Armakart Voting System| : %1 won and got %2/%3 of the player votes!", GUI_Weather, _Weather, (Weather_Clear + Weather_Cloudy + Weather_Foggy + Weather_Light_Rain + Weather_Stormy)]] remoteExec ["systemChat", 0, false];

["Edit_Track_Loading_Screen", false, GUI_Weather] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];

uiSleep 3.25;

_Time = selectMax [Time_Early_Morning, Time_Noon, Time_Late_Afternoon, Time_Night, Time_Night_Full_Moon];

switch (_Time) do {

	case Time_Early_Morning: {

		GUI_Time = 'Early Morning';

		skipTime ((5.45 - daytime + 24) % 24);

	};
		
	case Time_Noon: {

		GUI_Time = 'Noon';

		skipTime ((12 - daytime + 24) % 24);

	};

	case Time_Late_Afternoon: {

		GUI_Time = 'Late Afternoon';

		skipTime ((19.15 - daytime + 24) % 24);
		
	};

	case Time_Night: {

		GUI_Time = 'Night';

		[[2000, 7, 8, 24, 0]] remoteExec ["setDate"];
		
	};

	case Time_Night_Full_Moon: {

		GUI_Time = 'Night Full Moon';

		skipTime ((24 - daytime + 24) % 24);

	};

	default {Time_Noon};

};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart Voting| : Tallied Time votes.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

[format ["|Armakart Voting System| : %1 won and got %2/%3 of the player votes!", GUI_Time, _Time, (Time_Early_Morning + Time_Noon + Time_Late_Afternoon + Time_Night + Time_Night_Full_Moon)]] remoteExec ["systemChat", 0, false];

["Edit_Track_Loading_Screen", true, GUI_Weather, GUI_Time] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];

call NJP_Server_Fnc_Weather;

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart Voting| : Applied weather effects to the server.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

uiSleep 4.25;

["Track_Loading_Layer", 0.001] remoteExec ["cutFadeOut", 0, true];

["dynamicBlur",  true] remoteExec ["ppEffectEnable", 0, false];
["dynamicBlur",  [4]] remoteExec ["ppEffectAdjust", 0, false];
["dynamicBlur",  0] remoteExec ["ppEffectCommit", 0, false];    
["dynamicBlur",  [0.0]] remoteExec ["ppEffectAdjust", 0, false];
["dynamicBlur",  2] remoteExec ["ppEffectCommit", 0, false];

["Black_Screen_Layer", ["", "BLACK IN", 3]] remoteExec ["cutText", 0, true];