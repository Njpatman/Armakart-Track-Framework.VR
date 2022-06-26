/* 
*
* - Initializes sub checkpoints
* 
*/

{

	_Dir = getDir _x;
	_Sub_CP_Trigger = createTrigger ["EmptyDetector", getPos _x];
	_Sub_CP_Trigger attachTo [_x, [0,0,0]];
	detach _Sub_CP_Trigger;

	uiSleep 0.5;

	[_Sub_CP_Trigger, [20, 20, _Dir, true, 20]] remoteExec ["setTriggerArea", 0, false];
	[_Sub_CP_Trigger, ["WEST", "PRESENT", true]] remoteExec ["setTriggerActivation", 0, false];
	[_Sub_CP_Trigger, ["vehicle player in thislist", 
	"
		_trigger = thistrigger;

		[_trigger] Spawn {

			params ['_trig'];

			_Sub_CP = getPos _trig nearestObject 'Sign_Arrow_Large_Cyan_F';
			
			_Sub_CP_Name_str = vehicleVarName _Sub_CP;

			_Sub_CP_Num_Array = toArray _Sub_CP_Name_str;

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

			_Sub_CP_Num_Add_str = 'Next_Sub_CP_Num = 1 +' + (_Next_Sub_CP_Num_str);

			[] call compile _Sub_CP_Num_Add_str;
	
			if (Next_Sub_CP_Num isEqualTo Sub_Checkpoints_Number) then {

				Sub_CP_str = 'Sub_CP_obj = FINISH_LINE';

			} else {

				Sub_CP_str = 'Sub_CP_obj = Sub_CP_' + (str Next_Sub_CP_Num);

			};

			[] call compile Sub_CP_str;
	
		};

	", ""] ] remoteExec ["setTriggerStatements", 0, false];
	[_Sub_CP_Trigger, 0.4] remoteExec ["setTriggerInterval", 0, false];

} forEach (allMissionObjects "Sign_Arrow_Large_Cyan_F");