package deceptinfect.sabotage;

class Sabotage {
	static var nextid = 0;

	final id:SabotageID;

	public function new() {
		id = nextid++;
	}
}

abstract SabotageID(Int) from Int to Int {}
