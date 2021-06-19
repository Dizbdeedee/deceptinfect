package deceptinfect.ecswip;

import deceptinfect.radiation.ContaminationProducer;
import deceptinfect.radiation.RadSource;
import deceptinfect.radiation.ContaminationAccepter;
import deceptinfect.radiation.RadVictim;

class DummySystem extends System {


    #if server
    override function run_server() {

	
	for (i in entities) {
	    for (p in 1...entities) {
		i + p;
	    }
	}
        // for (vic in entities) {
        //     // switch [vic.get(RadVictim),vic.get(ContaminationAccepter),vic.get(VirtualPosition)] {
        //     // case [Comp(c_rv),Comp(c_contamAccept),Comp(c_vicpos)]:
        //         for (produce in entities) {
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