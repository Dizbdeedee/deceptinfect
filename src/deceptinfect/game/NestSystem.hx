package deceptinfect.game;

import deceptinfect.radiation.RadiationProducer;
import deceptinfect.infection.InfectionSystem;

class NestSystem extends System {
    #if server
    override function run_server() {
        for (ent in entities) {
            switch [ent.get(NestComponent),ent.get(RadiationProducer)] {
            case [Comp(c_nest),Comp(c_rad)]:
                var avg = InfectionSystem.averageInfection;
                var remap = MathLib.Remap.bind(avg,c_nest.rate_threshold_min,c_nest.rate_threshold_max);
                c_rad.maxrate = remap(c_nest.rate_start,c_nest.rate_end);
                c_rad.radius = remap(c_nest.radius_start,c_nest.radius_end);
                // trace(avg);
            // InfectionSystem.averageInfection 
            default:
            }
        }
    }

    public function revealNests() {
        for (ent in entities) {
            switch ent.get(NestComponent) {
            case Comp(c_nest):
                c_nest.nestState = VISIBLE;
            default:
            }
        }
    }

    public function hideNests() {
        for (ent in entities) {
            switch ent.get(NestComponent) {
            case Comp(c_nest):
                c_nest.nestState = INVISIBLE;
            default:
            }
        }
    }
    #end
}