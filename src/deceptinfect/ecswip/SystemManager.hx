package deceptinfect.ecswip;

import deceptinfect.radiation.RadiationSystem.RadiationID;
import haxe.ds.ObjectMap;


class SystemManager {

   
    public static var getSystems(default,never):ObjectMap<Class<Dynamic>,System> = cast [
        InfectionSystem => new InfectionSystem(),

    ];

    public static var runSystems(default,never):Array<Class<Dynamic>> = [
        InfectionSystem,
    ];

    public static function runAllSystems() {
        for (clsSystem in runSystems) {
            getSystems.get(clsSystem).run();
        }
    }

    
    

    
}