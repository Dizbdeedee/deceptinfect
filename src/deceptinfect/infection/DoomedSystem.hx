package deceptinfect.infection;

import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.infection.components.DoomClient;
import deceptinfect.game.GameSystem;
import deceptinfect.infection.components.DoomTarget;
import deceptinfect.infection.components.Doomed;
import deceptinfect.ecswip.ReplicatedEntity;
import deceptinfect.macros.ClassToID;

class DoomedSystem extends System {

    static final sound = Gmod.Sound("deceptinfect/doom.wav");

    #if client
    override function init_client() {
        componentManager.getAddSignal(ClassToID.idc(DoomClient)).handle((doom) -> {
            SurfaceLib.PlaySound(sound);
        });
    }
    #end

    #if server
    override function init_server() {
    }
    #end

    #if server
    override function run_server() {
        final infectionSystem = systemManager.get(InfectionSystem);
        final gameSystem = systemManager.get(GameSystem);
        IterateEnt.iterGet([InfectionComponent], [{infection : inf}],function (vic) {
            if (vic.has_comp(Doomed) || vic.has_comp(DoomTarget)) continue;

            switch (inf) {
                case NOT_INFECTED({value : inf}):
                    if (inf > GameValues.DOOM_THRESHOLD_MIN && inf < GameValues.DOOM_THRESHOLD_MAX) {
                        trace("Doom threshold reached");
                        vic.add_component(new DoomTarget());
                    }
                default:
            }
        });
        IterateEnt.iterGet([DoomTarget,InfectionComponent],[c_dt,{rate: rate, infection : inf}],function (victim) {
            if (victim.has_comp(Doomed)) continue;
            c_dt.idleTime += if (rate > GameValues.DOOM_IDLE_THRESHOLD) {
                gameSystem.diffTime();
            } else {
                trace("doom++");
                gameSystem.diffTime();
            }
            if (c_dt.idleTime < 0) {
                c_dt.idleTime = 0;
            }
            if (c_dt.idleTime > GameValues.DOOM_WAIT_FOR_IDLE) {
                trace("Now doomed :(");
                victim.add_component(new Doomed(Gmod.CurTime() + MathLib.random(GameValues.DOOM_MIN,GameValues.DOOM_MAX)));
                victim.add_component(new DoomClient());
                victim.add_component(new ReplicatedEntity());
            }
        });
        IterateEnt.iterGet([Doomed],[{doomTime : deth}],function (victim) {
            if (victim.has_comp(InfectedComponent)) continue;
            if (Gmod.CurTime() > deth) {
                infectionSystem.makeInfected(victim);
            }
        });
    }
    #end
}