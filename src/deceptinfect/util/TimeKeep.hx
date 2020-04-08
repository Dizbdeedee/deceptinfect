package deceptinfect.util;
#if server
class TimeKeep<T:Int> {
    var times:Map<T,Float> = [];
    var limitZero:Bool;
    public function new(limitZero = true) {
        this.limitZero = limitZero;
    }

    public function addTime(key:T):Float {
        initTime(key);
        var difftime = GameManager.sure().diffTime;
        //trace('difftime $difftime');
        times[key] += difftime;
        return times[key];
    }

    function initTime(key:T) {
        if (!times.exists(key)) {
            times[key] = 0;
        }
    }
    public function setTime(key:T,f:Float) {
        times.set(key,f);
    }

    public function resetTime(key:T) {
        times[key] = 0;
    }

    public function removeTime(key:T):Float {
        initTime(key);
        var difftime = GameManager.sure().diffTime;
        times[key] -= difftime;
        if (times[key] < 0) {
            times[key] = 0;
        }
        return times[key];
    }

    public function getTime(key:T):Float {
        return times[key];
    }
}
#end