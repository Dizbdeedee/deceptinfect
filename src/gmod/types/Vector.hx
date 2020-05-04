package gmod.types;

import gmod.libs.UtilLib;
import gmod.libs.GlobalLib;
import gmod.gclass.Vector as GVec;
@:forward
extern abstract Vector(GVec) from GVec to GVec {
    
    public var x(get,set):Float;

    public var y(get,set):Float;

    public var z(get,set):Float;
    @:noCompletion
    public extern inline function get_x():Float {
        return untyped this[1];
    }
    @:noCompletion
    public extern inline function set_x(x:Float):Float {
        return untyped this[1] = x;
    }
    @:noCompletion
    public extern inline function get_y():Float {
        return untyped this[2];
    }
    @:noCompletion
    public extern inline function set_y(x:Float):Float {
        return untyped this[2] = x;
    }
    @:noCompletion
    public extern inline function get_z():Float {
        return untyped this[3];
    }
    @:noCompletion
    public extern inline function set_z(x:Float):Float {
        return untyped this[3] = x;
    }
    
    public inline function new(?x:Float,?y:Float,?z:Float) {
        this = GlobalLib.Vector(x,y,z);
    }

    @:op(A + B)
    public inline function add(otherVec:Vector):Vector {
        return untyped __lua__("{0} + {1}",this,otherVec);
    }

    @:op(A - B)
    public inline function sub(otherVec:Vector):Vector {
        return untyped __lua__("{0} - {1}",this,otherVec);
    }

    @:op(A * B)
    @:commutative
    public inline function mult(other:Float):Vector {
        return untyped __lua__("{0} * {1}",this,other);
    }

    @:op(A / B)
    public inline function div(other:Float):Vector {
        return untyped __lua__("{0} / {1}",this,other);
    }

}
