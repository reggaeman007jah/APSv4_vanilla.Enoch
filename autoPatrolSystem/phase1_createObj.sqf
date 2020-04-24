/*
This file creates dynamic markers 
These markers are used to direct the flow-logic of the mission 
"missionOrigin" - green - designates the start of any patrol mission - 
"battleArea" - grey - main AO that can be used to direct all AO units - 
"objective 1" - red - should be renamed really - main red area - used to control 
"missionCore" - dark red - used to control units at center of patrol point 
*/

sleep 5;

hint "MISSION STARTING";
MISSIONTASK = "Setting up new patrol objectives";

_sentPos 	= _this select 0; // objective point for any new mission 
_sentOrigin = _this select 1; // starting point for any new mission

RGG_missionOrigin = _sentOrigin;
// RGG_patrol_obj = [_sentPos, 600, 800, 3, 0, 0, 0, RGG_patrolPositionBlacklist] call BIS_fnc_findSafePos; // generate patrol obj between 600m and 800m away, and always over land 
// new test to make each point closer, now 350 - 500 away 
RGG_patrol_obj = [_sentPos, 600, 650, 3, 0, 0, 0, RGG_patrolPositionBlacklist] call BIS_fnc_findSafePos; // generate patrol obj between 600m and 800m away, and always over land 
// RGG_patrol_obj = [_sentPos, 600, 800, 3, 0, 20, 0] call BIS_fnc_findSafePos; // generate patrol obj between 600m and 800m away, and always over land 
// _newPos = [_markerPos, 600, 1800, 3, 0, 20, 0, blackList] call BIS_fnc_findSafePos;
// delete any existing opfor RF points 
deleteMarker "Point 1";
deleteMarker "Point 2";
deleteMarker "Point 3";

// Patrol Stage Origin 
deleteMarker "missionOrigin";
_base = createMarker ["missionOrigin", RGG_missionOrigin];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorGreen";
_base setMarkerSize [70, 70];
_base setMarkerAlpha 0.5;
sleep 0.1;
_base setMarkerSize [80, 80];
_base setMarkerAlpha 0.6;
sleep 0.1;
_base setMarkerSize [90, 90];
_base setMarkerAlpha 0.7;
sleep 0.1;
_base setMarkerSize [100, 100];
_base setMarkerAlpha 0.8;
sleep 0.1;
_base setMarkerSize [110, 110];
_base setMarkerAlpha 0.9;
sleep 1;

// AO - grey circle within which all calcs take place
deleteMarker "BattleArea"; 
_battleArea = createMarker ["BattleArea", RGG_patrol_obj];
_battleArea setMarkerShape "ELLIPSE";
_battleArea setMarkerColor "ColorBlack";
_battleArea setMarkerSize [1000, 1000];
_battleArea setMarkerAlpha 0.1;
sleep 0.1;
_battleArea setMarkerSize [1500, 1500];
_battleArea setMarkerAlpha 0.2;
sleep 0.1;
_battleArea setMarkerSize [2000, 2000];
_battleArea setMarkerAlpha 0.3;
sleep 0.1;
_battleArea setMarkerSize [2500, 2500];
_battleArea setMarkerAlpha 0.4;
sleep 0.1;
_battleArea setMarkerSize [3000, 3000];
_battleArea setMarkerAlpha 0.5;
sleep 0.1;
_battleArea setMarkerSize [3500, 3500];

// OBJ - patrol stage objective 
deleteMarker "Objective 1";
_objective1 = createMarker ["Objective 1", RGG_patrol_obj];
_objective1 setMarkerShape "ELLIPSE";
_objective1 setMarkerColor "ColorRed";
_objective1 setMarkerSize [100, 100];
_objective1 setMarkerAlpha 0.5;
sleep 0.1;
_objective1 setMarkerSize [120, 120];
_objective1 setMarkerAlpha 0.6;
sleep 0.1;
_objective1 setMarkerSize [130, 130];
_objective1 setMarkerAlpha 0.7;
sleep 0.1;
_objective1 setMarkerSize [140, 140];
_objective1 setMarkerAlpha 0.8;
sleep 0.1;
_objective1 setMarkerSize [150, 150];
_objective1 setMarkerAlpha 0.9;
sleep 0.1;
_objective1 setMarkerSize [250, 250];
sleep 0.1;
_objective1 setMarkerSize [450, 450];
sleep 1;

// Patrol Stage Core 
deleteMarker "missionCore";
_base = createMarker ["missionCore", RGG_patrol_obj];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorRed";
_base setMarkerSize [10, 10];
_base setMarkerAlpha 0.5;
sleep 0.1;
_base setMarkerSize [150, 15];
_base setMarkerAlpha 0.6;
sleep 0.1;
_base setMarkerSize [20, 20];
_base setMarkerAlpha 0.7;
sleep 0.1;
_base setMarkerSize [25, 25];
_base setMarkerAlpha 0.8;
sleep 0.1;
_base setMarkerSize [30, 30];
_base setMarkerAlpha 0.9;
sleep 1;

// add patrol position to blacklist 
_topleft = RGG_patrol_obj getPos [1000,315];
_bottomRight = RGG_patrol_obj getPos [1000,135];
RGG_patrolPositionBlacklist pushBack [_topLeft, _bottomRight];

sleep 5;

// generate defending opfor 
execVM "autoPatrolSystem\phase2_createOpforWave1.sqf";
// systemchat "debug --- phase2_createOpforWave1 ACTIVATED";
// "MP debug --- phase2_createOpforWave1 ACTIVATED" remoteExec ["systemChat", 0, true];

// paths between marker points 
_float = diag_tickTime;
_float2 = random 10000;
_uniqueStamp = [_float, _float2];
_stampToString = str _uniqueStamp;

_reldirX = RGG_missionOrigin getDir RGG_patrol_obj;
_relDir = floor _relDirX;
_distX = RGG_missionOrigin distance RGG_patrol_obj;
_dist = floor _distX;
_dist2 = _dist / 2;
_testPos = RGG_missionOrigin getPos [_dist2, _relDir];

sleep 5;
_lineTest = createMarker [_stampToString, _testPos];
_lineTest setMarkerShape "RECTANGLE";
_lineTest setMarkerColor "ColorBlack";
_lineTest setMarkerDir _reldirX;
_lineTest setMarkerSize [2, _dist2];
