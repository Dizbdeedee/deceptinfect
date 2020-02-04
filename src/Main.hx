
import deceptinfect.ecswip.Component;
import deceptinfect.ecswip.ComponentManager;
import lua.Lua;
#if server
import gmod.engine_ents.Prop_thumper.Prop_thumperdustscaleChoices;
#end
import gmod.types.Vector;
import gmod.libs.MathLib.MathLibFrexpReturn;
import gmod.gclass.*;
import gmod.hooks.*;
import gmod.libs.*;
import gmod.panels.*;
import gmod.sent.*;
import gmod.engine_ents.*;
import gmod.HaxeMultiReturn;
// import gmod.hooks.Gm.GmPlayerCanHearPlayersVoiceHaxeReturn;
import gmod.EntityClass;
import gmod.Networking;
#if client
// import gmod.PanelInterface.PanelTest;
#end
import deceptinfect.*;
// import deceptinfect.CustomEnt;

class Main {
    public static function main() {
        DeceptInfect.initaliseGamemode();
        deceptinfect.Networking.initMessages();
        #if client
        // var b:PanelHelper_DTree;
        
        
        
        #end
        var b:Player = null;
        b.GetName();
    }
    #if server
    @:expose("testComponents")
    static function testComponents() {
        // var cmp:DI_Entity = cast PlayerLib.GetByID(1);
        // ComponentManager.addEnt(cmp);
        // cmp.components.addComponent(MyFirstComponent,new MyFirstComponent());
        // cmp.components.addComponent(MyOtherComponent, new MyOtherComponent());
    }

    @:expose("makeThump")
    static function makeThump() {
        // var zombie = new Npc_zombie();
        // zombie.SetName("zombee");
        // zombie.Spawn();
        // var sensor = new Point_proximity_sensor();
        // sensor.target = "zombee";
        // sensor.targetname = "zombee";
        // sensor.Spawn();
        // zombie.OutputOnUser1(onThumped);
        // zombie.OutputOnFoundEnemy(onThumped);
        // sensor.OutputDistance(onThumped);
        // sensor.Fire("FireUser1","0.1",0);
        // sensor.OutputDistance(onThumped);
        // var thumper = new Prop_thumper();
        // thumper.SetPos(new Vector(100,100,100));
        // thumper.Spawn();
        // thumper.FireEnable(0);
        // thumper.SetName("big_thump");
        // thumper.Activate();
        // trace(thumper.targetname);
        // thumper.dustscale = Prop_thumperdustscaleChoices.LARGE_THUMPER;
        // trace(thumper.dustscale);
        // thumper.OutputOnThumped(onThumped);
        
        // thumper.OutputOnUser1(onThumped);
        // thumper.FireFireUser1(0);
        // try {
        //     throw "No!!";
        // } catch (e:Dynamic) {
        //     trace(e);
        // }
    }

    static function onThumped(data:{activator:Npc_zombie,data:String}) {
        trace("THUMPED!");
        Lua.print(data.activator);

    }
    #end

}

