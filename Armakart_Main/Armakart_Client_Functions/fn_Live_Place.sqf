/*
* 
* - Handles the updating for players live in-race UI.
* 
*/ 

// Exit if spectator
if (!hasInterface || (typeOf player isEqualTo "potato_spectate_spectator" || typeOf player isEqualTo "ace_spectator_virtual" || player in ([] call ace_spectator_fnc_players))) exitWith {};

#define _Personal_UI_Places uiNamespace getVariable ["Place_UI", controlNull]
#define _Personal_UI_CPs uiNamespace getVariable ["Personal_UI_CPs", controlNull]
#define _Personal_UI_Laps uiNamespace getVariable ["Personal_UI_Laps", controlNull]

While {!Player_Finished} do 
{

	if (player in (fullCrew [vehicle player, "driver", false] select 0)) then 
	{

		if (isNil 'Sub_CP_obj') then {

			Sub_CP_obj = FINISH_LINE;

		};

		Places_Live sort false;

		_dist = vehicle player distance Sub_CP_obj;
		_dist_calculated = -500;
		_dist_calculated = _dist - (_dist * 2);

		Loc_Array = [Current_Laps, Current_Checkpoint, Next_Sub_CP_Num, _dist_calculated, player, Current_Place];

		[Loc_Array] remoteExec ["NJP_Client_Fnc_Add_To_Places_Live_Array", 0, true];

		uiSleep 1.65;

		Places_Live sort false;

		//debug
		//hintsilent str Places_Live;

		Current_Place = Places_Live find Loc_Array;

		[Loc_Array] remoteExec ["NJP_Client_Fnc_Delete_From_Places_Live_Array", 0, true];

		Current_Place = Current_Place + 1;
				
	} else {

		Current_Place = "N/A";

	};

	if ((Current_Place isEqualTo "N/A")) then {

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