package deceptinfect.ecswip;

import deceptinfect.Networking.N_InfectionMessageDef;
import deceptinfect.ecswip.InfectionComponent;


class InfectionSystem extends System {

    
    static var infectedTrigger:SignalTrigger<Noise> = new SignalTrigger();
    public static var infectedSig:Signal<Noise> = infectedTrigger.asSignal();

    #if client
    override function init_client() {
        
        Networking.InfectionMessageSignal.handle(recvInfection);
    }

    function recvInfection(data:N_InfectionMessageDef) {
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
    override function run_server() {
        for (entity in ComponentManager.entities) {
            switch (entity.get(InfectionComponent)) {
                //TODO refactor?
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
                            
                            inf.value += base * rate;
                            
                            //trace('$base $rate ${inf.value}');
                            fixUpInfection(infection);
                            
                            switch (entity.get(PlayerComponent)) {
                                case Comp(ply):
                                    Networking.sendInfectionMessage({infection: inf.value},ply.player);
                                default:
                            }
                            infection.rate = rate;
                            //trace(infection.rate);
                        default:
                    }
                    

                    

                default:
            }
        }
    }
    #end

    public static function calcInfectionFromRates(rate:RateComponent):Float {
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


    public static function getBaseInfection(inf:InfectionComponent):Float {
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
    public static function fixUpInfection(infection:InfectionComponent) {
        
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
    
}