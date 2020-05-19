package gmod.sent;


#if server
class ENT_NEXTBOT extends gmod.sent.ENT<NextBot> {
    public final TYPE = "nextbot";

    /**
        Called to initialize the behaviour.

        This is called automatically when the NextBot is created, you should not call it manually.
        You shouldn't override this unless you know what you are doing - it's used to kick off the coroutine that runs the bot's behaviour. See NEXTBOT:RunBehaviour instead.
    **/
    @:hook
    function BehaveStart() {}

    /**
        Called to update the bot's behaviour.


        Name | Description
		--- | ---
		`interval` | How long since the last update.
    **/
    @:hook
    function BehaveUpdate(interval:Float) {}

    /**
        Called to update the bot's animation.
    **/
    @:hook
    function BodyUpdate() {}

    /**
        Called when the nextbot touches another entity.

        
        Name | Description
		--- | ---
		`ent` | The entity the nextbot came in contact with.
    **/
    @:hook
    function OnContact(ent:Entity) {}

    /**

    **/
    function OnIgnite() {}

    /**
        Called when the bot gets hurt. This is a good place to play hurt sounds or voice lines.
        
        
        Name | Description
        --- | ---
        `info` | The damage info
    **/
    function OnInjured(info:CTakeDamageInfo) {}
}

#end
