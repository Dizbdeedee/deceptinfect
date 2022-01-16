package deceptinfect.hxbit;

@:forward
@:forward.variance
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

	@:s
	@:op(A + B)
    public inline function add(otherVec:NVector):NVector {
        return untyped __lua__("{0} + {1}",this,otherVec);
    }

	@:s
    @:op(A - B)
    public inline function sub(otherVec:NVector):NVector {
        return untyped __lua__("{0} - {1}",this,otherVec);
    }

	@:s
    @:op(A * B)
    @:commutative
    public inline function mult(other:Float):NVector {
        return untyped __lua__("{0} * {1}",this,other);
    }

	@:s
    @:op(A / B)
    public inline function div(other:Float):NVector {
        return untyped __lua__("{0} / {1}",this,other);
	}
	
	@:s
	@:op(-A)
	public inline function neg():NVector {
		return untyped __lua__("-{0}",this);
	}

}