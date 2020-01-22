package deceptinfect;

import gmod.Networking;
@:build(gmod.macros.Networking.build())
class Networking {

    var infection2:NetMessageServer<InfectionMessage>;
    
}

typedef InfectionMessage = {
    infection : Float,
    rate : Float
}