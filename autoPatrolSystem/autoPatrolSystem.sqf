
/*
Auto Patrol System v3 

April 2020
This is an old project from 2018 I recovered and rebuilt from scratch.

In summary, Blufor and Opfor troops are auto-created and pitted against eachother in a series of clashes.

Blue Marker = permaBase for Blufor troops, and provides respawn point, vehicle respawn, rearm refuel and repair trucks etc 
Red Marker (main) = patrol AO, with the center of which the main patrol objective 
Dark grey marker = main AO area 

You can play along in different ways:
 on the ground as a single unit fighting alongside the patrol 
 on the ground, taking direct control of some/all units using C2, AIC or similar 
 on the gound in landrovers providing HMG support
 in the air providing CAS 
 in the air providing Medivac (not yet built)
 in the air providing smoke-led arty missions and generla observation support 
 as an observer using indiCam or simmilar

The flow works like this:
 blufor units move to a location that is defended by opfor 
 blufor fights for opfor position, and if successful, waits for opfor reprisals 
 if successful in repelling this attack, blufor moves to the next key patrol point 
 if blufor unit numbers are depleted, another platoon (20 units) is created at moves in to support the patrol 
 in theory this mission can run without any direct intervention (player input) indefinately

*/


// this launches the mission-specific params file 
execVM "autoPatrolSystem\autoPatrolSystemParams.sqf";
// systemchat "debug --- autoPatrolSystemParams.sqf running";
// "MP debug --- autoPatrolSystemParams.sqf running" remoteExec ["systemChat", 0, true];


// this file should run only once 
sleep 2;
systemchat "debug --- autoPatrolSystem.sqf running";
"MP debug --- autoPatrolSystem.sqf running" remoteExec ["systemChat", 0, true];

/*
------- Base Setup ------- 
*/

// "ammo1" is a fixed 'named asset' in the mission itself - it is both the VA arsenal and also acts as a anchor point for the main Blufor base.
// RGG_initStartPos is a location array (of the location of the ammo box)
// "permaBase" acts as the one and only fixed blufor base area, can be used for RF/RE-UP/Medivac tasks (TBC)
RGG_initStartPos = getPos ammo1;
_base = createMarker ["permaBase", RGG_initStartPos];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorBlue";
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
// the above sequence provides a very basic marker animation on startup 

// this takes the permaBase location as the first anchor (subsequent progress anchors will be different)
// -------------------------------------------- to do / April 2020 / work out why you used the same arg twice here --------------------------------------------
[RGG_initStartPos, RGG_initStartPos] execVM "autoPatrolSystem\phase1_createObj.sqf";
// systemchat "debug --- phase1_createObj ACTIVATED";
// "MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];
sleep 0.2;

// this also takes the main blufor permaBase anchor location as the first spawn point for blufor troops
[RGG_initStartPos] execVM "autoPatrolSystem\spawnerSystems\createFriendlyUnits.sqf";
// systemchat "debug --- createFriendlyUnits.sqf running";
// "MP debug --- createFriendlyUnits.sqf running" remoteExec ["systemChat", 0, true];
sleep 0.2;

// add base position to blacklist 
_topleft = RGG_initStartPos getPos [800,315];
_bottomRight = RGG_initStartPos getPos [800,135];
RGG_patrolPositionBlacklist pushBack [_topLeft, _bottomRight];
