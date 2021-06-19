package deceptinfect.lib;


@:native("_G.mri.m_cMethods")
extern class Mri {
	static function DumpMemorySnapshot(prefix:String, name:String, dunno:Int):Void;

	static function DumpMemorySnapshotComparedFile(prefix:String, name:String, unknown:Int, before:String, after:String):Void;
}

