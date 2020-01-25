package gmod;
abstract Hook<T:Function>(String) {
    public inline function new(name:String) {
        this = name;
    }
}

@:keep
@:build(gmod.macros.GenerateHooksFile.build())
class Hooks {}
