//-------------Track Controls & Editable Variables-------------\\

	//Track Title\\

		Track_Title = 'Framework'; // Should be name of your track, shown at intro.

	//Checkpoint & Sub Checkpoint Size Arrays\\

		CP_Size_Array = [18, 18, 0, true, 25]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		Sub_CP_Size_Array = [20, 20, 0, true, 25]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

	//Checkpoint Manual Trigger Placement Arrays\\

		Manual_Checkpoint_Array = []; // Insert string of Checkpoint name, should look something like: ['CP_4', 'CP_7', 'CP_12'];

		Manual_Sub_Checkpoint_Array = []; // Insert string of Sub Checkpoint name, should look something like: ['Sub_CP_9', 'Sub_CP_13', 'Sub_CP_24'];

	//Reset Variables\\

		Reset_Diameter = 10; // Diameter around the Checkpoint Markers players reset to; Please set to track width.

		Reset_Height = 2; // Height above the Checkpoint Markers players will reset to.

	//Intro Cam Controls\\

		Radius_cam = 125; // Circle radius.

		Angle_cam = random 360; // Starting angle (compass direction).

		Altitude_cam = 50; // Camera altitude (height above ground).

		Speed_cam = 0.06; // Higher is faster.

	//Kart Classname\\

		Kart_Classname = "C_Quadbike_01_F";

	// NOTE: Global Variables such as Laps_number, Customization_Phase_Time, Voting_Phase_Enabled, and Voting_Phase_Time can be found in Armakart_Main/Armakart_Params.hpp, Feel free to edit the default values to what best suits your track.

/*
\\-------------------------------------------------------------//
*/

//Simply extends init.sqf
#include "Armakart_Main\Armakart_Init.sqf";