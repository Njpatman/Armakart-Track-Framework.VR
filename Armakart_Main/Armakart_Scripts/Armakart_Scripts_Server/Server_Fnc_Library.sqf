/* 
*
* - All the basic variables players can vote on, doing this on the server gets around having to use public variables.
* 
*/

NJP_Powerup_Block_Disappearing_Act = { 

  params ["_trig"];

  _trig enableSimulationGlobal false;

  _Block = getPos _trig nearestObject 'Land_VR_CoverObject_01_kneelHigh_F';

  _Block hideObjectGlobal true;

	uiSleep 3.85;

	_Block hideObjectGlobal false;

  _trig enableSimulationGlobal true;

};

NJP_WEATHER_CLEAR_ADD = { 

  WEATHER_CLEAR = WEATHER_CLEAR + 1;

};

NJP_WEATHER_CLOUDY_ADD = {  

  WEATHER_CLOUDY = WEATHER_CLOUDY + 1;

};

NJP_WEATHER_FOGGY_ADD = {  

  WEATHER_FOGGY = WEATHER_FOGGY + 1;

};

NJP_WEATHER_LIGHT_RAIN_ADD = {  

  WEATHER_LIGHT_RAIN = WEATHER_LIGHT_RAIN + 1;

};

NJP_WEATHER_STORMY_ADD = {  

  WEATHER_STORMY = WEATHER_STORMY + 1;

};

NJP_TIME_E_MORNING_ADD = {  

  TIME_E_MORNING = TIME_E_MORNING + 1;

};

NJP_TIME_NOON_ADD = {  

  TIME_NOON = TIME_NOON + 1;

};

NJP_TIME_L_AFTERNOON_ADD = {  

  TIME_L_AFTERNOON = TIME_L_AFTERNOON + 1;

};

NJP_TIME_NIGHT_ADD = {  

  TIME_NIGHT = TIME_NIGHT + 1;

};

NJP_TIME_NIGHT_F_MOON_ADD = {  

  TIME_NIGHT_F_MOON = TIME_NIGHT_F_MOON + 1;
  
};

NJP_Server_Voting_Phase = {

  diag_log "//----------------------------------------------------------------------------\\";
  diag_log "|Armakart System| : Completed Customization Phase & Begun Voting Phase.";
  diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
  diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
  diag_log "\\----------------------------------------------------------------------------//";

  //Creates the Voting menu
  ["Voting_Menu"] remoteExec ["createDialog", 0];

  remoteExec ["NJP_Client_Fnc_Voting_Phase_Edit", 0];
    
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

  [parseText "<t color='#c77518' size='1.15'>Track Weather and Time are initializing, keep in mind that you have a GPS and MicroDAGR, and you have to ACE self-interact to reset to your last checkpoint. Otherwise, good luck!</t>",-1,-1,99,0,0,750] remoteExec ["BIS_fnc_dynamicText", 0];

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
      skipTime ((6.45 - daytime + 24) % 24);

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

  uiSleep 2;

  "|Armakart System| : Track Weather & Time Initialization completed, beginning the race..." remoteExec ["systemChat", 0];

  uiSleep 2;

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

};

//Just a simple cleanup script so there aren't any abandoned karts / Ai groups / Dead bois taking away precious frames
NJP_CLEAN_UP = {

  {

    if ( count units _x isEqualTo 0 ) then {deleteGroup _x;};

  } forEach allGroups;

  {

    if ( (not alive _x) || (({ alive _x } count (crew _x)) isEqualTo 0) && !(typeOf _x isEqualTo "Land_ClutterCutter_small_F")) then {deleteVehicle _x;};

  } foreach Vehicles;

  {

    deleteVehicle _x;

  } forEach allDeadMen;

};