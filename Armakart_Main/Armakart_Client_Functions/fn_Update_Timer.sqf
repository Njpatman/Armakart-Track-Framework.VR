if !(hasInterface) exitWith {};

Params ["_color", "_Time_left"];

#define _Timer uiNamespace getVariable [ "TimerCtrl", controlNull ]

_Timer ctrlSetStructuredText parseText format ["<t align = 'center' size='1.85' font='LCD14' color='%1'>-- %2 --</t>", _color, [(_Time_left/3600),"HH:MM:SS"] call BIS_fnc_timetostring];