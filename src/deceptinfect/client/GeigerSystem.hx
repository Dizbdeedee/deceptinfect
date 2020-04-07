package deceptinfect.client;

import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.ecswip.System;

@:expose("geiger")
class GeigerSystem extends System {
    
    public static var net_geiger(default,never) = new gmod.NET_Server<"geiger",{geiger : Float}>();
    #if client

    
    public static var geiger:Float = 0.0;

    static var sounds = [
        GlobalLib.Sound("player/geiger1.wav"),
        GlobalLib.Sound("player/geiger2.wav"),
        GlobalLib.Sound("player/geiger3.wav")
    ];
    static var playTime:Float = 0.0;

    
    override function init_client() {
        net_geiger.signal.handle(
        function (data:{geiger : Float}) {
            //trace('geiger $geiger');
            geiger = data.geiger;
        });

    }
    override function run_client() {
        geigerThink();
    }

    public static function geigerThink() {
        if (GlobalLib.CurTime() > playTime && geiger > 0.016) {
            var choice = switch (geiger) {
                case x if (x < 0.2):
                    sounds[0];
                default:
                    sounds[MathLib.random(0,2)];
            }
            GlobalLib.EmitSound(choice,new Vector(0,0,0),-2,CHAN_STATIC,0.5);
            var mintime = GlobalLib.SoundDuration(sounds[0]) * 0.75;
            var exponent = 0.5 * (Math.pow(geiger,-0.5)) - 0.5;
            var random = untyped __lua__("math.random(0.5,1.1)");
            var maxtime = 3;
            playTime = MathLib.min(GlobalLib.CurTime() + mintime + exponent * random,GlobalLib.CurTime() + maxtime);
        }
    }


    
    #end

    #if server
    override function run_server() {
        for (plyr in ComponentManager.entities) {
            switch [plyr.get(InfectionComponent),plyr.get(PlayerComponent)] {
            case [Comp(inf),Comp(_.player => player)]:
                var fract = Math.min(((inf.rate - 1) / 3),1);
                net_geiger.send({geiger: fract},player,true);
            default:
            }
        }
    }
    #end
}

