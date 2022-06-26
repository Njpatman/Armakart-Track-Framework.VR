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