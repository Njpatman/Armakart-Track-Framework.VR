/*
	Author: Njpatman

	Description:
		Banana powerup, Simply spawns a banana and attaches a trigger to it
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Banana Status:  </t><t color='#eef441'>Droping...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_banana = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
			_banana attachTo [player, [0,-1.8,0.6]];
			[_banana, 2.4] remoteExec ["setObjectScale",0,true];
			_trgSpc = createTrigger ["EmptyDetector", [0,0,0]];
			[_trgSpc, [1, 4, (getDir player), true, 2]] remoteExec ["setTriggerArea",0,true];
			[_trgSpc, ["WEST", "PRESENT", false]] remoteExec ["setTriggerActivation",0,true];
			[_trgSpc, ["vehicle player in thislist", 
			"
			
			[] call NJP_Powerup_Effect_Fnc_Banana_Effect;
			_banana = getPosASL thistrigger nearestObject 'ACE_bananaItem';
			deleteVehicle _banana;
			deleteVehicle thistrigger;
			
			", ""]
			] remoteExec ["setTriggerStatements",0,true];
			uiSleep 0.5;
			detach _banana;
			uiSleep 0.25;
			_trgSpc attachTo [_banana, [0,0,0]];
			detach _trgSpc;
			[_trgSpc, 0.25] remoteExec ["setTriggerInterval", 0,true];

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Banana Status:  </t><t color='#ff0000'>Banana is set</t>";
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
		hintsilent parseText "<t>Banana Status:  </t><t color='#eef441'>Droping...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_banana = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
			_banana attachTo [player, [0,-1.8,0.6]];
			[_banana, 2.4] remoteExec ["setObjectScale",0,true];
			_trgSpc = createTrigger ["EmptyDetector", [0,0,0]];
			[_trgSpc, [1, 4, (getDir player), true, 2]] remoteExec ["setTriggerArea",0,true];
			[_trgSpc, ["WEST", "PRESENT", false]] remoteExec ["setTriggerActivation",0,true];
			[_trgSpc, ["vehicle player in thislist", 
			"
			
			[] call NJP_Powerup_Effect_Fnc_Banana_Effect;
			_banana = getPosASL thistrigger nearestObject 'ACE_bananaItem';
			deleteVehicle _banana;
			deleteVehicle thistrigger;
			
			", ""]
			] remoteExec ["setTriggerStatements",0,true];
			uiSleep 0.5;
			detach _banana;
			uiSleep 0.25;
			_trgSpc attachTo [_banana, [0,0,0]];
			detach _trgSpc;
			[_trgSpc, 0.25] remoteExec ["setTriggerInterval", 0,true];

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Banana Status:  </t><t color='#ff0000'>Banana is set</t>";
		playsound"hint";
		No_item = true;
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#FFFF00'>Banana acquired!</t><br/><br/><t>Banana Status:  </t><t color='#45f442'>Ready To Drop</t><br/><br/><t>The Banana is a banana that will push players backward if they run over it on the track.</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 1.5;
	};
};
playsound"hint";

