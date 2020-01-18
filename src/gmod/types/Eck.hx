package gmod.types;

class Eck {
    static function hmm() {
        var e:PLAYER = {DisplayName: "ook"}
        
    }
}

/**
    This page describes all  fields for a playerclass.  
	
	
	
**/
typedef PLAYER = {
    /**
        How much armour we start with Default: 0
		
    **/
    var ?StartArmor : Float;
    /**
        Do we drop our weapon when we die Default: false
		
    **/
    ?DropWeaponOnDie : Bool,
    /**
        How fast to go from not ducking, to ducking Default: 0.3
		
    **/
    ?DuckSpeed : Float,
    /**
        How much health we start with Default: 100
		
    **/
    ?StartHealth : Float,
    /**
        Multiply walk speed by this when crouching Default: 0.3
		
    **/
    ?CrouchedWalkSpeed : Float,
    /**
        How fast to move when running/sprinting Default: 600
		
    **/
    ?RunSpeed : Float,
    /**
        Do we collide with teammates or run straight through them Default: true
		
    **/
    ?TeammateNoCollide : Bool,
    /**
        How powerful a jump should be Default: 200
		
    **/
    ?JumpPower : Float,
    /**
        Uses viewmodel hands Default: true
		
    **/
    ?UseVMHands : Bool,
    /**
        Automatically swerves around other players Default: true
		
    **/
    ?AvoidPlayers : Bool,
    /**
        The 'nice' name of the player class for display in User Interface and such.
		
    **/
    DisplayName : String,
    /**
        Max health we can have Default: 100
		
    **/
    ?MaxHealth : Float,
    /**
        How fast to go from ducking, to not ducking Default: 0.3
		
    **/
    ?UnDuckSpeed : Float,
    /**
        Can the player use the flashlight Default: true
		
    **/
    ?CanUseFlashlight : Bool,
    /**
        How fast to move when not running Default: 400
		
    **/
    ?WalkSpeed : Float,
    
}