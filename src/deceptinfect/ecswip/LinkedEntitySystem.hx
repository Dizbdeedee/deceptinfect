package deceptinfect.ecswip;

import deceptinfect.macros.IterateEnt;

class LinkedEntitySystem extends System {
	override function init_server() {
		componentManager.getAddSignal(LinkedComponents)
			.handle((linkedCompData) -> {
				final comp1 = linkedCompData.comp.comp1;
				final comp2 = linkedCompData.comp.comp2;
				if (comp1 == null || comp2 == null) {
					trace("Linked components could not be linked!!! AAAA");
					return;
				}
				var trashCallbacks:Array<CallbackLink>;
				trashCallbacks = [
					componentManager.getRemoveSignal(linkedCompData.comp.comp1.getCompID())
						.handle((removedData) -> {
							if (removedData.comp == linkedCompData.comp.comp1) {
								trashCallbacks.map((c) -> c.cancel());
								componentManager.removeEntity(linkedCompData.ent);
							}
						}),
					componentManager.getRemoveSignal(linkedCompData.comp.comp2.getCompID())
						.handle((removedData) -> {
							if (removedData.comp == linkedCompData.comp.comp2) {
								trashCallbacks.map((c) -> c.cancel());
								componentManager.removeEntity(linkedCompData.ent);
							}
						})];
			});
	}
}
