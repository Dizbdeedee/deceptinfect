package gmod;



enum abstract PanelClass<T:Panel>(String) from String to String {
    

    public inline function new(name:String) {
        this = name;
    }
}
