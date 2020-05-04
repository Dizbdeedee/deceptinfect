package gmod.sent;


class ENT_BRUSH extends gmod.sent.ENT {
	
	public final TYPE = "brush";
    var self(default,never):gmod.gclass.Entity;

    function StartTouch(ent:Entity) {}

    function EndTouch(ent:Entity) {}

    function Touch(ent:Entity) {}
}