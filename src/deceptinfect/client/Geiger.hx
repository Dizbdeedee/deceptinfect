package deceptinfect.client;

class Geiger {

    public static var geiger:Float = 0.0;

    static var sounds = [
        GlobalLib.Sound("player/geiger1.wav"),
        GlobalLib.Sound("player/geiger2.wav"),
        GlobalLib.Sound("player/geiger3.wav")
    ];
    static var playTime:Float = 0;
    public static function geigerThink() {
        if (GlobalLib.CurTime() > playTime) {
            var choice = switch (geiger) {
                case x if (x < 0.2):
                    sounds[0];
                default:
                    sounds[MathLib.random(0,2)];
            }
            GlobalLib.EmitSound(choice,new Vector(0,0,0),-2,CHAN_STATIC,0.5);
            var mintime = GlobalLib.SoundDuration(sounds[0]) * 0.75;
            var exponent = 0.5 * Math.pow(geiger,-0.5) - 0.5;
            var random = MathLib.random();
            playTime = GlobalLib.CurTime() + mintime + exponent * random;
        }
    }
}