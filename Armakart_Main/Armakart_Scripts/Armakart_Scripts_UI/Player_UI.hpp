class Crosshair	
{
	idd = 1345;

	duration = 99999999999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.82};
			onload = "uiNamespace setVariable [ 'Crosshair_1', _this select 0 ];";
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.82};
			onload = "uiNamespace setVariable [ 'Crosshair_2', _this select 0 ];";
		};
	};	
};

class In_Race_UI	
{
	idd = 1348;

	duration = 99999999999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Njpatman, v1.063, #Lequgu)
		////////////////////////////////////////////////////////

		class RscText_1000: RscText
		{
			idc = 1000;

			x = 0.164844 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;

			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1802: RscFrame
		{
			idc = 1802;

			x = 0.164844 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1803: RscFrame
		{
			idc = 1803;

			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			font = "puristaMedium";
			onload = "uiNamespace setVariable [ 'Place_UI', _this select 0 ];";

			x = 0.762969 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			font = "puristaMedium";
			onload = "uiNamespace setVariable [ 'Personal_UI_CPs', _this select 0 ];";

			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1102: RscStructuredText
		{
			idc = 1102;
			font = "puristaMedium";
			onload = "uiNamespace setVariable [ 'Personal_UI_Laps', _this select 0 ];";

			x = 0.195781 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;

			text = "Armakart_Main\Armakart_Scripts\Armakart_Scripts_UI\UI_FLAG.paa";
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;

			text = "Armakart_Main\Armakart_Scripts\Armakart_Scripts_UI\UI_CP.paa";
			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};	
};

class Customization_Timer_UI	
{
	idd = 12358;

	duration = 99999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		class Text: RscStructuredText
		{
			idc = 1004;

			text = "<br/> <t align = 'center'> If you've exited the Customization Menu, simply Self Interact >> Reset Menu</t>"; //--- ToDo: Localize;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.464062 * safezoneW;
			h = 0.099 * safezoneH;
			onload = "uiNamespace setVariable [ 'Pre_Race_UI_Bottom', _this select 0 ];";
		};
		class Timer_Title: RscStructuredText
		{
			idc = 1005;

			text = "<t align = 'center'  size='2'>--- Customization Time Left ---</t>"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.066 * safezoneH;	
			onload = "uiNamespace setVariable [ 'Timer_Title', _this select 0 ];";	
		};			
	};	
};

class Timer
{

	idd = 1236;

	duration = 9999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		class timer_text: RscStructuredText
		{
			idc = 1029;

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {1,0,0,0};
			onload = "uiNamespace setVariable [ 'TimerCtrl', _this select 0 ];";
		};
	};
};