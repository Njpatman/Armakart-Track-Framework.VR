// Spec check - potato specific
if (hasInterface && (typeOf player isEqualTo "potato_spectate_spectator" || typeOf player isEqualTo "ace_spectator_virtual")) exitWith {  // Check if player, even a host
	//systemChat "You are a spectator";
};


//-------------Track Controls & Editable Variables-------------\\

	//Track Title\\

		Track_Title = 'Framework'; // Should be name of your track, shown at intro.

	//Checkpoint & Sub Checkpoint Size Arrays\\

		CP_Size_Array = [16, 16, 0, true, 20]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		Sub_CP_Size_Array = [20, 20, 0, true, 20]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

	//Checkpoint Manual Trigger Placement Array\\

		Manual_Checkpoint_Array = []; // String of Checkpoint name IE: 'CP_7'

		Manual_Sub_Checkpoint_Array = []; // String of Sub Checkpoint name IE: 'Sub_CP_9'

	//Intro Cam Controls\\

		Radius_cam = 125; // Circle radius (distance to the checkpoints).

		Angle_cam = random 360; // Starting angle (compass direction).

		Altitude_cam = 50; // Camera altitude (height above ground).

		Speed_cam = 0.06; // Higher is faster.

	//Kart Classname\\

		Kart_Classname = "C_Quadbike_01_F";

	// NOTE: Global Variables such as Laps_number, Customization_Phase_Time, Voting_Phase_Enabled, and Voting_Phase_Time can be found in Armakart_Main/Params.hpp, Feel free to edit the default values to what best suits your track.

/*
\\-------------------------------------------------------------//
*/

//Simply extends init.sqf
#include "Armakart_Main\Armakart_Init.sqf";
