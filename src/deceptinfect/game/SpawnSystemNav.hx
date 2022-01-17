package deceptinfect.game;

import haxe.ds.GenericStack;

using Lambda;
using deceptinfect.util.ArrayTools;
using deceptinfect.DistSquared;

import deceptinfect.GEntCompat;

class SpawnSystemNav extends System {
	#if server
	public static var areasCovered:Map<Int, Bool> = [];

	static var distanceMin:DistSquared = 500.safeSquare();

	static var distMinOthers:DistSquared = 250.safeSquare();

	static var playerPos:Vector;

	static var result:Array<CNavArea> = [];

	@:expose("spawnItem")
	public static function spawnItem(x:GPlayerCompat) {
		final navmesh = NavmeshLib.GetNearestNavArea(x.GetPos(), null, null, true);
		final processing:GenericStack<CNavArea> = new GenericStack<CNavArea>();
		if (Gmod.IsValid(navmesh)) {
			playerPos = x.GetPos();
			navmesh.GetAdjacentAreas().iter(processing.add);
			while (!processing.isEmpty()) {
				final nav = processing.pop();
				if (filterAreas(nav)) {
					if (filterAreaResults(nav)) {
						result.push(nav);
					}
					nav.GetAdjacentAreas().iter(processing.add);
				}
			}

			if (result.length == 0)
				throw "bad";
			final point = result.getRandom().GetRandomPoint();

			final ent:GEntCompat = EntsLib.Create("di_battery");

			final bounds = ent.GetCollisionBounds();
			final traceResult = UtilLib.TraceHull({
				ignoreworld: false,
				start: point + new Vector(0, 0, 50),
				endpos: point + new Vector(0, 0, 49),
				mins: bounds.mins,
				maxs: bounds.maxs
			});
			if (traceResult.Hit) {
				trace("failed");
			} else {
				ent.SetPos(point + new Vector(0, 0, 50));
				ent.Spawn();
				// final c_itemOwner = new ItemOwner(Gmod.CurTime(), x.id);
				// trace(x.id);
				// ent.id.add_component(c_itemOwner);
				// trace("success!");
				// DebugoverlayLib.Cross(ent.GetPos(),10,30,null,true);
				// DebugoverlayLib.Box(ent.GetPos(),bounds.mins,bounds.maxs,30);
			}
		}
	}

	static function filterAreas(nav:CNavArea):Bool {
		return if (areasCovered.exists(nav.GetID())) {
			false;
		} else {
			areasCovered.set(nav.GetID(), true);
			true;
		}
	}

	static function filterAreaResults(nav:CNavArea) {
		return nav.GetCorner(NORTH_EAST).distSq(playerPos) > distanceMin;
	}
	#end
}
