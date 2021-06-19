package deceptinfect.ecswip;

import hxbit.Serializable;
import deceptinfect.game.ClientTranslateSystem.ServerID;

class NetProxy implements hxbit.Serializable {
    @:s public var id:DI_ID;

    @:s public var componentID:Int;

    public function new(id:DI_ID,compID:Int) {
	this.id = id;
	componentID = compID;
    }
}

class ProxyComponent extends Component {

    var recipients:Array<Player> = [];
    
}

// @:autoBuild(deceptinfect.macros.ProxyMacros.build())
class ComponentProxy extends Component {

    // public function proxyCreated(x:Component):Component {
    // 	return x;
    // }
}