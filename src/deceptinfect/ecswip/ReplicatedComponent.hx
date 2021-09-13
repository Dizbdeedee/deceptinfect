package deceptinfect.ecswip;

import deceptinfect.game.ClientTranslateSystem;


typedef FieldsChangedData = {
    ent : DI_ID,
    comp : ReplicatedComponent
}
@:autoBuild(deceptinfect.macros.ReplicatedComponentMacro.build())
abstract class ReplicatedComponent extends Component implements hxbit.Serializable {

    #if server
    var replicated(default,set):ReplicatedTarget = NONE;

    private var fieldsChangedTrig:SignalTrigger<FieldsChangedData> = new SignalTrigger();

    var fieldsChangedSig:Signal<FieldsChangedData>;
    
    var unreliable:Bool = true;

    var fieldsChanged(default,set) = true;

    function set_replicated(x) {
        // fieldsChanged = true;
        return replicated = x;
    }

    function set_fieldsChanged(nfc) {
        if (!fieldsChanged && nfc) {
            fieldsChangedTrig.trigger({
                ent: this.getOwner(),
                comp: this
            });
        }
        return fieldsChanged = nfc;
    }

    public function new() {
        super();
        fieldsChangedSig = fieldsChangedTrig.asSignal();
    }
    
    #end

    

}

//custom targets, i.e people with tag?
//follow option needed?
enum ReplicatedTarget {
    NONE;
    SOME(target:SomeTargets);
    ALL;
    MASTER(target:ReplicatedComponent);
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