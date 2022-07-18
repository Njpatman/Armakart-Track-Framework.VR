//Creates Customization Menu
["Customization_Timer_Layer", ["Customization_Timer_UI", "PLAIN"]] remoteExec ["cutRsc", 0, true];
["Customization_Menu"] remoteExec ["createDialog", 0, false];

remoteExec ["NJP_Client_fnc_UI_Color_Swap", 0, false];

["Edit_Customization_Phase"] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];

//- Adds a timer to the players screen, which should give the time until the next phase or race start -\\

[( "Timer" call BIS_fnc_rscLayer ), ["Timer", "PLAIN"]] remoteExec ["cutRsc", 0];

_color = "#45f442";//green

//Default
_Time_left = 45;

[_color, Customization_Phase_Time] remoteExec ["NJP_Client_fnc_Update_Timer", 0, true];

uiSleep 1;

_Customization_time_Left = Customization_Phase_Time + time;

while {_Time_left > 0} do {

	uiSleep 0.25;

	_Time_left = _Customization_time_Left - time;

	if (_Time_left < (Customization_Phase_Time * 0.35)) then {_color = "#eef441";};//yellow

	if (_Time_left < (Customization_Phase_Time * 0.15)) then {_color = "#ff0000";};//red

	[_color, _Time_left] remoteExec ["NJP_Client_fnc_Update_Timer", 0, true];

};

//Removes Customization Menu Reset option
[[],{ [player, 1,["ACE_SelfActions","Reset_Menu"]] call ace_interact_menu_fnc_removeActionFromObject; }] remoteExec ["Spawn", 0, true];

//Closes Customization Menu
[1234] remoteExec ["closeDialog", 0, true];