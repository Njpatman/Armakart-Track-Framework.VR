/*
* 
* - Handles the client functions
* 
*/

//Client functions
NJP_Client_Fnc_In_Race_UI_Backgrnd_Toggle = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_UI\In_Race_UI_Backgrnd_Toggle.sqf";
NJP_Client_Fnc_UI_Color_Swap = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Armakart_Scripts_UI\UI_Color.sqf";
NJP_Client_Fnc_Character_Swap = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Scripts\Swap_Character.sqf";

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