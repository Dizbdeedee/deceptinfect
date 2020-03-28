package deceptinfect.ecswip;

import deceptinfect.ecswip.ComponentManager.DI_ID;

class GrabProducer extends Component {

    public var grab:Null<DI_ID> = null;

    public var grabindex = 0;
    public var grabinc:Float = 0.0;
    public var damage:Float = 0.0;
    public var threshold:Float = 50.0;
    public var looktargets:Bool = false;
    public var targeting:Null<GrabAccepter> = null;
    
    
}