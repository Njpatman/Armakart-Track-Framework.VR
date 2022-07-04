/*
	Author: Njpatman

	Description:
		A template for all the ambitious people who want to insert their own custom powerups into their track

	Note: I'm straight up not going to hold your hand, here are the other two files you need to modify, it's pretty damn self explanatory of what you need to do :

	* Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Armakart_Powerup_Master.sqf

	* Armakart_Main\Armakart_Scripts\Client_Fnc_Library.sqf

	if you want an alternate keybinding setup (ie: F is for launching forward and R is for launching behind) I'd recommend looking at Washing_Machine.sqf.

*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>*Name Of Powerup* Status:  </t><t color='#eef441'>Deploying...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			// *Code Goes Here* (has to be an exact copy of code bellow)

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>*Name Of Powerup* Status:  </t><t color='#ff0000'>Deployed</t>";
		playsound"hint";
		No_item = true;
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>*Name Of Powerup* Status:  </t><t color='#eef441'>Deploying...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			// *Code Goes Here* (has to be an exact copy of code above)

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>*Name Of Powerup* Status:  </t><t color='#ff0000'>Deployed</t>";
		playsound"hint";
		No_item = true;
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#ff0d00'>*Name Of Powerup* acquired!</t><br/><br/><t>*Name Of Powerup* Status:  </t><t color='#45f442'>Ready To Deploy</t><br/><br/><t>*Short And Concise Description Of Powerup*</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 1.5;
	};
};
playsound"hint";