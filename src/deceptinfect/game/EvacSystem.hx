package deceptinfect.game;

import deceptinfect.util.PrintTimer;
import deceptinfect.util.Util;
import gmod.net.NET_Server;
import deceptinfect.game.EvacZone.EvacState;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ents.Di_entities;
import deceptinfect.infection.InfectionSystem;
import deceptinfect.abilities.FormComponent;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;

typedef NetData_Evac = {
    state : INT_EvacState,
    time : Float
}

class EvacSystem extends System {

    static var evac_state = new NET_Server<"di_evac",NetData_Evac>();

    #if client
    override function init_client() {
        evac_state.signal.handle(changeEvacState);
    }

    function changeEvacState(x:NetData_Evac) {
        switch (x) {
            case {state: NOT_ACTIVE}:
                //stop showing hud
            case {state: ARRIVING, time : t}:
                //start showing hud
            case {state: LEAVING, time: t}:
                // Util.printTimer("BOOOGA",3, () -> trace('leaving!!..$t'));
                PrintTimer.print_time(3,() -> trace('leaving!!.. $t'));
                // Util.printTime(3,() -> trace('leaving!!..$t'));
            default:
                PrintTimer.print_time(5,() -> trace("Invalid state for hud...."));
                // Util.printTime(5,() -> trace("Invalid state for hud...."));
                // Util.printTimer("oogieboogie",5,() -> trace("Invalid state for hud..."));
        }
    }

    #end

    #if server
    var flaresSpawned = false;
    override function run_server() {
        for (ent in entities) {
            switch [ent.get(EvacZone),GameManager.state] {
            case [Comp(c_evac),PLAYING(_)]:
                if (InfectionSystem.averageInfection > 80 && !flaresSpawned) {
                    var flareSpawn = SpawnSystem.obj.getRandom();
                    flareSpawn.spawn(EntsLib.Create(Di_entities.di_flare));
                    var flareSpawn2 = flareSpawn.getRandomSpawns(1);
                    flareSpawn2[0].spawn(EntsLib.Create(Di_entities.di_flare));
                    flaresSpawned = true;
                }
                switch (c_evac.state) {
                case LEAVING(time):
                    time.value -= GameManager.diffTime;
                    if (time.value < 0) {
                        trace(c_evac.state);
                        checkWin(c_evac);
                        c_evac.state = NOT_ACTIVE;
                    }
                    for (id in c_evac.in_zone.keys()) {
                        switch (id.get(FormComponent)) {
                        case Comp(_.form => INFECTED):
                            c_evac.in_zone.remove(id);
                            c_evac.blocked.set(id,true);
                        default:
                        }
                    }
                    evac_state.broadcast(
                        {state : c_evac.state,
                        time : time
                        },true);

                case ARRIVING(time):
                    time.value -= GameManager.diffTime;
                    if (time.value < 0) {
                        trace(c_evac.state);
                        c_evac.state = LEAVING(c_evac.leavetime);
                    }
                    evac_state.broadcast(
                        {state : c_evac.state,
                        time : time
                        },true);

                default:
                }
            default:
            }


        }
    }

    public function checkWin(evac:EvacZone) {
        var humanEscape = false;
        for (id in evac.in_zone.keys()) {

            switch([id.get(InfectedComponent),id.get(PlayerComponent)]) {
            case [Comp(_),Comp(_)]:
                getSystem(WinSystem).winTrig.trigger(WIN_INF);
                return;
            case [NONE,Comp(_)]:
                humanEscape = true;
            default:
            }

        }
        if (humanEscape) {
            getSystem(WinSystem).winTrig.trigger(WIN_HUMAN);
        } else {
            getSystem(WinSystem).winTrig.trigger(DRAW);
        }
    }

    public function touched(ent:DI_ID,evac:EvacZone) {
        switch(ent.get(PlayerComponent)) {
        case Comp(c_player):
            if (evac.blocked.exists(ent)) {return;}
            switch (evac.state) {
                case LEAVING(time):
                    if (!evac.touched.exists(ent) && time.value < evac.leavetime / 2) {
                        time.value = evac.leavetime / 2;
                    }
                default:
                }
                evac.touched.set(ent,true);
                evac.in_zone.set(ent,false);
                ent.add_component(new InEvacZone());
        default:
        }
    }

    public function addFlare(flare:DI_ID,evac:DI_ID) {
        switch [flare.get(FlareComponent),flare.get(GEntityComponent),evac.get(EvacZone)] {
        case [Comp(_),Comp(c_gent),Comp(c_evac)]:
            switch (c_evac.state) {
            case NOT_ACTIVE:
                c_evac.state = ARRIVING(c_evac.arrivetime);
                c_gent.entity.Remove();
            default:
            }
        default:
        }
    }
    public function leave(ent:DI_ID,evac:EvacZone) {
        switch (ent.get(PlayerComponent)) {
        case Comp(_):
            evac.in_zone.remove(ent);
            ent.remove_component(InEvacZone);
        default:
        }
    }
    #end
}

enum abstract INT_EvacState(Int) from Int to Int {
    var NOT_ACTIVE;
    var ARRIVING;
    var LEAVING;

    @:from
    public static function from(x:EvacState):INT_EvacState {
        return switch (x) {
            case EvacState.NOT_ACTIVE:
                NOT_ACTIVE;
            case EvacState.ARRIVING(_):
                ARRIVING;
            case EvacState.LEAVING(_):
                LEAVING;

        }
    }


}
