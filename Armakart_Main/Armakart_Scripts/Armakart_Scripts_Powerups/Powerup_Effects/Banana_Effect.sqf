
_vehicle=vehicle player;
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = -30;
_vehicle setVelocity [
	(_vel select 0) + (sin _dir * _speed), 
	(_vel select 1) + (cos _dir * _speed), 
	(_vel select 2)
];

