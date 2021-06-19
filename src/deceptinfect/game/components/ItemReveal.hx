package deceptinfect.game.components;

import gmod.Gmod;
import deceptinfect.ecswip.ProxyComponent.ComponentProxy;



// class SerializableVector implements hxbit.Serializable {
// 	public var vec:Vector;

// 	@:keep
// 	public function customSerialize(ctx:hxbit.Serializer) {
// 		ctx.addFloat(vec.x);
// 		ctx.addFloat(vec.y);
// 		ctx.addFloat(vec.z);
// 	}

// 	@:keep
// 	public function customUnserialize(ctx:hxbit.Serializer) {
// 		vec = new Vector(ctx.getFloat(), ctx.getFloat(), ctx.getFloat());
// 	}

// 	public inline function new(x:gmod.gclass.Vector) {
// 		vec = x;
// 	}
// }

// @:forward
// abstract NVec(SerializableVector) {
// 	@:to
// 	public function toVec():Vector {
// 		return this.vec;
// 	}

// 	@:from
// 	public static function fromVec(x:Vector) {
// 		return cast new SerializableVector(x);
// 	}
// }

// abstract NetVector(gmod.gclass.Vector) {
//     @:to
//     public function toArr():Array<Float> {
// 	return [this.x,this.y,this.z];
//     }
//     @:from
//     public static function fromArrayFloat(x:Array<Float>) {
// 	return cast new Vector(x[0],x[1],x[2]);
//     }
// }
