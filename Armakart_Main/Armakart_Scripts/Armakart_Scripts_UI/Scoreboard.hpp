class Scoreboard_UI	
{
	idd = 10002;

	duration = 9999999999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		class RscText_1004: RscText
		{
			idc = 1005;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.422812 * safezoneW;
			h = 0.627 * safezoneH;
			colorBackground[] = {0.133,0.349,0.522,0.5};
			onload ="uiNamespace setVariable [ 'Places_UI', _this select 0 ];";
		};
		class Score_Box: RscListbox
		{
			idc = 1555;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.36};
			colorText[] = {0,0,0,1};
		};
		class RscStructuredText_1100: RscStructuredText
		{
			text = "<t align = 'center' color='#000000' size='2.4'>--- Places ---</t>";
			idc = 1100;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.42};
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.627 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.627 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscText_1002: RscText
		{
			idc = 1003;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};
		class RscText_1003: RscText
		{
			idc = 1004;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.62};
		};

	};			
};	