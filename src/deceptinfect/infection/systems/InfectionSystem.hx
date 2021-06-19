package deceptinfect.infection.systems;

import deceptinfect.game.components.AliveComponent;
import deceptinfect.client.GeigerSystem;
import deceptinfect.ecswip.System;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.PlayerComponent;

typedef ND_Infection = {
    infection:Float,
}

@:allow(InfectionComponent)
class InfectionSystem extends System {

    static var net_inf = new gmod.helpers.net.NET_Server<"di_infection",ND_Infection>();

    static var net_infected = new gmod.helpers.net.NET_Server<"di_infected",{}>();

    #if client
    override function init_client() {
        
        net_inf.signal.handle(recvInfection);
        net_infected.signal.handle(onInfectedCl);
    }

    function onInfectedCl(data:{}) {
        trace("Recieved infected data");
        switch (PlayerManager.getLocalPlayerID().get(InfectionComponent)) {
        case Comp(c_inf):
            c_inf.infection = INFECTED;
            PlayerManager.getLocalPlayerID().add_component(new InfectedComponent());
            trace(c_inf);
        default:
            trace("no...");
            var c_inf = new InfectionComponent();
            PlayerManager.getLocalPlayerID().add_component(c_inf);
            c_inf.infection = INFECTED;
        }
    }

    function recvInfection(data:ND_Infection) {
        switch PlayerManager.getLocalPlayerID().get(InfectionComponent) {
            case Comp(inf):
                
                switch (inf.infection) {
                    case NOT_INFECTED(val):
                        //trace('set ${inf.infection}');
                        val.value = data.infection;
                    default:
                }
            default:
                trace("nu shit");
                var c_inf = new InfectionComponent();
                PlayerManager.getLocalPlayerID().add_component(c_inf);
                c_inf.infection = NOT_INFECTED(data.infection);
        }
    }
    #end
    
    #if server
    public static var averageInfection(default,null):Float = 0.0;

    static var infectionReport = 0.0;
    
    override function run_server() {
        var numPlayers = 0;
        var totalInf = 0.0;
        for (entity in ComponentManager.entities) {
            switch (entity.get(InfectionComponent)) {
            case Comp(infection = _.acceptingInfection => ACCEPTING):
                switch [entity.get(PlayerComponent),entity.get(AliveComponent)] {
                    case [Comp(_),NONE]:
                        continue;
                    default:
                }    
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
                    if (Gmod.CurTime() > infectionReport) {
                        trace('$base $rate $vun');
                    }
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
                    totalInf += infection.getInfValue();
                    numPlayers++;
                }
            default:
            }
        }
        if (numPlayers > 0) {
            averageInfection = totalInf / numPlayers;
        }
        if (Gmod.CurTime() > infectionReport) {
            infectionReport = Gmod.CurTime() + 5;
        }
    }
    #end

    public function makeInfected(ent:DI_ID) {
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

    #if server
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
        }
    }
    #end

    //TODO needed?
    static function fixUpInfection(infection:InfectionComponent) {
        switch (infection.infection) {
            case NOT_INFECTED(inf) if (inf.value < 0):
                inf.value = 0;
            case NOT_INFECTED(inf) if (inf.value >= 100):
                trace("Now infected :)");    
                infection.infection = INFECTED;
            default:
        }
    }

    static function onInfected(ent:DI_ID) {
        #if server
        switch (ent.get(PlayerComponent)) {
        case Comp(_.player => p):
            trace('INIT INFECTED PLAYER $p');
            // net_inf.send({infection: 100.0},p);
            net_infected.send({},p);
            GameManager.initInfectedPlayer(ent);
            GeigerSystem.net_geiger.send({geiger : 0.0},p); 
        default:
        }
        #end
    }
}