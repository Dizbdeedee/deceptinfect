package gmod;

import gmod.libs.UtilLib;
import gmod.Hook.GMHook;
import gmod.libs.HookLib;
import haxe.io.Input;
import gmod.libs.NetLib;
import haxe.io.Bytes;
import hxbit.NetworkHost;
import gmod.libs.PlayerLib;
using gmod.PairTools;
class Server extends NetworkHost {

    public function new() {
        super();
        #if server
        UtilLib.AddNetworkString("hxbit");
        #end
        defaultLogger();
        isAuth = false;
    }
    #if server
    public function wait(onConnect:(nc:NetworkClient) -> Void) {
        isAuth = false;
        self = new Client(this,null);
        HookLib.Add(GMHook.PlayerInitialSpawn,"gmhxbit",(ply,tran) -> {
            var c = new Client(this,ply);
            pendingClients.push(c);
            c.sync();    
            onConnect(c);
        });
        isAuth = true;
        for (ply in PlayerLib.GetAll()) {
            var c = new Client(this,ply);
            pendingClients.push(c);
            c.sync();
            onConnect(c);
        }
        makeAlive();
    }
    #end
    
    #if client
    public function connect(onConnect:(nc:NetworkClient) -> Void) {
        isAuth = false;
        self = new Client(this,null);
        // connected = true;
        clients = [self];
        onConnect(self);
    }
    #end
}

class GmodNetworkInput extends haxe.io.Input {
    override function readInt32():Int {
        var len = NetLib.ReadUInt(32);
        return len;
    }
    override function readByte():Int {
        var len = NetLib.ReadUInt(8);
        return len;
    }

    public function new() {
        //....
    }
}

class Client extends NetworkClient {

    #if server
    final ply:Player;
    #end
    
    
    public function new(host:NetworkHost,?ply:Player) {
        super(host);
        NetLib.Receive("hxbit",recieve);
        #if server
        this.ply = ply;
        #end 
    }

    function recieve (len:Int) {
        var ni = new GmodNetworkInput();
        readData(ni,cast NetLib.BytesLeft().a);
    }
    

    override function send(bytes:Bytes) {
        NetLib.Start("hxbit",true);
        NetLib.WriteUInt(bytes.length,32);
        for (byt in bytes.getData()) {
            NetLib.WriteUInt(byt,8);
        }
        #if server
        NetLib.Send(ply);
        #elseif client
        NetLib.SendToServer();
        #end
    }


}
