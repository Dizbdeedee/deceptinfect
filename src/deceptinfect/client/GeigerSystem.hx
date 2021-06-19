package deceptinfect.client;

import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.game.GeigerCounter;
import deceptinfect.macros.IterateEnt2;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.ecswip.System;

@:expose("geiger")
class GeigerSystem extends System {

	#if client
	var geiger:Float = 0.0;

	static var sounds = [
		Gmod.Sound("player/geiger1.wav"),
		Gmod.Sound("player/geiger2.wav"),
		Gmod.Sound("player/geiger3.wav")
	];
	
	var playTime:Float = 0.0;

	override function run_client() {
		IterateEnt2.iterGet([GeigerCounter],[{geiger : g}],
		function () {
			trace("Running");
			geiger = g;
		});
		geigerThink();
	}

	public function geigerThink() {
		if (Gmod.CurTime() > playTime && geiger > 0.016) {
			var choice = switch (geiger) {
				case x if (x < 0.2):
					sounds[0];
				default:
					sounds[MathLib.random(0, 2)];
			}
			Gmod.EmitSound(choice, new Vector(0, 0, 0), -2, CHAN_STATIC, 0.5);
			var mintime = Gmod.SoundDuration(sounds[0]) * 0.75;
			var exponent = 0.5 * (Math.pow(geiger, -0.5)) - 0.5;
			var random = untyped __lua__("math.random(0.5,1.1)");
			var maxtime = 3;
			playTime = MathLib.min(Gmod.CurTime() + mintime + exponent * random, Gmod.CurTime() + maxtime);
		}
	}
	#end



	#if server

	@:expose("testGeiger")
	static function testGeiger(x:GPlayerCompat) {
		final xdee = new GeigerCounter();
		x.id.add_component(xdee);
		xdee.replicate(SOME(CURRENT_PLAYER));
		xdee.geiger = 0.5;
	}

	@:expose("testGeiger2")
	static function testGeiger2(x:GPlayerCompat) {
		final count = x.id.get_sure(GeigerCounter);
		count.geiger = 0;
		count.replicate(NONE);
		count.send(SOME(CURRENT_PLAYER));
	}

	
	override function run_server() {
		IterateEnt2.iterGet([GeigerCounter,InfectionComponent,PlayerComponent],[geig,{rate : r},_],
		function () {
			geig.geiger = Math.min(((r - 1) / 2),1);
		});
		
	}
	#end
}
