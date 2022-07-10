/*
* 
* - Checks if a player or all players finish, and executes code for each respective scenario.
* 
*/ 
	
while {RACE_IN_PROGRESS} do
{

	if (west countSide allPlayers isEqualTo 0 && RACE_IN_PROGRESS) exitWith
	{

		ALL_PLAYERS_COMPLETED = true;

		RACE_IN_PROGRESS = false;

		["|Armakart System| : All players have completed the race!"] remoteExec ["systemChat", 0];

		uiSleep 3;

		["|Armakart System| : Auto Race End shutting down, calling Places Screen..."] remoteExec ["systemChat", 0];

		[parseText "<t color='#3275a8'>--- Race is ending, Places will be displayed momentarily! ---</t>"] remoteExec ["hint", 0];

		uiSleep 2;

		remoteExec ["NJP_Client_Fnc_Scoreboard", 0];

	};

	if (KARTS_FINISHED > 0 && !(NO_LOOPING)) then
	{

		NO_LOOPING = true;

		[] Spawn 
		{

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			["|Armakart System| : Someone has completed the race, Racers have 3 minutes to finish!"] remoteExec ["systemChat", 0];

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			uiSleep 60;
				
			if (ALL_PLAYERS_COMPLETED) exitWith {};

			["|Armakart System| : 2 minutes until race end!"] remoteExec ["systemChat", 0];

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			uiSleep 60;

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			["|Armakart System| : 1 minute until race end!"] remoteExec ["systemChat", 0];

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			uiSleep 30;

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			["|Armakart System| : 30 seconds until race end!"] remoteExec ["systemChat", 0];

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			uiSleep 15;

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			["|Armakart System| : 15 seconds until race end!"] remoteExec ["systemChat", 0];

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			uiSleep 10;

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			["|Armakart System| : 5 seconds until race end!"] remoteExec ["systemChat", 0];

			if (ALL_PLAYERS_COMPLETED) exitWith {};

			RACE_IN_PROGRESS = false;

			uiSleep 5;

			[parseText "<t color='#3275a8'>--- Race is ending, Places will be displayed momentarily! ---</t> <br/><br/> <t>If you haven't finished, you'll shortly be shoved into spectator and won't show on the Places Screen and are considered DNF</t>"] remoteExec ["hint", 0];

			uiSleep 2;

			[[],{ 

				if (!Player_Finished && hasInterface) then {

					Player_Finished = true;

					deleteVehicle vehicle player;

					[true] call ace_spectator_fnc_setSpectator;
					
				};

			}] remoteExec ["Spawn", 0];

			uiSleep 2;
				
			remoteExec ["NJP_Client_Fnc_Scoreboard", 0];

		};

	};

	uiSleep 10;
};
