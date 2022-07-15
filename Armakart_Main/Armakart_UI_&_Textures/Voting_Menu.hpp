class Voting_Menu
{
	idd = 123456;

	movingEnable = false;

	class controls
	{
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Njpatman, v1.063, #Cirabi)
		////////////////////////////////////////////////////////

		class RscText_1245: RscText
		{
			idc = 1008;

			x = 0.381406 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;

			text = "<t align = 'center' size='2.45'>--- Voting ---</t>"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			text = "<t align = 'center' size='1.8'>- Weather -</t>"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscStructuredText_1102: RscStructuredText
		{
			idc = 1102;
			text = "<t align = 'center' size='1.8'>- Time -</t>"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			action = "remoteExec ['NJP_Server_fnc_Weather_Clear_Vote', 2];		     ctrlEnable [1601, false]; ctrlEnable [1602, false]; ctrlEnable [1603, false]; ctrlEnable [1604, false]; ctrlEnable [1600, false];";

			text = "Clear"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = { "", 0, 1};
			soundPush[] = { "", 0, 1};
			soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEscape[] = { "", 0, 1};
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			action = "remoteExec ['NJP_Server_fnc_Weather_Cloudy_Vote', 2];				ctrlEnable [1601, false]; ctrlEnable [1602, false]; ctrlEnable [1603, false]; ctrlEnable [1604, false]; ctrlEnable [1600, false];";

			text = "Cloudy"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = { "", 0, 1};
			soundPush[] = { "", 0, 1};
			soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEscape[] = { "", 0, 1};
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			action = "remoteExec ['NJP_Server_fnc_Weather_Foggy_Vote', 2];				ctrlEnable [1601, false]; ctrlEnable [1602, false]; ctrlEnable [1603, false]; ctrlEnable [1604, false]; ctrlEnable [1600, false];";

			text = "Foggy"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = { "", 0, 1};
			soundPush[] = { "", 0, 1};
			soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEscape[] = { "", 0, 1};
		};
		class RscButton_1604: RscButton
		{
			idc = 1604;
			action = "remoteExec ['NJP_Server_fnc_Weather_Light_Rain_Vote', 2];				ctrlEnable [1601, false]; ctrlEnable [1602, false]; ctrlEnable [1603, false]; ctrlEnable [1604, false]; ctrlEnable [1600, false];";

			text = "Light Rain"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = { "", 0, 1};
			soundPush[] = { "", 0, 1};
			soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEscape[] = { "", 0, 1};
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;

			action = "remoteExec ['NJP_Server_fnc_Weather_Stormy_Vote', 2];				ctrlEnable [1601, false]; ctrlEnable [1602, false]; ctrlEnable [1603, false]; ctrlEnable [1604, false]; ctrlEnable [1600, false];";

			text = "Stormy"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = { "", 0, 1};
			soundPush[] = { "", 0, 1};
			soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEscape[] = { "", 0, 1};
		};
		class RscButton_1605: RscButton
		{
			idc = 1605;

			action = "remoteExec ['NJP_Server_fnc_Time_Early_Morning_Vote', 2];					ctrlEnable [1605, false]; ctrlEnable [1606, false]; ctrlEnable [1607, false]; ctrlEnable [1608, false]; ctrlEnable [1609, false];";

			text = "Early Morning"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = { "", 0, 1};
			soundPush[] = { "", 0, 1};
			soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEscape[] = { "", 0, 1};
		};
		class RscButton_1606: RscButton
		{
			idc = 1606;

			action = "remoteExec ['NJP_Server_fnc_Time_Noon_Vote', 2];			ctrlEnable [1605, false]; ctrlEnable [1606, false]; ctrlEnable [1607, false]; ctrlEnable [1608, false]; ctrlEnable [1609, false];";

			text = "Noon"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = { "", 0, 1};
			soundPush[] = { "", 0, 1};
			soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEscape[] = { "", 0, 1};
		};
		class RscButton_1607: RscButton
		{
			idc = 1607;

			action = "remoteExec ['NJP_Server_fnc_Time_Late_Afternoon_Vote', 2];				ctrlEnable [1605, false]; ctrlEnable [1606, false]; ctrlEnable [1607, false]; ctrlEnable [1608, false]; ctrlEnable [1609, false];";

			text = "Late Afternoon"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = { "", 0, 1};
			soundPush[] = { "", 0, 1};
			soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEscape[] = { "", 0, 1};
		};
		class RscButton_1608: RscButton
		{
			idc = 1608;

			action = "remoteExec ['NJP_Server_fnc_Time_Night_Vote', 2];				ctrlEnable [1605, false]; ctrlEnable [1606, false]; ctrlEnable [1607, false]; ctrlEnable [1608, false]; ctrlEnable [1609, false];";

			text = "Night"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = { "", 0, 1};
			soundPush[] = { "", 0, 1};
			soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEscape[] = { "", 0, 1};
		};
		class RscButton_1609: RscButton
		{
			idc = 1609;

			action = "remoteExec ['NJP_Server_fnc_Time_Night_Full_Moon_Vote', 2];				ctrlEnable [1605, false]; ctrlEnable [1606, false]; ctrlEnable [1607, false]; ctrlEnable [1608, false]; ctrlEnable [1609, false];";

			text = "Night (Full Moon)"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			soundEnter[] = { "", 0, 1};
			soundPush[] = { "", 0, 1};
			soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEscape[] = { "", 0, 1};
		};
		class RscText_1248: RscText
		{
			idc = 1000;

			x = 0.381406 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.528 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscText_1247: RscText
		{
			idc = 1001;

			x = 0.603125 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.528 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscText_1249: RscText
		{
			idc = 1003;

			x = 0.386562 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscText_1246: RscText
		{
			idc = 1004;

			x = 0.386562 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscText_1001: RscText
		{
			idc = 1001;

			x = 0.489687 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscText_1006: RscText
		{
			idc = 1004;

			x = 0.386562 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscText_1007: RscText
		{
			idc = 1004;

			x = 0.386562 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscText_1008: RscText
		{
			idc = 1001;

			x = 0.489687 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////


	};
};
