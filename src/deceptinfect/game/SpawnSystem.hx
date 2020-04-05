package deceptinfect.game;



class SpawnSystem extends System {
    public var obj(default,never) = new SpawnPointTable();
    public var item(default,never)= new SpawnPointTable();

    #if server
    override function init_server() {
        generateSpawns();
    }
    #end
    
    public function generateSpawns() {
        obj.generateSpawns(MapStorage.spawns.get(GameLib.GetMap()).objectives);
        item.generateSpawns(MapStorage.spawns.get(GameLib.GetMap()).items);
    }

    
}

enum SpawnClaim {
    UNCLAIMED;
    CLAIMED(e:Entity);
}

class Spawn {

    final vec:Vector;
    final parent:SpawnPointTable;
    final id:SpawnID;
    var claimed:SpawnClaim = UNCLAIMED;
    var distStore:Map<SpawnID,Float> = [];
    var distOrder:Array<SpawnID> = [];
    var maxdistID:Int;
    var mindistID:Int;

    function getRandomFarAwaySpawn():Int {
        return MathLib.random(Math.floor(distOrder.length / 2),distOrder.length);
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
        var id = 0;
        for (dist in total) {
            if (dist > mindist) {
                luckydraw.push(id);
            }
            id++;
        }
        if (luckydraw.length == 0) {
            trace("Not enough spawns far away enough to use algo.");
            return get(getRandomFarAwaySpawn());
        } else {
            return get(luckydraw[MathLib.random(0,luckydraw.length)]);
        }

    }

    public function getRandomSpawns(noSpawns:Int):Array<Spawn> {
        var rtn:Array<Spawn> = [];
        var curspawns:Array<SpawnID> = [id];
        for (i in 0...noSpawns) {
            var newspawn = getRandomSpawnMinDistAway(curspawns);
            curspawns[i] = newspawn.id; 
            rtn[i] = newspawn;
        }
        return rtn;
    }

    public function spawn(ent:Entity) {
        claimed = CLAIMED(ent);
        ent.SetPos(vec);
        ent.Spawn();

             

    } 

    inline function get(x:SpawnID):Spawn {
        return parent.spawns[x];
    }

    public function calculateDist(other:Spawn) {
        var dist = vec.Distance(other.vec);
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
        var insert = distOrder.length;
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
private typedef SpawnID = Int;


class SpawnPointTable {

    public var spawns(default,null):Array<Spawn> = [];

    public function generateSpawns(points:Array<Vector>) {
        spawns = [];
        for (point in points) {
            spawns.push(new Spawn(this,point));
            trace(spawns[0]);
        }

        for (spawn in spawns) {
            for (spawn2 in spawns) {
                spawn.calculateDist(spawn2);
            }
        }
        trace(spawns);
    }

    public function getRandom():Spawn {
        return spawns[MathLib.random(0,spawns.length)];
    }

    public function new() {

    }

}