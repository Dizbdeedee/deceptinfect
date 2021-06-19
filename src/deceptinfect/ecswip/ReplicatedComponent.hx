package deceptinfect.ecswip;

class ReplicatedComponent extends Component implements hxbit.Serializable {

    var replicated:ReplicatedTarget = NONE;

    // public function setReplicated(x:ReplicatedTarget) {

    // }

}

enum ReplicatedTarget {
    NONE;
    SOME(target:ReplicateTargets);
    ALL;
}

enum ReplicateTargets {
    PVS;
    PLAYERS(arr:Array<Player>);
    INFECTED;
}