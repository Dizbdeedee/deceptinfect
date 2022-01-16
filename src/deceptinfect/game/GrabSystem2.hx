package deceptinfect.game;


class GrabSystem2 extends System {


    override function init_server() {
        // HookLib.Add(GMHook.EntityTakeDamage, "grabDamage", grabDamage);
        GrabAccepter2.getAddSignal().handle((data) -> {
            IterateEnt.iterGet([GrabProducer2],[_],
            function (entProduce) {
                final linkEnt = ComponentManager.addEntity();
                linkEnt.add_component(new Grab)
            });
        });

    }


}