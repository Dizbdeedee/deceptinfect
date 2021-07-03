package deceptinfect.ecswip;

/**
	Misc, one off bits of data that can only ever belong to players anyway
**/
@:replicated(ALL)
class PlayerComponent extends ReplicatedComponent {
	/**

	**/
	#if server
	public var spec_next = 1;

	public var roundModel:String = "";

	public var deathTime:DeathTime = ALIVE;

	public var playing:Bool = true;

	#end
	@:s public var player:deceptinfect.hxbit.NPlayer;

	public function new(x:Player) {
		super();
		player = x;
	}
}

enum DeathTime {
	ALIVE;
	DEAD(reviveTime:Float);
}
