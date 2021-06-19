package deceptinfect.radiation;

import deceptinfect.radiation.RadiationTypes.RadTypes;
import deceptinfect.radiation.RadSource.RadSourceOptions;
import enumExtractor.EnumExtractor;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.statuses.Contaminated;

class RadSourceSystem extends System implements EnumExtractor {
	#if server
	override function run_server() {
		for (x in 0...entities) {
			final ent:DI_ID = x;
			switch [ent.get(RadSource)] {
				case [Comp(c_rs)]:
					switch (c_rs.state) {
						case ACTIVE(FINITE(time)):
							if (Gmod.CurTime() > time) {
								switch (c_rs.attatch.get(RadVictim)) {
									case Comp(_):
										disengage(ent, c_rs.attatch);
									default:
								}
								ComponentManager.removeEntity(ent);
							}
						default:
					}
				default:
			}
		}
	}

	public function radSourceFromType(x:RadTypes, attatch:DI_ID, ?base:DI_ID) {
		return newRadSource(RadiationTypes.types.get(x), attatch, base);
	}

	public function refreshTime(x:RadSource) {
		x.state = switch (x.lifetime) {
			case FINITE(x):
				ACTIVE(FINITE(Gmod.CurTime() + x));
			case INFINITE:
				ACTIVE(INFINITE);
		}
	}

	public function newRadSource(rso:RadSourceOptions, attatch:DI_ID, ?base:DI_ID):DI_ID {
		var rad = ComponentManager.addEntity();
		var c_rs = new RadSource(rso);
		rad.add_component(c_rs);
		c_rs.base = switch (base) {
			case null:
				rad;
			case x:
				x;
		};
		attatchRad(rad, attatch);
		refreshTime(c_rs);
		switch (rso.options) {
			case BOTH(rpo, _) | RAD(rpo):
				rad.add_component(new RadiationProducer(rpo));
			default:
		}
		switch (rso.options) {
			case BOTH(_, cpo) | CONTAM(cpo):
				rad.add_component(new ContaminationProducer(cpo));
			default:
		}
		return rad;
	}

	public function attatchRad(rad:DI_ID, vic:DI_ID) {
		var c_rs = rad.get_sure(RadSource);
		c_rs.attatch = vic;
		var c_rv = switch (vic.get(RadVictim)) {
			case Comp(c_rv):
				c_rv;
			default:
				trace("No radvictim found on victim");
				new RadVictim();
		}
		c_rv.affected.set(c_rs.base, true);
		c_rv.radiation.set(rad, true);
		c_rv.affectedtype.set(c_rs.type, rad);
		var c_vir = switch [vic.get(VirtualPosition), vic.get(GEntityComponent)] {
			case [Comp(c_vir), _]:
				c_vir;
			case [_, Comp(c_gent)]:
				new VirtualPosition(ENT(c_gent.entity));
			default:
				trace('Could not attatch to ent $vic');
				return;
		}
		rad.add_component(c_vir);
		c_rs.attatch.getOrAdd(Contaminated);
	}

	public function disengage(radsource:DI_ID, vic:DI_ID) {
		var c_rs = radsource.get_sure(RadSource);
		c_rs.attatch = null;
		@as(vic.get(RadVictim) => Comp(c_rv)) {
			c_rv.radiation.remove(radsource);
			c_rv.affected.remove(c_rs.base);
			c_rv.affectedtype.remove(c_rs.type);
		}
		radsource.remove_component(VirtualPosition);
	}
	#end
}
