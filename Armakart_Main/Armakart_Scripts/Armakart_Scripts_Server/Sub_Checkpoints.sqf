/* 
*
* - Initializes sub checkpoints
* 
*/

{
	
	_Sub_CP_Trigger = createTrigger ["EmptyDetector", getPos _x];
	_Sub_CP_Trigger attachTo [_x, [0,0,0]];
	detach _Sub_CP_Trigger;

	uiSleep 0.1;

	[_Sub_CP_Trigger, Sub_CP_Size_Array] remoteExec ["setTriggerArea", 0, false];
	[_Sub_CP_Trigger, ["WEST", "PRESENT", true]] remoteExec ["setTriggerActivation", 0, false];
	[_Sub_CP_Trigger, ["vehicle player in thislist", 
	"
	
		_trigger = thisTrigger;

		_Sub_CP = getPos _trigger nearestObject 'Sign_Arrow_Large_Cyan_F';
			
		Sub_CP_Name_str = vehicleVarName _Sub_CP;

		{ if (Sub_CP_Name_str isEqualTo _x) exitWith {Sub_CP_Manual_Override = true;}; } forEach Manual_Sub_Checkpoint_Array;

		if (!Sub_CP_Manual_Override) then {

			_Sub_CP_Num_Array = toArray Sub_CP_Name_str;

			_Sub_CP_Num_1 = _Sub_CP_Num_Array select 7;

			_Sub_CP_Num_1 = _Sub_CP_Num_1 - 48;

			_Sub_CP_Num_1_str = str _Sub_CP_Num_1;

			_Next_Sub_CP_Num_str = _Sub_CP_Num_1_str;

			_Sub_CP_Num_2 = _Sub_CP_Num_Array select 8;

			if !(isNil '_Sub_CP_Num_2') then {

				_Sub_CP_Num_2 = _Sub_CP_Num_2 - 48;

				_Sub_CP_Num_2_str = str _Sub_CP_Num_2;

				_Next_Sub_CP_Num_str = _Next_Sub_CP_Num_str + (_Sub_CP_Num_2_str);

				_Sub_CP_Num_3 = _Sub_CP_Num_Array select 9;

				if !(isNil '_Sub_CP_Num_3') then {

					_Sub_CP_Num_3 = _Sub_CP_Num_3 - 48;

					_Sub_CP_Num_3_str = str _Sub_CP_Num_3;

					_Next_Sub_CP_Num_str = _Next_Sub_CP_Num_str + (_Sub_CP_Num_3_str);
				
				};
				
			};

			_Sub_CP_Num_Add_str = 'Next_Sub_CP_Num = 1 + ' + (_Next_Sub_CP_Num_str);
			
			[] call compile _Sub_CP_Num_Add_str;
		
			if (Next_Sub_CP_Num isEqualTo SUB_CP_NUM) then {

				Sub_CP_str = 'Sub_CP_obj = FINISH_LINE';

			} else {

				Sub_CP_str = 'Sub_CP_obj = Sub_CP_' + (str Next_Sub_CP_Num);

			};

			[] call compile Sub_CP_str;

		} else {Sub_CP_Manual_Override = false;};

	", ""] ] remoteExec ["setTriggerStatements", 0, false];
	[_Sub_CP_Trigger, 0.5] remoteExec ["setTriggerInterval", 0, false];

} forEach (allMissionObjects "Sign_Arrow_Large_Cyan_F");

"|Armakart System| : Sub Checkpoint initialization completed!" remoteExec ["systemChat", 0];

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Initializing Sub Checkpoints.";
diag_log format ["|Armakart System| : Time for Sub Checkpoints to init: %1.", diag_tickTime];
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";