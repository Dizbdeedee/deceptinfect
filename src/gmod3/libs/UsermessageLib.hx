package gmod.libs;


/**
    ***Deprecated:**   You should be using the net library instead
	
	The usermessage library is used to receive user messages from the server on the client. 
	
	
**/
@:native("usermessage")extern class UsermessageLib {
    
    /**
        ***INTERNAL:**  
		
		Called by the engine when a usermessage arrives, this method calls the hook function specified by usermessage.Hook if any. 
		
		
		Name | Description
		--- | ---
		`name` | The message name.
		`msg` | The message.
		
		
		
    **/
    @:deprecated
    public static function IncomingMessage(name:String, msg:Bf_read):Void;
    
    
    /**
        ***Deprecated:**   You should be using net library instead
		
		Sets a hook for the specified to be called when a usermessage with the specified name arrives. 
		
		
		Name | Description
		--- | ---
		`name` | The message name to hook to.
		`callback` | The function to be called if the specified message was received. Parameters (Optional): bf_read msg vararg preArgs
		`preArgs` | Arguments that are passed to the callback function when the hook is called. *ring ring*
		
		
		
    **/
    @:deprecated
    public static function Hook(name:String, callback:Function, preArgs:Rest<Dynamic>):Void;
    
    
    /**
        Returns a table of every usermessage hook 
		
		
		**Returns:** hooks
		
		
    **/
    
    public static function GetTable():AnyTable;
    
    

}
#if !client
private typedef Bf_read = Dynamic;
#end