package deceptinfect.radiation;

import deceptinfect.radiation.RadSource.RadSourceOptions;
import deceptinfect.radiation.RadiationTypes.RadTypes;
import deceptinfect.radiation.RadiationProducer.RadiationProduceOptions;
import deceptinfect.radiation.RadiationProducer.RadLifetime;
using deceptinfect.DistSquared;
class ContaminationProducer extends Component {
	public var chance:Float;

	public var check:Float;
	
	public var dist:DistSquared;

	public var type:ContaminationType = SAME_TYPE;

	public var contam_time:RadLifetime;

	public var nextoptions:NextOptions;

	public function new(options:ContaminationProducerOptions, ?radoptions:RadiationProduceOptions) {
		super();
		chance = options.chance;
		dist = options.dist.safeSquare();
		check = options.check;
		if (options.type != null) {
			type = options.type;
		}
		nextoptions = options.nextoptions;
	}
}

typedef ContaminationProducerOptions = {
	/**
		Chance of being contamianted per roll
	**/
	var chance:Float;

	/**
		Distance to roll for contamination
	**/
	var dist:Float;

	/**
		How often to roll for contamination
	**/
	var check:Float;

	/**
		Contamination type.
	**/
	var type:ContaminationType;

	/**
		How long should vicitm stay contaminated for
	**/
	// var contam_time:RadLifetime;
	var nextoptions:NextOptions;
}

enum NextOptions {
	/**
		Create next radsource from type
	**/
	TYPE(radtype:RadTypes);

	/**
		Next radsource will be a duplicate of current radsource
	**/
	MY_TYPE;

	/**
		Values will be copied from type if not overridden.
	**/
	// OVERRIDE(rso:Option<RadSourceOptions>,rpo:Option<RadiationProduceOptions>,cpo:Option<ContaminationProducerOptions>);

	/**

	**/
	OVERRIDE_LIFETIME(t:RadLifetime);
}

enum ContaminationType {
	/**
		Always contaminate, no matter the target
	**/
	ALWAYS;

	/**
		Contaminate only if there is nothing with the same type on the object
	**/
	SAME_TYPE;

	/**
		Contaminate only if there is nothing from the same base source on the object
	**/
	SAME_SOURCE;
}
