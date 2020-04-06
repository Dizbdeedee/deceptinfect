package gmod;

/**
    Generate a net message by adding a variable to any class
    i.e

    ```haxe 
    static var netmessage = new NET_Server<"exampleMessage",{name : String}>;
    ```
**/
@:genericBuild(gmod.macros.Networking.build())
extern class NET_Server<Const,Data> {
}

interface I_NET<T:{}> {

    #if server
    function send(data:T,recv:Player,?unreliable:Bool):Void;

    function sendTable(data:T,recv:Table<Dynamic,Player>,?unreliable:Bool):Void;

    function sendFilter(data:T,recv:CRecipientFilter,?unreliable:Bool):Void;

    #end

    #if client

    #if tink_core
    var signal(default,never):tink.CoreApi.Signal<T>;
    #else
    function addReciever(ident:String,recv:(data:T) -> Void):Void;
    function removeReciever(ident:String);
    #end
    
    #end
    
}
