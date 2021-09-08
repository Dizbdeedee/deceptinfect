package deceptinfect.game.components;

import deceptinfect.game.components.Darken.PreviousMaterial;

class DarkenApplied extends Component {
    #if client
    var darkApplied = false;

    var materialsSet:Array<PreviousMaterial> = [];
    #end
}