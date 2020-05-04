package deceptinfect.infection;

class InfVunerability extends Component {

    public var vun:Float;

    public var removeTime:Float;
    
    public function new(v:Float,removeTime:Float) {
        super();
        vun = v;
        removeTime = GlobalLib.CurTime() + removeTime;
    }
}