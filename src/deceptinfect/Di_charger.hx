package deceptinfect;

@:build(gmod.macros.SentMacro.build())
class Di_charger extends gmod.sent.ENT_ANIM {
    #if server
    override function Initialize() {
        super.Initialize();
    }

    #end
}