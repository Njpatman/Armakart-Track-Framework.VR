/*
* 
* - Handles the client functions
* 
*/

//Powerup Block functions
NJP_Powerup_Fnc_Powerup_Master = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Armakart_Powerup_Master.sqf";
NJP_Powerup_Fnc_Banana = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Banana.sqf";
NJP_Powerup_Fnc_Banana_Gun = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Banana_Gun.sqf";
NJP_Powerup_Fnc_Bomb = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Bomb.sqf";
NJP_Powerup_Fnc_Boost = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Boost.sqf";
NJP_Powerup_Fnc_Bunny_IED = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Bunny_IED.sqf";
NJP_Powerup_Fnc_CP_Tele = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\CP_Tele.sqf";
NJP_Powerup_Fnc_Fus_Ro_Dah = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Fus_Ro_Dah.sqf";
NJP_Powerup_Fnc_Involuntary_Boost = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Involuntary_Boost.sqf";
NJP_Powerup_Fnc_Kitchen_sink = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Kitchen_sink.sqf";
NJP_Powerup_Fnc_Lightning = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Lightning.sqf";
NJP_Powerup_Fnc_Miller = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Miller.sqf";
NJP_Powerup_Fnc_Smoke_Screen = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Smoke_Screen.sqf";
NJP_Powerup_Fnc_Triple_Banana = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Triple_Banana.sqf";
NJP_Powerup_Fnc_Triple_Bomb = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Triple_Bomb.sqf";
NJP_Powerup_Fnc_Triple_Boost = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Triple_Boost.sqf";
NJP_Powerup_Fnc_Washing_Machine = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Washing_Machine.sqf";
NJP_Powerup_Fnc_Change_Mass = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Change_Mass.sqf";
NJP_Powerup_Fnc_Blue_Shell = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Blue_Shell.sqf";

//Powerup Block function additionals
NJP_Powerup_Additional_Fnc_Banana_2 = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Powerup_Additional\Banana_2.sqf";
NJP_Powerup_Additional_Fnc_Banana_3 = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Powerup_Additional\Banana_3.sqf";
NJP_Powerup_Additional_Fnc_Boost_2 = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Powerup_Additional\Boost_2.sqf";
NJP_Powerup_Additional_Fnc_Boost_3 = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Powerup_Additional\Boost_3.sqf";
NJP_Powerup_Additional_Fnc_Bunny_IED_Server_Loop = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Powerup_Additional\Bunny_IED_Server_Loop.sqf";

//Powerup Block function effects
NJP_Powerup_Effect_Fnc_FusRoDah_Effect = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Powerup_Effects\FusRoDah_Effect.sqf";
NJP_Powerup_Effect_Fnc_Banana_Effect = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Powerups\Powerup_Effects\Banana_Effect.sqf";

//Used to update the in-race places ui 
NJP_ADD_PLAYER_ARRAY_TO_PLACES_ARRAY = { 

  Params ["_Loc_Array"];

  if (!isNil "_Loc_Array") then {

    Places_Live pushBack _Loc_Array;

  };  

};

//Used to update the in-race places ui 
NJP_DELETE_PLAYER_ARRAY_FROM_PLACES_ARRAY = {  

  Params ["_Loc_Array"];

  if (!isNil "_Loc_Array") then {

    Places_Live deleteAt (Places_Live find _Loc_Array);

  };

};

NJP_PLACES_PUSHBACK = {

  Params ["_Name", "_Name_Dos"];

  KARTS_FINISHED = KARTS_FINISHED + 1;

  _FINISHED_KART_NUM = KARTS_FINISHED;

  _FINISHED_KART_NUM_STR = [_FINISHED_KART_NUM] call BIS_fnc_ordinalNumber;

  if (isNil "_Name_Dos") then {

    Places pushBack format ["%1  -  %2", _FINISHED_KART_NUM_STR, _Name];

  } else {

    Places pushBack format ["%1  -  %2  &  %3", _FINISHED_KART_NUM_STR, _Name_Dos, _Name];

  };

};

