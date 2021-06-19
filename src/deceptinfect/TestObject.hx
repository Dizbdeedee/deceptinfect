package deceptinfect;

import hxbit.Serializable;
import deceptinfect.infection.InfectionComponent.INF_STATE;

// import hxbit.NetworkSerializable;
@:expose("testobj")
@:keep
class TestObject implements Serializable {
    @:keep
    public static var inst:TestObject;
    // @:s public var testplayer:gmod.hxbit.NPlayer;
    @:s public var testString:String;
    
    // @:rpc(clients) public function clientFunction() {
    //     trace("Remote procedure call");
    // }
    @:expose("newinst") public function new() {
        // enableReplication = true;
        #if server
        inst = this;
        testString = "boogie";
        #end
    }
    // public function networkAllow(op:Operation,propId:Int,client:NetworkSerializable) {
    //     // switch (op) {
    //     //     case Register:

    //     // }
        
    //     return client == this;
    // }
    public function alive() {
        // inst = this;
        trace("I am... alive!");
    }
}
