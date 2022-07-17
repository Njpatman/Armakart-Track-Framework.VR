/* 
*
* - Basically an extension of init.sqf just so all these commands don't clutter init.sqf if another unit wants to integrate armakart into their mission framework for a mission.
* 
*/

//Compiles and applies briefing to players
call NJP_Client_fnc_Briefing;

//- Variables that are handled globally -\\

//Setsup the Systemchat at the end of the players individual race which tells them their place
KARTS_FINISHED = 0;

//Setsup "Places"
Places = [];

//Setsup "Places_Live"
Places_Live = [];

//Setsup "Scoreboard_Active"
Scoreboard_Active = false;

//Number of Laps/Checkpoints
Laps_number = ["Laps_number", 3] call BIS_fnc_getParamValue; // Can be as high as you want

//Customization Phase Time
Customization_Phase_Time = ["Customization_Phase_Time", 55] call BIS_fnc_getParamValue;

//Voting Phase
Voting_Phase_Enabled = ["Voting_Phase_Enabled", 1] call BIS_fnc_getParamValue;

Voting_Phase_Time = ["Voting_Phase_Time", 25] call BIS_fnc_getParamValue;

//Powerup Creep
Powerup_Creep_Enabled = ["Powerup_Creep_Enabled", 1] call BIS_fnc_getParamValue;

//Sets the color values for UI Color Toggle function
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

//Get number of each object
CP_NUM = count allMissionObjects "VR_3DSelector_01_complete_F";
SUB_CP_NUM = count allMissionObjects "Sign_Arrow_Large_Cyan_F";
PWR_BLK_NUM = count allMissionObjects "Land_VR_CoverObject_01_kneelHigh_F";

//- Server Init -\\

if (isServer) then 
{

	//Setsup variables for Weather Voting
	Weather_Clear = 0;
	Weather_Cloudy = 0;
	Weather_Foggy = 0;
	Weather_Light_Rain = 0;
	Weather_Stormy = 0;

	//Setsup variables for Time Voting
	Time_Early_Morning = 0;
	Time_Noon = 0;
	Time_Late_Afternoon = 0;
	Time_Night = 0;
	Time_Night_Full_Moon = 0;

	Loaded_CP_NUM = 0;
	Loaded_SUB_CP_NUM = 0;
	Loaded_PWR_BLK_NUM = 0;

	NJP_Server_fnc_Weather_Clear_Vote = { Weather_Clear = Weather_Clear + 1; };
	NJP_Server_fnc_Weather_Cloudy_Vote = { Weather_Cloudy = Weather_Cloudy + 1; };
	NJP_Server_fnc_Weather_Foggy_Vote = { Weather_Foggy = Weather_Foggy + 1; };
	NJP_Server_fnc_Weather_Light_Rain_Vote = { Weather_Light_Rain = Weather_Light_Rain + 1; };
	NJP_Server_fnc_Weather_Stormy_Vote = { Weather_Stormy = Weather_Stormy + 1; };
	NJP_Server_fnc_Time_Early_Morning_Vote = { Time_Early_Morning = Time_Early_Morning + 1; };
	NJP_Server_fnc_Time_Noon_Vote = { Time_Noon = Time_Noon + 1; };
	NJP_Server_fnc_Time_Late_Afternoon_Vote = { Time_Late_Afternoon = Time_Late_Afternoon + 1; };
	NJP_Server_fnc_Time_Night_Vote = { Time_Night = Time_Night + 1; };
	NJP_Server_fnc_Time_Night_Full_Moon_Vote = { Time_Night_Full_Moon = Time_Night_Full_Moon + 1; };

	addMissionEventHandler ["PlayerDisconnected", 
	{

		params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

		if (!isNil "NJP_Client_Fnc_Delete_From_Places_Live_Array" && !isNil "Loc_Array" && !(Loc_Array isEqualTo [0, 0, 0, 0])) then {

			[Loc_Array] remoteExec ["NJP_Client_Fnc_Delete_From_Places_Live_Array", 0, true];
								
		};

	}];

	//Pre-Race phase START!!
	[] spawn NJP_Server_fnc_Race_Init_Master;

	"|Armakart System| : Server initialization completed!" remoteExec ["systemChat", 0, true];

};



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------------------------------------------------
//	Whales Nametags Settup. Feel free to modify.
//------------------------------------------------------------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//	Main Values																	(Default values)
WHA_NAMETAGS_DRAWCURSORONLY = false;	//	Only draw nametags on mouse cursor. 		(Default: false)
										//	Can save FPS in crowded areas.
										//	Clients can change with CBA settings menu.
								
//WHA_NAMETAGS_ACTIONKEY = "timeInc"; 	//	Key that can be pressed to toggle tags.		("timeInc")
										//	Default is "timeInc", which is normally
										//	the (=) key. Other keys available here:
										//	https://community.bistudio.com/wiki/inputAction/actions/bindings
										//	Don't want any key? Comment out the line.
								
WHA_NAMETAGS_NIGHT = false;				//	Whether night will affect tag visibility.	(true)

