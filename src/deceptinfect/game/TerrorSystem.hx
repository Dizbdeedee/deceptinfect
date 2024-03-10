package deceptinfect.game;

import deceptinfect.game.components.TerrorComponent;
import deceptinfect.infection.InfectionComponent;

abstract class TerrorSystem extends System {}

class TerrorSystemDef extends TerrorSystem {
	#if client
	static final sounds = [
		Gmod.Sound("deceptinfect/beats/adrenalin/1.wav"),
		Gmod.Sound("deceptinfect/beats/adrenalin/2.wav"),
		Gmod.Sound("deceptinfect/beats/adrenalin/3.wav"),
		Gmod.Sound("deceptinfect/beats/adrenalin/4.wav"),
		Gmod.Sound("deceptinfect/beats/adrenalin/5.wav"),
		Gmod.Sound("deceptinfect/beats/adrenalin/6.wav"),
		Gmod.Sound("deceptinfect/beats/adrenalin/7.wav"),
		Gmod.Sound("deceptinfect/beats/adrenalin/8.wav"),
		Gmod.Sound("deceptinfect/beats/adrenalin/9.wav")
	];

	var playTime:Float = 0.0;

	override function run_client() {
		IterateEnt.iterGet([TerrorComponent], [{terror: t}], function() {
			if (Gmod.RealTime() > playTime) {
				var ind = MathLib.floor(t);
				if (ind == 0) {
					playTime = Gmod.RealTime() + 1;
					return;
				}
				var chosenSound = sounds[cast MathLib.floor(t)];
				Gmod.EmitSound(chosenSound, new Vector(0, 0, 0), -2, CHAN_STATIC, 0.5);
				var duration = Gmod.SoundDuration(chosenSound) - 0.025;
				playTime = Gmod.RealTime() + duration;
			}
		});
	}
	#end

	#if server
	override function run_server() {
		IterateEnt.iterGet([TerrorComponent, InfectionComponent], [c_terror, {rate: r}], function() {
			var terror = MathLib.Remap(r, 0, 3, 0, 9);
			c_terror.terror = terror;
		});
	}
	#end
}
