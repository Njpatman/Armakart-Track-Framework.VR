//Creates Customization Menu
["Customization_Timer_Layer", ["Customization_Timer_UI", "PLAIN"]] remoteExec ["cutRsc", 0, true];
["Customization_Menu"] remoteExec ["createDialog", 0, false];

remoteExec ["NJP_Client_fnc_UI_Color_Swap", 0, false];

[[],{ 
	
	if !(hasInterface) exitWith {};

	if ((typeOf player isEqualTo "potato_spectate_spectator" || typeOf player isEqualTo "ace_spectator_virtual" || player in ([] call ace_spectator_fnc_players))) then {

		disableSerialization;

		#define _Pre_Race_UI_Bottom uiNamespace getVariable ["Pre_Race_UI_Bottom", controlNull]
		_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'> </t>";

		closeDialog 1234;

	};

}] remoteExec ["Spawn", 0, false];

//- Adds a timer to the players screen, which should give the time until the next phase or race start -\\

[( "Timer" call BIS_fnc_rscLayer ), ["Timer", "PLAIN"]] remoteExec ["cutRsc", 0];

_color = "#45f442";//green

//Default
_Time_left = 45;

_Customization_time_Left = Customization_Phase_Time + time;

while {_Time_left > 0} do {

	uiSleep 1;

	_Time_left = _Customization_time_Left - time;

	if (_Time_left < 31) then {_color = "#eef441";};//yellow

	if (_Time_left < 16) then {_color = "#ff0000";};//red

	[_color, _Time_left] remoteExec ["NJP_Client_fnc_Update_Timer", 0, true];

};

//Removes Customization Menu Reset option
[[],{ [player, 1,["ACE_SelfActions","Reset_Menu"]] call ace_interact_menu_fnc_removeActionFromObject; }] remoteExec ["Spawn", 0, true];

//Closes Customization Menu
[1234] remoteExec ["closeDialog", 0, true];