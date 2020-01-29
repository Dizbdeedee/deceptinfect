package gmod;

import gmod.libs.GlobalLib;
import gmod.libs.EntsLib;
import tink.CoreApi.CallbackLink;
import tink.CoreApi.Callback;
import tink.CoreApi.Noise;
import gmod.libs.HookLib;
import gmod.gclass.Entity.EntityID;
import tink.CoreApi.CallbackList;
#if server
import gmod.engine_ents.Logic_relay;
private typedef OutputCallback = Map<String,CallbackList<Dynamic>>;
class OutputRunner {
    static var outputEnt:Null<Logic_relay> = null;
    static var outputID:EntityID;
    static var callbacks:Map<EntityID,OutputCallback> = [];
    public static function addOutput(e:Entity,outputName:String,cb:Callback<Dynamic>):CallbackLink {
        if (outputEnt == null) {
            outputEnt = new Logic_relay();
            outputEnt.SetName("outputrunner");
            outputEnt.Activate();
            
            outputEnt.Spawn();
            outputID = outputEnt.EntIndex();
            var exportName = gmod.macros.InitMacro.exportName;
            HookLib.Add(Hooks.AcceptInput,'${exportName}AcceptInput',acceptInput);
            trace("hooked");
        }
        var id = e.EntIndex();
        if (!callbacks.exists(id)) {
            var callbacklist = new CallbackList();
            var callbackmap:OutputCallback = new Map();
            callbackmap.set(outputName,callbacklist);
            callbacks.set(id,callbackmap);
            trace("New callbacklist + map");  
            e.SetKeyValue(outputName,"outputrunner:Trigger::0:-1");
            //e.Fire("AddOutput",'$outputName outputrunner:Trigger::0:-1');
        } else if (!callbacks.get(id).exists(outputName)) {
            var callbacklist = new CallbackList();
            callbacks.get(id).set(outputName,callbacklist);
            e.SetKeyValue(outputName,"outputrunner:Trigger::0:-1");
            //e.Fire("AddOutput",'$outputName outputrunner:Trigger::0:-1');
            trace("New callbacklist");
        }
        trace(outputName);
        return callbacks.get(id).get(outputName).add(cb);
    }
    
    static function acceptInput(ent:Entity,input:String,actv:Entity,caller:Entity,value:Dynamic) {
        trace('Entity: ${ent.GetClass()} got sent $input ${GlobalLib.tostring(actv)} with $value');
        if (ent.EntIndex() == outputID && GlobalLib.IsValid(caller)) {
            var backs = callbacks.get(caller.EntIndex());
            if (backs != null) {
                var backs2 = backs.get(input);
                if (backs2 != null) {
                    backs2.invoke({data:value,activator:caller});
                }
                trace(backs2);
            }
            // switch (callbacks.get(caller.EntIndex())) {
            //     case null:
            //     case _.get(input) => x if (x != null) :
            //         x.invoke({data:value,activator:caller});
            // }
            
        }
        return null;
    }
}
#end