//Used to update the timer during the customization and voting phases
NJP_UPDATE_TIMER = {

  Params ["_color", "_Time_left"];

  #define _Timer uiNamespace getVariable [ "TimerCtrl", controlNull ]

  _Timer ctrlSetStructuredText parseText format ["<t align = 'center' size='1.85' font='LCD14' color='%1'>-- %2 --</t>", _color, [(_Time_left/3600),"HH:MM:SS"] call BIS_fnc_timetostring];

};

//Function used to block key inputs if a kart has been hit by lightning or any other disabling effect
fnc_BlockKeyDown = { 

  _ctrl = _this select 0; 
  _dikCode = _this select 1; 
  _shift = _this select 2; 
  _ctrlKey = _this select 3; 
  _alt = _this select 4; 

  Bkeys=[];

  {Bkeys = Bkeys + [(actionKeys _x) select 0]} foreach [

  "moveBack","moveDown","moveFastForward","moveForward","moveLeft","moveRight","moveSlowForward","turbo","turnLeft","turnRight",
  "CarFastForward","CarBack","CarForward","CarLeft","CarMovement","CarRight","CarSlowForward","CarWheelLeft","CarWheelRight"

  ];

  if (_dikCode in Bkeys) then { 

    true

  }; 

}; 

NJP_Client_Fnc_Voting_Phase_Edit = {

  disableSerialization;

  #define _Pre_Race_UI_Bottom uiNamespace getVariable ["Pre_Race_UI_Bottom", controlNull]
  #define _Timer_Title uiNamespace getVariable ["Timer_Title", controlNull]

  _Voting_UI = findDisplay 123456;
  _Voting = _Voting_UI displayCtrl 1008;

  //Get the UI color that was used on the Customization UI and applies it
  _Voting ctrlSetBackgroundColor UI_Color;

  _Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'>If you exit the voting menu, you will not be able to open it again!</t>";

  _Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Voting Time Left ---</t>";

};

