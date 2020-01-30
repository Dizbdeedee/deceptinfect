package deceptinfect.ecswip;

class InfectionSystem {
    public static function run() {
        handleInfections();
    }

    public static function handleInfections() {
        for (entity in ComponentManager.entities) {
            switch (entity.switch_component(InfectionComponent2)) {
                case Some(inf = _.acceptingInfection => ACCEPTING)  :
                    handleInfection(inf);
                default:
                
            }
        }
    }

    
    public static function handleInfection(inf:InfectionComponent2) {
        
        switch (inf.infection) {
            case NOT_INFECTED(x) if (x >= 100):
                inf.infection = INFECTED;
                //infectedTrigger.trigger(Noise);
                // infectedTrigger.clear();
            case NOT_INFECTED(x) if (x <= 0):
                x = 0;
            
            default:
        }
    }
    
}