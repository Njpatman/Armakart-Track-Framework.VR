"In_Race_UI_Layer" cutFadeOut 0.001;
"Crosshair_Layer" cutFadeOut 0.001;

No_item = false;

Initial_hint = false;

Player_Finished = true;

_Group = createGroup sideLogic;

[player] joinSilent _Group;

[true] call ace_spectator_fnc_setSpectator;