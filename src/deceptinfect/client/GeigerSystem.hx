package deceptinfect.client;

import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.game.GeigerCounter;
import deceptinfect.macros.IterateEnt;
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
		geiger = 0.0;
		IterateEnt.iterGet([GeigerCounter], [{geiger: g}], function() {
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
	override function run_server() {
		IterateEnt.iterGet([GeigerCounter, InfectionComponent, PlayerComponent],
						   [geig, {infection: i, rate: r}, _]
			, function() {
				var baserate = switch (i) {
					case NOT_INFECTED({value: v}) if (v < 50):
						0;
					case NOT_INFECTED({value: v}) if (v < 70):
						MathLib.Remap(v, 50, 70, 0,0.2);
					case NOT_INFECTED({value: v}) if (v < 90):
						MathLib.Remap(v, 70, 90, 0.2,0.9);
					case INFECTED:
						0;
					default:
						0.8;
				}
				geig.geiger = Math.max(baserate, Math.min(((r - 1) / 2), 1));
		});
	}
	#end
}
