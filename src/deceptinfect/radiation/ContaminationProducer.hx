package deceptinfect.radiation;

import deceptinfect.radiation.RadiationProducer.RadLifetime;

class ContaminationProducer {
    public var chance:Float;
    // public var time:Float;
    public var check:Float;
    public var dist:Float;
    public var type:ContaminationType = SAME_TYPE;

    public var contam_time:RadLifetime;

    public var options:ContaminationProducerOptions;

    public function new(options:ContaminationProducerOptions) {
        chance = options.chance;
        time = options.time;
        dist = options.dist;
        check = options.check;
        if (options.type != null) {type = options.type;}
        this.options = options;
        
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
    var contam_time:RadLifetime;

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