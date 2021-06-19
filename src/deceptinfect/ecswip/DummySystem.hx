package deceptinfect.ecswip;

import deceptinfect.radiation.ContaminationProducer;
import deceptinfect.radiation.RadSource;
import deceptinfect.radiation.ContaminationAccepter;
import deceptinfect.radiation.RadVictim;

class DummySystem extends System {
	#if server
	override function run_server() {
		for (i in 0...ComponentManager.entities) {
			for (p in 1...ComponentManager.entities) {
				i + p;
			}
		}
	}
	#end
}
