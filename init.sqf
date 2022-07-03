//-------------Track Controls-------------\\

	//Everything that uses BIS_fnc_getParamValue can be found in Armakart_Main\Params.hpp

	//-Basic Controls-\\
		//Track Title\\

			Track_Title = 'Framework'; // Should be name of your track, shown at intro

		//Number of Laps/Checkpoints\\

			Laps_number = ["Laps_number", 3] call BIS_fnc_getParamValue; // Can be as high as you want, just don't go under 2

			Checkpoints_number = 8; // The number of checkpoints on the track, so we can display the total number of checkpoints on the players ui and make the track work !!! NEVER GO UNDER 2 !!!.

			Sub_Checkpoints_Number = 1; // Number of sub checkpoints on your track, make sure to include Sub_CP_0.

		//Customization Phase Time\\

			Customization_Phase_Time = ["Customization_Phase_Time", 55] call BIS_fnc_getParamValue;

		//Voting Phase\\

			Voting_Phase_Enabled = ["Voting_Phase_Enabled", 1] call BIS_fnc_getParamValue;

			Voting_Phase_Time = ["Voting_Phase_Time", 25] call BIS_fnc_getParamValue;

		//Powerup Creep\\

			Powerup_Creep_Enabled = ["Powerup_Creep_Enabled", 1] call BIS_fnc_getParamValue;

		//Intro Cam Controls\\

			Radius_cam = 125; // Circle radius (distance to the checkpoints)

			Angle_cam = random 360; // Starting angle (compass direction)

			Altitude_cam = 55; // Camera altitude (height above ground)

			Speed_cam = 0.06; // Higher is faster

/*
\\---------------------------------------//
*/

//Simply extends init.sqf
#include "Armakart_Main\Armakart_Init.sqf";
