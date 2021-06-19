package deceptinfect.items;

import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;

class ScannerSystem extends System {
	#if server
	public function scan_target(scan:DI_ID, target:DI_ID) {
		final c_scan = scan.get_sure(ScannerComponent);
		switch (target.get(PlayerComponent)) {
			case Comp(_):
				c_scan.scanProgress.addTime(target);
			default:
		}
	}

	public function get_reliability(scan:DI_ID, target:DI_ID):Option<Float> {
		var c_scan = scan.get_sure(ScannerComponent);
		switch (target.get(PlayerComponent)) {
			case Comp(_):
				var time = c_scan.scanProgress.getTime(target);
				final time = MathLib.Clamp(time, 0, c_scan.time);
				return Some(MathLib.Remap(time, 0, c_scan.time, c_scan.reliability_min, c_scan.reliability_max));
			default:
				return None;
		}
	}

	public function final_scan(scan:DI_ID, target:DI_ID):ScanResult {
		final c_reliab = get_reliability(scan, target);
		//something does not seem right with the probabilities here. i'm pretty sure you can game the system, or game a similar system
		return switch [c_reliab, target.get(InfectedComponent)] {
			case [Some(r), Comp(_)]:
				trace(r);
				if (MathLib.random() < r) {
					trace("right : infected");
					INFECTED;
				} else {
					trace("wrong : infected");
					HUMAN;
				}
			case [Some(r), NONE]:
				if (MathLib.random() < r) {
					trace("right: human");
					HUMAN;
				} else {
					trace("wrong: human");
					INFECTED;
				}
			default:
				NO_SCAN;
		}
	}
	#end
}

enum ScanResult {
	NO_SCAN;
	HUMAN;
	INFECTED;
}
