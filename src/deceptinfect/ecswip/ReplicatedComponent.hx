package deceptinfect.ecswip;

import deceptinfect.game.ClientTranslateSystem;

@:autoBuild(deceptinfect.macros.ReplicatedComponentMacro.build())
abstract class ReplicatedComponent extends Component implements hxbit.Serializable {

    #if server
    var replicated(default,set):ReplicatedTarget = NONE;

    var unreliable:Bool = false;

    var fieldsChanged = true;

    public function set_replicated(x) {
        fieldsChanged = true;
        return replicated = x;
    }
    
    #end

    

}

//custom targets, i.e people with tag?
//follow option needed?
enum ReplicatedTarget {
    NONE;
    SOME(target:SomeTargets);
    ALL;
}
enum ReplicateOnceTarget {
    NONE(unreliable:Bool);
    SOME(target:SomeTargets,unreliable:Bool);
    ALL(unreliable:Bool);
}

enum SomeTargets {
    PVS(ent:Entity);
    PLAYERS(arr:Array<Player>);
    CURRENT_PLAYER;
    INFECTED;
}