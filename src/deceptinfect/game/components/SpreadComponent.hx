package deceptinfect.game.components;


@:structInit
class SpreadComponent extends Component {
    #if server
    var initial:CNavArea;

    var markedMap:Map<Int,Bool> = [];

	var marked:Array<CNavArea> = [];

	var endpoints:Array<CNavArea> = [];

	var mapSize:Float;

    var percent:Float;
    #end
}