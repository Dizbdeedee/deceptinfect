package gmod.libs;


/**
    The debugoverlay library is mainly useful for 3D debugging, it can be used to draw shapes on the screen for debug purposes. 
	
	
**/
@:native("debugoverlay")extern class DebugoverlayLib {
    
    /**
        Displays 2D text at the specified coordinates. 
		
		
		Name | Description
		--- | ---
		`pos` | The position in 3D to display the text.
		`line` | Line of text, will offset text on the to display the new line unobstructed
		`text` | The text to display
		`lifetime` | Number of seconds to appear
		`color` | The color of the box. Uses the Color structure
		
		
		
    **/
    
    public static function EntityTextAtPosition(pos:Vector, line:Float, text:String, ?lifetime:Float, ?color:AnyTable):Void;
    
    
    /**
        Displays text triangle at the specified coordinates. 
		
		
		Name | Description
		--- | ---
		`x` | The position of the text, from 0 ( left ) to 1 ( right ).
		`y` | The position of the text, from 0 ( top ) to 1 ( bottom ).
		`text` | The text to display
		`lifetime` | Number of seconds to appear
		`color` | The color of the box. Uses the Color structure
		
		
		
    **/
    
    public static function ScreenText(x:Float, y:Float, text:String, ?lifetime:Float, ?color:AnyTable):Void;
    
    
    /**
        Creates a coloured cross at the specified position for the specified time. 
		
		
		Name | Description
		--- | ---
		`position` | Position origin
		`size` | Size of the cross
		`lifetime` | Number of seconds the cross to appear
		`color` | The color of the cross. Uses the Color structure
		`ignoreZ` | If true, will draw on top of everything; ignoring the Z buffer
		
		
		
    **/
    
    public static function Cross(position:Vector, size:Float, ?lifetime:Float, ?color:AnyTable, ?ignoreZ:Bool):Void;
    
    
    /**
        Displays a coloured sphere at the specified position. 
		
		
		Name | Description
		--- | ---
		`origin` | Position origin
		`size` | Size of the sphere
		`lifetime` | Number of seconds to appear
		`color` | The color of the sphere. Uses the Color structure
		`ignoreZ` | If true, will draw on top of everything; ignoring the Z buffer
		
		
		
    **/
    
    public static function Sphere(origin:Vector, size:Float, ?lifetime:Float, ?color:AnyTable, ?ignoreZ:Bool):Void;
    
    
    /**
        Displays a solid coloured box at the specified position. 
		
		
		Name | Description
		--- | ---
		`origin` | Position origin
		`mins` | Minimum bounds of the box
		`maxs` | Maximum bounds of the box
		`lifetime` | Number of seconds to appear
		`color` | The color of the box. Uses the Color structure
		
		
		
    **/
    
    public static function Box(origin:Vector, mins:Vector, maxs:Vector, ?lifetime:Float, ?color:AnyTable):Void;
    
    
    /**
        Displays "swept" box, two boxes connected with lines by their verices. 
		
		
		Name | Description
		--- | ---
		`vStart` | The start position of the box.
		`vEnd` | The end position of the box.
		`vMins` | The "minimum" edge of the box.
		`vMaxs` | The "maximum" edge of the box.
		`ang` | 
		`lifetime` | Number of seconds to appear
		`color` | The color of the box. Uses the Color structure
		
		
		
    **/
    
    public static function SweptBox(vStart:Vector, vEnd:Vector, vMins:Vector, vMaxs:Vector, ang:Angle, ?lifetime:Float, ?color:AnyTable):Void;
    
    
    /**
        Displays a solid colored rotated box at the specified position. 
		
		
		Name | Description
		--- | ---
		`pos` | World position
		`mins` | The mins of the box (lowest corner)
		`maxs` | The maxs of the box (highest corner)
		`ang` | The angle to draw the box at
		`lifetime` | Amount of seconds to show the box
		`color` | The color of the box. Uses the Color structure
		
		
		
    **/
    
    public static function BoxAngles(pos:Vector, mins:Vector, maxs:Vector, ang:Angle, ?lifetime:Float, ?color:AnyTable):Void;
    
    
    /**
        Displays a colored triangle at the specified coordinates. 
		
		
		Name | Description
		--- | ---
		`pos1` | First point of the triangle
		`pos2` | Second point of the triangle
		`pos3` | Third point of the triangle
		`lifetime` | Number of seconds to appear
		`color` | The color of the box. Uses the Color structure
		`ignoreZ` | If true, will draw on top of everything; ignoring the Z buffer
		
		
		
    **/
    
    public static function Triangle(pos1:Vector, pos2:Vector, pos3:Vector, ?lifetime:Float, ?color:AnyTable, ?ignoreZ:Bool):Void;
    
    
    /**
        Draws a 3D grid of limited size in given position. 
		
		
		Name | Description
		--- | ---
		`position` | 
		
		
		
    **/
    
    public static function Grid(position:Vector):Void;
    
    
    /**
        Displays text at the specified position. 
		
		
		Name | Description
		--- | ---
		`origin` | Position origin
		`text` | String message to display
		`lifetime` | Number of seconds to appear
		`viewCheck` | Clip text that is obscured
		
		
		
    **/
    
    public static function Text(origin:Vector, text:String, ?lifetime:Float, ?viewCheck:Bool):Void;
    
    
    /**
        Displays a coloured line at the specified position. 
		
		
		Name | Description
		--- | ---
		`pos1` | First position of the line
		`pos2` | Second position of the line
		`lifetime` | Number of seconds to appear
		`color` | The color of the line. Uses the Color structure
		`ignoreZ` | If true, will draw on top of everything; ignoring the Z buffer
		
		
		
    **/
    
    public static function Line(pos1:Vector, pos2:Vector, ?lifetime:Float, ?color:AnyTable, ?ignoreZ:Bool):Void;
    
    
    /**
        Displays an axis indicator at the specified position. 
		
		
		Name | Description
		--- | ---
		`origin` | Position origin
		`ang` | Angle of the axis
		`size` | Size of the axis
		`lifetime` | Number of seconds to appear
		`ignoreZ` | If true, will draw on top of everything; ignoring the Z buffer
		
		
		
    **/
    
    public static function Axis(origin:Vector, ang:Angle, size:Float, ?lifetime:Float, ?ignoreZ:Bool):Void;
    
    

}



