/*
	Author: Njpatman

	Description:
		Selects a random powerup and plays a little hint animation that lasts as long as the sound effect
*/

if (!No_item) exitwith {};

No_item = false;
Itembox_sfx = true;
playsound"itembox";

[] spawn {

		while {Itembox_sfx} do {

		_Hintstr = selectRandom [
			"<t color='#808080'>Bomb</t>",
			"<t color='#948685'>Triple Bomb</t>",
			"<t color='#04378f'>Lightning</t>",
			"<t color='#11aed9'>Fus-Roh-Dah</t>",
			"<t color='#5c0c5e'>Smoke</t>",
			"<t color='#FFFF00'>Banana</t>",
			"<t color='#e68f0e'>Kitchen Sink</t>",
			"<t color='#ff0d00'>Bunny Mine</t>",
			"<t color='#69f0ff'>Blue Shell</t>",
			"<t color='#FFFF00'>Triple Banana</t>",
			"<t color='#731717'>Triple Boost</t>",
			"<t color='#25910d'>Miller</t>",
			"<t color='#25910d'>Miller Lite</t>",
			"<t color='#fc3903'>Washing Machine</t>",
			"<t color='#FFFF00'>Banana Gun</t>",
			"<t color='#cd7f32'>Checkpoint Teleport</t>",
			"<t color='#ff5454'>Involuntary Boost</t>",
			"<t color='#5c8694'>Change Mass</t>"
		];

		hintSilent parseText _Hintstr;
		uiSleep 0.12;

	};
};

_Count_Racers = count Places_Live;

uiSleep 1.25;

Powerup_Block_Not_Hit = true;

uiSleep 4;

Itembox_sfx = false;
uiSleep 0.125;
hintSilent "";

if (Player_Finished) exitWith {};

if (Powerup_Creep_Enabled isEqualTo 2) exitwith 
{

	_Powerup = [1,19] call BIS_fnc_randomInt;

	switch (_Powerup) do
	{
		case 1 : { [] call NJP_Client_Powerup_Fnc_Bunny_IED; };
		case 2 : { [] call NJP_Client_Powerup_Fnc_Bomb; };
		case 3 : { [] call NJP_Client_Powerup_Fnc_Banana; };
		case 4 : { [] call NJP_Client_Powerup_Fnc_Involuntary_Boost; };
		case 5 : { [] call NJP_Client_Powerup_Fnc_Triple_Bomb; };
		case 6 : { [] call NJP_Client_Powerup_Fnc_Lightning; };
		case 7 : { [] call NJP_Client_Powerup_Fnc_Banana_Gun; };
		case 8 : { [] call NJP_Client_Powerup_Fnc_Smoke_Screen; };
		case 9 : { [] call NJP_Client_Powerup_Fnc_Triple_Boost; };
		case 10 : { [] call NJP_Client_Powerup_Fnc_Boost; };
		case 11 : { [] call NJP_Client_Powerup_Fnc_Triple_Banana; };
		case 12 : { [] call NJP_Client_Powerup_Fnc_Kitchen_sink; };
		case 13 : { [] call NJP_Client_Powerup_Fnc_Miller; };
		case 14 : { [] call NJP_Client_Powerup_Fnc_Washing_Machine; };
		case 15 : { [] call NJP_Client_Powerup_Fnc_Fus_Ro_Dah; };
		case 16 : { [] call NJP_Client_Powerup_Fnc_CP_Tele; };
		case 17 : { [] call NJP_Client_Powerup_Fnc_Change_Mass; };
		case 18 : { [] call NJP_Client_Powerup_Fnc_Blue_Shell; };
		case 19 : { [] call NJP_Client_Powerup_Fnc_Miller_Lite; };
	};
};

//While I know this many if statements is frowned upon, a switch statement doesn't work from what I've tried so...

