package deceptinfect.ecswip;

import deceptinfect.radiation.RadiationSystem.RadiationID;
import haxe.ds.ObjectMap;
import deceptinfect.client.GeigerSystem;

class SystemManager {

   
    public static var getSystems(default,null):ObjectMap<Class<Dynamic>,System> = cast [

        
        

    ];

    public static var runSystems(default,null):Array<Class<Dynamic>> = [
        InfectionSystem,
        GeigerSystem
    ];

    public static function make() {
        getSystems.set(InfectionSystem,new InfectionSystem());
        getSystems.set(GeigerSystem,new GeigerSystem());
    }

    public static function runAllSystems() {
        for (clsSystem in runSystems) {
            getSystems.get(clsSystem).run();
        }
    }

    public static function initAllSystems() {
        make();
        for (clsSystem in runSystems) {
            getSystems.get(clsSystem).init();
        }
    }    
    

    
}