package deceptinfect;

import haxe.ds.Option;
import deceptinfect.GameEntity.ComponentState;
import gmod.gclass.Entity.EntityID;

class Radiation {
    var lifetime:Float;
    public var attatched:RadiationAttatched = NOT_ATTATCHED;
    

    var state:RadiationState = ENABLED;
    var maxrate:Float;
    var radius:Float;
    public var pos:Vector;
    public var id(default,null):RadiationID;
    public var baseID(default,null):RadiationID;
    public function new(pos:Vector,rad:RadiationManager) {
        this.pos = pos;
        id = rad.addRadiation(this);
        
    }

    public function getRadiationForPosition(pos:Vector):Option<Float> {
        var rate = (maxrate - 1) * ((radius - this.pos.Distance(pos)));
        if (rate >= 0) {
            return Some(rate);
        } else {
            return None;
        }
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
    var contam_dist:Float;
    var contam_time:Float;
    var times:TimeKeep;
    //contamactive?
    function shouldContamRoll(pos:Vector,ent:EntityID):Bool {
        var dist = this.pos.Distance(pos);
        if (dist <= contam_dist) {
            var time = times.addTime(ent);
            if (time >= contam_time) {
                times.setTime(ent,0.0);
                return true;
            }
        } else {
            times.removeTime(ent);
        }
        return false;
        
    }

    function contaminate(e:Entity) {
        
    }

    
}

typedef ContamEntity = {
    
}

/**
    Storage for overaching radiation managment
**/
class RadiationManager {
    var targets:Array<RadiationTarget>;

    /**
        All radiation goes here
    **/
    var storage:Array<Radiation> = [];
    var contaminated:Map<EntityID,ContamRadiation> = [];
    // var rateEntities:Array<
    public function new() {
        
    }
    public function addRadiation(r:Radiation):RadiationID {
        storage.push(r);
        return storage.length - 1;
    }

    //TODO handle embigenning of radiation stuffs.
    public function removeRadation(r:RadiationID) {
        storage[r] = null;
    }

    public function think() {
        for (rad in storage) {
            switch (rad.attatched) {
                case ATTATCHED(e):
                    rad.pos = e.pos;
                default:
            }
            for (target in targets) {
                switch(rad.getRadiationForPosition(target.pos)) {
                    case Some(rate):
                        target.radhandler.sure().updateRadiationRate(rad.id,rate);
                    default:
                        target.radhandler.sure().updateRadiationRate(rad.id,0);
                }
                

            }
        }        
    }

    public function addTarget(t:RadiationTarget) {
        targets.push(t);
    }

    public function setContaminated(e:EntityID,r:ContamRadiation) {
        
    }
}

interface RadiationTarget {
    var pos(get,set):Vector;
    var radhandler:ComponentState<RadiationRateHandler>;
}

typedef HasPos = {
    var pos:Vector;
}

/**
    Whether the source 
**/
enum RadiationAttatched {
    NOT_ATTATCHED;
    ATTATCHED(e:HasPos);
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
abstract RadiationID(Int) from Int to Int {

}