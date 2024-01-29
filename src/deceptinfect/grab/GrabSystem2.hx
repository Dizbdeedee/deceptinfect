package deceptinfect.game;

class GrabSystem2 extends System {
	#if server
	override function init_server() {}

	override function run_server() {
		IterateEnt.iterGet([GrabSearcher, GEntityComponent], [c_search, {entity: g_attack}]
			, function(attack) {
				switch (c_search.searchState) {
					case SEARCH_ACTIVE:
					// search code
					case TARGET_LOCKED(target):
					// target validility. maybe keep track of them if they are valid
					case BUILDUP_TARGET(target):
					case SEARCH_INACTIVE():
				}
		});
	}
	#end
}
