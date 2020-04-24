// B_Plane_CAS_01_dynamicLoadout_F
// [startPos, endPos, altitude, speedMode, classname, side] call BIS_fnc_ambientFlyby;
// always over RGG_patrol_obj
// player getPos [100,45];

/*

000 / 180 
180 / 000

090 / 270
270 / 090

get an origin by taking patrol point, then get pos east at 090 100m 
then get pos west 270 from patrol point 



*/

sleep 60;

while {true} do {
	// systemChat "spawning ambient";
	_sleep = selectRandom [60, 90, 120, 150, 180];
	_number = selectRandom [1,2,3];
	_type = selectRandom ["B_Plane_CAS_01_dynamicLoadout_F", "B_Heli_Transport_01_F", "B_Heli_Transport_03_F", "B_Heli_Light_01_dynamicLoadout_F"];
	_startPos = RGG_patrol_obj getPos [5000, 90];
	_endPos = RGG_patrol_obj getPos [5000, 270];

	for "_i" from 1 to _number do {

		[_startPos, _endPos, 100, "FULL", _type, west] call BIS_fnc_ambientFlyby;
		sleep 10;	
	};

	// sleep 30;
	sleep _sleep;
};


// [startPos, endPos, altitude, speedMode, classname, side] call BIS_fnc_ambientFlyby;



