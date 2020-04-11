package deceptinfect;



enum abstract MapNames(String) from String to String {
    var mor_temple_v1;
}

typedef SpawnTable = {
    items : Array<Vector>,
    objectives : Array<Vector>,
    nests : Array<Vector>,
    evacs : Array<MinMax>
}

typedef MinMax = {
    mins : Vector,
    maxs : Vector
}

class MapStorage {

    public static var spawns:Map<MapNames,SpawnTable> = [
        mor_temple_v1 => {
        items : [
            new Vector(-20.135118, 293.638184, 62.682350),
            new Vector(214.035873, 252.134552, 46.033661)

        ],
        objectives : [
            new Vector(45.967289, -942.858459, 64.031250),
        new Vector(-4.848439,-1728.742920,64.031250),
        new Vector(-481.968323, -1022.401917, 64.031250),
        new Vector(571.895020,-1031.322632,64.031250),
        new Vector(10.328067,-1039.059570,64.031250)
        ],
        evacs : [
            {mins : new Vector(-64.220894, -989.030090, 60.787186),
            maxs : new Vector(111.524712, -1094.413208, 110.729080)}
        ],
        nests : [
            new Vector(29.061092,1006.951233,93.697433),
            // new Vector(-4.253020,1452.940063,64.031250)
        ]
        }];

}