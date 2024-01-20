package deceptinfect.game;

import deceptinfect.ecswip.ReplicatedComponent;
import deceptinfect.ecswip.ClientRepresentationTarget;
import deceptinfect.macros.ClassToID;

class CRTSystem extends System {
	#if server
	override function init_server() {
		componentManager.addSignal.handle((data) -> {
			if (data.comp is ReplicatedComponent
				&& data.ent.has_comp(ClientRepresentationTarget)
				&& !(data.comp is ClientRepresentationTarget)) {
				final crt = data.ent.get_2(ClientRepresentationTarget);
				final replComp = cast data.comp;
				replComp.replicated = MASTER(crt);
				trace("master repl set");
			}
		});
		componentManager.getAddSignal(ClassToID.idc(ClientRepresentationTarget))
			.handle((data) -> {
				for (component in componentManager.components_3) {
					if (component.has_component(data.ent)) {
						final comp = component.get_component(data.ent);
						if (comp is ReplicatedComponent && !(comp is ClientRepresentationTarget)) {
							final replComp:ReplicatedComponent = comp;
							replComp.replicated = MASTER(data.comp);
							trace("master repl set 2");
						}
					}
				}
			});
	}
	#end
}
