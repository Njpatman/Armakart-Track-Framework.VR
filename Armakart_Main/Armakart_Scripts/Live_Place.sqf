/*
* 
* - Handles the updating for players live in-race UI.
* 
*/ 
if !(hasInterface) exitWith {};

#define _Personal_UI_Places uiNamespace getVariable ["Place_UI", controlNull]
#define _Personal_UI_CPs uiNamespace getVariable ["Personal_UI_CPs", controlNull]
#define _Personal_UI_Laps uiNamespace getVariable ["Personal_UI_Laps", controlNull]

Loc_Array = [Current_Laps, Current_Checkpoint, 0, 0, player];

[Loc_Array] remoteExec ["NJP_ADD_PLAYER_ARRAY_TO_PLACES_ARRAY", 0];

While {alive player} do 
{

	if (player in (fullCrew [vehicle player, "driver", false] select 0)) then 
	{

		[Loc_Array] remoteExec ["NJP_DELETE_PLAYER_ARRAY_FROM_PLACES_ARRAY", 0];

		if (isNil 'Sub_CP_obj') then {

			Sub_CP_obj = FINISH_LINE;

		};

		_dist = vehicle player distance Sub_CP_obj;
		_dist_calculated = -500;
		_dist_calculated = _dist - (_dist * 2);

		_Current_Sub_CP = 0;
		_Current_Sub_CP = Next_Sub_CP_Num - 1;

		Loc_Array = [Current_Laps, Current_Checkpoint, _Current_Sub_CP, _dist_calculated, player];

		[Loc_Array] remoteExec ["NJP_ADD_PLAYER_ARRAY_TO_PLACES_ARRAY", 0];

		uiSleep 1.65;

		Places_Live sort false;

		//debug
		//hintsilent str Places_Live;

		Current_Place = Places_Live find Loc_Array;

		Current_Place = Current_Place + 1;
				
	} else {

		Current_Place = "N/A";

	};

	if (Current_Place isEqualTo "N/A") then {

		_Personal_UI_Places ctrlSetStructuredText parseText "<t color = '#FF0000' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='1.85'>N/A</t>";
		
	} else {

		_Current_Place_ordinal = [Current_Place, "English", false] call BIS_fnc_ordinalNumber;

		switch (_Current_Place_ordinal) do 
		{
			case "1st" : 
			{
				_Personal_UI_Places ctrlSetStructuredText parseText format ["<t color = '#FFD700' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>1st</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %1</t>", count Places_Live];
			};
			case "2nd" : 
			{
				_Personal_UI_Places ctrlSetStructuredText parseText format ["<t color = '#C0C0C0' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>2nd</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %1</t>", count Places_Live];
			};
			case "3rd" : 
			{
				_Personal_UI_Places ctrlSetStructuredText parseText format ["<t color = '#8B4513' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>3rd</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %1</t>", count Places_Live];
			};
			default 
			{
				_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>%1</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %2</t>", _Current_Place_ordinal, count Places_Live];
			};
		};
	};

	_Personal_UI_CPs ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' size='1.78'>%1/%2</t>", Current_Checkpoint, CP_NUM];

	_Personal_UI_Laps ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' size='1.78'>%1/%2</t>", Current_Laps, Laps_number];
				
};

if (Current_Place isEqualTo "N/A") exitwith {};

[Loc_Array] remoteExec ["NJP_DELETE_PLAYER_ARRAY_FROM_PLACES_ARRAY", 0];

[[999, 999, 999, player]] remoteExec ["NJP_ADD_PLAYER_ARRAY_TO_PLACES_ARRAY", 0];