package deceptinfect.util;

import deceptinfect.ecswip.compat.GEntCompat;
import deceptinfect.ecswip.compat.GPlayerCompat;
import gmod.Gmod.IsValid;

class EntityExt {
	public static function facingBehind(me:Entity, target:Entity):Bool {
		var vec1 = new Angle(0, me.EyeAngles()
			.y, 0).Forward();
		var vec2 = new Angle(0, target.EyeAngles()
			.y, 0).Forward();
		var dot = Math.acos(vec1.Dot(vec2));
		return dot < Math.PI / 4;
	}

	public static inline function validID(x:Entity):Option<DI_ID> {
		if (IsValid(x)) {
			return cmp(x).has_id();
		} else {
			return None;
		}
	}

	// TODO rename
	public static function validID2(x:Entity):ValidID {
		return if (IsValid(x)) {
			switch cmp(x).id {
				case null:
					NO_ID;
				case x:
					HAS_ID(x);
			}
		} else {
			return INVALID;
		}
	}

	public static inline function cmp(x:Entity):GEntCompat {
		return cast x;
	}

	public static inline function cmpPly(x:Entity):GPlayerCompat {
		return cast x;
	}

	public static inline function createCompat(x:Entity):GEntCompat {
		return new GEntCompat(x);
	}

}

enum ValidID {
	HAS_ID(id:DI_ID);
	NO_ID;
	INVALID;
}
