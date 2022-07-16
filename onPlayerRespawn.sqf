#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_R, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_R, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

uiSleep 0.85;

"In_Race_UI_Layer" cutFadeOut 0.001;
"Crosshair_Layer" cutFadeOut 0.001;

No_item = false;

Initial_hint = false;

Player_Finished = true;

_Group = createGroup sideLogic;

[player] joinSilent _Group;

[true] call ace_spectator_fnc_setSpectator;