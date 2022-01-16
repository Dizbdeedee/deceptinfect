package deceptinfect.game.components;

import deceptinfect.hxbit.NVector;
import deceptinfect.ecswip.ReplicatedComponent;

@:replicated(ALL)
class GasDraw extends ReplicatedComponent {

    var ownedBy:DI_ID;

    @:s var northeast:NVector;

    @:s var southwest:NVector;

    public function new(northeast:NVector,southwest:NVector,ownedBy:DI_ID) {
        super();
        this.northeast = northeast;
        this.southwest = southwest;
        this.ownedBy = ownedBy;
    }
        
}