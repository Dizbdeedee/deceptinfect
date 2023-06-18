package deceptinfect.radiation;

import deceptinfect.ecswip.SystemManager;
import deceptinfect.macros.IterateEnt;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.game.GameSystem;

using deceptinfect.DistSquared.DistSqSafe;

class ContaminationSystem extends System {
    #if server

    override function init_server() {

    }

    function run_server_() {
        // IterateEnt.iterGet([ContaminationProducer,])
    }
    override function run_server() {
        final radSourceSystem = systemManager.get(RadSourceSystem);
        final gameSystem = systemManager.get(GameSystem);
        IterateEnt.iterGet([RadVictim,ContaminationAccepter,VirtualPosition],
        [c_rv,c_contamAccept,{pos : victimPos}],
        (vic) -> {
            IterateEnt.iterGet([RadSource,ContaminationProducer,VirtualPosition],
            [c_rs,c_contamProduce,{pos : producePos}],
            (produce) -> {
                if (c_rs.attatch == vic) {
                    // do not contaminate yourself....
                    continue;
                }
                var dist = producePos.distSq(victimPos);
                if (shouldContam(dist, c_contamProduce)) {
                    var time = c_contamAccept.contam_time.addTime(produce,gameSystem.diffTime());
                    if (shouldRoll(time, c_contamProduce)) {
                        c_contamAccept.contam_time.resetTime(produce);
                        var randRoll = Math.random();
                        if (randRoll < c_contamProduce.chance) {
                            switch (c_contamProduce.type) {
                                case ALWAYS:
                                case SAME_TYPE:
                                    if (c_rv.affectedtype.exists(c_rs.type)) {
                                        continue;
                                    }
                                case SAME_SOURCE:
                                    var abort = false;
                                    IterateEnt.iterGet([RadSource],[{base : b}],() -> {
                                        if (b == c_rs.base) {
                                            abort = true;
                                            break;
                                        }
                                    });

                                    if (abort) {
                                        switch [c_rs.state, c_rs.lifetime] {
                                            case [ACTIVE(FINITE(_)), FINITE(time)]:
                                                c_rs.state = ACTIVE(FINITE(Gmod.CurTime() + time));
                                            default:
                                        }

                                        continue;
                                    }
                            }
                            trace("Rolled successfully");
                            var rad = switch (c_contamProduce.nextoptions) {
                                case TYPE(radtype):
                                    radSourceSystem.radSourceFromType(radtype, vic, c_rs.base);
                                case MY_TYPE:
                                    radSourceSystem.radSourceFromType(c_rs.type, vic, c_rs.base);
                                case OVERRIDE_LIFETIME(t):
                                    var rad = radSourceSystem.radSourceFromType(c_rs.type, vic, c_rs.base);
                                    var c_rs = rad.get_sure(RadSource);
                                    c_rs.lifetime = t;
                                    radSourceSystem.refreshTime(c_rs);
                                    rad;
                            }
                        }
                    }
                } else {
                    c_contamAccept.contam_time.removeTime(produce,gameSystem.diffTime());
                }

            });

        });

    }

    static inline function shouldContam(dist:DistSquared, contamProduce:ContaminationProducer):Bool {
        return dist < contamProduce.dist;
    }

    static inline function shouldRoll(time:Float, contamProduce:ContaminationProducer):Bool {
        return time > contamProduce.check;
    }
    #end
}
