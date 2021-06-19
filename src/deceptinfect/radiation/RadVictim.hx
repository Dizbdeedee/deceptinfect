package deceptinfect.radiation;

import deceptinfect.radiation.RadiationTypes.RadTypes;

/**
	Goes on entity producing **NOT** the radiation entity
**/
class RadVictim extends Component {
	/**
		For base types...
	**/
	var affected:Map<DI_ID, Bool> = [];

	var affectedtype:Map<RadTypes, DI_ID> = [];

	var radiation:Map<DI_ID, Bool> = [];
}
