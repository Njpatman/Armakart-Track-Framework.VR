if !(hasInterface) exitWith {};

params ["_GUI_Edit", "_Variable_1", "_Variable_2", "_Variable_3"];

disableSerialization;

#define _Pre_Race_UI_Bottom uiNamespace getVariable ["Pre_Race_UI_Bottom", controlNull]
#define _Timer_Title uiNamespace getVariable ["Timer_Title", controlNull]
#define _Loading_Screen_Main_Display uiNamespace getVariable ["Loading_Screen_Main_Display", controlNull]
#define _Loading_Screen_Left_Mid_Display uiNamespace getVariable ["Loading_Screen_Left_Bottom_Display", controlNull]
#define _Loading_Screen_Middle_Mid_Display uiNamespace getVariable ["Loading_Screen_Middle_Mid_Display", controlNull]
#define _Loading_Screen_Right_Mid_Display uiNamespace getVariable ["Loading_Screen_Right_Mid_Display", controlNull]
#define _Loading_Screen_Left_Bottom_Display uiNamespace getVariable ["Loading_Screen_Left_Mid_Display", controlNull]
#define _Loading_Screen_Middle_Bottom_Display uiNamespace getVariable ["Loading_Screen_Middle_Bottom_Display", controlNull]
#define _Loading_Screen_Right_Bottom_Display uiNamespace getVariable ["Loading_Screen_Right_Bottom_Display", controlNull]
#define _Loading_Screen_Bottom_Main_Display uiNamespace getVariable ["Loading_Screen_Bottom_Main_Display", controlNull]

