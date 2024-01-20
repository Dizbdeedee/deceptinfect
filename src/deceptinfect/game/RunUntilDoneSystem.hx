package deceptinfect.game;

using Lambda;

class RunUntilDoneSystem extends System {
	public function addRunner(x:() -> Bool) {
		if (added.exists(x))
			return;
		added.set(x, true);
		linkQueue.push(x);
	}

	var added:Map<Function, Bool> = new Map();

	var linkQueue:Array<Function> = [];

	override function run_shared() {
		var removes = [];
		for (link in linkQueue) {
			if (link()) {
				removes.push(link);
			}
		}
		removes.iter(linkQueue.remove);
	}
}
