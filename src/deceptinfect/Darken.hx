package deceptinfect;

import gmod.stringtypes.Hook;
import deceptinfect.lib.BSP;
import gmod.helpers.net.NET_Server;

typedef PreviousMaterial = {
    name : String,
    baseTexture : ITexture,
    ?color : Vector
}

class NDarken implements hxbit.Serializable {
    @:s public var darkenToggle:Bool;

    public function new(x:Bool) {
        darkenToggle = x;
    }
}

@:keep
class Darken {

    static var materialsSet:Array<PreviousMaterial> = [];

    static var replaced:Bool = false;

    public static final net_darken = new NET_Sv<NDarken>([recieveND]);


    static function recieveND(x:NDarken) {
        trace(x);
        setDark(x.darkenToggle);
    }

    static function replace() {
        final open = MRBsp.OpenBSP();
		if (open != false) {
			final b:BSP = open;
			for (str in b.ReadLumpTextDataStringData()) {
				final imat = Gmod.Material(str).a;
				if (!imat.IsError()) {
					if (imat.GetName().indexOf("tools") == -1
						&& imat.GetName().indexOf("lights") == -1
					&& imat.GetName().indexOf("water") == -1) {
                        var col = imat.GetVector("$color");
                        final er = {
                            name : str,
                            baseTexture : imat.GetTexture("$basetexture"),
                            color : col 
                        };                        
                        materialsSet.push(er);
                        // final colorTex = Gmod.Material("tools/toolsblack").a.GetTexture("$basetexture");
						imat.SetTexture("$basetexture","grey");
						imat.SetVector("$color", new Vector(0.03,0.03,0.03));
					}
				}
			}
		}
    }

    static function revert() {
        for (mat in materialsSet) {
            final imat = Gmod.Material(mat.name).a;
            if (mat.baseTexture == null) {
                trace("no base texture");
                imat.SetUndefined("$basetexture");
            } else {
                imat.SetTexture("$basetexture",mat.baseTexture);
                trace("set texture");
            }
            if (mat.color == null) {
                imat.SetUndefined("$color");
                trace("no color");
            } else {
                imat.SetVector("$color", mat.color);
                trace("set color");
            }
            // imat.Recompute();
        }
    }

    @:expose("setDark")
    static function setDark(x:Bool) {
        if (!replaced && x) {
            replace();
            replaced = true;
        } else if (replaced && !x) {
            
            revert();
            replaced = false;
        }
    }
}