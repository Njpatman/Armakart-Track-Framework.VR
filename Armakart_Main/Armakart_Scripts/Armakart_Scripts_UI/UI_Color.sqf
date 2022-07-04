/*
* 
* - Simply changes the player ui color
* 
*/
if !(hasInterface) exitWith {};

//Sets the color values
Light_Blue = [0.133,0.349,0.522,0.65];
Light_Green = [0.114,0.639,0.255,0.65];
Light_Red = [0.749,0.141,0.129,0.65];
Light_Orange = [0.961,0.404,0.106,0.65];
Dark_Blue = [0,0.051,1,0.65];
Purple = [0.584,0,1,0.65];
Pink = [1,0.02,0.855,0.65];
Blue_violet = [0.451,0.4,0.741,0.65];
Bronze = [0.69,0.549,0.341,0.65];
Rose_Gold = [0.718,0.431,0.475,0.65];
Yellow = [1,1,0,0.65];
Khaki = [0.741,0.718,0.42,0.65];

UI_Color_int = UI_Color_int + 1;

switch (UI_Color_int) do
{

	case 1 : {

		UI_Color = Light_Blue;
		UI_Color_int = 1;

	};

	case 2 : {

		UI_Color = Light_Green;

	};

	case 3 : {

		UI_Color = Light_Red;

	};

	case 4 : {

		UI_Color = Light_Orange;

	};

	case 5 : {

		UI_Color = Dark_Blue;

	};

	case 6 : {

		UI_Color = Purple;

	};

	case 7 : {

		UI_Color = Pink;

	};

	case 8 : {

		UI_Color = Blue_violet;

	};

	case 9 : {

		UI_Color = Bronze;

	};

	case 10 : {

		UI_Color = Rose_Gold;

	};

	case 11 : {

		UI_Color = Yellow;

	};

	case 12 : {

		UI_Color = Khaki;
		UI_Color_int = 0;

	};

};

_Customization_Menu_UI = findDisplay 1286;
_UI_Display_1 = _Customization_Menu_UI displayCtrl 1060;
_UI_Display_2 = _Customization_Menu_UI displayCtrl 1061;
_UI_Display_3 = _Customization_Menu_UI displayCtrl 1062;

//Apllies the color value to the UI
{
_x ctrlSetBackgroundColor UI_Color;
} forEach [_UI_Display_1, _UI_Display_2, _UI_Display_3];

//Applies the color value to the profile so we can use it to reset the menu to the correct color and use it in the Places screen.
profileNamespace setVariable ["UI_Color", UI_Color];