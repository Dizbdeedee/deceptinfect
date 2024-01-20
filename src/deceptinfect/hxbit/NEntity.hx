package deceptinfect.hxbit;

@:transitive
@:forward
enum abstract NEntity(gmod.gclass.Entity) from gmod.gclass.Entity to gmod.gclass.Entity {
	@:from
	@:s
	public static function from(x:Int):NEntity {
		return Gmod.Entity(x);
	}

	@:to
	@:s
	public function to():Int {
		return this.EntIndex();
	}
}
