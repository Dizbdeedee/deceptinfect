package deceptinfect.game;

import deceptinfect.lib.BSP;
import deceptinfect.macros.IterateEnt;
import deceptinfect.game.components.DarkenApplied;
import deceptinfect.game.components.Darken;

class DarkenSystem extends System {
	#if client
	// TODO confusing logic, can we make this simpler?
	override function run_client() {
		var curDarken = None;
		IterateEnt.iterGet([DarkenApplied], [dark], function() {
			curDarken = Some(dark);
		});
		IterateEnt.iterGet([Darken], [dark], function() {
			switch (curDarken) {
				case Some(_):
					return;
				default:
					var ent = componentManager.addEntity();
					var apply = new DarkenApplied();
					replace(apply);
					ent.add_component(apply);
			}
		});
		switch (curDarken) {
			case Some(apply):
				revert(apply);
				componentManager.removeEntity(componentManager.getIDFromComponent(apply));
			default:
		}
	}

	function replace(d:DarkenApplied) {
		final open = MRBsp.OpenBSP();
		if (open != false) {
			final b:BSP = open;
			for (str in b.ReadLumpTextDataStringData()) {
				final imat = Gmod.Material(str)
					.a;
				if (!imat.IsError()) {
					if (imat.GetName()
						.indexOf("tools") == -1 && imat.GetName()
						.indexOf("lights") == -1 && imat.GetName()
						.indexOf("water") == -1) {
						var col = imat.GetVector("$color");
						final er = {
							name: str,
							baseTexture: imat.GetTexture("$basetexture"),
							color: col
						};
						d.materialsSet.push(er);
						// final colorTex = Gmod.Material("tools/toolsblack").a.GetTexture("$basetexture");
						imat.SetTexture("$basetexture", "grey");
						imat.SetVector("$color", new Vector(0.03, 0.03, 0.03));
					}
				}
			}
		}
	}

	function revert(d:DarkenApplied) {
		for (mat in d.materialsSet) {
			final imat = Gmod.Material(mat.name)
				.a;
			if (mat.baseTexture == null) {
				trace("no base texture");
				imat.SetUndefined("$basetexture");
			} else {
				imat.SetTexture("$basetexture", mat.baseTexture);
				trace("set texture");
			}
			if (mat.color == null) {
				imat.SetUndefined("$color");
				trace("no color");
			} else {
				imat.SetVector("$color", mat.color);
				trace("set color");
			}
			// imat.Recompute();
		}
	}
	#end
}
