package deceptinfect.game;

import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.game.components.BatteryAccepter;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.System;

class BatterySystem extends System {

    #if server
    override function run_server() {
        for (ents in ComponentManager.entities) {
            switch [ents.get(BatteryAccepter)] {
            case [Comp(c_accept)]:
                c_accept.charge -= c_accept.decay;
                if (c_accept.charge < 0.0) {
                    c_accept.charge = 0.0;
                }
                if (c_accept.charge > c_accept.satisfy) {
                    //reveal nest ect.
                    c_accept.status = SATISIFED;
                }
                switch (c_accept.status) {
                case SATISIFED:
                    if (c_accept.charge < c_accept.satisfy) {
                        c_accept.status = AVALIABLE;
                    }
                default:

                }
            default:
            }

        }
    }
    

    public function addBattery(source:DI_ID,accepter:DI_ID):Bool {
        return switch [source.get(BatterySource),accepter.get(BatteryAccepter)] {
        case [Comp(c_source),Comp(c_accept)]:
            switch source.get(deceptinfect.sabotage.S_Break) {
                case Comp(_):
                    c_accept.charge -= (c_source.charge / 2);
                default:
                    c_accept.charge += c_source.charge;
            }
            switch [source.get(deceptinfect.sabotage.S_Explode),source.get(GEntityComponent)] {
                case [Comp(s_explode),Comp(c_gent)]:
                    UtilLib.BlastDamage(c_gent.entity,c_gent.entity,c_gent.entity.GetPos(),500,75);    
                default:
            }
            true;
        default:
            false;
        }
    }
    #end
}