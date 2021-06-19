package deceptinfect.radiation;

import deceptinfect.macros.IterateEnt2;
import deceptinfect.ecswip.VirtualPosition;

using deceptinfect.DistSquared.DistSqSafe;

class ContaminationSystem extends System {
	#if server
	override function run_server() {
		IterateEnt2.iterGet([RadVictim,ContaminationAccepter,VirtualPosition],
		[c_rv,c_contamAccept,{pos : victimPos}],
		(vic) -> {
			IterateEnt2.iterGet([RadSource,ContaminationProducer,VirtualPosition],
			[c_rs,c_contamProduce,{pos : producePos}],
			(produce) -> {
				if (c_rs.attatch == vic) {
					// do not contaminate yourself....
					continue;
				}
				var dist = producePos.distSq(victimPos);
				if (shouldContam(dist, c_contamProduce)) {
					var time = c_contamAccept.contam_time.addTime(produce);
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
									if (c_rv.affected.exists(c_rs.base)) {
										switch [c_rs.state, c_rs.lifetime] {
											case [ACTIVE(FINITE(removetime)), FINITE(time)]:
												c_rs.state = ACTIVE(FINITE(Gmod.CurTime() + time));
											default:
										}

										continue;
									}
							}
							trace("Rolled successfully");
							var rad = switch (c_contamProduce.nextoptions) {
								case TYPE(radtype):
									getSystem(RadSourceSystem).radSourceFromType(radtype, vic, c_rs.base);
								case MY_TYPE:
									getSystem(RadSourceSystem).radSourceFromType(c_rs.type, vic, c_rs.base);
								case OVERRIDE_LIFETIME(t):
									var rad = getSystem(RadSourceSystem).radSourceFromType(c_rs.type, vic, c_rs.base);
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
