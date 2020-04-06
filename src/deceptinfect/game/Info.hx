package deceptinfect.game;

import gmod.NET_Server;
import gmod.NET_Server.I_NET;

interface Info<T:{}> {

    
    var data:T;

    var net(get,never):I_NET<T>;
    
    #if client
    function display():String;

    #end
}

typedef Data_ItemLocation = {
    loc : Vector
}

class Info_ItemLocation implements Info<Data_ItemLocation> {


    static var msg = new NET_Server<"info_itemloc",Data_ItemLocation>();

    public var net(get,never):I_NET<Data_ItemLocation>;
    
    @:noCompletion
    inline function get_net():I_NET<Data_ItemLocation> {
        return msg;
    }
    public var data:Data_ItemLocation;
    #if client
    public function display():String {
        return 'A BLANK can be located at ${data.loc}';
    }
    #end

}