package deceptinfect.util;

class Util {

    static var mappy:Map<String,Float> = [];
    public static function printTimer(string:String,time:Float,run:() -> Void) {
        if (mappy.exists(string)) {
            var nextTime = mappy.get(string);
            if (GlobalLib.CurTime() > nextTime) {

                run();
                mappy.set(string,GlobalLib.CurTime() + time);
            }
        } else {
            run();
            mappy.set(string,GlobalLib.CurTime() + time);
        }
    }  
}

