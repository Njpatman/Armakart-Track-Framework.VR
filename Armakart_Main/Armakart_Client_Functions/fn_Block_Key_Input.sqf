if !(hasInterface) exitWith {};

_ctrl = _this select 0; 
_dikCode = _this select 1; 
_shift = _this select 2; 
_ctrlKey = _this select 3; 
_alt = _this select 4; 

Bkeys=[];

{Bkeys = Bkeys + [(actionKeys _x) select 0]} foreach [

"moveBack","moveDown","moveFastForward","moveForward","moveLeft","moveRight","moveSlowForward","turbo","turnLeft","turnRight",
"CarFastForward","CarBack","CarForward","CarLeft","CarMovement","CarRight","CarSlowForward","CarWheelLeft","CarWheelRight"

];

if (_dikCode in Bkeys) then { 

	true

}; 