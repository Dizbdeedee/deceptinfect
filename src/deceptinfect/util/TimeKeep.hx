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
        var difftime = GameManager.diffTime;
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
        var difftime = GameManager.diffTime;
        times[key] -= difftime;
        managetime(key);
        return times[key];
    }

    inline function managetime(key:T) {
        if (times[key] < 0) {
            times[key] = 0;
        }
    }

    public function removeAllTimes() {
        var difftime = GameManager.diffTime;
        for (key in times.keys()) {
            times[key] -= difftime;
            managetime(key);
        }

    }

    public function getTime(key:T):Float {
        return times[key];
    }
}
#end