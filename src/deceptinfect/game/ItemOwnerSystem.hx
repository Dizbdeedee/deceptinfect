package deceptinfect.game;

import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ecswip.PlayerComponent;
import gmod.stringtypes.Hook.GMHook;
import deceptinfect.game.components.ItemOwner;
import deceptinfect.game.components.*;
import deceptinfect.game.ClientTranslateSystem;
import deceptinfect.ecswip.VirtualPosition;

using deceptinfect.DistSquared;

// typedef Net_ItemReveal = {
// 	// itemType ect.
// 	id:ServerID,
// 	pos:Vector,
// 	model:String
// }

class ItemOwnerSystem extends System {
	// public static final net_itemReveal = new gmod.helpers.net.NET_Server<"di_itemreveal", Net_ItemReveal>();

	#if client
	override function init_client() {
		HookLib.Add(GMHook.PreDrawHalos, "di_drawitemhalos", drawHalos);
		// deceptinfect.game.components.ItemReveal.proxyInit();
	}

	function drawHalos() {
		final table = lua.Table.create();
		var x = 0;

	}

	#end
	#if server
	override function run_server() {

	}

	function revealer(item:DI_ID) { // itemPos:Vector,ownerPos:Vector,c_itemOwner:ItemOwner,id:DI_ID
		// final c_itemOwner = item.getRetInd(ItemOwner);
		// final itemPos:Vector = item.getRet(VirtualPosition,{pos : itemPos},itemPos);
		// final owner:DI_ID = c_itemOwner.owner;
		// final ownerPos = owner.getRet(VirtualPosition,{pos : ownerPos},ownerPos);
		// final itemEnt = item.getRet(GEntityComponent,{entity : ent},ent);
		// final ownerPlayer = owner.getRet(PlayerComponent,{player : ply},ply);
		// final realDist = itemPos.distSq(ownerPos);
		// c_itemOwner.itemRevealState = switch (c_itemOwner.itemRevealState) {
		//     case revealState = NOT_REVEALED(STAGE(startTime,startDist,nextStage = STAGE(nextTime,nextDist,_) | FINAL(nextTime,nextDist))):

		// 	final curTime = Gmod.CurTime() - c_itemOwner.initalSpawnTime;
		// 	final targetDist = MathLib.Remap(curTime,startTime,nextTime,startDist,nextDist);

		// 	if (realDist < targetDist) {
		// 	    trace("based");
		// 	    final itemreveal = owner.add_component(new ItemReveal(itemPos,itemEnt.GetModel()));
		// 	    itemreveal.recipients = [ownerPlayer];
		// 	    REVEALED(VISIBLE(realDist));
		// 	} else if (curTime > nextTime) {
		// 	    trace("cringe");
		// 	    trace(nextStage);
		// 	    NOT_REVEALED(nextStage);
		// 	} else {
		// 	    revealState;
		// 	}
		//     case NOT_REVEALED(FINAL(_,targetDist)) if (realDist < targetDist):
		// 	final itemreveal = owner.add_component(new ItemReveal(itemPos,itemEnt.GetModel()));
		// 	itemreveal.recipients = [ownerPlayer];
		// 	REVEALED(VISIBLE(realDist));
		//     case REVEALED(VISIBLE(targetDist)) if (targetDist > realDist):
		// 	REVEALED(HIDDEN(targetDist));

		//     case REVEALED(HIDDEN(targetDist)) if (targetDist < realDist):

		// 	REVEALED(VISIBLE(targetDist));
		//     case revealState:
		// 	revealState;
		// }
		// switch (owner.get(ItemReveal)) {
		//     case Comp(c_itemreveal):
		// 	c_itemreveal.proxySend();
		//     default:
		// }
	}
	#end
}
