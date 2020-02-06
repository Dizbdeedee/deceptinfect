package gmod.types;

import gmod.gclass.Panel as GPanel;

abstract Panel(GPanel) from GPanel to GPanel {

    @:from
    public static function fromHelper<T:PanelHelper<X>,X:Panel>(x:T):Panel {
        return x.self;
    }
}