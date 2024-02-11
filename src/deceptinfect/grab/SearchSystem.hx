package deceptinfect.grab;

import deceptinfect.grab.components.*;
import deceptinfect.macros.ClassToID;
import deceptinfect.grab.components.GrabSearchLink;
import deceptinfect.ecswip.VirtualPosition;
import Assert.assert;
import deceptinfect.game.GameSystem;

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
		var validGrabCache = [];
		IterateEnt.iterGet([GrabSearchLink], [
			c_gsl = {grabSearcher: entSearch, grabVictim: entVictim, grabSearchLinkState: linkstate}
		], function(entGSL) {
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
			if (c_vicPos.pos.Distance(c_searchPos.pos) < 150) {
				increaseGrabTime(linkstate);
			} else {
				decreaseGrabTime(linkstate);
			}
			switch (assertValidGrab(c_gs, c_gv, c_gsl)) {
				case NEW_VALID_GRAB(_):
					validGrabCache.push(c_gv);
				default:
			}
		});
	}

	function increaseGrabTime(linkstate:GrabSearchLinkState) {
		var dt = systemManager.get(GameSystem)
			.diffTime();
		if (dt == null)
			return;
		switch (linkstate) {
			case VALID(timeInvalid):
				timeInvalid.value -= dt;
				if (timeInvalid.value < 0) {
					timeInvalid.value = 0;
				}
			case INVALID(timeValid):
				timeValid.value += dt;
		}
	}

	function decreaseGrabTime(linkstate:GrabSearchLinkState) {
		var dt = systemManager.get(GameSystem)
			.diffTime();
		if (dt == null)
			return;
		switch (linkstate) {
			case VALID(timeInvalid):
				timeInvalid.value += dt;
			case INVALID(timeValid):
				timeValid.value -= dt;
				if (timeValid.value < 0) {
					timeValid.value = 0;
				}
		}
	}

	function assertValidGrab(searcher:GrabSearcher, searchVictim:GrabSearchVictim,
			link:GrabSearchLink):ValidGrabResult {
		switch (link.grabSearchLinkState) {
			case VALID(timeInvalid):
				if (timeInvalid.value > searcher.searchInactiveTime) {
					link.grabSearchLinkState = INVALID(.0);
					searchVictim.targetting -= 1;
				}
			case INVALID(timeValid):
				if (timeValid.value > searcher.searchTime) {
					link.grabSearchLinkState = VALID(.0);
					searchVictim.targetting += 1;
					return NEW_VALID_GRAB(searchVictim);
				}
		}
		return NONE;
	}
	#end
}

enum ValidGrabResult {
	NEW_VALID_GRAB(searchVictim:GrabSearchVictim);
	NONE;
}
