/* 
*
* - Basically an extension of init.sqf just so all these commands don't clutter init.sqf if another unit wants to integrate armakart into their mission framework for a mission.
* 
*/

//Compiles and applies briefing to players
[] execVM "Armakart_Main\Briefing.sqf";

//- Variables that are handled globally -\\

//Setsup "RACE_IN_PROGRESS", which most of the while loops use
RACE_IN_PROGRESS = true;

//Setsup "PRE_RACE_PHASE"
PRE_RACE_PHASE = true;

//Setsup the Systemchat at the end of the players individual race which tells them their place
KARTS_FINISHED = 0;

//Setsup "Places"
Places = [];

//Setsup "BEGUN_RACE"
BEGUN_RACE = false;

//Setsup "Places_Live"
Places_Live = [];

//Setsup "Scoreboard_Active"
Scoreboard_Active = false;

ALL_PLAYERS_COMPLETED = false;
NO_LOOPING = false;

//- Client Init -\\

if (hasInterface && local player) then 
{

	//- Stuff that happens at the map screen -\\

	//Sets up local variables
	Current_Laps = 1;
	initial_Lap = true;
	Current_Checkpoint = 1;
	Sub_CP_obj = FINISH_LINE;
	No_item = true;
	UI_Color_int = [2,12] call BIS_fnc_randomInt;
	UI_Color = [0.133,0.349,0.522,0.65];
	Next_Sub_CP_Num = 0;
	Loc_Array = [0, 0, 0, 0, player];
	Powerup_Block_Not_Hit = true;

	uiNamespace setVariable ["NJP_Block_Keys", 0];
	uiNamespace setVariable ["NJP_Block_Keys_EH", nil];

	//Compiles client functions
	[] execVM "Armakart_Main\Armakart_Scripts\Client_Fnc_Library.sqf";

	//Sets plaver vic fuel to 0
	[vehicle player, 0] remoteexec ['setfuel',vehicle player];
	//Initial client loadout
			
	//Makes player/player vic invincible
	player allowDamage false;
	vehicle player allowDamage false;

	// NAMETAGS
	[] execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Whale's_Nametags\wha_nametags_init.sqf";

	WHA_NAMETAGS_TESTLOOP =
	[

		{ { WHA_NAMETAGS_PLAYER reveal [_x,4] } forEach allUnits; },
		10,
		[]

	] call CBA_fnc_addPerFrameHandler;

	//Sets group name for spectator boys
	[group player, [(name player)]] remoteExec ["setGroupIdGlobal", 2];
	
	["players", "allsides"] execVM 'Armakart_Main/Armakart_Scripts/Player_Markers.sqf';

	"Black_Screen_Layer" cutText ["", "BLACK FADED", 150];

	[] Spawn 
	{

		[parseText "<t color='#c77518' size='1.15'>Armakart is initializing, keep in mind that you have to ACE self-interact to reset to your last checkpoint!</t>",-1,-1,6.5,0,0,800] remoteExec ["BIS_fnc_dynamicText", 0];

	};

	systemChat "|Armakart System| : Initialization completed!";

	[] Spawn {

		waitUntil {time > 2};

		if (didJIP && !BEGUN_RACE) then {

			_Search_Array = nearestObjects [getPos player, ["Car", "Truck"], 12];
			_Kart = _Search_Array select 0;
			player moveInDriver _veh;

			"Black_Screen_Layer" cutText ["", "BLACK IN", 3];
			800 cutText ["", "PLAIN"];

		};

		if (BEGUN_RACE) exitWith {

			[true] call ace_spectator_fnc_setSpectator;

			uiSleep 2;

			hint "Sadly, you've joined too late. Armakart doesn't allow JIPs past race start, enjoy watching the carnage in spectator!";

			"Black_Screen_Layer" cutText ["", "BLACK IN", 3];
			800 cutText ["", "PLAIN"];

		};

	};

	[] Spawn {

		waitUntil {time > 1};

		//Sets players initial character
		["Farmer"] call NJP_Client_Fnc_Character_Swap;

	};

};

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

	//Compiles server functions
	[] execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Server_Fnc_Library.sqf";

	//Pre-Race phase START!!
	[] execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Server\Race_Init_Master.sqf";

};
