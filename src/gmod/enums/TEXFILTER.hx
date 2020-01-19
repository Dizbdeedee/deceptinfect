/**
    Enumerations used by render.PushFilterMin and render.PushFilterMag. 
	
	See this and this page for more information on texture filtering.
**/
@:native("_G")
extern enum abstract TEXFILTER(Int) {
    /**
        
    **/
    var TEXFILTER.LINEAR;
    /**
        
    **/
    var TEXFILTER.NONE;
    /**
        
    **/
    var TEXFILTER.ANISOTROPIC;
    /**
        
    **/
    var TEXFILTER.POINT;
    
}