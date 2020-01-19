/**
    Enumerations used by Player:ScreenFade.
**/
@:native("_G")
extern enum abstract SCREENFADE(Int) {
    /**
        Fade out after the hold time has passed
    **/
    var SCREENFADE.IN;
    /**
        Fade in, hold time passes, disappear
    **/
    var SCREENFADE.OUT;
    /**
        Appear, Disappear, no effects
    **/
    var SCREENFADE.PURGE;
    /**
        With white color, turns the screen black
    **/
    var SCREENFADE.MODULATE;
    /**
        No effects, never disappear
    **/
    var SCREENFADE.STAYOUT;
    
}