if (Current_Place isEqualTo "N/A") exitwith 
{

	_Powerup = [1,18] call BIS_fnc_randomInt;

	switch (_Powerup) do
	{
		case 1 : { [] call NJP_Client_Powerup_Fnc_Bunny_IED; };
		case 2 : { [] call NJP_Client_Powerup_Fnc_Bomb; };
		case 3 : { [] call NJP_Client_Powerup_Fnc_Banana; };
		case 4 : { [] call NJP_Client_Powerup_Fnc_Involuntary_Boost; };
		case 5 : { [] call NJP_Client_Powerup_Fnc_Triple_Bomb; };
		case 6 : { [] call NJP_Client_Powerup_Fnc_Lightning; };
		case 7 : { [] call NJP_Client_Powerup_Fnc_Banana_Gun; };
		case 8 : { [] call NJP_Client_Powerup_Fnc_Smoke_Screen; };
		case 9 : { [] call NJP_Client_Powerup_Fnc_Triple_Boost; };
		case 10 : { [] call NJP_Client_Powerup_Fnc_Boost; };
		case 11 : { [] call NJP_Client_Powerup_Fnc_Triple_Banana; };
		case 12 : { [] call NJP_Client_Powerup_Fnc_Kitchen_sink; };
		case 13 : { [] call NJP_Client_Powerup_Fnc_Miller; };
		case 14 : { [] call NJP_Client_Powerup_Fnc_Washing_Machine; };
		case 15 : { [] call NJP_Client_Powerup_Fnc_Fus_Ro_Dah; };
		case 16 : { [] call NJP_Client_Powerup_Fnc_Change_Mass; };
		case 17 : { [] call NJP_Client_Powerup_Fnc_Miller_Lite; };
		case 18 : { [] call NJP_Client_Powerup_Fnc_Blue_Shell; };

	};
};

if (Current_Place isEqualTo 1) exitwith 
{

	_Powerup = [1,4] call BIS_fnc_randomInt;

	switch (_Powerup) do
	{
		case 1 : { [] call NJP_Client_Powerup_Fnc_Smoke_Screen; };
		case 2 : { [] call NJP_Client_Powerup_Fnc_Bunny_IED; };
		case 3 : { [] call NJP_Client_Powerup_Fnc_Bomb; };
		case 4 : { [] call NJP_Client_Powerup_Fnc_Banana; };
	};
};

if (Current_Place > 1 && Current_Place <= (_Count_Racers * 0.2)) exitwith 
{

	_Powerup = [1,13] call BIS_fnc_randomInt;

	switch (_Powerup) do
	{
		case 1 : { [] call NJP_Client_Powerup_Fnc_Bunny_IED; };
		case 2 : { [] call NJP_Client_Powerup_Fnc_Bomb; };
		case 3 : { [] call NJP_Client_Powerup_Fnc_Banana; };
		case 4 : { [] call NJP_Client_Powerup_Fnc_Involuntary_Boost; };
		case 5 : { [] call NJP_Client_Powerup_Fnc_Triple_Bomb; };
		case 6 : { [] call NJP_Client_Powerup_Fnc_Lightning; };
		case 7 : { [] call NJP_Client_Powerup_Fnc_Banana_Gun; };
		case 8 : { [] call NJP_Client_Powerup_Fnc_Smoke_Screen; };
		case 9 : { [] call NJP_Client_Powerup_Fnc_Triple_Boost; };
		case 10 : { [] call NJP_Client_Powerup_Fnc_Boost; };
		case 11 : { [] call NJP_Client_Powerup_Fnc_Triple_Banana; };
		case 12 : { [] call NJP_Client_Powerup_Fnc_Kitchen_sink; };
		case 13 : { [] call NJP_Client_Powerup_Fnc_Change_Mass; };
	}
};

if (Current_Place >= (_Count_Racers * 0.2) && Current_Place <= (_Count_Racers * 0.4)) exitwith 
{

	_Powerup = [1,17] call BIS_fnc_randomInt;

	switch (_Powerup) do
	{
		case 1 : { [] call NJP_Client_Powerup_Fnc_Bunny_IED; };
		case 2 : { [] call NJP_Client_Powerup_Fnc_Bomb; };
		case 3 : { [] call NJP_Client_Powerup_Fnc_Banana; };
		case 4 : { [] call NJP_Client_Powerup_Fnc_Involuntary_Boost; };
		case 5 : { [] call NJP_Client_Powerup_Fnc_Triple_Bomb; };
		case 6 : { [] call NJP_Client_Powerup_Fnc_Lightning; };
		case 7 : { [] call NJP_Client_Powerup_Fnc_Banana_Gun; };
		case 8 : { [] call NJP_Client_Powerup_Fnc_Smoke_Screen; };
		case 9 : { [] call NJP_Client_Powerup_Fnc_Triple_Boost; };
		case 10 : { [] call NJP_Client_Powerup_Fnc_Boost; };
		case 11 : { [] call NJP_Client_Powerup_Fnc_Triple_Banana; };
		case 12 : { [] call NJP_Client_Powerup_Fnc_Kitchen_sink; };
		case 13 : { [] call NJP_Client_Powerup_Fnc_Miller; };
		case 14 : { [] call NJP_Client_Powerup_Fnc_Washing_Machine; };
		case 15 : { [] call NJP_Client_Powerup_Fnc_Fus_Ro_Dah; };
		case 16 : { [] call NJP_Client_Powerup_Fnc_Change_Mass; };
		case 17 : { [] call NJP_Client_Powerup_Fnc_Miller_Lite; };
	};
};

