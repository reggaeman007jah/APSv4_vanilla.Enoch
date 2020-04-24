/*
there is a lot of wet code here - consider making functions to issue move orders  
by parsing a location in here i can easily gen blufor platoons from anywhere, but for now they are only spawning at the perma-base 
maybe in future I can create FOBs which become remote spawn points 
it would be good to enable logic so that the AI manages whether to build a spawnerFob 

I_Soldier_A_F // ammo bearer
I_Soldier_AR_F // autorifle
 // hmg
I_Soldier_AT_F // AT
 // officer
 // team leader



note - it would be nice to one day have a system that allows a single flag to be changed, to indicate the faction required 
then all classes are managed automatically - e.g. in the below spawners you would not quote classnames, rather, local variables
*/

sleep 10;
_spawnPos = _this select 0;
_area = 120;
_timer = 0.3;

// systemChat "blu units being created - check perf";

// rifleman
for "_i" from 1 to 6 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["I_soldier_F", _pos, [], 0.1, "none"]; 
	sleep _timer;
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
	spawnedIndiUnit = spawnedIndiUnit +1;
};

// HMG
for "_i" from 1 to 4 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
	// _unit = bluGroup createUnit ["UK3CB_BAF_MGGPMG_MTP", _pos, [], 0.1, "none"]; 
	_unit = bluGroup createUnit ["I_support_MG_F", _pos, [], 0.1, "none"]; 
	sleep _timer;
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
	spawnedIndiUnit = spawnedIndiUnit +1;

};

// for "_i" from 1 to 2 do {
// 	bluGroup = createGroup west;
// 	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
// 	_unit = bluGroup createUnit ["UK3CB_BAF_LSW_MTP", _pos, [], 0.1, "none"]; 

// 	sleep _timer;
	
// 	_randomDir = selectRandom [270, 310, 00, 50, 90];
// 	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
// 	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
// 	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

// 	_unit setBehaviour "COMBAT";
// 	_unit doMove _endPoint1;
// };

// grenadier
for "_i" from 1 to 4 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
	// find the old classname for 3cb 
	_unit = bluGroup createUnit ["I_Soldier_GL_F", _pos, [], 0.1, "none"]; 
	sleep _timer;
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
	spawnedIndiUnit = spawnedIndiUnit +1;

};

// marksman
for "_i" from 1 to 2 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
	// _unit = bluGroup createUnit ["UK3CB_BAF_Marksman_MTP", _pos, [], 0.1, "none"]; 
	_unit = bluGroup createUnit ["I_Soldier_M_F", _pos, [], 0.1, "none"]; 
	sleep _timer;
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
	spawnedIndiUnit = spawnedIndiUnit +1;

};

// medic
for "_i" from 1 to 2 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
	// find 3cb medic class
	_unit = bluGroup createUnit ["I_medic_F", _pos, [], 0.1, "none"]; 
	sleep _timer;
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
	spawnedIndiUnit = spawnedIndiUnit +1;

};

// for "_i" from 1 to 2 do {
// 	bluGroup = createGroup west;
// 	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
// 	_unit = bluGroup createUnit ["UK3CB_BAF_Sharpshooter_MTP", _pos, [], 0.1, "none"]; 

// 	sleep _timer;
	
// 	_randomDir = selectRandom [270, 310, 00, 50, 90];
// 	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
// 	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
// 	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

// 	_unit setBehaviour "COMBAT";
// 	_unit doMove _endPoint1;
// };

// for "_i" from 1 to 1 do {
// 	bluGroup = createGroup west;
// 	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
// 	_unit = bluGroup createUnit ["UK3CB_BAF_Engineer_MTP", _pos, [], 0.1, "none"]; 

// 	sleep _timer;
	
// 	_randomDir = selectRandom [270, 310, 00, 50, 90];
// 	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
// 	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
// 	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

// 	_unit setBehaviour "COMBAT";
// 	_unit doMove _endPoint1;
// };

// for "_i" from 1 to 1 do {
// 	bluGroup = createGroup west;
// 	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
// 	_unit = bluGroup createUnit ["UK3CB_BAF_Explosive_MTP", _pos, [], 0.1, "none"]; 

// 	sleep _timer;
	
// 	_randomDir = selectRandom [270, 310, 00, 50, 90];
// 	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
// 	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
// 	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

// 	_unit setBehaviour "COMBAT";
// 	_unit doMove _endPoint1;
// };

// officer
for "_i" from 1 to 1 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
	// _unit = bluGroup createUnit ["UK3CB_BAF_Officer_MTP", _pos, [], 0.1, "none"]; 
	_unit = bluGroup createUnit ["I_officer_F", _pos, [], 0.1, "none"]; 
	sleep _timer;
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
	spawnedIndiUnit = spawnedIndiUnit +1;

};

// TL
for "_i" from 1 to 1 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, _area] call BIS_fnc_findSafePos;
	// _unit = bluGroup createUnit ["UK3CB_BAF_RO_MTP", _pos, [], 0.1, "none"]; 
	_unit = bluGroup createUnit ["I_Soldier_TL_F", _pos, [], 0.1, "none"]; 
	sleep _timer;
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
	spawnedIndiUnit = spawnedIndiUnit +1;

};

// systemChat "indi spawner complete";

// execVM "autoPatrolSystem\checkBluforRF.sqf";