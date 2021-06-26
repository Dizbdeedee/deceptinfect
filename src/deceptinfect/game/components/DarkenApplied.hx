package deceptinfect.game.components;

class DarkenApplied extends Component {
    #if client
    var darkApplied = false;

    var materialsSet:Array<PreviousMaterial> = [];
    #end
}