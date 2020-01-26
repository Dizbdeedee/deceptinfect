package deceptinfect;

class TimeKeep {
    var times:Map<Int,Float> = [];
    var limitZero:Bool;
    public function new(limitZero = true) {
        this.limitZero = limitZero;
    }

    public function addTime(key:Int):Float {
        if (times.exists(key)) {
            var difftime = Game.sure().difftime;
            times[key] += difftime;
        } else {
            times[key] = 0;
        }
        
        return times[key];
    }

    public function setTime(key:Int,f:Float) {
        times.set(key,f);
    }

    public function removeTime(key:Int):Float {
        var difftime = Game.sure().difftime;
        times[key] -= difftime;
        if (times[key] < 0) {
            times[key] = 0;
        }
        return times[key];
    }

    public function getTime(key:Int):Float {
        return times[key];
    }
}
