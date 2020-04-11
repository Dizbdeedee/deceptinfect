package deceptinfect.game;

import haxe.Json;
import deceptinfect.statuses.Walkthroughable;
import deceptinfect.abilities.FormSystem;
import deceptinfect.abilities.FormComponent;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.GameManager.GAME_STATE;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ents.Di_entities;
import deceptinfect.GEntCompat;
import deceptinfect.infection.InfectedComponent;
import gmod.Hook.GMHook;

typedef ND_Statue = {
    playerpos : Vector,
    playermodel : String,
    weaponmodel : String,
    playerbones : Table<Int,Vector>,
    playerangle : Table<Int,Angle>
}

typedef JsonStatues = Array<JsonStatue>;

typedef JsonStatue = {
    model : String,
    phys : Array<JsonPhys>,
}

typedef JsonPhys = {
    pos : Vector,
    ang : Angle
}




class RagdollSystem extends System {

    static var statue = new gmod.NET_Server<"statue",ND_Statue>();
    #if client
    static var ranonce = false;
    
    override function init_client() {
        statue.signal.handle(newStatue);
    }

    function newStatue(x:ND_Statue) {
        var rag = GlobalLib.ClientsideModel(x.playermodel);
        var wep = GlobalLib.ClientsideModel(x.weaponmodel);
        rag.SetPos(x.playerpos);
        // rag.SetupBones();
        rag.AddCallback("BuildBonePositions",
        function (rag:Entity,numbones:Int) {
            for (boneid in 0...numbones) {
                if (x.playerbones[boneid] == null) {

                    var bp = rag.GetBonePosition(boneid);
                    var offset = bp.a - rag.GetBonePosition(0).a;
                    // var offset2 = bp.b - rag.GetBonePosition(0).b;

                    
                    rag.SetBonePosition(boneid,x.playerbones[0] + offset,new Angle(0,0,0));
                }
            }
            var done:Map<Int,Bool> = [];
            for (boneid => vec in x.playerbones) {
                var ang = x.playerangle[boneid];
                // trace('$boneid : $vec $ang');
                done[boneid] = true;
                
                rag.SetBonePosition(boneid,vec,ang);
                
            }
        });
        // rag.SetupBones();
        wep.SetupBones();
        wep.AddEffects(EF_BONEMERGE);
        wep.AddEffects(EF_BONEMERGE_FASTCULL);
        wep.SetParent(rag);
    }

    override function run_client() {
        // if (ranonce) return;
        for (rag in EntsLib.GetAll()) {
            
            var mdl:String = rag.GetNWString("showwep");
            if (mdl != null && mdl != "" && untyped rag.showwep == null) {
                trace(mdl);
                untyped rag.showwep = true;
                var ent = GlobalLib.ClientsideModel(mdl);
                ent.SetupBones();
                // ent.Spawn();
                // rag.CallOnRemove("derka", (rag:Entity,ent:CSEnt) -> if (IsValid(ent)) ent.Remove(),ent);
                ent.AddEffects(EF_BONEMERGE);
                ent.AddEffects(EF_BONEMERGE_FASTCULL);
                ent.SetParent(rag);
                // ent.SetPos(rag.GetPos()); 
                // ent.SetAngles(rag.GetAngles());
                // ent.Spawn();
                // var success = false;
                // for (i in 0...ent.GetBoneCount()) {
                //     var otherbone = rag.LookupBone(ent.GetBoneName(i));
                //     if (otherbone != null) {
                //         // ent.FollowBone(rag,otherbone);

                //         trace(otherbone);
                //         success = true;
                //         break;
                //     }
                // }
                // if (!success) trace("Failed to bonemerge wep");
                // ranonce = true;
            }
        }
    }
    #end

    #if server
    override function init_server() {
        // HookLib.Add(GMHook.CreateEntityRagdoll,"di_ragdoll",playerRagdoll);
        GameManager.stateChange.handle(stateChange);
        getSystem(SlowMotionSystem).slowMotionEnd.handle(endSlowMotion);
    }

    function endSlowMotion(x:Noise) {
        for (ent in entities) {
            switch [ent.get(Ragdoll),ent.get(Statue),ent.get(GEntityComponent)] {
                case [Comp(_),Comp(_),Comp(_.entity => gent)]:
                    for (physid in 0...gent.GetPhysicsObjectCount()) {
                        var physob = gent.GetPhysicsObjectNum(physid);
                        physob.EnableMotion(false);
                        physob.Sleep();
                    }
                    gent.SetCollisionGroup(COLLISION_GROUP_WORLD);
                    gent.SetSolid(SOLID_NONE);
                default:
            }
            switch [ent.get(PlayerComponent),ent.get(AliveComponent)] {
                case [Comp(_.player => plyr),Comp(_)]:
                    playerStatue(plyr);
                    plyr.KillSilent();
                default:
            }
        }
    }

