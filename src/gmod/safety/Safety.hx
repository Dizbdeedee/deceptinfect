package gmod.safety;

import lua.Lua;
import gmod.libs.GlobalLib;
import gmod.safety.InvalidObject;
import haxe.ds.Option;

class Safety {
	static public inline function sure<T:CanCheckValid>(value:InvalidObject<T>):T {
		return !GlobalLib.IsValid(value) ? throw "Value not valid at sure statement!": @:nullSafety(Off) (value : T);
	}

	static public inline function unsafe<T:CanCheckValid>(value:InvalidObject<T>):T {
		return @:nullSafety(Off) (value : T);
	}

	static public inline function or<T:CanCheckValid>(value:InvalidObject<T>, defaultValue:T):T {
		return !GlobalLib.IsValid(value) ? defaultValue : @:nullSafety(Off) (value : T);
	}

	static public function valid<T:CanCheckValid>(value:T):ValidObject<T> {
		if (GlobalLib.IsValid(value)) {
			return VALID(value);
		} else {
			return INVALID;
		}
	}

	static public function validFnIterator<T:CanCheckValid>(list:Iterable<T>, fn:(valid:T) -> Void) {
		for (item in list) {
			if (GlobalLib.IsValid(item)) {
				fn(item);
			}
		}
	}

	static public function validIterator<T:CanCheckValid, X>(table:Table<X, T>):KeyValueIterator<X, T> {
		var p = Lua.pairs(table);
		var next = p.next;
		var i = p.index;
		return {
			next: function a() {
				var res = next(table, i);
				i = res.index;
				if (GlobalLib.IsValid(res.value)) {
					return {key: res.index, value: res.value};
				} else {
					return a();
				}
			},
			hasNext: function() {
				return Lua.next(table, i).value != null;
			}
		}
	}

	
}

enum ValidObject<T> {
    INVALID;
    VALID(ob:T);
}
