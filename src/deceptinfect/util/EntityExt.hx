package deceptinfect.util;

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
			return (x : GEntCompat).has_id();
		} else {
			return None;
		}
	}

	// TODO rename
	public static function validID2(x:Entity):ValidID {
		return if (IsValid(x)) {
			switch (x : GEntCompat).id {
				case null:
					NO_ID;
				case x:
					HAS_ID(x);
			}
		} else {
			return INVALID;
		}
	}
}

enum ValidID {
	HAS_ID(id:DI_ID);
	NO_ID;
	INVALID;
}
