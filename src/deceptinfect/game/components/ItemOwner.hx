package deceptinfect.game.components;

import hxbit.Serializable;

class ItemOwner extends Component {

    static final stageProgression:Stage = STAGE(0,50,STAGE(30,300,STAGE(60,500,FINAL(240,1100))));
    
    final owner:DI_ID;

    var itemRevealState:ItemOwnerState = NOT_REVEALED(stageProgression); 

    public var initalSpawnTime:Float;

    public function new(initalTime:Float,owner:DI_ID) {
	super();
	initalSpawnTime = initalTime;
	this.owner = owner;
    }
    
}

enum ItemOwnerState {
    NOT_REVEALED(stage:Stage);
    REVEALED(reveal:RevealState);
}

enum RevealState {
    HIDDEN(dist:Float);
    VISIBLE(dist:Float);
}

enum Stage {
    STAGE(time:Float,dist:DistSquared,x:Stage);
    FINAL(time:Float,dist:DistSquared);
}

