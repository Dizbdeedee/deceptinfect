package deceptinfect.client;

import deceptinfect.Networking.N_Geiger;
import deceptinfect.ecswip.InfectionComponent;
import deceptinfect.ecswip.System;

class GeigerSystem extends System {
    
    #if client
    public static var geiger:Float = 0.0;

    static var sounds = [
        GlobalLib.Sound("player/geiger1.wav"),
        GlobalLib.Sound("player/geiger2.wav"),
        GlobalLib.Sound("player/geiger3.wav")
    ];
    static var playTime:Float = 0;
    
    override function run_client() {
        Networking.GeigerSignal.handle(
        function (data:N_Geiger) {
            geiger = data.geiger;
            geigerThink();
        });

    }


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

    
    #end

    #if server
    override function run_server() {
        for (plyr in PlayerManager.getPlayers()) {
            switch (plyr.get(InfectionComponent)) {
            case Comp(inf):
                var fract = Math.min(((inf.rate - 1) / 3),1);
                Networking.sendGeiger({geiger: fract},plyr);
            default:
            }
        }
    }
    #end
}

