package deceptinfect;

class TimeKeep<T:Int> {
    var times:Map<T,Float> = [];
    var limitZero:Bool;
    public function new(limitZero = true) {
        this.limitZero = limitZero;
    }

    public function addTime(key:T):Float {
        if (times.exists(key)) {
            var difftime = GameManager.sure().diffTime;
            times[key] += difftime;
        } else {
            times[key] = 0;
        }
        
        return times[key];
    }

    public function setTime(key:T,f:Float) {
        times.set(key,f);
    }

    public function removeTime(key:T):Float {
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
