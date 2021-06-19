package deceptinfect.client;

import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.ecswip.System;

@:expose("geiger")
class GeigerSystem extends System {
    
    public static var net_geiger(default,never) = new gmod.net.NET_Server<"geiger",{geiger : Float}>();
    #if client
    
    public static var geiger:Float = 0.0;

    static var sounds = [
        Gmod.Sound("player/geiger1.wav"),
        Gmod.Sound("player/geiger2.wav"),
        Gmod.Sound("player/geiger3.wav")
    ];
    static var playTime:Float = 0.0;

    
    override function init_client() {
        net_geiger.signal.handle(
        function (data:{geiger : Float}) {
            //trace('geiger $geiger');
            geiger = data.geiger;
        });
        GameManager.stateChange.handle(function (x) {
            switch (x) {
            case WAIT:
               geiger = 0.0;
            default:
            }
        });
    }
    override function run_client() {
        geigerThink();
    }

    public static function geigerThink() {
        if (Gmod.CurTime() > playTime && geiger > 0.016) {
            var choice = switch (geiger) {
                case x if (x < 0.2):
                    sounds[0];
                default:
                    sounds[MathLib.random(0,2)];
            }
            Gmod.EmitSound(choice,new Vector(0,0,0),-2,CHAN_STATIC,0.5);
            var mintime = Gmod.SoundDuration(sounds[0]) * 0.75;
            var exponent = 0.5 * (Math.pow(geiger,-0.5)) - 0.5;
            var random = untyped __lua__("math.random(0.5,1.1)");
            var maxtime = 3;
            playTime = MathLib.min(Gmod.CurTime() + mintime + exponent * random,Gmod.CurTime() + maxtime);
        }
    }


    
    #end

    #if server
    override function run_server() {
        for (x in 0...entities) {
	    final plyr:DI_ID = x;
            switch [plyr.get(InfectionComponent),plyr.get(PlayerComponent)] {
            case [Comp(inf),Comp(_.player => player)]:
                var fract = Math.min(((inf.rate - 1) / 2),1);
                net_geiger.send({geiger: fract},player,true);
            default:
            }
        }
    }
    #end
}

