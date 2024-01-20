package deceptinfect.game;

import Assertion.*;
import deceptinfect.game.SpawnSystem.BoundsSpawn;
import deceptinfect.ents.Di_nest;
import deceptinfect.ents.Di_evac_zone;
import deceptinfect.ents.Di_charger;
import deceptinfect.ents.Di_battery;
import deceptinfect.macros.IterateEnt;

class GameInProgressSystem extends System {
	#if server
	override function run_server() {
		IterateEnt.iterGet([GameManager2], [{diffTime: dt}], function() {
			IterateEnt.iterGet([GameInProgress], [c_gamePro], function() {
				c_gamePro.baseInfection.value = calcBaseInfection(c_gamePro, dt);
				return;
			});
			return;
		});
	}
	#end

	function calcBaseInfection(x:GameInProgress, dt:Float):Float {
		var baseInf = (100 / x.totalGameTime) * dt;
		return baseInf;
	}

	public function setTime(x:GameInProgress) {
		var time = GameValues.GAME_TIMER;
		var variance = GameValues.GAME_TIMER_VARIANCE;
		x.totalGameTime = time + MathLib.random(-variance, variance);
		x.gameStarted = Gmod.CurTime();
		trace('');
		trace('Time until infection: ${x.totalGameTime}');
	}

	public function spawns() {
		final spread = systemManager.get(Spread);
		final spawnSystem = systemManager.get(SpawnSystem);
		#if server
		assert(spawnSystem != null);
		assert(spread != null);
		assert(spawnSystem.obj != null);
		var chargerSpawn = spawnSystem.obj.getRandom();
		var ent = Di_charger.create();
		chargerSpawn.spawn(ent);
		var bat1 = Di_battery.create();
		var bat2 = Di_battery.create();
		var spawns = chargerSpawn.getRandomSpawns(2);
		trace(spawns.length);
		trace(untyped spawns[1].claimed);
		spawns[0].spawn(bat1);
		spawns[1].spawn(bat2);
		var nestSpawn = spawnSystem.nest.getRandom();
		var nest = Di_nest.create();
		nestSpawn.spawn(nest);
		var evacZone = Di_evac_zone.create();
		var evacZoneSpawn:BoundsSpawn = cast spawnSystem.evac.getRandom();
		evacZoneSpawn.spawn(evacZone);
		spread.beginSpread(NavmeshLib.GetNearestNavArea(nest.GetPos(), null, false, true));
		#end
	}
}
