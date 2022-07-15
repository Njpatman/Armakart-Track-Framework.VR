Params ["_Loc_Array"];

if (!isNil "_Loc_Array") then {

	Places_Live deleteAt (Places_Live find _Loc_Array);

};