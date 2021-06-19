package deceptinfect.hxbit;

@:forward
@:forward.variance
@:transitive
enum abstract NVector(gmod.gclass.Vector) from gmod.gclass.Vector to gmod.gclass.Vector {
	@:to
	@:s
	public inline function to():Array<Float> {
		return [this.x,this.y,this.z];
	}

	@:from
	@:s
	public inline static function from(x:Array<Float>):NVector {
		return Gmod.Vector(x[0],x[1],x[2]);
	}
}