params ["_trig"];

_trig enableSimulationGlobal false;

_Block = getPos _trig nearestObject 'Land_VR_CoverObject_01_kneelHigh_F';

_Block hideObjectGlobal true;

[_Block, ["Item_Box_Hit", 85]] remoteExec ["say3D", 0];

uiSleep 3.85;

_Block hideObjectGlobal false;

_trig enableSimulationGlobal true;
