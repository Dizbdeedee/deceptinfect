package deceptinfect;

#if client
class Effect_di_test extends gmod.seffects.EFFECT implements gmod.seffects.SeffectBuild {
    override function Init(effectData:CEffectData) {
        trace(effectData.GetOrigin());
        
    }
}
#end