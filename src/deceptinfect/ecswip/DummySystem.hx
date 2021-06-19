package deceptinfect.ecswip;

import deceptinfect.radiation.ContaminationProducer;
import deceptinfect.radiation.RadSource;
import deceptinfect.radiation.ContaminationAccepter;
import deceptinfect.radiation.RadVictim;

class DummySystem extends System {
	// static var enbs = new Entities();
	#if server
	override function run_server() {
		// for (enb in enbs) {
		//     trace(enb);
		// }

		for (i in 0...entities) {
			for (p in 1...entities) {
				i + p;
			}
		}
		// for (vic in 0...entities) {
		//     // switch [vic.get(RadVictim),vic.get(ContaminationAccepter),vic.get(VirtualPosition)] {
		//     // case [Comp(c_rv),Comp(c_contamAccept),Comp(c_vicpos)]:
		//         for (produce in 0...entities) {
		//             // switch [produce.get(RadSource),produce.get(ContaminationProducer),produce.get(VirtualPosition)] {
		// 	    // 	    case [Comp(c_rad),Comp(c_contam),Comp(c_vir)]:
		// 	    // 		// trace("oogie");
		// 	    // 		default:
		// 	    // 	}
		// 	}
		//     // default:
		//     // }
		// }
	}
	#end
}
// private class Entities {
//     var curEnts:Int = 0;
//     public function new() {
//     }
//     public function iterator() {
// 	return inline new DI_ID_Iterator();
//     }
// }
// class DI_ID_Iterator {
//     var current:Int = 0;
//     public extern inline function new() {
//     }
//     public inline function hasNext() {
// 	return current < 5;
//     }
//     public extern inline function next() {
// 	return (current++ : DI_ID);
//     }
// }
