package deceptinfect.ecswip;

import deceptinfect.ecswip.InfectionComponent2;
import gmod.engine_ents.Combine_mine;

class InfectionSystem {
    public static function run() {
        handleInfections();
    }

    
    static var infectedTrigger:SignalTrigger<Noise> = new SignalTrigger();
    public static var infectedSig:Signal<Noise> = infectedTrigger.asSignal();
    public static function handleInfections() {
        for (entity in ComponentManager.entities) {
            switch (entity.get_component(InfectionComponent2)) {
                //TODO refactor?
                case COMPONENT(infection = _.acceptingInfection => ACCEPTING):
                    switch (infection.infection) {
                        case NOT_INFECTED(inf):
                        
                            var base = getBaseInfection(infection);
                        
                            var rate = switch (entity.get_component(RateComponent)) {
                                case COMPONENT(rate):
                                    calcInfectionFromRates(rate);
                                default:
                                    infection.rate;
                            }
                            rate += 1;
                            
                            inf.value += base * rate;
                            
                            trace('$base $rate ${inf.value}');
                            fixUpInfection(infection);
                            
                            
                        default:
                    }
                    

                    

                default:
            }
        }
    }

    public static function calcInfectionFromRates(rate:RateComponent):Float {
        var total = 0.0;
        var totalmulti = 0.0;
        for (rate in rate.addRates) {
            total += rate;
        }
        for (multi in rate.multipliers) {
            totalmulti += multi; 
        }
        return total * totalmulti;
    }


    public static function getBaseInfection(inf:InfectionComponent2):Float {
        return switch (inf.baseInfection) {
            case NOT_USING:
                0;
            case USING_GLOBAL:
                0;
            case USING_STATIC(rate):
                rate;
                // return Game.
        }
    }

    //TODO needed?
    public static function fixUpInfection(infection:InfectionComponent2) {
        
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