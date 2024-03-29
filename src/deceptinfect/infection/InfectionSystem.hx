package deceptinfect.infection;

import deceptinfect.game.GameSystem;
import deceptinfect.radiation.RadiationAccepter;
import deceptinfect.game.GeigerCounter;
import deceptinfect.macros.IterateEnt;
import deceptinfect.game.components.AliveComponent;
import deceptinfect.game.components.KeepRestart;
import deceptinfect.ecswip.System;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.infection.components.InfectionManager;
import deceptinfect.infection.doom.components.ActiveDoom;

@:allow(InfectionComponent)
class InfectionSystem extends System {
	#if server
	var infectionReport = 0.0;

	override function init_server() {
		var ent = componentManager.addEntity();
		ent.add_component(new InfectionManager());
		ent.add_component(new KeepRestart());
	}

	public function getAverageInfection() {
		IterateEnt.iterGet([InfectionManager], [{averageInfection: avg}], () -> {
			return avg;
		});
		throw "Average infection not here...";
	}

	override function run_server() {
		final gameSystem = systemManager.get(GameSystem);
		var numPlayers = 0;
		var totalInf = 0.0;
		IterateEnt.iterGet([InfectionComponent],
			[c_inf = {acceptingInfection: ACCEPTING, infection: NOT_INFECTED(inf)}],
			(ent) -> {
				c_inf.fieldsChanged = true; // we're using a proxy object
				if (ent.has_comp(PlayerComponent) && !ent.has_comp(AliveComponent)) {
					continue;
				}
				var base = getBaseInfection(c_inf);
				var rate = switch (ent.get(RateAccepter)) {
					case Comp(rate):
						calcInfectionFromRates(rate, ent);
					default:
						c_inf.rate;
				}
				c_inf.rate = MathLib.max(0, rate);
				rate *= gameSystem.diffTime(); // what? shouldn't this be base?? read: NO!!!
				// rate += 1;
				var vun = switch (ent.get(InfVunerability)) {
					case Comp(c_v):
						c_v.vun;
					default:
						1;
				}
				if (!ent.has_comp(ActiveDoom)) {
					inf.value += base * vun;
				}
				if (ent.has_comp(ActiveDoom)) {
					vun = MathLib.min(0.3, vun);
				}
				inf.value += rate * vun;
				if (Gmod.CurTime() > infectionReport) {
					trace('$base $rate $vun');
				}
				fixUpInfection(c_inf);
				switch (ent.get(PlayerComponent)) {
					case Comp(ply):
						totalInf += c_inf.getInfValue();
						numPlayers++;
					default:
				}
				switch (c_inf.infection) {
					case INFECTED:
						onInfected(ent);
					default:
				}
			});
		if (numPlayers > 0) {
			IterateEnt.iterGet([InfectionManager], [infMan], () -> {
				infMan.averageInfection = totalInf / numPlayers; // not actually average infection
			});
		}
		if (Gmod.CurTime() > infectionReport) {
			infectionReport = Gmod.CurTime() + 5;
		}
	}
	#end

	public function makeInfected(ent:DI_ID) {
		switch (ent.get(InfectionComponent)) {
			case Comp(inf):
				inf.infection = switch (inf.infection) {
					case NOT_INFECTED(_):
						onInfected(ent);
						INFECTED;
					default:
						INFECTED;
				}
				trace('infection : ${inf.infection}');
			default:
		}
	}

	function calcInfectionFromRates(rate:RateAccepter, target:DI_ID):Float {
		var total = 0.0;
		var totalmulti = 1.0;
		IterateEnt.iterGet([Rate], [{affecting: affecting, value: value, multiplier: multi}], function() {
			if (affecting == target) {
				if (!multi) {
					total += value;
				} else {
					totalmulti += value;
				}
			}
		});
		switch (target.get(RadiationAccepter)) {
			case Comp(c_radAccept):
				total += c_radAccept.rate;
			default:
		}

		return total * totalmulti;
	}

	public function infect(id:DI_ID, x:Float) {
		var inf = id.get_sure(InfectionComponent);
		switch [inf.infection, id.get(InfVunerability)] {
			case [NOT_INFECTED(inf), Comp(c_vun)]:
				inf.value += x * c_vun.vun;
			case [NOT_INFECTED(inf), NONE]:
				inf.value += x;
			case [INFECTED, _]:
		}
	}

	#if server
	function getBaseInfection(inf:InfectionComponent):Float {
		return switch (inf.baseInfection) {
			case NOT_USING:
				0;
			case USING_GLOBAL:
				var value = null;
				IterateEnt.iterGet([GameInProgress], [{baseInfection: bI}], function() {
					value = bI.value;
					break;
				});
				if (value == null) {
					inf.baseInfection = USING_STATIC(0.0);
					value = .0;
				}
				value;
			case USING_STATIC(rate):
				rate;
		}
	}
	#end

	// TODO needed?
	function fixUpInfection(infection:InfectionComponent) {
		switch (infection.infection) {
			case NOT_INFECTED(inf) if (inf.value < 0):
				inf.value = 0;
			case NOT_INFECTED(inf) if (inf.value >= 100):
				trace("Now infected :)");
				infection.infection = INFECTED;
			default:
		}
	}

	function onInfected(ent:DI_ID) {
		#if server
		final gameSystem = systemManager.get(GameSystem);
		switch (ent.get(PlayerComponent)) {
			case Comp({player: p}):
				trace('INIT INFECTED PLAYER $p');
				gameSystem.beginInfected(ent);
				ent.remove_component(GeigerCounter);
			default:
		}
		#end
	}
}
