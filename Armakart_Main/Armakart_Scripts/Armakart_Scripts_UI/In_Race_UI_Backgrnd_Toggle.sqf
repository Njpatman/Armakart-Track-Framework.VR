/*
* 
* - Adds a keybind so players can toggle the background for the in-race ui.
* 
*/ 


#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["Armakart", "UI_Alt_KEY", "UI_Backgrnd_HIDE", {

	_In_Race_UI = findDisplay 1345;
	_Personal_UI_Background_1 = _In_Race_UI displayCtrl 1000;
	_Personal_UI_Background_2 = _In_Race_UI displayCtrl 1002;

	{
	_x ctrlSetBackgroundColor [-1,-1,-1,0];
	} forEach [_Personal_UI_Background_1, _Personal_UI_Background_2];

	["Armakart", "UI_Alt_KEY", "UI_Backgrnd_HIDE", {

		_In_Race_UI = findDisplay 1345;
		_Personal_UI_Background_1 = _In_Race_UI displayCtrl 1000;
		_Personal_UI_Background_2 = _In_Race_UI displayCtrl 1002;

		{
		_x ctrlSetBackgroundColor UI_Color;
		} forEach [_Personal_UI_Background_1, _Personal_UI_Background_2];

			call NJP_Client_Fnc_In_Race_UI_Backgrnoggle;

	}, {""}, [DIK_U, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_U, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;