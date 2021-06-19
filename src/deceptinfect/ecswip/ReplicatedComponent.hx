package deceptinfect.ecswip;

import deceptinfect.game.ClientTranslateSystem;

abstract class ReplicatedComponent extends Component implements hxbit.Serializable {

    #if server
    var replicated:ReplicatedTarget = NONE;

    var unreliable:Bool = false;
    public inline extern function send(curOwner:DI_ID,target:ReplicatedTarget) {
        SystemManager.getSystem(ClientTranslateSystem).enqueueComponent(curOwner,this,target);
    }

    public inline extern function replicate(curOwner:DI_ID,target:ReplicatedTarget) {
        SystemManager.getSystem(ClientTranslateSystem).setReplicate(curOwner,this,target);
    }
    #end

    

}

//custom targets, i.e people with tag?
enum ReplicatedTarget {
    NONE;
    SOME(target:SomeTargets);
    ALL;
}

enum SomeTargets {
    PVS(ent:Entity);
    PLAYERS(arr:Array<Player>);
    CURRENT_PLAYER;
    INFECTED;
}