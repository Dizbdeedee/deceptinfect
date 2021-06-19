package deceptinfect.radiation;

import deceptinfect.ecswip.VirtualPosition;
using deceptinfect.DistSquared.DistSqSafe;

class ContaminationSystem extends System implements enumExtractor.EnumExtractor {

    #if server
    override function run_server() {
        
        
        for (x in 0...entities) {
            final vic:DI_ID = x; 
            switch [vic.get(RadVictim),vic.get(ContaminationAccepter),vic.get(VirtualPosition)] {
            case [Comp(c_rv),Comp(c_contamAccept),Comp(c_vicpos)]:
                for (y in 0...entities) {
		    final produce:DI_ID = y;
                    switch [produce.get(RadSource),produce.get(ContaminationProducer),produce.get(VirtualPosition)] {
                    case [Comp(c_rs),Comp(c_contamProduce),Comp(c_producePos)]:
                        if (c_rs.attatch == vic) {
                            //do not contaminate yourself....
                            continue;
                        }
                        
                        var dist = c_producePos.pos.distSq(c_vicpos.pos);
                        if (shouldContam(dist,c_contamProduce)) {
                            var time = c_contamAccept.contam_time.addTime(produce);
                            //trace('time $time');
                            if (shouldRoll(time,c_contamProduce)) {
                                c_contamAccept.contam_time.resetTime(produce);
                                //trace('roll');
                                var randRoll = Math.random();
                                if (randRoll < c_contamProduce.chance) {
                                    switch (c_contamProduce.type) {
                                    case ALWAYS:
                                    case SAME_TYPE:
                                        if (c_rv.affectedtype.exists(c_rs.type)) {

                                            continue;
                                        }
                                    case SAME_SOURCE:
                                        if (c_rv.affected.exists(c_rs.base)) {
                                            
                                            switch [c_rs.state,c_rs.lifetime] {
                                                case [ACTIVE(FINITE(removetime)),FINITE(time)]:
                                                    c_rs.state = ACTIVE(FINITE(Gmod.CurTime() + time));
                                                default:
                                            }
                            
                                            continue;
                                        }
                                    }
                                    // c_rv.affected.set(c_rs.base,true);
                                    // c_rv.affectedtype.set(c_rs.type,produce);
                                    trace("Rolled successfully");
                                    // var rad = ComponentManager.addEntity();
                                    var rad = switch (c_contamProduce.nextoptions) {
                                        case TYPE(radtype):
                                            getSystem(RadSourceSystem).radSourceFromType(radtype,vic,c_rs.base);
                                        case MY_TYPE:
                                            getSystem(RadSourceSystem).radSourceFromType(c_rs.type,vic,c_rs.base);
                                        case OVERRIDE_LIFETIME(t):
                                            var rad = getSystem(RadSourceSystem).radSourceFromType(c_rs.type,vic,c_rs.base);
                                            var c_rs = rad.get_sure(RadSource);
                                            c_rs.lifetime = t;
                                            getSystem(RadSourceSystem).refreshTime(c_rs);
                                            rad;
                                    }
                                    
                                }
                            }
                        } else {
                            c_contamAccept.contam_time.removeTime(produce);
                        }
                    default:
                    }
                }
            default:
            }
        }

       
    }


    static inline function shouldContam(dist:DistSquared,contamProduce:ContaminationProducer):Bool {
        return dist < contamProduce.dist;
    }

    static inline function shouldRoll(time:Float,contamProduce:ContaminationProducer):Bool {
        return time > contamProduce.check;
    }
    #end
}