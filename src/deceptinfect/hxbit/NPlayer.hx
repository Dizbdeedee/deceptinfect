package deceptinfect.hxbit;

@:forward
@:transitive
enum abstract NPlayer(gmod.gclass.Player) from gmod.gclass.Player to gmod.gclass.Player {
    @:s
    @:from
    public static function from(x:Int):NPlayer {
        return cast Gmod.Player(x);
    }

    @:s
    @:to
    public function to():Int {
        return this.UserID();
    }

    
}