package deceptinfect.ecswip;
class SignalStorage {

    public static var onInfected(default,null):Signal<InfectedSig>;
}


typedef InfectedSig = {
    victim:DI_Entity,
    cause:DI_Entity,
    
     
}