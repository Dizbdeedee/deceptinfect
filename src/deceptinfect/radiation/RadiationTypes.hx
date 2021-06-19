package deceptinfect.radiation;

import deceptinfect.radiation.RadSource.RadSourceOptions;
import deceptinfect.radiation.RadiationProducer.RadiationProduceOptions;

class RadiationTypes {
	public static var types:Map<RadTypes, RadSourceOptions> = [
		NEST => {
			type: NEST,
			lifetime: INFINITE,
			options: BOTH({
				maxrate: 6,
				radius: 500,
			}, {
				chance: 2 / 5,
				dist: 20,
				// contam_time: FINITE(10),
				check: 0.8,
				type: SAME_SOURCE,
				nextoptions: TYPE(NEST_CONTAM)
			})
		},
		NEST_CONTAM => {
			type: NEST_CONTAM,
			lifetime: FINITE(10),
			options: BOTH({
				maxrate: 4,
				radius: 300
			}, {
				chance: 2 / 5,
				dist: 20,
				check: 0.8,
				type: SAME_SOURCE,
				nextoptions: MY_TYPE
			})
		},
		INF => {
			type: INF,
			lifetime: INFINITE,
			options: BOTH({
				maxrate: 5,
				radius: 500
			}, {
				chance: 0.4,
				dist: 40,
				check: 0.8,
				type: SAME_SOURCE,
				nextoptions: OVERRIDE_LIFETIME(FINITE(10))
			})
		}
		// NEST => {
		//     maxrate: 6,
		//     radius: 500,
		//     contaminate: {
		//         chance: 2/5,
		//         dist: 20,
		//         contam_time: FINITE(10),
		//         check: 0.8,
		//         type : SAME_SOURCE
		//     },
		//     lifetime: INFINITE,
		// },
		// CORPSE => {
		//     maxrate: 6,
		//     radius: 350,
		//     contaminate: {
		//         chance: 0.5,
		//         contam_time: FINITE(10),
		//         check: 0.5,
		//         dist: 50,
		//         type: SAME_SOURCE
		//     },
		//     lifetime: FINITE(25)
		// },
		// INF => {
		//     maxrate: 4.5,
		//     radius: 300,
		//     contaminate: {
		//         chance: 0.4,
		//         contam_time: FINITE(10),
		//         check: 0.3,
		//         dist: 50,
		//         type: SAME_SOURCE
		//     },
		//     lifetime: INFINITE
		// },
		// PUSTLE => {
		//     maxrate: 3,
		//     radius: 400,
		// },
		// SPIT_HIT => {
		//     maxrate: 5,
		//     radius: 250,
		//     contaminate: {
		//         chance: 0.8,
		//         contam_time: FINITE(7),
		//         check: 0.3,
		//         dist: 60,
		//         type: ALWAYS
		//     }
		// },
		// SPIT => {
		//     maxrate: 4.5,
		//     radius: 200,
		// }
	];
}

enum abstract RadTypes(Int) from Int to Int {
	var NEST_CONTAM;
	var NEST;
	var CORPSE;
	var INF;
	var PUSTLE;
	var SPIT_HIT;
	var SPIT;
}
