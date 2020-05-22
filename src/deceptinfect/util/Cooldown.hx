package deceptinfect.util;

@:using(deceptinfect.util.Cooldown.CooldownTools)
enum Cooldown {
    AVALIABLE;
    COOLDOWN(time:Float);
    UNAVALIABLE;
}

class CooldownTools {
    
    public static function check(x:Cooldown):Cooldown {
        return switch(x) {
            case COOLDOWN(time) if (Gmod.CurTime() > time):
                AVALIABLE;
            case x:
                x;
        }
    }

    public static function add(x:Cooldown,add:Float) {
        return switch(x) {
            case COOLDOWN(time):
                COOLDOWN(time + add);
            case x:
                x;
        }
    }

    public static function set(x:Cooldown,set:Float) {
        return switch(x) {
            case AVALIABLE | COOLDOWN(_):
                COOLDOWN(Gmod.CurTime() + set);
            case x:
                x;
        }
    }
}