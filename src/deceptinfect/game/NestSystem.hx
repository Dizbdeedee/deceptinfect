package deceptinfect.game;

import deceptinfect.radiation.RadiationProducer;
import deceptinfect.infection.InfectionSystem;

class NestSystem extends System {
	#if server
	override function run_server() {
		for (x in 0...ComponentManager.entities) {
			final ent:DI_ID = x;
			switch [ent.get(NestComponent), ent.get(RadiationProducer)] {
				case [Comp(c_nest), Comp(c_rad)]:
					var avg = InfectionSystem.get().getAverageInfection();
					var remap = MathLib.Remap.bind(avg, c_nest.rate_threshold_min, c_nest.rate_threshold_max);
					c_rad.maxrate = remap(c_nest.rate_start, c_nest.rate_end);
					c_rad.radius = (cast remap(c_nest.radius_start, c_nest.radius_end) : DistSquared);
				default:
			}
		}
	}


	public function revealNests() {
		for (x in 0...ComponentManager.entities) {
			final ent:DI_ID = x;
			switch ent.get(NestComponent) {
				case Comp(c_nest):
					trace("BISIBLE");
					c_nest.nestState = VISIBLE;
				default:
			}
		}
	}

	public function hideNests() {
		for (x in 0...ComponentManager.entities) {
			final ent:DI_ID = x;
			switch ent.get(NestComponent) {
				case Comp(c_nest):
					c_nest.nestState = INVISIBLE;
				default:
			}
		}
	}

	
	#end
}
