package deceptinfect;




import tink.CoreApi.Signal;

class Grab {
    var attacker:DI_Player;
    var victim:Grababble;

    public var grabStarted:Signal<Grab>;
    

    public static function startGrab(f:CanGrab,e:Grababble):AttemptGrabResult {
        switch ([f.grab,e.grababble]) {
            case [GRAB_FREE,NOT_GRABBED]:
                var g = new Grab();
                return SUCCESS(g);
            case [CANT_GRAB,_] | [GRABBING(_),_]:
                return ATTACKER_BUSY;
            default:
                return ATTACKER_BUSY;
        }
    } 

    function new() {

    }
}

typedef Grababble = {
    var grababble:GrabRef;
}

typedef CanGrab = {
    var grab:GrabAttack;
}

enum AttemptGrabResult {
    ATTACKER_BUSY;
    TARGET_BUSY;
    SUCCESS(g:Grab);
}
enum GrabAttack {
    CANT_GRAB;
    GRAB_FREE;
    GRABBING(e:Grab);
}

enum GrabRef {
    NOT_GRABBED;
    GRABBED(g:Grab);
}