package deceptinfect.ecswip;

import deceptinfect.game.WinSystem;
import deceptinfect.game.BatterySystem;
import deceptinfect.radiation.RadiationSystem;
import deceptinfect.infection.InfectionSystem;
import deceptinfect.radiation.RadiationSystem.RadiationID;
import haxe.ds.ObjectMap;
import deceptinfect.client.GeigerSystem;

class SystemManager {

   
    static var getSystems(default,never):ObjectMap<Class<Dynamic>,System> = new ObjectMap();

    public static var runSystems(default,null):Array<Class<Dynamic>> = [
        InfectionSystem,
        GeigerSystem,
        RadiationSystem,
        GrabSystem,
        HiddenHealthSystem,
        WinSystem,
        BatterySystem,
    ];

    public static function make() {
        getSystems.set(InfectionSystem,new InfectionSystem());
        getSystems.set(GeigerSystem,new GeigerSystem());
        getSystems.set(RadiationSystem,new RadiationSystem());
        getSystems.set(GrabSystem,new GrabSystem());
        getSystems.set(HiddenHealthSystem,new HiddenHealthSystem());
        getSystems.set(WinSystem,new WinSystem());
        getSystems.set(BatterySystem,new BatterySystem());
    }
    public static function getSystem<T:System>(cls:Class<T>):T {
        return cast getSystems.get(cls);
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