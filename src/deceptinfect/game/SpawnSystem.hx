package deceptinfect.game;

import deceptinfect.ecswip.VirtualPosition;



class SpawnSystem extends System {
    public static final obj = new SpawnPointTable();
    public static final item = new SpawnPointTable();

    public static final nest = new SpawnPointTable();

    public static final evac = new SpawnPointTable();

    #if server
    override function init_server() {
        // generateSpawns();
    }

    override function run_server() {
        for (ent in entities) {
            switch [ent.get(Spawned),ent.get(VirtualPosition)] {
            case [Comp(c_spawn),Comp(c_pos)]:
                if (c_spawn.spawn.vec.DistToSqr(c_pos.pos) > C_square(90)) {
                    trace("Spawn freed");
                    c_spawn.spawn.claimed = UNCLAIMED;
                    ent.remove_component(Spawned);
                };
            default:
            }
        }
    }
    #end
    
    public static function generateSpawns() {
        obj.generateSpawns(MapStorage.spawns.get(GameLib.GetMap()).objectives);
        item.generateSpawns(MapStorage.spawns.get(GameLib.GetMap()).items);
        nest.generateSpawns(MapStorage.spawns.get(GameLib.GetMap()).nests);
        evac.generateBoundSpawns(MapStorage.spawns.get(GameLib.GetMap()).evacs);
    }

    
}

enum SpawnClaim {
    UNCLAIMED;
    CLAIMED(e:Entity);
}

class Spawn {

    public final vec:Vector;
    final parent:SpawnPointTable;
    final id:SpawnID;
    public var claimed:SpawnClaim = UNCLAIMED;
    var distStore:Map<SpawnID,Float> = [];
    var distOrder:Array<SpawnID> = [];
    var maxdistID:Int;
    var mindistID:Int;

    function getRandomFarAwaySpawn():Int {
        return MathLib.random(Math.floor(distOrder.length / 2),distOrder.length - 1);
    }
    function getRandomSpawnMinDistAway(curSpawns:Array<SpawnID>):Spawn {
        var total:Map<SpawnID,Float> = [];
        var min = Math.POSITIVE_INFINITY;
        var max = -1.0;
        // trace(distStore);
        for (_sp in curSpawns) {
            var sp = get(_sp);
            trace('id : $_sp stuff : ${sp.distStore}');

            for (id => dist in sp.distStore) {
                trace('my id : $_sp thier id : $id boogie : ${get(id).claimed}');
                if (get(id).claimed == UNCLAIMED) {
                    trace(total[id]);
                    total[id] = switch (total[id]) {
                        case null:
                            dist;
                        case x:
                            x + dist;
                    }
                    if (total[id] > max) {
                        max = total[id];
                        trace('new max $max');
                    }
                    if (total[id] < min) {
                        min = total[id];
                        trace('new min $min');
                    }

                }
            }
        }
        var mindist = ((max - min) * 0.4) + min;
        var luckydraw = [];
        for (id => dist in total) {
            if (dist > mindist) {
                luckydraw.push(id);
            }
            
        }
        if (luckydraw.length == 0) {
            trace("Not enough spawns far away enough to use algo.");
            var id = getRandomFarAwaySpawn();
            trace('id chosen $id');
            return get(id);
        } else {
            var index = MathLib.random(0,luckydraw.length - 1);
            var id = luckydraw[index];

            trace(luckydraw);
            trace('id chosen $id index $index');

            return get(id);
        }

    }

    public function getRandomSpawns(noSpawns:Int):Array<Spawn> {
        var rtn:Array<Spawn> = [];
        var curspawns:Array<SpawnID> = [id];
        for (i in 0...noSpawns) {
            trace(curspawns);
            var newspawn = getRandomSpawnMinDistAway(curspawns);
            curspawns[i] = newspawn.id; 
            rtn[i] = newspawn;
        }
        return rtn;
    }

    public function spawn(ent:GEntCompat) {
        claimed = CLAIMED(ent);
        ent.SetPos(vec);
        ent.Spawn();
        switch (ent.has_id()) {
        case Some(id):
            trace(id);
            id.add_component(new Spawned(this));
        default:
        }

             

    } 

    inline function get(x:SpawnID):Spawn {
        return parent.spawns[x];
    }

    public function calculateDist(other:Spawn) {
        var dist = vec.DistToSqr(other.vec);
        distStore.set(other.id,dist);
        if (maxdistID == null || dist > distStore.get(maxdistID)) {
            maxdistID = other.id;
        }
        if (mindistID == null || dist < distStore.get(mindistID)) {
            mindistID = other.id;
        }
        insertNewSortedDist(other);
    }

    function insertNewSortedDist(other:Spawn) {
        var i = 0;
        var insert = distOrder.length - 1;
        for (spawnid in distOrder) {
            if (distStore.get(spawnid) > distStore.get(other.id)) {
                insert = i;
                break;
            }
            i++;
        }
        distOrder[insert] = other.id;
    }


    // @:allow(SpawnPointTable.generateSpawns)
    public function new(parent:SpawnPointTable,vec:Vector) {
        this.vec = vec;
        this.parent = parent;
        this.id = parent.spawns.length;

    }

}

class BoundsSpawn extends Spawn {
    final bounds:MinMax;

    public function new(parent:SpawnPointTable,vec:Vector,bounds:MinMax) {
        super(parent,vec);
        this.bounds = bounds;
    }

    override function spawn(ent:GEntCompat) {
        claimed = CLAIMED(ent);
        ent.SetPos(vec);
        ent.Spawn();
        switch (ent.has_id()) {
        case Some(id):
            trace(id);
            id.add_component(new Spawned(this));
        default:
        }
        ent.SetCollisionBoundsWS(bounds.mins,bounds.maxs);
    }
}
private typedef SpawnID = Int;


class SpawnPointTable {

    public var spawns(default,null):Array<Spawn> = [];

    public function generateSpawns(points:Array<Vector>) {
        spawns = [];
        for (point in points) {
            spawns.push(new Spawn(this,point));
            // trace(spawns[0]);
        }

        for (spawn in spawns) {
            for (spawn2 in spawns) {
                spawn.calculateDist(spawn2);
            }
        }
        // trace(spawns);
    }

    public function generateBoundSpawns(points:Array<MinMax>) {
        spawns = [];
        for (minmax in points) {
            spawns.push(new BoundsSpawn(this,minmax.getCenter(),minmax));
        }

        for (spawn in spawns) {
            for (spawn2 in spawns) {
                spawn.calculateDist(spawn2);
            }
        }

    }

    public function getRandom():Spawn {
        var choose = MathLib.random(0,spawns.length - 1);
        trace ('index chosen $choose');
        return spawns[choose];
    }

    public function new() {

    }

}