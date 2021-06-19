package deceptinfect.infection;

import deceptinfect.ecswip.Component;
import deceptinfect.infection.systems.RateSystem;

class RateComponent extends Component {
	public var addRates:Map<AddRateID, Float> = [];

	public var multipliers:Map<MultiplierRateID, Float> = [];
}
