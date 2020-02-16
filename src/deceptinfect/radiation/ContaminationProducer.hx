package deceptinfect.radiation;

class ContaminationProducer {
    public var chance:Float;
    public var time:Float;
    public var check:Float;
    public var dist:Float;
    public var type:ContaminationType = SAME_TYPE;

    public function new(options:ContaminationProducerOptions) {
        chance = options.chance;
        time = options.time;
        dist = options.dist;
        check = options.check;
        if (options.type != null) {type = options.type;}
        
    }
    
}



typedef ContaminationProducerOptions = {
    /**
        Chance of being contamianted per roll
    **/
    var chance:Float;
    /**
        How long contamination lasts on target
    **/
    var time:Float;
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