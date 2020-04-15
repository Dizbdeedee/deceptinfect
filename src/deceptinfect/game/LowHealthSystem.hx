package deceptinfect.game;

import deceptinfect.infection.InfVunerability;
import enumExtractor.EnumExtractor;
import deceptinfect.ecswip.PlayerComponent;

class LowHealthSystem extends System implements EnumExtractor {

    #if server
    override function run_server() {
        for (ent in entities) {
            // PlayerComponentp
            @as(ent.get(PlayerComponent) => Comp(c_ply)) {
                if (c_ply.player.Health() < 25) {

                    var remap = MathLib.Remap.bind(25 - c_ply.player.Health(),1,25);
                    var c_inf = ent.getOrAdd(InfVunerability);
                    c_inf.vun = remap(1.0,1.6);
                }
                // c_ply.player.SetWalkSpeed(remap(225,))
            }
        }
    }
    #end
}