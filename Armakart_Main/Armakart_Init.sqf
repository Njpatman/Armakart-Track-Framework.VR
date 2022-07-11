/* 
*
* - Basically an extension of init.sqf just so all these commands don't clutter init.sqf if another unit wants to integrate armakart into their mission framework for a mission.
* 
*/

//Compiles and applies briefing to players
[] execVM "Armakart_Main\Briefing.sqf";

//- Variables that are handled globally -\\

//Setsup the Systemchat at the end of the players individual race which tells them their place
KARTS_FINISHED = 0;

//Setsup "Places"
Places = [];

//Setsup "Places_Live"
Places_Live = [];

//Setsup "Scoreboard_Active"
Scoreboard_Active = false;

ALL_PLAYERS_COMPLETED = false;
NO_LOOPING = false;

//Number of Laps/Checkpoints
Laps_number = ["Laps_number", 3] call BIS_fnc_getParamValue; // Can be as high as you want, just don't go under 2

//Customization Phase Time
Customization_Phase_Time = ["Customization_Phase_Time", 55] call BIS_fnc_getParamValue;

//Voting Phase
Voting_Phase_Enabled = ["Voting_Phase_Enabled", 1] call BIS_fnc_getParamValue;

Voting_Phase_Time = ["Voting_Phase_Time", 25] call BIS_fnc_getParamValue;

//Powerup Creep
Powerup_Creep_Enabled = ["Powerup_Creep_Enabled", 1] call BIS_fnc_getParamValue;

//- Server Init -\\

if (isServer) then 
{

	//Setsup variables for Weather Voting
	WEATHER_CLEAR = 0;
	WEATHER_CLOUDY = 0;
	WEATHER_FOGGY = 0;
	WEATHER_LIGHT_RAIN = 0;
	WEATHER_STORMY = 0;

	//Setsup variables for Time Voting
	TIME_E_MORNING = 0;
	TIME_NOON = 0;
	TIME_L_AFTERNOON = 0;
	TIME_NIGHT = 0;
	TIME_NIGHT_F_MOON = 0;

	addMissionEventHandler ["PlayerDisconnected", 
	{

		params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

		if (!isNil "NJP_DELETE_PLAYER_ARRAY_FROM_PLACES_ARRAY" && !isNil "Loc_Array") then {

			[Loc_Array] remoteExec ["NJP_DELETE_PLAYER_ARRAY_FROM_PLACES_ARRAY", 0, true];
								
		};

	}];

	//Compiles server functions
	_Server_Fnc_init = execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Server_Fnc_Library.sqf";

	waitUntil {scriptDone _Server_Fnc_init};

	//Pre-Race phase START!!
	execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Race_Init_Master.sqf";

	"|Armakart System| : Server initialization completed!" remoteExec ["systemChat", 0, true];

};
