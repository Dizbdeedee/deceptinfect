package deceptinfect.macros;

import haxe.ds.GenericStack;
import haxe.crypto.Crc32;
import haxe.io.Bytes;
using Lambda;
class SpamTracker {

    static var messages = new haxe.ds.List<Int>();

    static var blocked:BlockStatus = NOT_BLOCKED;
    public static function shouldShow(x:String):Bool {
        var newcrc = Crc32.make(Bytes.ofString(x));
        return switch (blocked) {
            case NOT_BLOCKED:
                messages.add(newcrc);
                var shouldshow = messages.length < 5 || messages.exists((item) -> item != newcrc);
                if (messages.length > 5) {
                    messages.pop();
                    if (!shouldshow) {
                        trace("Spam tracker blocking spammy error message.");
                        blocked = BLOCKED(newcrc);
                    }
                }
                shouldshow;
            case BLOCKED(i) if (newcrc == i):
                false;
            case BLOCKED(i) if (newcrc != i):
                blocked = NOT_BLOCKED;
                true;
            default:
                true;
        }
    }
}

enum BlockStatus {
    NOT_BLOCKED;
    BLOCKED(i:Int);
}
@:autoBuild(deceptinfect.macros.StopSpam.build())
interface Spam {
   
}