//All the stuff that happens when a players crosses the finish line trigger
NJP_Client_Fnc_Finish_Line = {

  if !(hasInterface) exitWith {};

  #include "\a3\ui_f\hpp\defineDIKCodes.inc"

  //This block of code checks if the player has finished the race, if true, tell them their place then kill them
  if (Current_Laps + 1 > Laps_number && Current_Checkpoint isEqualTo CP_NUM) exitWith
  {

    "In_Race_UI_Layer" cutFadeOut 0.001;
    "Crosshair_Layer" cutFadeOut 0.001;

    No_item = false;

    Initial_hint = false;

    Player_Finished = true;

    _FINISHED_KART_NUM = KARTS_FINISHED + 1;

    _FINISHED_KART_NUM_STR = [_FINISHED_KART_NUM] call BIS_fnc_ordinalNumber;

    ["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
    ["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

    hintSilent "Race completed! Enjoy watching everyone else in spectator!";

    playSound "Win";

    if (player in (fullCrew [vehicle player, "cargo", false] select 0)) then {

      _Driver = driver vehicle player;

      _Name = profileName;
      _Name_Dos = name _Driver;

      [_Name, _Name_Dos] remoteExec ["NJP_PLACES_PUSHBACK", 0];

      [format ["|Armakart Doubles| : You & your buddy finished %1, make sure to notify him as he might not get this message", _FINISHED_KART_NUM_STR]] remoteexec ["systemChat", vehicle player];

      deleteVehicle vehicle player;

    };

    if (player in (fullCrew [vehicle player, "driver", false] select 0)) then {

      _Name = profileName;

      [_Name] remoteExec ["NJP_PLACES_PUSHBACK", 0];

      systemChat format ["|Armakart Singles| : You finished %1", _FINISHED_KART_NUM_STR];

      deleteVehicle vehicle player;

    };

    _Group = createGroup sideLogic;

    [player] joinSilent _Group;

    [true] call ace_spectator_fnc_setSpectator;

  };


  //Simply adds to the Current_Laps variable and resets the Checkpoint and Sub_Checkpoint count, while also making a song and dance about it
  if (Current_Laps + 1 < Laps_number && Current_Checkpoint isEqualTo CP_NUM) then
  {

    systemChat "|Armakart System| : Next Lap Started!";
    playsound"Lap";

    Current_Checkpoint = 1;

    Sub_CP_obj = Sub_CP_0;

    Current_Laps = Current_Laps + 1;

    initial_Lap = false;

  };

  //Checks if player is on his final lap, if so, then to make a song and dance about it.
  if (Current_Laps + 1 isEqualTo Laps_number && Current_Checkpoint isEqualTo CP_NUM) then
  {

    systemChat "|Armakart System| : Final Lap Started!";
    playsound"Final_Lap";

    Current_Checkpoint = 1;

    Sub_CP_obj = Sub_CP_0;

    Current_Laps = Current_Laps + 1;

    initial_Lap = false;

  };

  //Checks if player is on his first lap, if so, then to make a song and dance about it.
  if (initial_Lap) then 
  {

    systemChat "|Armakart System| : First Lap Started!";

    playsound"Lap";

    Sub_CP_obj = Sub_CP_0;

    initial_Lap = false;

  };

};

//Displays scoreboard with everyone's places.
NJP_Client_Fnc_Scoreboard = {

  if !(hasInterface) exitWith {};

  #define _Scoreboard_UI uiNamespace getVariable ["Places_UI", controlNull]

  if (!Player_Finished) then {

    Player_Finished = true;

    deleteVehicle vehicle player;

    [true] call ace_spectator_fnc_setSpectator;
    
  };

  Scoreboard_Active = true;

  //Creates the Places Screen
  createDialog "Scoreboard_UI";

  //Default UI color incase player jip'd
  _UI_Color = [0.133,0.349,0.522,0.65];

  //Get the UI color that was used on the Customization UI and applies it
  _UI_Color = profileNamespace getVariable "_UI_Color";
  _Scoreboard_UI ctrlSetBackgroundColor _UI_Color;

  //Get's the places array and applies them in order to the Places Screen
  {

    lbAdd [1555,_x];

  } forEach Places;

  playMusic "";

  //Plays some music
  [] Spawn
  {

    while {Scoreboard_Active} do
    {

      music_isPlaying = true;
      playMusic "Customization_Phase";
                
      waitUntil
      {

        uiSleep 1;

        not music_isPlaying

      };

    };
              
  };

  _pos = selectRandom [CAMERA_LOOK_POS, CAMERA_LOOK_POS_1, CAMERA_LOOK_POS_2, CAMERA_LOOK_POS_3];
  _pos_object = _pos;
  _pos = [getPosATL _pos select 0, getPosATL _pos select 1, getPosATL _pos select 2];

  _logic_pos = [(_pos select 0), (_pos select 1), (_pos select 2)];
  _logic = "Land_ClutterCutter_small_F" createVehicleLocal _logic_pos;
  _logic attachTo [_pos_object, [0, 0, 0]];
  detach _logic;

  _logic setDir Angle_cam;
  _camPos = [_pos select 0, _pos select 1, (_pos select 2) + Altitude_cam];

  _cam = "camera" camCreate _camPos;
  _cam camSetPos _camPos;
  _cam camSetTarget _logic;
  _cam camCommit 0;

  waitUntil {camcommitted _cam && Scoreboard_Active};

  _cam attachto [_logic, [0, Radius_cam, Altitude_cam] ];
  _cam cameraEffect ["internal", "BACK"];

  while {Scoreboard_Active} do
  {
              
    Angle_cam = Angle_cam + Speed_cam;
    _Logic setDir Angle_cam;
    uiSleep 0.05;
              
  };

  camDestroy _cam;
  deleteVehicle _logic;

};


//Everything that happens to create the "Pre-Race Phase"
NJP_Client_Fnc_Pre_Race_Phase = {

  if !(hasInterface) exitWith {};

  //Creates Ace Self interact to reset the UI
  _Reset_Menu = ["Reset_Menu","<t color='#225985'>Reset Menu</t>","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
  {
      
    createDialog "Customization_Menu";

    _Customization_Menu_UI = findDisplay 1286;
    _UI_Display_1 = _Customization_Menu_UI displayCtrl 1060;
    _UI_Display_2 = _Customization_Menu_UI displayCtrl 1061;
    _UI_Display_3 = _Customization_Menu_UI displayCtrl 1062;

    {
    _x ctrlSetBackgroundColor UI_Color;
    } forEach [_UI_Display_1, _UI_Display_2, _UI_Display_3];

  },{true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions"], _Reset_Menu] call ace_interact_menu_fnc_addActionToObject;

  //- Handles the creation and orbiting of the Pre-race camera -\\

  //Creates a small arrow local to the player then attaches it above the players kart so they can tell which cart is theirs
  Arrow = "VR_3DSelector_01_default_F" createVehicleLocal [0,0,0];
  Arrow attachto [vehicle player, [0, 0, 1.35] ];
  Arrow setObjectScale 0.5;

  _Angle_Player_cam = random 360;

  _pos = vehicle player;
  _pos_object = _pos;
  _pos = [getPosATL _pos select 0, getPosATL _pos select 1, getPosATL _pos select 2];

  _logic_pos = [(_pos select 0), (_pos select 1), (_pos select 2)];
  logic = "VR_3DSelector_01_default_F" createVehicleLocal _logic_pos;
  logic attachTo [_pos_object, [0, 0, 0]];
  detach logic;
  hideObject logic;

  logic setDir _Angle_Player_cam;
  _camPos = [_pos select 0, _pos select 1, (_pos select 2) +  4.2];

  cam = "camera" camCreate _camPos;
  cam camSetPos _camPos;
  cam camSetTarget logic;
  cam camCommit 0;

  waitUntil {camcommitted cam};

  cam attachTo [logic, [0, 5.6, 4.2] ];
  cam cameraEffect ["internal", "BACK"];

  // Handles the actual orbiting of the cam
  while {PRE_RACE_PHASE} do
  {

    _Angle_Player_cam = _Angle_Player_cam + 0.065;
    logic setDir _Angle_Player_cam;
    uiSleep 0.0085;

  };

  camDestroy cam;
  deleteVehicle logic;
  deleteVehicle Arrow;

};

NJP_Client_Fnc_In_Race_UI_Backgrnd_Toggle = {

  #include "\a3\ui_f\hpp\defineDIKCodes.inc"

  ["Armakart", "UI_Alt_KEY", "UI_Backgrnd_HIDE", {

    _In_Race_UI = findDisplay 1345;
    _Personal_UI_Background_1 = _In_Race_UI displayCtrl 1000;
    _Personal_UI_Background_2 = _In_Race_UI displayCtrl 1002;

    {
    _x ctrlSetBackgroundColor [-1,-1,-1,0];
    } forEach [_Personal_UI_Background_1, _Personal_UI_Background_2];

    ["Armakart", "UI_Alt_KEY", "UI_Backgrnd_HIDE", {

      _In_Race_UI = findDisplay 1345;
      _Personal_UI_Background_1 = _In_Race_UI displayCtrl 1000;
      _Personal_UI_Background_2 = _In_Race_UI displayCtrl 1002;

      {
      _x ctrlSetBackgroundColor UI_Color;
      } forEach [_Personal_UI_Background_1, _Personal_UI_Background_2];

      call NJP_Client_Fnc_In_Race_UI_Backgrnd_Toggle;

    }, {""}, [DIK_U, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

  }, {""}, [DIK_U, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

};

NJP_Client_Fnc_UI_Color_Swap = {

  if !(hasInterface) exitWith {};

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

};


NJP_Client_Fnc_Character_Swap = {

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

};

systemChat "|Armakart System| : Client initialization completed!";