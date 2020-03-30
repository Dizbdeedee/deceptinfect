package deceptinfect;

import deceptinfect.GameManager.Net_GAME_STATE_VAL;
import deceptinfect.ecswip.ComponentManager.DI_ID;
import gmod.Networking;
@:build(gmod.macros.Networking.build())
class Networking {

    var InfectionMessage:NetMessageServer<N_InfectionMessageDef>;
    var GameState:NetMessageServer<N_GameState>;
    var Geiger:NetMessageServer<N_Geiger>;
    var GrabUpdate:NetMessageServer<N_GrabPos>;
    var GrabEnd:NetMessageServer<N_GrabEnd>;

    //var GameStart:NetMessageServer<{}>;
    
    
}

typedef N_InfectionMessageDef = {
    infection : Float,
}

typedef N_GrabPos = {
    index : Int,
    ent : Entity,
    ent2 : Entity
}

typedef N_GrabEnd = {
    index : Int
}

typedef N_Geiger = {
    geiger : Float
}



typedef N_GameState = {
    state : Net_GAME_STATE_VAL,
}