if (Current_Place >= (_Count_Racers * 0.4) && Current_Place <= (_Count_Racers * 0.6)) exitwith 
{

	_Powerup = [1,17] call BIS_fnc_randomInt;

	switch (_Powerup) do
	{
		case 1 : { [] call NJP_Client_Powerup_Fnc_Bunny_IED; };
		case 2 : { [] call NJP_Client_Powerup_Fnc_Bomb; };
		case 3 : { [] call NJP_Client_Powerup_Fnc_Banana; };
		case 4 : { [] call NJP_Client_Powerup_Fnc_Involuntary_Boost; };
		case 5 : { [] call NJP_Client_Powerup_Fnc_Triple_Bomb; };
		case 6 : { [] call NJP_Client_Powerup_Fnc_Lightning; };
		case 7 : { [] call NJP_Client_Powerup_Fnc_Banana_Gun; };
		case 8 : { [] call NJP_Client_Powerup_Fnc_Triple_Boost; };
		case 9 : { [] call NJP_Client_Powerup_Fnc_Triple_Boost; };
		case 10 : { [] call NJP_Client_Powerup_Fnc_Boost; };
		case 11 : { [] call NJP_Client_Powerup_Fnc_Boost; };
		case 12 : { [] call NJP_Client_Powerup_Fnc_Kitchen_sink; };
		case 13 : { [] call NJP_Client_Powerup_Fnc_Miller; };
		case 14 : { [] call NJP_Client_Powerup_Fnc_Washing_Machine; };
		case 15 : { [] call NJP_Client_Powerup_Fnc_Fus_Ro_Dah; };
		case 16 : { [] call NJP_Client_Powerup_Fnc_Change_Mass; };
		case 17 : { [] call NJP_Client_Powerup_Fnc_Miller_Lite; };
	};
};

if (Current_Place >= (_Count_Racers * 0.6) && Current_Place <= (_Count_Racers * 0.8)) exitwith 
{

	_Powerup = [1,11] call BIS_fnc_randomInt;

	switch (_Powerup) do
	{
		case 1 : { [] call NJP_Client_Powerup_Fnc_Involuntary_Boost; };
		case 2 : { [] call NJP_Client_Powerup_Fnc_Triple_Bomb; };
		case 3 : { [] call NJP_Client_Powerup_Fnc_Lightning; };
		case 4 : { [] call NJP_Client_Powerup_Fnc_Triple_Boost; };
		case 5 : { [] call NJP_Client_Powerup_Fnc_Boost; };
		case 6 : { [] call NJP_Client_Powerup_Fnc_Kitchen_sink; };
		case 7 : { [] call NJP_Client_Powerup_Fnc_Miller; };
		case 8 : { [] call NJP_Client_Powerup_Fnc_Fus_Ro_Dah; };
		case 9 : { [] call NJP_Client_Powerup_Fnc_CP_Tele; };
		case 10 : { [] call NJP_Client_Powerup_Fnc_Blue_Shell; };
		case 11 : { [] call NJP_Client_Powerup_Fnc_Miller_Lite; };
	};
};

if (Current_Place >= (_Count_Racers * 0.8) && Current_Place <= _Count_Racers) exitwith 
{

	_Powerup = [1,7] call BIS_fnc_randomInt;

	switch (_Powerup) do
	{
		case 1 : { [] call NJP_Client_Powerup_Fnc_Lightning; };
		case 2 : { [] call NJP_Client_Powerup_Fnc_Triple_Boost; };
		case 3 : { [] call NJP_Client_Powerup_Fnc_CP_Tele; };
		case 4 : { [] call NJP_Client_Powerup_Fnc_Kitchen_sink; };
		case 5 : { [] call NJP_Client_Powerup_Fnc_Boost; };
		case 6 : { [] call NJP_Client_Powerup_Fnc_CP_Tele; };
		case 7 : { [] call NJP_Client_Powerup_Fnc_Blue_Shell; };
	};
};
