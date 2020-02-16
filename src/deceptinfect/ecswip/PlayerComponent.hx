package deceptinfect.ecswip;

/**
    Misc, one off bits of data that can only ever belong to players anyway
**/
class PlayerComponent extends Component {
    /**

    **/
    public var spec_next = 1;

    public var roundModel:String = "";

    public var deathTime:Float = 0;

    public var playing:Bool = true;

    public var player:Player;

    public function new(x:Player) {
        super();
        player = x;
    }



    
}