class Customization_Menu
{
	idd = 1286;

	movingEnable = false;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Njpatman, v1.063, #Buwije)
		////////////////////////////////////////////////////////

		class UI_Color_1: RscText
		{
			idc = 1060;

			x = 0.814531 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.682 * safezoneH;
		};
		class UI_Color_2: RscText
		{
			idc = 1061;

			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.682 * safezoneH;
		};
		class UI_Color_3: RscText
		{
			idc = 1062;

			x = 0.412344 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscFrame_1801: RscFrame
		{
			idc = 1800;

			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.682 * safezoneH;
		};
		class Background_2: RscFrame
		{
			idc = 1800;

			x = 0.814531 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.682 * safezoneH;
		};
		class Text_1: RscStructuredText
		{
			idc = 1101;

			text = "<t align = 'center' size='2.2'>- Characters -</t>"; //--- ToDo: Localize;
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.72};
		};
		class Text_2: RscStructuredText
		{
			idc = 1089;

			text = "<t align = 'center' size='2.2'>- Kart Colors -</t>"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.72};
		};
				class RscText_1005: RscText
		{
			idc = 1004;

			x = 0.819687 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class RscText_1007: RscText
		{
			idc = 1004;

			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class RscText_1008: RscText
		{
			idc = 1004;

			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class RscText_1009: RscText
		{
			idc = 1001;

			x = 0.180312 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.682 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class RscText_1010: RscText
		{
			idc = 1001;

			x = 0.005 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.682 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class RscStructuredText_1104: RscStructuredText
		{
			idc = 1102;

			text = " "; //--- ToDo: Localize;
			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.561 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class RscText_1011: RscText
		{
			idc = 1004;

			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class Border_1: RscText
		{
			idc = 1001;

			x = 0.814531 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.682 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class Border_2: RscText
		{
			idc = 1002;

			x = 0.989844 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.682 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class Border_3: RscText
		{
			idc = 1004;

			x = 0.819687 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class Border_4: RscText
		{
			idc = 1003;

			x = 0.819687 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class Border_5: RscStructuredText
		{
			idc = 1102;

			text = " "; //--- ToDo: Localize;
			x = 0.902187 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.561 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.64};
		};
		class RscButton_1629: RscButton
		{
			idc = 1610;
			action = "call NJP_Client_Fnc_UI_Color_Swap;";

			text = "-- Customization UI --"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.85};
			tooltip = ">> CLICK ME <<"; //--- ToDo: Localize;
			sizeEX = 0.065;
		};
		class Button_14: RscButton
		{
			idc = 1613;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0,0,1,0.5)'];";

			text = "Blue"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_15: RscButton
		{
			idc = 1614;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.749,0.506,0.416,0.5)'];";

			text = "Copper Rose"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_16: RscButton
		{
			idc = 1615;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(1,1,1,0.5)'];";

			text = "White"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_24: RscButton
		{
			idc = 1616;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.608,0.067,0.118,0.5)'];";

			text = "Dark Ruby"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Buttton_17: RscButton
		{
			idc = 1617;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0,0.25,0,0.5)'];";

			text = "Green"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_18: RscButton
		{
			idc = 1618;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.5,0,1,0.5)'];";

			text = "Purple"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_19: RscButton
		{
			idc = 1619;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0,1,1,0.5)'];";

			text = "Teal"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_20: RscButton
		{
			idc = 1620;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.412,0.412,0.412,0.5)'];";

			text = "Grey"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_21: RscButton
		{
			idc = 1621;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(1,0.5,0,0.5)'];";

			text = "Orange"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_22: RscButton
		{
			idc = 1622;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.314,0.784,0.471,0.5)'];";

			text = "Emerald"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_23: RscButton
		{
			idc = 1623;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.5,0.1,0.5,0.5)'];";

			text = "Pink"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_25: RscButton
		{
			idc = 1624;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.2,0,0,0.5)'];";

			text = "Maroon"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Button_26: RscButton
		{
			idc = 1625;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.902,0.62,0.498,0.5)'];";

			text = "Light Copper"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1600: RscButton
		{
			idc = 1613;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.42,0.557,0.137,0.5)'];";

			text = "Olive"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1601: RscButton
		{
			idc = 1614;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.69,0.549,0.341,0.5)'];";

			text = "Tan"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1602: RscButton
		{
			idc = 1615;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(1,0,1,0.5)'];";

			text = "Magenta"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1603: RscButton
		{
			idc = 1617;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(1,1,0,0.5)'];";

			text = "Yellow"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1604: RscButton
		{
			idc = 1618;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.5,1,0,0.5)'];";

			text = "Lime"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1605: RscButton
		{
			idc = 1619;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.6,0.4,0.8,0.5)'];";

			text = "Amethyst"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1606: RscButton
		{
			idc = 1620;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.706,0.769,0.141,0.5)'];";

			text = "Peridot"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1607: RscButton
		{
			idc = 1621;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.588,0.294,0,0.5)'];";

			text = "Brown"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1608: RscButton
		{
			idc = 1622;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.718,0.431,0.475,0.5)'];";

			text = "Rose Gold"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1609: RscButton
		{
			idc = 1623;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.1,0.4,0.7,0.5)'];";

			text = "Light Blue"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1637: RscButton
		{
			idc = 1616;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0,0,0,0)'];";

			text = "Black"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1638: RscButton
		{
			idc = 1624;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.639,0.282,0.153,0.5)'];";

			text = "Dark Copper"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1639: RscButton
		{
			idc = 1625;
			action = "vehicle player setObjectTextureGlobal [0, '#(rgb,8,8,3)color(1,0,0,0.5)'];";

			text = "Red"; //--- ToDo: Localize;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class RscButton_1655: RscButton
		{
			idc = 1601;
			action = "['Farmer'] call NJP_Client_Fnc_Character_Swap";

			text = "Farmer"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "For when you just want to be another face in the crowd"; //--- ToDo: Localize;
		};
		class RscButton_1626: RscButton
		{
			idc = 1612;
			action = "['LOW_Construction'] call NJP_Client_Fnc_Character_Swap";

			text = "[LOW] Worker"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Laws Of War DLC"; //--- ToDo: Localize;
		};
		class RscButton_1627: RscButton
		{
			idc = 1611;
			action = "['LOW_Paramedic'] call NJP_Client_Fnc_Character_Swap";

			text = "[LOW] Paramedic"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Laws Of War DLC"; //--- ToDo: Localize;
		};
		class RscButton_1628: RscButton
		{
			idc = 1610;
			action = "['LOW_Aid_Worker'] call NJP_Client_Fnc_Character_Swap";

			text = "[LOW] Aid Worker"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Laws Of War DLC"; //--- ToDo: Localize;
		};
				class RscButton_1640: RscButton
		{
			idc = 1611;
			action = "['LOW_IDAP'] call NJP_Client_Fnc_Character_Swap";

			text = "[LOW] IDAP"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Laws Of War DLC"; //--- ToDo: Localize;
		};
		class RscButton_1641: RscButton
		{
			idc = 1612;
			action = "['LOW_EOD'] call NJP_Client_Fnc_Character_Swap";

			text = "[LOW] EOD"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Laws Of War DLC"; //--- ToDo: Localize;
		};
		class RscButton_1642: RscButton
		{
			idc = 1610;
			action = "['LOW_Mechanic'] call NJP_Client_Fnc_Character_Swap";

			text = "[LOW] Mechanic"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Laws Of War DLC"; //--- ToDo: Localize;
		};
		class RscButton_1610: RscButton
		{
			idc = 1609;
			action = "['CON_Spetsnaz'] call NJP_Client_Fnc_Character_Swap";

			text = "[CON] Spetsnaz"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Contact DLC"; //--- ToDo: Localize;
		};
		class RscButton_1611: RscButton
		{
			idc = 1608;
			action = "['CON_Nerd'] call NJP_Client_Fnc_Character_Swap";

			text = "[CON] Nerd"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Contact DLC"; //--- ToDo: Localize;
		};
		class RscButton_1612: RscButton
		{
			idc = 1607;
			action = "['CON_Scientist'] call NJP_Client_Fnc_Character_Swap";

			text = "[CON] Scientist"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Contact DLC"; //--- ToDo: Localize;
		};
		class RscButton_1643: RscButton
		{
			idc = 1609;
			action = "['CON_Looter'] call NJP_Client_Fnc_Character_Swap";

			text = "[CON] Looter"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Contact DLC"; //--- ToDo: Localize;
		};
		class RscButton_1644: RscButton
		{
			idc = 1608;
			action = "['CON_LDF'] call NJP_Client_Fnc_Character_Swap";

			text = "[CON] LDF"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Contact DLC"; //--- ToDo: Localize;
		};
		class RscButton_1645: RscButton
		{
			idc = 1607;
			action = "['CON_CBRN'] call NJP_Client_Fnc_Character_Swap";

			text = "[CON] CBRN"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Requires Contact DLC"; //--- ToDo: Localize;
		};
		class RscButton_1630: RscButton
		{
			idc = 1606;
			action = "['Police'] call NJP_Client_Fnc_Character_Swap";

			text = "Police"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Just make sure your doubles partner doesn't pick Racer B"; //--- ToDo: Localize;
		};
		class RscButton_1631: RscButton
		{
			idc = 1605;
			action = "['Nikos'] call NJP_Client_Fnc_Character_Swap";

			text = "Nikos"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Just Nikos, what more could I say?"; //--- ToDo: Localize;
		};
		class RscButton_1632: RscButton
		{
			idc = 1604;
			action = "['Kerry'] call NJP_Client_Fnc_Character_Swap";

			text = "Kerry"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Best guy, helped Miller tear appart a whole island"; //--- ToDo: Localize;
		};
		class RscButton_1633: RscButton
		{
			idc = 1603;
			action = "['VR_Guy'] call NJP_Client_Fnc_Character_Swap";

			text = "VR Guy"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "When you want to pretend you're part of TRON"; //--- ToDo: Localize;
		};
		class RscButton_1634: RscButton
		{
			idc = 1602;
			action = "['Racer_A'] call NJP_Client_Fnc_Character_Swap";

			text = "Racer A"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Racer but white"; //--- ToDo: Localize;
		};
					x = 0.102969 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		class RscButton_1636: RscButton
		{
			idc = 1601;
			action = "['Racer_B'] call NJP_Client_Fnc_Character_Swap";

			text = "Racer B"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Racer but black"; //--- ToDo: Localize;
		};
		class RscButton_1646: RscButton
		{
			idc = 1606;
			action = "['Surfer'] call NJP_Client_Fnc_Character_Swap";

			text = "Surfer"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "I just want to ride those waves maaaaaaaan"; //--- ToDo: Localize;
		};
		class RscButton_1647: RscButton
		{
			idc = 1605;
			action = "['Fisherman'] call NJP_Client_Fnc_Character_Swap";

			text = "Fisherman"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "I'll stare at the waves all day just to catch a boot"; //--- ToDo: Localize;
		};
		class RscButton_1648: RscButton
		{
			idc = 1604;
			action = "['Hunter'] call NJP_Client_Fnc_Character_Swap";

			text = "Hunter"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "For when you want to play one of those shitty Hunter simulators"; //--- ToDo: Localize;
		};
		class RscButton_1649: RscButton
		{
			idc = 1603;
			action = "['Simp'] call NJP_Client_Fnc_Character_Swap";

			text = "Simp"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "M' Lady"; //--- ToDo: Localize;
		};
		class RscButton_1650: RscButton
		{
			idc = 1602;
			action = "['ION'] call NJP_Client_Fnc_Character_Swap";

			text = "ION"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "With enough cash, we'll do anything from conquering a third world country to babysitting your mom"; //--- ToDo: Localize;
		};
		class RscButton_1651: RscButton
		{
			idc = 1601;
			action = "['Ghillie'] call NJP_Client_Fnc_Character_Swap";

			text = "Bush Man"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "For when you want to become a part of nature, or bug the public server zeus for a sniper mission"; //--- ToDo: Localize;
		};
		class RscButton_1652: RscButton
		{
			idc = 1601;
			action = "['Press'] call NJP_Client_Fnc_Character_Swap";

			text = "Press"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			tooltip = "Either dies part way through the mission or dies at the end, they never survive"; //--- ToDo: Localize;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};