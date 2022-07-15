if !(hasInterface) exitWith {};

// Exit if spectator
if ((typeOf player isEqualTo "potato_spectate_spectator" || typeOf player isEqualTo "ace_spectator_virtual" || player in ([] call ace_spectator_fnc_players))) exitWith {
	
	systemChat "|Armakart System| : Detected that player is a spectator, skipping NJP_Client_Fnc_Voting_Phase_Edit";

	disableSerialization;

	#define _Pre_Race_UI_Bottom uiNamespace getVariable ["Pre_Race_UI_Bottom", controlNull]
	#define _Timer_Title uiNamespace getVariable ["Timer_Title", controlNull]

	_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'> </t>";

	_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Voting Time Left ---</t>";

	closeDialog 1235;

};

disableSerialization;

#define _Pre_Race_UI_Bottom uiNamespace getVariable ["Pre_Race_UI_Bottom", controlNull]
#define _Timer_Title uiNamespace getVariable ["Timer_Title", controlNull]

_Voting_UI = findDisplay 123456;
_Voting = _Voting_UI displayCtrl 1008;

//Get the UI color that was used on the Customization UI and applies it
_Voting ctrlSetBackgroundColor UI_Color;

_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'>If you exit the voting menu, you will not be able to open it again!</t>";

_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Voting Time Left ---</t>";