switch (_GUI_Edit) do {

  case "Edit_Voting_Phase": { 

		// Exit if spectator
		if ((typeOf player isEqualTo "potato_spectate_spectator" || typeOf player isEqualTo "ace_spectator_virtual" || player in ([] call ace_spectator_fnc_players))) exitWith {

			_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'> </t>";

			_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Voting Time Left ---</t>";

			closeDialog 1235;

		};

		_Voting_UI = findDisplay 123456;
		_Voting = _Voting_UI displayCtrl 1008;

		//Get the UI color that was used on the Customization UI and applies it
		_Voting ctrlSetBackgroundColor UI_Color;

		_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'>If you exit the voting menu, you will not be able to open it again!</t>";

		_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Voting Time Left ---</t>";

    };

    case "Edit_Initial_Loading_Screen": {

		_Loading_Screen_Bottom_Main_Display ctrlSetStructuredText parseText format [ "<t color='#a7adba' font='PuristaSemibold' align = 'right' size='1.85'>Armakart %1 is Initializing, Please Stand By...</t>", Track_Title];
		_Loading_Screen_Main_Display ctrlSetStructuredText parseText "<t color='#c77518' font='PuristaSemibold' align = 'center' size='3.85'>Armakart is initializing, keep in mind that you have to ACE self-interact to reset to your last checkpoint!</t>";

		if (_Variable_1 isEqualTo CP_NUM && _Variable_2 isEqualTo SUB_CP_NUM && _Variable_3 isEqualTo PWR_BLK_NUM) then {
			
			_Loading_Screen_Bottom_Main_Display ctrlSetStructuredText parseText format [ "<t color='#a7adba' font='PuristaSemibold' align = 'right' size='1.85'>Armakart %1 Has Loaded, Please Stand By...</t>", Track_Title];
			_Loading_Screen_Main_Display ctrlSetStructuredText parseText "<t color='#c77518' font='PuristaSemibold' align = 'center' size='3.85'>Armakart initialization completed, keep in mind that you have to ACE self-interact to reset to your last checkpoint!</t>";
			
		};

		_color = "#ff0000";
		if (_Variable_1 > (0.5 * CP_NUM)) then {_color = "#eef441";};
		if (_Variable_1 isEqualTo CP_NUM) then {_color = "#45f442";};

		_Loading_Screen_Left_Mid_Display ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Checkpoints</t>", _color];

		_Loading_Screen_Left_Bottom_Display ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%3' size='1.70'>%1/%2</t>", _Variable_1, CP_NUM, _color];

		_color = "#ff0000";
		if (_Variable_2 > (0.5 * SUB_CP_NUM)) then {_color = "#eef441";};
		if (_Variable_2 isEqualTo SUB_CP_NUM) then {_color = "#45f442";};

		_Loading_Screen_Middle_Mid_Display ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Sub Checkpoints</t>", _color];

		_Loading_Screen_Middle_Bottom_Display ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%3' size='1.70'>%1/%2</t>", _Variable_2, SUB_CP_NUM, _color];

		_color = "#ff0000";
		if (_Variable_3 > (0.5 * PWR_BLK_NUM)) then {_color = "#eef441";};
		if (_Variable_3 isEqualTo PWR_BLK_NUM) then {_color = "#45f442";};

		_Loading_Screen_Right_Mid_Display ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Powerup Blocks</t>", _color];

		_Loading_Screen_Right_Bottom_Display ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%3' size='1.70'>%1/%2</t>", _Variable_3, PWR_BLK_NUM, _color];

    };

	case "Edit_Track_Loading_Screen": { 

		_Loading_Screen_Bottom_Main_Display ctrlSetStructuredText parseText "<t color='#a7adba' font='PuristaSemibold' align = 'right' size='1.85'>The Track is Initializing, Please Stand By...</t>";
		_Loading_Screen_Main_Display ctrlSetStructuredText parseText "<t color='#c77518' font='PuristaSemibold' align = 'center' size='3.2'>Track Weather and Time are initializing, keep in mind that you have to ACE self-interact to reset to your last checkpoint. Otherwise, good luck!</t>";

		if (_Variable_1) then {
			
			_Loading_Screen_Bottom_Main_Display ctrlSetStructuredText parseText "<t color='#a7adba' font='PuristaSemibold' align = 'right' size='1.85'>Track initialization completed, Please Stand By...</t>";
			_Loading_Screen_Main_Display ctrlSetStructuredText parseText "<t color='#c77518' font='PuristaSemibold' align = 'center' size='3.2'>Track Weather and Time Initialized, keep in mind that you have to ACE self-interact to reset to your last checkpoint. Otherwise, good luck!</t>";
			
		};

		_color = "#ff0000";
		_1_Str = "Calculating...";
		if (!isNil "_Variable_2") then {
			
			_color = "#45f442";
			_1_Str = _Variable_2;
		
		};

		_Loading_Screen_Left_Mid_Display ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Weather</t>", _color];

		_Loading_Screen_Left_Bottom_Display ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.25'>%2</t>", _color, _1_Str];

		_color = "#ff0000";
		_Server_Str = "Loading...";
		if (!isNil "_Variable_2") then {_color = "#eef441";};
		if (!isNil "_Variable_2" && !isNil "_Variable_3") then {
			
			_color = "#45f442";
			_Server_Str = "Loaded";
		
		};

		_Loading_Screen_Middle_Mid_Display ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Track</t>", _color];

		_Loading_Screen_Middle_Bottom_Display ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.45'>%2</t>", _color, _Server_Str];

		_color = "#ff0000";
		_2_Str = "Calculating...";
		_Size = 1.25;
		if (!isNil "_Variable_3") then {
			
			_color = "#45f442";
			_2_Str = _Variable_3;

			if ((_Variable_3 isEqualTo "Night Full Moon") || (_Variable_3 isEqualTo "Late Afternoon")) then {_Size = 0.92;};
			
		};

		_Loading_Screen_Right_Mid_Display ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.65'>Time</t>", _color];

		_Loading_Screen_Right_Bottom_Display ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' color='%1' size='%3'>%2</t>", _color, _2_Str, _Size];

    };

};