    function stateChange(newstate:GAME_STATE) {
        switch [GameManager.state,newstate] {
        case [_,ENDING(_, _)]:
            for (ent in entities) {

                switch [ent.get(PlayerComponent),ent.get(InfectedComponent),ent.get(AliveComponent)] {
                case [Comp(c_ply),Comp(_),Comp(_)]:
                    c_ply.player.SetModel(Misc.infModel);
                default:
                }
                // switch [ent.get(PlayerComponent),ent.get(AliveComponent)] {
                // case [Comp(c_ply),Comp(_)]:
                //     switch ent.get(InfectedComponent) {
                //     case Comp(_):
                //         TimerLib.Simple(0.5,() -> playerStatue(c_ply.player,true));
                //     default:
                //         TimerLib.Simple(0.5,() -> playerStatue(c_ply.player));
                //     }   
                // default:
                // }
                switch [ent.get(GEntityComponent),ent.get(Ragdoll)] {
                case [Comp(c_ent),Comp(_.reveal => WAIT(_))]:
                    reveal(c_ent.entity);
                default:
                }
                
            }
        case [WAIT,_]:
            for (ent in entities) {
                switch [ent.get(Statue),ent.get(GEntityComponent)] {
                case [Comp(_),Comp(c_gent)]:
                    trace("removed statue");
                    c_gent.entity.Remove();
                default:
                }
            }
        default:
        }
    }
    override function run_server() {
        for (ent in entities) {
            switch [ent.get(GEntityComponent),ent.get(Ragdoll),ent.get(Statue)] {
            case [Comp(c_ent),Comp(c_rag),NONE]:
                switch (c_rag.reveal) {
                case WAIT(time) if (GlobalLib.CurTime() > time.value):
                    reveal(c_ent.entity);    
                    // c_ent.entity.SetModel(Misc.infModel);
                default:
                }
                if (c_rag.owner.get_sure(PlayerComponent).player.Alive()) {
                    c_ent.entity.Remove();
                }
                
            default:
            }
        }
    }

    public function playerRagdoll(owner:Entity,ragdoll:Entity) {
        
        if (owner.IsPlayer()) {
            var ply:GPlayerCompat = cast owner;
            var di_ragdoll = newRagdoll(ply,ragdoll);
            switch (ply.get(InfectedComponent)) {
            case Comp(_):
                di_ragdoll.id.get_sure(Ragdoll).reveal = WAIT(GlobalLib.CurTime() + 5);
            default:
            }

        }
        ragdoll.SetNoDraw(true);
        ragdoll.Remove();
    }

    public function playerStatue(plyr:Player,?inf=false) {
        var ent:GEntCompat = new GEntCompat(EntsLib.Create("prop_ragdoll"));
        ent.id.add_component(new Statue());
        ent.id.add_component(new KeepRestart());
        if (inf) {
            ent.SetModel(Misc.infModel);
            
        } else {
            ent.SetModel(plyr.GetModel());
        }
        ent.SetPos(plyr.GetPos());
        // ent.AddEffects(EF_BONEMERGE);
        // ent.AddEffects(EF_BONEMERGE_FASTCULL);
        trace("hmm i wonder whats for dinner");
        // ent.SetParent(plyr);
        ent.Spawn();
        for (physNum in 0...ent.GetPhysicsObjectCount() - 1) {
            var physob = ent.GetPhysicsObjectNum(physNum);
            var result = plyr.GetBonePosition(ent.TranslatePhysBoneToBone(physNum));
            if (IsValid(physob)) {
                physob.SetPos(result.a);
                physob.SetAngles(result.b);
                // TimerLib.Simple(0.1,() -> physob.EnableMotion(false));
                
                physob.EnableMotion(false);
                physob.Sleep();
            }
            
        }
        ent.SetCollisionGroup(COLLISION_GROUP_WORLD);
        ent.SetSolid(SOLID_NONE);
        var plywep:Weapon = plyr.GetActiveWeapon();
        ent.SetNWString("showwep",plywep.GetModel());
    }

