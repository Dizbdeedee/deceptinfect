package deceptinfect.game;

import deceptinfect.GameManager2.GAME_STATE_2;
import deceptinfect.macros.IterateEnt;
import deceptinfect.ecswip.SystemManager;
import deceptinfect.util.PrintTimer;
import deceptinfect.util.Util;
import gmod.helpers.net.NET_Server;
import deceptinfect.game.components.EvacZone;
import deceptinfect.game.components.EvacBlocked;
import deceptinfect.game.components.EvacInZone;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ents.Di_entities;
import deceptinfect.infection.InfectionSystem;
import deceptinfect.abilities.FormComponent;
import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;


class EvacSystem extends System {

	#if client

	function changeEvacState() {

		IterateEnt.iterGet([EvacZone],[c_evac = {state : s, prevState : prev}],function() {
			if (prev.getIndex() != s.getIndex()) {
				switch (s) {
					case ARRIVING(time):
						PrintTimer.print_time(3, () -> trace('leaving!!.. $time'));
					default:
				}
				c_evac.prevState = s;
			}
			// switch (s) {
				
			// }
		});
		// switch (x) {
		// 	case {state: NOT_ACTIVE}:
		// 	// stop showing hud
		// 	case {state: ARRIVING, time: t}:
		// 	// start showing hud
		// 	case {state: LEAVING, time: t}:
		// 		// Util.printTimer("BOOOGA",3, () -> trace('leaving!!..$t'));
		// 		PrintTimer.print_time(3, () -> trace('leaving!!.. $t'));
		// 	// Util.printTime(3,() -> trace('leaving!!..$t'));
		// 	default:
		// 		PrintTimer.print_time(5, () -> trace("Invalid state for hud...."));
		// 		// Util.printTime(5,() -> trace("Invalid state for hud...."));
		// 		// Util.printTimer("oogieboogie",5,() -> trace("Invalid state for hud..."));
		// }
	}
	#end

	#if server
	var flaresSpawned = false;

	override function run_server() {
		for (x in 0...ComponentManager.entities) {
			final ent:DI_ID = x;
			var state:GAME_STATE_2 = null;
			IterateEnt.iterGet([GameManager2],[{state : s}],function () {
				state = s;
				break;
			});

			
			switch [ent.get(EvacZone), state] {
				case [Comp(c_evac), PLAYING]:
					if (InfectionSystem.get().getAverageInfection() > 80 && !flaresSpawned) {
						var flareSpawn = SpawnSystem.obj.getRandom();
						flareSpawn.spawn(EntsLib.Create(Di_entities.di_flare));
						var flareSpawn2 = flareSpawn.getRandomSpawns(1);
						flareSpawn2[0].spawn(EntsLib.Create(Di_entities.di_flare));
						flaresSpawned = true;
					}
					switch (c_evac.state) {
						case LEAVING(time):
							time.value -= GameSystem.get().diffTime();
							if (time.value < 0) {
								trace(c_evac.state);
								checkWin(c_evac);
								c_evac.state = NOT_ACTIVE;
							}
							// IterateEnt.iterGet([EvacInZone],[])
							// for (id in c_evac.in_zone.keys()) {
							// 	switch (id.get(FormComponent)) {
							// 		case Comp(_.form => INFECTED):
							// 			c_evac.in_zone.remove(id);
							// 			c_evac.blocked.set(id, true);
							// 		default:
							// 	}
							// }
							

						case ARRIVING(time):
							time.value -= GameSystem.get().diffTime();
							if (time.value < 0) {
								trace(c_evac.state);
								c_evac.state = LEAVING(c_evac.leavetime);
							}
							

						default:
					}
				default:
			}
		}
	}

	public function checkWin(evac:EvacZone) {
		// var humanEscape = false;
		IterateEnt.iterGet([EvacInZone],[_],function (id) {
			switch [id.get(InfectedComponent),id.get(EvacBlocked)] {
				case [Comp(_),NONE]:
					IterateEnt.get([WinManager],[{winTrigger : wt}],function () {
						wt.trigger(WIN_INF);
						return;
					}); 

				default:
			}
			
		});
		// var ello:String;
		IterateEnt.iterGet([WinManager],[{winTrigger : wt}],function () {
			wt.trigger(WIN_HUMAN);
			break;
		}); 
		return;
		
	}

	public function touched(ent:DI_ID, evac:EvacZone) {
		if (ent.has_comp(PlayerComponent)) {
			if (ent.has_comp(EvacBlocked)) {
				return;
			}				
			switch [evac.state,ent.has_comp(EvacTouched)] {
				case [LEAVING(time),false]:
					
					if (time.value < evac.leavetime / 2) {
						time.value = evac.leavetime / 2;
					}
				default:
			}
			
			ent.add_component(new EvacTouched());
			ent.add_component(new EvacInZone());
		}
	}

	public function addFlare(flare:DI_ID, evac:DI_ID) {
		switch [flare.get(FlareComponent), flare.get(GEntityComponent), evac.get(EvacZone)] {
			case [Comp(_), Comp(c_gent), Comp(c_evac)]:
				switch (c_evac.state) {
					case NOT_ACTIVE:
						c_evac.state = ARRIVING(c_evac.arrivetime);
						c_gent.entity.Remove();
					default:
				}
			default:
		}
	}

	public function leave(ent:DI_ID, evac:EvacZone) {
		switch (ent.get(PlayerComponent)) {
			case Comp(_):
				ent.remove_component(EvacInZone);
			default:
		}
	}
	#end
}
