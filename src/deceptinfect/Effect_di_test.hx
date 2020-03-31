package deceptinfect;

#if client
class Effect_di_test extends gmod.effects.EFFECT implements gmod.effects.EffectBuild {
    override function Init(effectData:CEffectData) {
        trace(effectData.GetRadius());
        
    }
}
#end