//-------------Track Controls-------------\\

// NOTE: Everything such as Laps_number, Customization_Phase_Time, Voting_Phase_Enabled, and Voting_Phase_Time can be found in Armakart_Main/Params.hpp, Feel free to edit the default values to what best suits your track.

	//Track Title\\

		Track_Title = 'Framework'; // Should be name of your track, shown at intro

	//Intro Cam Controls\\

		Radius_cam = 125; // Circle radius (distance to the checkpoints)

		Angle_cam = random 360; // Starting angle (compass direction)

		Altitude_cam = 55; // Camera altitude (height above ground)

		Speed_cam = 0.06; // Higher is faster

	//Kart Classname\\

		Kart_Classname = "C_Quadbike_01_F";
/*
\\---------------------------------------//
*/

//Simply extends init.sqf
#include "Armakart_Main\Armakart_Init.sqf";
