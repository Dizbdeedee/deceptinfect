package deceptinfect.game;

import deceptinfect.ents.Di_entities;
import deceptinfect.infection.InfectionSystem;
import deceptinfect.abilities.FormComponent;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;

class EvacSystem extends System {

    #if server
    var flaresSpawned = false;
    override function run_server() {
        for (ent in entities) {
            switch [ent.get(EvacZone),GameManager.state] {
            case [Comp(c_evac),PLAYING(_)]:
                if (InfectionSystem.averageInfection > 80 && !flaresSpawned) {
                    var flareSpawn = getSystem(SpawnSystem).obj.getRandom();
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
                case ARRIVING(time):
                    time.value -= GameManager.diffTime;
                    if (time.value < 0) {
                        trace(c_evac.state);
                        c_evac.state = LEAVING(c_evac.leavetime);
                    }
                
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
        switch [flare.get(FlareComponent),evac.get(EvacZone)] {
        case [Comp(_),Comp(c_evac)]:
            c_evac.state = ARRIVING(c_evac.arrivetime);
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