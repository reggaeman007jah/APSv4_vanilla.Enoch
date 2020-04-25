
while {true} do {

	sleep 28;

	_missionDuration = time;
	// _roundedMission = floor _missionDuration;
	_roundedMission2 = _missionDuration / 60;
	_roundedMission3 = floor _roundedMission2;

	// _missionDuration2 = _roundedMission / 60;

	_totalIndi = independent countSide allUnits;
	_totalWest = west countSide allUnits;
	_totalEast = east countSide allUnits;
	
	_TEST1 = "";

	_opforCount = 0;
	_blueforCount = 0;
	_indiCount = 0;
	_units = allUnits inAreaArray "Objective 1";
	_totalUnits = count _units;
	
	{
		switch ((side _x)) do
		{
			case EAST: {_opforCount = _opforCount + 1};
			case WEST: {_blueforCount = _blueforCount + 1};
			case INDEPENDENT: {_indiCount = _indiCount + 1};
		};
	} forEach _units;
	_totalRedzone = _opforCount + _blueforCount + _indiCount;
	_totalUnits = count allUnits;

	// count blacklist items 
	_blackListItems = count RGG_patrolPositionBlacklist; // EVENTUALLY TRIM THIS TO BE ONLY 5 OR 6 

	// list groups 
	_opforGroups = allGroups select {side _x isEqualTo east};
	_indiforGroups = allGroups select {side _x isEqualTo independent};
	// _bluforGroupCount = allGroups select {side _x isEqualTo west};

	// count groups 
	_opforGroupCount = count _opforGroups;
	_indiforGroupCount = count _indiforGroups;

	// _indiKilled = spawnedIndiUnit - _totalIndi;

	/*
	RGG_totalOpforGroups = [];
	RGG_totalIndiforGroups = [];
	*/

	// count total groups spawned in since mission start 
	testOpforPBU = RGG_totalOpforGroups pushBackUnique _opforGroups;
	testIndiforPBU = RGG_totalIndiforGroups pushBackUnique _indiforGroups;
	countTotalOpforGroups = count RGG_totalOpforGroups;
	countTotalIndiforGroups = count RGG_totalIndiforGroups;

	// _averagePatrolTime = _roundedMission3 / patrolPointsTaken;

	// systemChat ".....................................................................................................";
	// systemChat "................. MISSION PHASE:";
	// systemChat format ["................. STATUS: %1", @@@]; 
	systemChat "................. MISSION STATUS";
	systemChat format ["................. TASK: %1", MISSIONTASK]; 
	systemChat "................. ";
	systemChat "................. REDZONE UNITS";
	systemChat format ["................. TOTAL: %1", _totalRedzone]; 
	systemChat format ["................. WEST: %1 / EAST: %2 / INDI: %3", _blueforCount, _opforCount, _indiCount]; 
	systemChat "................. ";
	systemChat "................. GLOBAL UNITS";
	systemChat format ["................. TOTAL: %1", _totalUnits]; 
	systemChat format ["................. WEST: %1 / EAST: %2 / INDI: %3", _totalWest, _totalEast, _totalIndi]; 
	systemChat "................. ";
	// systemChat format ["................. REDZONE BLUFOR %1", _blueforCount]; 
	// systemChat format ["................. REDZONE OPFOR %1", _opforCount]; 
	systemChat "................. STATS";
	systemChat format ["................. MISSION DURATION (MINS): %1", _roundedMission3]; 
	systemChat format ["................. POINTS TAKEN: %1", patrolPointsTaken]; 
	systemChat format ["................. REINFORCEMENT PATROLS CALLED: %1", reinforcementsCalled]; 
	systemChat format ["................. BLACKLIST ITEMS: %1", _blackListItems]; 
	// systemChat format ["................. OVERALL PATROL DISTANCE: %1", _TEST1]; 
	// systemChat format ["................. AVERAGE TIME TO TAKE EACH PATROL POINT: %1", _TEST1]; 
	// systemChat format ["................. OPFOR KILLED: %1", _TEST1]; 
	// systemChat format ["................. INDIFOR KILLED: %1", _TEST1]; 	
	systemChat format ["................. TOTAL OPFOR SPAWNED: %1", spawnedOpforUnit]; 	
	systemChat format ["................. CURRENT OPFOR GROUPS: %1", _opforGroupCount]; 	
	// systemChat format ["................. TOTAL OPFOR GROUPS CREATED: %1", countTotalOpforGroups]; 	
	systemChat "................. ";
	systemChat format ["................. TOTAL INDIFOR SPAWNED: %1", spawnedIndiUnit]; 	
	systemChat format ["................. CURRENT INDIFOR GROUPS: %1", _indiforGroupCount]; 	
	// systemChat format ["................. TOTAL INDIFOR GROUPS CREATED: %1", countTotalIndiforGroups]; 	
	// systemChat format ["................. PATROLS LOST: %1", LOSTPATROLS]; 
	systemChat ".............................................................................................................................";

	if ((_totalIndi <10) && (_indiCount <10)) then {
		// hint "RF called in now from initServer";
		// systemChat "............ CALLING IN RF NOW ....................";
		// execVM "autoPatrolSystem\reinforcementSystems\bluforRF.sqf";
		sleep 2;
		hint "INDI REINFORCEMENTS ARE INBOUND";
		// systemchat "debug --- friendly units created";
		// "MP debug --- friendly units created" remoteExec ["systemChat", 0, true];
		reinforcementsCalled = reinforcementsCalled + 1;
		[RGG_missionOrigin] execVM "autoPatrolSystem\spawnerSystems\createFriendlyUnits.sqf";
		sleep 10;
	};
};
