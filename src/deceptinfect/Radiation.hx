package deceptinfect;

import gmod.gclass.Entity.EntityID;

class Radiation {
    var lifetime:Float;
    var attatched:RadiationAttatched = NOT_ATTATCHED;
    var state:RadiationState = ENABLED;
    var position:Vector;
    var id:RadiationID;
    var base:RadiationID;
    public var baseID(default,null):Int;

    public function new(pos:Vector,rad:RadiationManager) {
        position = pos;
        id = rad.addRadiation(this);
    
    }  

    public function think() {

    }
}

typedef RadiationOptions = {
    ?attatch : Entity,
    ?lifetime : Float
}
typedef ContamRadiationOptions = {
    contam_type : ContaminationType,
}

class ContamRadiation extends Radiation {
    
    var times:TimeKeep;
    function shouldContamRoll(f:ContamEntity):Bool {
        return false;
        // switch ([state,f.canContaminate()]) {
        //     case [ENABLED,true]:

        //     default:
        //         return false;
        // }
        
        
        
    }

    function contaminate(e:Entity) {

    }

    
}

typedef ContamEntity = {
    function EntIndex():EntityID;
    function GetPos():Vector;
    function canContaminate():Bool;
}

typedef RadiationTarget = {
    
}

class RadiationManager {
    var storage:Array<Radiation> = [];
    var contaminated:Map<EntityID,ContamRadiation> = [];
    // var rateEntities:Array<
    public function new() {
    
    }
    public function addRadiation(r:Radiation):RadiationID {
        storage.push(r);
        return storage.length - 1;
    }

    public function setContaminated(e:EntityID,r:ContamRadiation) {

    }



    
    
}

/**
    Whether the source 
**/
enum RadiationAttatched {
    NOT_ATTATCHED;
    ATTATCHED(e:Entity);
}
enum RadiationState {
    ENABLED;
    DISABLED;
    DESTROYED;
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

@:forward
abstract RadiationID(Int) from Int {

}