    function writeStatues() {
        var tbl:JsonStatues = [];

        for (ent in entities) {

            switch [ent.get(Statue),ent.get(GEntityComponent)] {
            case [Comp(_),Comp(_.entity => gent)]:
                var ar:Array<JsonPhys> = [];
                for (i in 0...gent.GetPhysicsObjectCount()) {
                    var physob = gent.GetPhysicsObjectNum(i);
                    ar.push({
                        pos : physob.GetPos(),
                        ang : physob.GetAngles() 
                    });

                }
                tbl.push({
                    model : gent.GetModel(),
                    phys: ar
                });
            default:
            }
        }
        FileLib.Write("deceptinfect/lastRoundStatues.txt",Json.stringify(tbl));
    }
    function readStatues() {
        var file = FileLib.Read("deceptinfect/lastRoundStatues.txt","DATA");
        if (file != null && file != "") {
            var json:JsonStatues = Json.parse(file);
            for (stat in json) {
                //ect.
            }
            trace(json);
        }
    }

    public function playerStatue2(plyr:Player) {
        var vecs:Table<Int,Vector> = Table.create();
        var angs:Table<Int,Angle> = Table.create();
        for (boneid in 0...plyr.GetBoneCount() - 1) {
            var bp = plyr.GetBonePosition(boneid);
            vecs[boneid] = bp.a;
            angs[boneid] = bp.b;
        }
        statue.broadcast({
            playerpos : plyr.GetPos(),
            playermodel: plyr.GetModel(),
            weaponmodel: plyr.GetActiveWeapon().GetModel(),
            playerangle: angs,
            playerbones: vecs
        });

    }
    // function playerDeath(vic:GPlayerCompat,inflicter:Entity,attacker:Entity) {
    //     if (GameManager.state.match(PLAYING(_))) {
    //         var di_ragdoll = newRagdoll(vic);
    //         switch vic.get(InfectedComponent) {
    //         case Comp(_):
    //             //FIXME FIXME AAAAHHHHH
    //             var c_rag = di_ragdoll.id.get_sure(Ragdoll);
    //             c_rag.reveal = WAIT(GlobalLib.CurTime() + 5);
    //         default:
    //         }
    //     }
    // }

    public function newRagdoll(owner:GPlayerCompat,old:Entity):GEntCompat {
        var rag = createProp();
        rag.SetPos(owner.GetPos());
        rag.SetModel(owner.GetModel());
        rag.Spawn();
        rag.id.get_sure(Ragdoll).owner = owner.id;
        // var inertia = owner.GetPhysicsObject().GetInertia();
        // trace(inertia);
        // var vel =owner.GetVelocity();
        for (physNum in 0...rag.GetPhysicsObjectCount() - 1) {
            var physob = rag.GetPhysicsObjectNum(physNum);
            var oldphysob = old.GetPhysicsObjectNum(physNum);
            var result = owner.GetBonePosition(rag.TranslatePhysBoneToBone(physNum));
            if (IsValid(physob)) {
                physob.SetPos(result.a);
                physob.SetAngles(result.b);
                if (IsValid(oldphysob)) {
                    physob.SetVelocityInstantaneous(oldphysob.GetVelocity());
                    physob.SetVelocity(oldphysob.GetVelocity());
                }
                physob.Wake();
            }
        }
        return rag;
    }

    function createProp():GEntCompat {
        var rag:Entity = EntsLib.Create("prop_ragdoll");
        
        // rag.SetMaterial()
        // rag.SetSubMaterial(0,"debug/particleerror");
        var id = new GEntCompat(rag).id;
        id.add_component(new Ragdoll());
        
        switch (GameManager.state) {
            case PLAYING(_):
                id.add_component(new Statue());
                id.add_component(new KeepRestart());
            default:
                id.add_component(new CleanupEnt());
                // id.add_component(new StragglingRagdoll());
        }
        return rag;
    }

    function reveal(rag:GEntCompat) {
        var newmodel = createProp();
        var c_rag = newmodel.id.get_sure(Ragdoll);
        c_rag.reveal = REVEAL;
        c_rag.owner = rag.id.get_sure(Ragdoll).owner;
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
                var oldphysob = switch (rag.TranslateBoneToPhysBone(otherbone)) {
                    case -1:
                        null;
                    case x:
                        rag.GetPhysicsObjectNum(x);
                };
                if (otherbone != null) {
                    var bp = rag.GetBonePosition(otherbone);
                    newphysob.SetPos(bp.a,true);
                    newphysob.SetAngles(bp.b);
                    if (oldphysob != null) {
                        newphysob.SetVelocityInstantaneous(oldphysob.GetVelocity());
                    }
                } else {
                    var translate = newphysob.GetPos() - newlocpos;  
                    newphysob.SetPos(translate + oldlocpos,true);
                }
                // newphysob.EnableMotion(false);
                // newphysob.Sleep();
            }
        }
        rag.Remove();
    }

    #end
}