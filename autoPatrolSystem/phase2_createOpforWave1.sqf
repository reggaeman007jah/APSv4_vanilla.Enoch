/*
This creates small opfor group at patrol obj and sends them to patrol origin, to engage the patrol as they move in - this is the first wave 
These opfor units will head to the patrol origin .. there is a chance they will not engage with the blufor units heading in 
Consider sending them back to patrol dest if this happens (surprise attack)
*/

MISSIONTASK = "Move into the patrol point and destroy any opfor defenders";

// systemChat "debug - op first wave units being created - check perf";

_rndOp1 = selectRandom [6, 10, 14];

for "_i" from 1 to _rndOp1 do {
	_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];
	_grp = createGroup east;
	_pos = [RGG_patrol_obj, 0, 30] call BIS_fnc_findSafePos; // was 30, now 80, now 150 hopefully for better dispertion // now back to 30
	_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
	_unit setBehaviour "COMBAT";
	_unit doMove RGG_missionOrigin; 
	spawnedOpforUnit = spawnedOpforUnit + 1;
	sleep 1;						
	// systemChat "debug --- opfor first defence wave unit created"; 	
	// "MP debug --- opfor first defence wave unit created" remoteExec ["systemChat", 0, true];		
};

sleep 1;

// systemChat "debug - opfor wave 1 spawn completed";

execVM "autoPatrolSystem\phase3_createOpforDefenders.sqf";
// systemchat "debug --- phase3_createOpforDefenders ACTIVATED";
// "MP debug --- phase3_createOpforDefenders ACTIVATED" remoteExec ["systemChat", 0, true];
