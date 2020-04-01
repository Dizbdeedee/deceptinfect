package gmod;

/**
    Generate a net message by adding a variable to any class
    i.e
    static var netmessage = new NET_Server<"exampleMessage",{name : String}>;
**/
@:genericBuild(gmod.macros.Networking_2.build())
extern class NET_Server<Const,Data> {
}


