package deceptinfect.grab;

import deceptinfect.grab.components.*;
import deceptinfect.macros.ClassToID;
import deceptinfect.ecswip.VirtualPosition;
import Assert.assert;

abstract class SearchSystem extends System {}

class SearchSystemDef extends SearchSystem {
	#if server
	override function init_server() {
		componentManager.getAddSignal(ClassToID.idc(GrabSearchVictim))
			.handle((data) -> {
				IterateEnt.iterGet([GrabSearcher], [_], function(gs) {
					if (gs == data.ent)
						continue;
					final linkEnt = componentManager.addEntity();
					var c_gsl = new GrabSearchLink();
					linkEnt.add_component(c_gsl);
					c_gsl.grabSearcher = gs;
					c_gsl.grabVictim = data.ent;
				});
			});
	}

	override function run_server() {
		IterateEnt.iterGet([GrabSearchLink], [{grabSearcher: entSearch, grabVictim: entVictim}]
			, function(entGSL) {
				var c_gs = entSearch.get_2(GrabSearcher);
				assert(c_gs != null);
				switch (c_gs.searchState) {
					case SEARCH_ACTIVE:
					default:
						continue;
				}
				var c_gv = entVictim.get_2(GrabSearchVictim);
				var c_vicPos = entSearch.get_2(VirtualPosition);
				var c_searchPos = entVictim.get_2(VirtualPosition);
				assert(c_gs != null && c_gv != null && c_vicPos != null && c_searchPos != null);
				if (c_vicPos.pos.Distance(c_searchPos.pos) < 150) {} else {}
		});
	}
	#end
}
