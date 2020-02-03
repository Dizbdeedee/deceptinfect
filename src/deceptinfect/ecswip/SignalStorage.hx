package deceptinfect.ecswip;
import deceptinfect.ecswip.ComponentManager;
class SignalStorage {

    public static var onInfected(default,null):Signal<InfectedSig>;
}


typedef InfectedSig = {
    victim:DI_ID,
    cause:DI_ID,
    
     
}