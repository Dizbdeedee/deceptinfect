package deceptinfect.game;

import deceptinfect.GameManager.GAME_STATE;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ents.Di_entities;
import deceptinfect.GEntCompat;
import deceptinfect.infection.InfectedComponent;
import gmod.Hook.GMHook;

class RagdollSystem extends System {

    #if server
    override function init_server() {
        HookLib.Add(GMHook.PlayerDeath,"di_ragdoll",playerDeath);
        GameManager.stateChange.handle(stateChange);
    }

    function stateChange(data:GAME_STATE) {
        switch (data) {
        case ENDING(_, _):
            for (ent in entities) {
                switch [ent.get(GEntityComponent),ent.get(Ragdoll)] {
                case [Comp(c_ent),Comp(_.reveal => WAIT(_))]:
                    reveal(c_ent.entity);
                default:
                }
            }
        default:
        }
    }
    override function run_server() {
        for (ent in entities) {
            switch [ent.get(GEntityComponent),ent.get(Ragdoll)] {
            case [Comp(c_ent),Comp(c_rag)]:
                switch (c_rag.reveal) {
                case WAIT(time) if (GlobalLib.CurTime() > time.value):
                    reveal(c_ent.entity);    
                    // c_ent.entity.SetModel(Misc.infModel);
                default:
                }
            default:
            }
        }
    }

    function playerDeath(vic:GPlayerCompat,inflicter:Entity,attacker:Entity) {
        if (GameManager.state.match(PLAYING(_))) {
            var di_ragdoll = newRagdoll(vic);
            switch vic.get(InfectedComponent) {
            case Comp(_):
                //FIXME FIXME AAAAHHHHH
                var c_rag = di_ragdoll.id.get_sure(Ragdoll);
                c_rag.reveal = WAIT(GlobalLib.CurTime() + 5);
            default:
            }
        }
    }

    public function newRagdoll(owner:GPlayerCompat):GEntCompat {
        var rag = createProp();
        rag.SetPos(owner.GetPos());
        rag.SetModel(owner.GetModel());
        rag.Spawn();
        for (physNum in 0...rag.GetPhysicsObjectCount() - 1) {
            var physob = rag.GetPhysicsObjectNum(physNum);
            var result = owner.GetBonePosition(rag.TranslatePhysBoneToBone(physNum));
            if (IsValid(physob)) {
                physob.SetPos(result.a);
                physob.SetAngles(result.b);
                physob.Wake();
            }
        }
        return rag;
    }

    function createProp():GEntCompat {
        var rag:Entity = EntsLib.Create("prop_ragdoll");
        var id = new GEntCompat(rag).id;
        id.add_component(new Ragdoll());
        return rag;
    }

    function reveal(rag:GEntCompat) {
        var newmodel = createProp();
        newmodel.id.get_sure(Ragdoll).reveal = REVEAL;
        newmodel.SetModel(Misc.infModel);
        newmodel.SetPos(rag.GetPos());
        newmodel.Spawn();
        var newlocpos = newmodel.GetBonePosition(0).a;
        var oldlocpos = rag.GetBonePosition(0).a;
        rag.SetCollisionGroup(COLLISION_GROUP_WORLD);
        for (i in 0...rag.GetPhysicsObjectCount() - 1) {
            var oldphysob = rag.GetPhysicsObjectNum(i);
            if (IsValid(oldphysob)) {
                oldphysob.EnableCollisions(false);
                
            } 
        } 
        for (i in 0...newmodel.GetPhysicsObjectCount() - 1) {
            var newphysob = newmodel.GetPhysicsObjectNum(i);
            if (IsValid(newphysob)) {
                var bone = newmodel.TranslatePhysBoneToBone(i);
                var otherbone = rag.LookupBone(newmodel.GetBoneName(bone));
                if (otherbone != null) {
                    var bp = rag.GetBonePosition(otherbone);
                    newphysob.SetPos(bp.a,true);
                    newphysob.SetAngles(bp.b);
                } else {
                    var translate = newphysob.GetPos() - newlocpos;  
                    newphysob.SetPos(translate + oldlocpos,true);
                }
                newphysob.EnableMotion(false);
                newphysob.Sleep();
            }
        }
        rag.Remove();
    }

    #end
}