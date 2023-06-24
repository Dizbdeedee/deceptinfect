class TestBed {

    static var componentManager:ComponentManager;

    static var systemManager:SystemManager

    public static function set(_componentManager:ComponentManager,_systemManager:SystemManager) {
        componentManager = _componentManager;
        systemManager = _systemManager;
    }

    @:expose("testRadiation")
    static function testRadiation(vec:Vector) {
        var radSourceSystem = systemManager.get(RadSourceSystem);
        var ent = componentManager.addEntity();
        ent.add_component(new VirtualPosition(REAL(vec, new Angle(0, 0, 0))));
        ent.add_component(radSourceSystem.createFromType(RadTypes.NEST,ent));
    }



}