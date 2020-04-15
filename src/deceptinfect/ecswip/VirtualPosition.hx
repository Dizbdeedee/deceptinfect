package deceptinfect.ecswip;

class VirtualPosition extends Component {
    @:isVar
    public var pos(get,set):Vector;
    @:isVar
    public var ang(get,set):Angle;
    @:noCompletion
    public var ent(default,null):Null<Entity>;

    @:noCompletion
    public function get_pos() {
        if (ent == null) {
            return pos;
        } else {
            return ent.GetPos();
        }
    }
    @:noCompletion
    public function get_ang() {
        if (ent == null) {
            return ang;
        } else {
            return ent.GetAngles();
        }
    }
    @:noCompletion
    public function set_pos(set:Vector):Vector {
        if (ent == null) {
            return pos = set;
        } else {
            ent.SetPos(set);
            return set;
        }
    }
    @:noCompletion
    public function set_ang(set:Angle):Angle {
        if (ent == null) {
            return ang = set;
        } else {
            ent.SetAngles(set);
            return set;
        }
    }
    public function new(choice:ChooseVirPos) {
        super();
        switch (choice) {
            case ENT(x):
                ent = x;
            case REAL(vec, ang):
                pos = vec;
                this.ang = ang;
        } 
    }
}

enum ChooseVirPos {
    ENT(x:Entity);
    REAL(vec:Vector,ang:Angle);
}