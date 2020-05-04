package deceptinfect;

import gmod.swep.SwepBuild;

class Weapon_di_scan extends gmod.swep.SWEP implements SwepBuild {
    final properties:SwepFields = {
        
        Primary: {
            DefaultClip: -1,
            ClipSize: -1,
            Automatic: false,
            Ammo : "SMG1",
        },
    
    }

    override function Initialize() {
        trace('big weapon!');

    }

    
}