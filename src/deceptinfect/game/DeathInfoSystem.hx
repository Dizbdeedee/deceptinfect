package deceptinfect.game;

import deceptinfect.ecswip.PlayerComponent;

class DeathInfoSystem extends System {

    static var deathinfo = new gmod.net.NET_Server<"di_deathinfo",{}>();

    #if server
    override function run_server() {
        for (ent in 0...entities) {
            switch ent.get(PlayerComponent) {
            case Comp(_.player => ply):
                var tr = ply.GetEyeTrace();
                switch (tr.Entity.validID()) {
                case Some(id):
                    switch id.get(DeathInfo) {
                    case Comp(c_di):
                    default:
                    }
                default:
                }
            default:
            }
        }
    }
    #end

}