package deceptinfect;

import gmod.Networking;
@:build(gmod.macros.Networking.build())
class Networking {

    var InfectionMessage:NetMessageServer<InfectionMessageDef>;
    
}

typedef InfectionMessageDef = {
    infection : Float,
}