if (!local player) exitWith {};

params ["_Character"];

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player addItemToUniform "ACE_microDAGR";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";

switch (_Character) do {

	case "Farmer": { 

		player forceAddUniform "U_BG_Guerilla3_1";
		player addHeadgear "H_Booniehat_khk";

	};

	case "Surfer": { 

		player forceAddUniform "U_OrestesBody";
		player addHeadgear "H_Cap_surfer";

	};

	case "Press": {

		player forceAddUniform "U_C_Journalist";
		player addVest "V_Press_F";
		player addHeadgear "H_Cap_blu";

	};

	case "Racer_A": {

		player forceAddUniform "U_C_Driver_1_red";
		player addHeadgear "H_RacingHelmet_1_red_F";

	};

	case "Racer_B": {

		player forceAddUniform "U_C_Driver_4";
		player addVest "V_BandollierB_blk";
		player addHeadgear "H_RacingHelmet_4_F";

	};

	case "ION": {

		player forceAddUniform "U_Competitor";
		player addHeadgear "H_Cap_blk_ION";
	
	};

	case "Nikos": {

		player forceAddUniform "U_NikosBody";
		player addHeadgear "H_StrawHat";
	
	};

	case "Simp": { 

		player forceAddUniform "U_C_Poloshirt_burgundy";
		player addHeadgear "H_Hat_grey";

	};

	case "Fisherman": { 

		player forceAddUniform "U_C_Poloshirt_blue";
		player addVest "V_TacVest_brn";
		player addHeadgear "H_Booniehat_tan";

	};

	case "Kerry": { 

		player forceAddUniform "U_I_G_Story_Protagonist_F";
		player addVest "V_PlateCarrier_Kerry";
		player addHeadgear "H_Helmet_Kerry";

	};

	case "Hunter": { 

		player forceAddUniform "U_C_HunterBody_grn";
		player addVest "V_Rangemaster_belt";
		player addHeadgear "H_Bandanna_camo";

	};

	case "Ghillie": { 

		player forceAddUniform "U_B_FullGhillie_lsh";
		player addVest "V_Chestrig_rgr";

	};

	case "Police": { 

		player forceAddUniform "U_B_GEN_Soldier_F";
		player addVest "V_TacVest_blk_POLICE";
		player addHeadgear "H_Cap_police";
	
	};

	case "VR_Guy": { 

		player forceAddUniform "U_B_Protagonist_VR";
		player addGoggles "G_Goggles_VR";
	
	};

	case "CON_CBRN": { 

		player forceAddUniform "U_C_CBRN_Suit_01_Blue_F";
		player addGoggles "G_AirPurifyingRespirator_01_F";
		
	};

	case "CON_Scientist": { 

		player forceAddUniform "U_C_Uniform_Scientist_01_F";

	};

	case "CON_LDF": { 

		player forceAddUniform "U_I_E_Uniform_01_F";
		player addVest "V_CarrierRigKBT_01_light_EAF_F";
		player addHeadgear "H_Beret_EAF_01_F";
		
	};

	case "CON_Nerd": { 

		player forceAddUniform "U_C_Uniform_Scientist_02_formal_F";
		player addHeadgear "H_Hat_Tinfoil_F";
		player addGoggles "G_Squares";

	};

	case "CON_Looter": { 

		player forceAddUniform "U_I_L_Uniform_01_tshirt_sport_F";
		player addHeadgear "H_Bandanna_sgg";
		player addGoggles "G_Bandanna_blk";
		
	};
	
	case "CON_Spetsnaz": { 

		player forceAddUniform "U_O_R_Gorka_01_camo_F";
		player addVest "V_SmershVest_01_radio_F";
		player addHeadgear "H_HelmetHBK_ear_F";
		
	};

	case "LOW_Aid_Worker": { 

		player forceAddUniform "U_C_IDAP_Man_cargo_F";
		player addVest "V_EOD_blue_F";
		player addHeadgear "H_Cap_White_IDAP_F";
		player addVest "V_Plain_crystal_F";

	};

	case "LOW_Construction": { 

		player forceAddUniform "U_C_ConstructionCoverall_Blue_F";
		player addVest "V_Safety_yellow_F";
		player addHeadgear "H_Construction_earprot_black_F";
		player addGoggles "G_EyeProtectors_F";
		
	};

	case "LOW_EOD": { 

		player forceAddUniform "U_C_IDAP_Man_casual_F";
		player addVest "V_EOD_blue_F";
		player addHeadgear "H_PASGT_basic_blue_F";
		player addGoggles "G_EyeProtectors_Earpiece_F";

	};

	case "LOW_IDAP": { 

		player forceAddUniform "U_C_IDAP_Man_Jeans_F";
		player addVest "V_Plain_medical_F";
		player addHeadgear "H_Cap_Black_IDAP_F";
	
	};

	case "LOW_Paramedic": { 

		player forceAddUniform "U_C_Paramedic_01_F";
		player addVest "V_LegStrapBag_black_F";
		player addHeadgear "H_WirelessEarpiece_F";
		
	};

	case "LOW_Mechanic": { 

		player forceAddUniform "U_C_Mechanic_01_F";
		player addVest "V_LegStrapBag_coyote_F";
		player addHeadgear "H_Bandanna_cbr";
		
	};

	default { 

		player forceAddUniform "U_BG_Guerilla3_1";
		player addHeadgear "H_Booniehat_khk";

	};
};