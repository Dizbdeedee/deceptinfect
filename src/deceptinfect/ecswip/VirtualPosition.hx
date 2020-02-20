package deceptinfect.ecswip;

class VirtualPosition extends Component {
    @:isVar
    public var pos(get,set):Vector;
    @:isVar
    public var ang(get,set):Angle;
    public var ent(default,null):Null<Entity>;
    public function get_pos() {
        if (ent == null) {
            return pos;
        } else {
            return ent.GetPos();
        }
    }

    public function get_ang() {
        if (ent == null) {
            return ang;
        } else {
            return ent.GetAngles();
        }
    }

    public function set_pos(set:Vector):Vector {
        if (ent == null) {
            return pos = set;
        } else {
            ent.SetPos(set);
            return set;
        }
    }

    public function set_ang(set:Angle):Angle {
        if (ent == null) {
            return ang = set;
        } else {
            ent.SetAngles(set);
            return set;
        }
    }
    public function new(?_ent:Entity,?_pos:Vector,?_ang:Angle) {
        super();
        if (_ent == null) {
            pos = _pos;
            ang = _ang;
        } else if (_pos == null) {
            ent = _ent;
        }
    }
}