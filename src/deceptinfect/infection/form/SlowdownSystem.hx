package deceptinfect.infection.form;

import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.abilities.FormComponent;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.infection.InfectionComponent;

abstract class SlowdownSystem extends System {}

class SlowdownSystemDef extends SlowdownSystem {
	#if server
	override function run_server() {
		IterateEnt.iterGet([PlayerComponent, FormComponent, VirtualPosition]
			, [c_ply, {form: INFECTED}, c_infpos], function() {
				IterateEnt.iterGet([PlayerComponent, InfectionComponent, VirtualPosition]
					, [_, {infection: NOT_INFECTED(_)}, c_vicpos], function() {
						var dist = c_vicpos.pos.Distance(c_infpos.pos);
						var newspeed = MathLib.Remap(dist, 95, 500, 100, 190);
						c_ply.player.SetWalkSpeed(newspeed);
				});
		});
	}
	#end
}
