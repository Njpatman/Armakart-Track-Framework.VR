params ["_Attacker_Name"];

_OG_mass = getMass vehicle player;

vehicle player setMass 10000;

[_Attacker_Name, "Change Mass"] call NJP_Client_Powerup_Additional_fnc_Tell_Victim_Attacker;

systemChat "|Armakart Powerups| : Your mass has been changed for 6.5 seconds!";

uiSleep 6.5;

vehicle player setMass _OG_mass;

systemChat "|Armakart Powerups| : Your mass has been reset!";