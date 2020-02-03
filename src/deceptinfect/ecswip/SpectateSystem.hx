package deceptinfect.ecswip;

class SpectateSystem {
    //TODO add ability to spectate other entities
    // public static function chooseSpectateTarget(x:PlayerComponent,dir:Spec_Direction){
    //     var iter = switch (dir) {
    //         case FORWARDS:
    //             1;
    //         case BACKWARDS:
    //             -1;
    //     }
    //     var specCur = x.spec_next;
    //     var specNext = x.spec_next + iter;
    //     var players = PlayerLib.GetAll();
    //     var specd = false;
    //     while (specNext != specCur) {
    //         var target = players[specNext];
    //         if (GlobalLib.IsValid(target) && target.Alive()) {
    //             ent.SpectateEntity(target);
    //             ent.SetObserverMode(OBS_MODE_CHASE);
    //             specd = true;
    //         }
    //         specNext += iter;
    //         if (specNext < 1) {
    //             specNext = players.length();
    //         } else if (specNext > players.length()) {
    //             specNext = 0;
    //         }
    //     }
    //     if (!specd) {
    //         trace("No spectatable players found");
    //     }
    //     x.spec_next = specNext;

    // }


}

enum Spec_Direction {
    FORWARDS;
    BACKWARDS;
}