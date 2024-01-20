package deceptinfect.game.components;

import deceptinfect.ecswip.ReplicatedComponent;

typedef PreviousMaterial = {
	name:String,
	baseTexture:ITexture,
	?color:Vector
}

@:replicated(SOME(CURRENT_PLAYER))
class Darken extends ReplicatedComponent {}
