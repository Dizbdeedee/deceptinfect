package deceptinfect.radiation;

import deceptinfect.ecswip.LinkedComponents;
import deceptinfect.ecswip.LinkedEntities;
import haxe.ds.ArraySort;
import deceptinfect.macros.IterateEnt;
import deceptinfect.macros.IterateEnt;
import deceptinfect.util.Util;
import deceptinfect.radiation.RadiationTypes.RadTypes;
import haxe.iterators.StringKeyValueIteratorUnicode;
import deceptinfect.ecswip.System;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.macros.ClassToID;
import gmod.helpers.PrintTimer;

using deceptinfect.DistSquared;
using gmod.helpers.LuaArray;
using deceptinfect.util.Mappy;

abstract class RadiationSystem extends System {}

class RadiationSystemDef extends System {
	#if server
	override function init_server() {
		// :(
		componentManager.getAddSignal(ClassToID.idc(RadiationAccepter))
			.handle((sig) -> {
				trace("yo??");
				IterateEnt.iterGet([RadiationProducer], [c_radProduce], function(radProduceEnt) {
					var c_radAffect = new RadiationAffecting();
					c_radAffect.accepter = sig.ent;
					c_radAffect.producer = radProduceEnt;
					trace('producer and accepter linked');
					final ent = componentManager.addEntity();
					ent.add_component(c_radAffect);
					ent.add_component(({
						comp1: c_radProduce,
						comp2: sig.comp
					} : LinkedComponents));
				});
			});
		componentManager.getAddSignal(ClassToID.idc(RadiationProducer))
			.handle((sig) -> {
				IterateEnt.iterGet([RadiationAccepter], [c_radAccept], function(radAcceptEnt) {
					var c_radAffect = new RadiationAffecting();
					c_radAffect.accepter = radAcceptEnt;
					c_radAffect.producer = sig.ent;
					trace('accepter and producer linked');
					final ent = componentManager.addEntity();
					ent.add_component(c_radAffect);
					ent.add_component(({
						comp1: c_radAccept,
						comp2: sig.comp
					} : LinkedComponents));
				});
			});
	}

	static final sortFunc = (x:Float, y:Float) -> if (x == y) 0; else if (x < y) -1; else 1;

	override function run_server() {
		var acceptersToProcess:Map<RadiationAccepter, Array<Float>> = [];
		var accepters = 0;
		var radOverallTotal = .0;
		IterateEnt.iterGet([RadiationAffecting], [{accepter: acceptEnt, producer: produceEnt}]
			, function(radAffectEnt) {
				var acceptPos = acceptEnt.get_sure(VirtualPosition)
					.pos;
				var producePos = produceEnt.get_sure(VirtualPosition)
					.pos;
				var dist = producePos.distSq(acceptPos);
				final rads = getTotalRadiation(dist, produceEnt.get_sure(RadiationProducer));
				if (rads < 0)
					continue;
				var c_radAccept = acceptEnt.get_sure(RadiationAccepter);
				var addToAcceptersArr = acceptersToProcess.getOrDefArr(c_radAccept);
				addToAcceptersArr.push(rads);
				acceptersToProcess.set(c_radAccept, addToAcceptersArr);
		});
		for (c_radAccept => radArr in acceptersToProcess) {
			radArr.sort(sortFunc);
			var total = .0;
			for (i in 0...radArr.length) {
				total = total + radArr[i] * Math.pow(c_radAccept.diminish, i);
			}
			c_radAccept.rate = total;
			radOverallTotal += total;
			accepters++;
		}
		PrintTimer.print_time(1, () -> {
			trace(radOverallTotal);
			trace(accepters);
		});
	}
	#end

	static function getTotalRadiation(dist:DistSquared, rad:RadiationProducer):Float {
		return if (dist < rad.radius) {
			(rad.maxrate) * ((rad.radius - dist) / rad.radius);
		} else {
			-1;
		}
	}
}

abstract RadiationID(Int) to Int from Int {
	public extern inline function new() {
		this = 0;
	}
}

abstract RadiationType(Int) to Int from Int {}
