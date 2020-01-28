package gmod;

import tink.CoreApi.CallbackLink;
import tink.CoreApi.Callback;
import tink.CoreApi.Noise;
import gmod.libs.HookLib;
import gmod.gclass.Entity.EntityID;
import tink.CoreApi.CallbackList;

@:forward
abstract Logic_relay(Entity) {

    public function new() {

    }

}

private typedef OutputCallback = Map<String,CallbackList<Dynamic>>;
class OutputRunner {
    static var outputEnt:Null<Logic_relay>;
    static var outputID:EntityID;
    static var callbacks:Map<EntityID,OutputCallback> = [];
    public static function addOutput(e:Entity,outputName:String,cb:Callback<Dynamic>):CallbackLink {
        if (outputEnt == null) {
            outputEnt = new Logic_relay();
            outputEnt.SetName("outputrunner");
            outputEnt.Spawn();
            outputID = outputEnt.EntIndex();
            var exportName = gmod.macros.InitMacro.exportName;
            HookLib.Add(Hooks.AcceptInput,'${exportName}AcceptInput',acceptInput);
        }
        var id = e.EntIndex();
        if (!callbacks.exists(id)) {
            var callbacklist = new CallbackList();
            var callbackmap:OutputCallback = new Map();
            callbackmap.set(outputName,callbacklist);
            callbacks.set(id,callbackmap);   
            e.Fire("AddOutput",'$outputName outputrunner:Trigger::0:-1');
        } else if (!callbacks.get(id).exists(outputName)) {
            var callbacklist = new CallbackList();
            callbacks.get(id).set(outputName,callbacklist);
            e.Fire("AddOutput",'$outputName outputrunner:Trigger::0:-1');
        }
        return callbacks.get(id).get(outputName).add(cb);
    }
    
    static function acceptInput(ent:Entity,input:String,actv:Entity,caller:Entity,value:Dynamic) {
        if (ent.EntIndex() == outputID) {
            
            switch (callbacks.get(caller.EntIndex())) {
                case null:
                case _.get(input) => x if (x != null) :
                    x.invoke(value);
            }
            
        }
        return null;
    }
}