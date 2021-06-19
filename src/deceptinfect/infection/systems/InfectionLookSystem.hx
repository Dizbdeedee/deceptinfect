package deceptinfect.infection.systems;

import deceptinfect.GEntCompat.GPlayerCompat;
import gmod.gclass.Entity.EntityGetHitBoxBoundsReturn;
import deceptinfect.ecswip.PlayerComponent;

typedef ND_InfInfo = {
	target:Entity,
	?inf:Float,
	isinfected:Bool
}

class InfectionLookSystem extends System {
	static var infectioninfo = new gmod.helpers.net.NET_Server<"di_infinfo", ND_InfInfo>();

	#if client
	override function init_client() {
		infectioninfo.signal.handle(recvInfectionInfo);
	}

	function recvInfectionInfo(x:ND_InfInfo) {
		var target:GPlayerCompat = cast x.target;
		var c_inf = target.id.getOrAdd(InfectionComponent);
		if (x.isinfected) {
			c_inf.infection = INFECTED;
		} else {
			c_inf.infection = NOT_INFECTED(x.inf);
		}
	}
	#end

	#if server
	override function run_server() {
		for (x in 0...ComponentManager.entities) {
			final ent:DI_ID = x;
			switch [ent.get(InfectionLookInfo), ent.get(PlayerComponent)] {
				case [Comp(c_look), Comp({player: ply})]:
					switch (ply.GetEyeTrace().Entity.validID()) {
						case Some(id = _.get(InfectionComponent) => Comp(c_inf)):
							var t = c_look.lookat.addTime(id);
							if (t > c_look.threshold) {
								var isinfected;
								var inf = switch (c_inf.infection) {
									case NOT_INFECTED(x):
										isinfected = false;
										x.value;
									case INFECTED:
										isinfected = true;
										100.0;
								}
								// trace('sending... $inf');
								infectioninfo.send({
									target: id.get_sure(PlayerComponent).player,
									isinfected: isinfected,
									inf: inf
								}, ply, true);
								c_look.lookat.setTime(id, 2.0);
							}
						default:
							c_look.lookat.removeAllTimes();
					}
				default:
			}
		}
	}
	#end
}
