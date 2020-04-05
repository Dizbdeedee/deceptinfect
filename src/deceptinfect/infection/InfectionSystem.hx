package deceptinfect.infection;

import deceptinfect.ecswip.System;
import deceptinfect.ecswip.ComponentManager.DI_ID;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.PlayerComponent;

class InfectionSystem extends System {



    static var net_inf = new gmod.NET_Server<"infection",{infection : Float}>();

    #if client
    override function init_client() {
        
        net_inf.signal.handle(recvInfection);
    }

    function recvInfection(data:{infection : Float}) {
        switch PlayerManager.getLocalPlayerID().get(InfectionComponent) {
            case Comp(inf):
                switch (inf.infection) {
                    case NOT_INFECTED(val):
                        val.value = data.infection;
                    default:
                }
            default:
        }
    }
    #end
    
    #if server
    public static var averageInfection(default,null):Float = 0.0;
    
    override function run_server() {
        var numPlayers = 0;
        var totalInf = 0.0;
        for (entity in ComponentManager.entities) {
            switch (entity.get(InfectionComponent)) {
            case Comp(infection = _.acceptingInfection => ACCEPTING):
                switch (infection.infection) {
                case NOT_INFECTED(inf):
                
                    var base = getBaseInfection(infection);
                
                    var rate = switch (entity.get(RateComponent)) {
                    case Comp(rate):
                        calcInfectionFromRates(rate);
                    default:
                        infection.rate;
                    }
                    rate += 1;
                    
                    
                    var vun = switch (entity.get(InfVunerability)) {
                    case Comp(c_v):
                        c_v.vun;
                    default:
                        1;
                    }
                    
                    inf.value += base * rate * vun;
                    fixUpInfection(infection);
                    
                    switch (entity.get(PlayerComponent)) {
                    case Comp(ply):
                        net_inf.send({infection: inf.value},ply.player,true);    
                        totalInf += infection.getInfValue();
                        numPlayers++;
                    default:
                    }
                    infection.rate = rate;
                    switch (infection.infection) {
                    case INFECTED:
                        onInfected(entity);
                    default:
                    }
                    //trace(infection.rate);
                default:
                }
                

                

            default:
            }
        }
        if (numPlayers > 0) {
            averageInfection = totalInf / numPlayers;
        }
    }
    #end

    

    public static function makeInfected(ent:DI_ID) {
        switch (ent.get(InfectionComponent)) {
        case Comp(inf):
            inf.infection = switch (inf.infection) {
            case NOT_INFECTED(_):
                onInfected(ent);
                
                INFECTED;
            default:
                INFECTED;
            }
            trace('infection : ${inf.infection}');
        default:
            
        }
    }
    static function calcInfectionFromRates(rate:RateComponent):Float {
        var total = 0.0;
        var totalmulti = 1.0;
        for (rate in rate.addRates) {
            total += rate;
        }
        for (multi in rate.multipliers) {
            totalmulti += multi; 
        }
        return total * totalmulti;
    }

    public function infect(id:DI_ID,x:Float) {
        var inf = id.get_sure(InfectionComponent);
        switch [inf.infection,id.get(InfVunerability)] {
        case [NOT_INFECTED(inf),Comp(c_vun)]:
            inf.value += x * c_vun.vun;
        case [NOT_INFECTED(inf),NONE]:
            inf.value += x;
        case [INFECTED,_]:

        }
    }


    static function getBaseInfection(inf:InfectionComponent):Float {
        return switch (inf.baseInfection) {
            case NOT_USING:
                0;
            case USING_GLOBAL:
                switch (GameManager.state) {
                    case PLAYING(x):
                        x.baseInfection.value;
                    default:
                        trace("Not currently playing...");
                        inf.baseInfection = USING_STATIC(0.0);
                        0;
                }
            case USING_STATIC(rate):
                rate;
                // return Game.
        }
    }

    //TODO needed?
    static function fixUpInfection(infection:InfectionComponent) {
        
        switch (infection.infection) {
            case NOT_INFECTED(inf) if (inf.value < 0):
                inf.value = 0;
            case NOT_INFECTED(inf) if (inf.value >= 100):
                trace("Now infected :)");    
                // infectedTrigger.trigger(Noise);
                infection.infection = INFECTED;
            default:
        }
    }

    static function onInfected(ent:DI_ID) {
        #if server
        switch (ent.get(PlayerComponent)) {
        case Comp(_):
            trace('INIT INFECTED PLAYER');
            GameManager.initInfectedPlayer(ent);
        default:
        }
        #end
    }
    
}