//	Information Shown
WHA_NAMETAGS_SHOW_GROUP 		= false;	//	Show group name under unit's name. 			(true)
WHA_NAMETAGS_SHOW_ROLE			= false; 	//	Show unit's role (rifleman, driver). 		(true)
WHA_NAMETAGS_SHOW_VEHICLEINFO 	= false;	//	Show vehicle info. Requires SHOW_ROLE.		(true)

//	Draw Distances

WHA_NAMETAGS_DRAWDISTANCE_CURSOR = 150; //	Distance to draw nametags when pointing at a unit.	(20)
										//	Should be greater than DISTANCE_ALL.
										//	Can be altered significantly depending on player FOV.
WHA_NAMETAGS_DRAWDISTANCE_NEAR = 100; 	//	Distance within which all nametags will be drawn.	(10)
										//	Increasing this will cost performance.
										//	Due to a bug this will seem ~3m shorter in third person.
										//	If you want to truly disable non-cursor tags, set this to 0.
//	Font Fade
WHA_NAMETAGS_FADETIME = 1.5;			//	Fade time for cursor tags after player mouses away.	(1)

//	Text Configuration: Typeface
//	To manually alter these options, see functions\nametagResetFont.sqf.		
//	Options:
//	- "Roboto" (DEFAULT)
//	- "RobotoLight"
//	- "Purista"
//	- "PuristaLight"
//	- "Etelka"
//	- "Tahoma"
WHA_NAMETAGS_FONT_FACE = "Roboto";			//	Typeface set for nametag system.			("Roboto")

//	Text Configuration: Size

WHA_NAMETAGS_FONT_SIZE_RAW = 0.044;			//	Default raw font size.						(0.036)
											//	Used directly for names, and used with
											//	below modifiers for all else.
WHA_NAMETAGS_FONT_SIZE_SEC_MULTI =	0.861;	//	Multiplier for group and role tags.			(0.861)
WHA_NAMETAGS_FONT_SIZE_MULTI = 1;			//	A general multiplier that can be used		(1)
											//	if you don't like the other ones.
											//	Multipliers may be overriden by CBA settings.
//	Text Configuration: Spacing
WHA_NAMETAGS_FONT_SPREAD_MULTI = 1;			//	Multiplier for vertical font spacing.		(1)
											//	may be overriden by CBA settings.
								
//	Text Configuration: Color
//	To manually alter these options, see functions\nametagResetFont.sqf.
//	Options:
//	- WHGreen
//	- ACERust
//	- TMTMTeal
//	- COALCrimson
//	- FAWhite
//	- STSand
//	- BromaPurple
WHA_NAMETAGS_FONT_COLOR = "COALCrimson";	//	Font color set for nametag system.			("WHGreen")

//	Text Configuration: Position
WHA_NAMETAGS_FONT_HEIGHT_ONHEAD = true;	//	Attaches nametags to head (like ACE)		(false)



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------------------------------------------------
//	Whales Nametags Functions and Scripts Settup. Please do not modify past this line.
//------------------------------------------------------------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//	Make sure this isn't a dedicated server or headless client.
if (!hasInterface) exitWith {};

//	Global variable that will be flipped on and off using the disableKey and CBA.
WHA_NAMETAGS_ON = true; 

//	Determine which mods are active.
#include "Armakart_Client_Functions\Armakart_Client_Nametag_Functions\Armakart_Nametags_Include\wha_nametags_checkMods.sqf";


//------------------------------------------------------------------------------------
//	Configuration and settings import and setup.
//------------------------------------------------------------------------------------

//	Allows for player (client) configuration of other settings.
#include "Armakart_Client_Functions\Armakart_Client_Nametag_Functions\Armakart_Nametags_Include\wha_nametags_settings.sqf"


//------------------------------------------------------------------------------------
//	More preparation.
//------------------------------------------------------------------------------------

//	Let the player initialize properly.
waitUntil{!isNull player};
waitUntil{player == player};

//	Variable that will be used to keep track of Arma's day/night cycle.
WHA_NAMETAGS_VAR_NIGHT = 1;

//	Reset font spacing and size to (possibly) new conditions.
call wha_nametags_fnc_resetFont;

//	Setting up cursor cache and fader.
WHA_NAMETAGS_CACHE_CURSOR = objNull;
WHA_NAMETAGS_CACHE_CURSOR_DATA = [];
WHA_NAMETAGS_CACHE_FADE = [[],[],[]];

//	Wait for player to get ingame.
waitUntil {!isNull (findDisplay 46)};

//	Setting up our disableKey (Default '+')
#include "Armakart_Client_Functions\Armakart_Client_Nametag_Functions\Armakart_Nametags_Include\wha_nametags_disableKey.sqf"


//------------------------------------------------------------------------------------
//	Keep an updated cache of all tags to draw.
//------------------------------------------------------------------------------------

#include "Armakart_Client_Functions\Armakart_Client_Nametag_Functions\Armakart_Nametags_Include\wha_nametags_cacheLoop.sqf"


//------------------------------------------------------------------------------------
//	Render nametags from the cache every frame.
//------------------------------------------------------------------------------------

WHA_NAMETAGS_EVENTHANDLER = addMissionEventHandler 
["Draw3D", 
{
	if WHA_NAMETAGS_ON then
	{	call wha_nametags_fnc_onEachFrame	};
}];

// KARTS : EH to remove nametags upon death
player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	WHA_NAMETAGS_ON = false;
}];