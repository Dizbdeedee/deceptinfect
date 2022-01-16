package deceptinfect.radiation;

import deceptinfect.ecswip.LinkedComponents;
import deceptinfect.ecswip.LinkedEntities;
import haxe.ds.ArraySort;
import deceptinfect.macros.IterateEnt;
import deceptinfect.macros.IterateEnt;

using deceptinfect.DistSquared;

import deceptinfect.util.Util;
import deceptinfect.radiation.RadiationTypes.RadTypes;
import haxe.iterators.StringKeyValueIteratorUnicode;
import deceptinfect.ecswip.System;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.GEntityComponent;
using gmod.helpers.LuaArray;


class RadiationSystem extends System {

	#if server

	override function init_server() {
		trace(RadiationAccepter.getAddSignal());
		RadiationAccepter.getAddSignal().handle((sig) -> {
			trace("yo??");
			IterateEnt.iterGet([RadiationProducer],[c_radProduce],
			function (radProduceEnt) {
				var c_radAffect = new RadiationAffecting();
				c_radAffect.accepter = sig.ent;
				c_radAffect.producer = radProduceEnt;
				trace('producer and accepter linked');
				final ent = ComponentManager.addEntity();
				ent.add_component(c_radAffect);
				ent.add_component(({
					comp1: c_radProduce,
					comp2: sig.comp
				} : LinkedComponents));
			});
		});
		RadiationProducer.getAddSignal().handle((sig) -> {
			IterateEnt.iterGet([RadiationAccepter],[c_radAccept],
			function (radAcceptEnt) {
				var c_radAffect = new RadiationAffecting();
				c_radAffect.accepter = radAcceptEnt;
				c_radAffect.producer = sig.ent;
				trace('accepter and producer linked');
				final ent = ComponentManager.addEntity();
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
		IterateEnt.iterGet([RadiationAffecting],
		[c_radAffect = {accepter : accepter, producer : producer}],
		function() {
			var producePos = producer.get_sure(VirtualPosition).pos;  
			var acceptPos = accepter.get_sure(VirtualPosition).pos;
			var dist = producePos.Distance(acceptPos);
			switch getTotalRadiation(dist, producer.get_sure(RadiationProducer)) {
				case Some(rate):
					c_radAffect.value = rate;
				default:
			}
		});
		IterateEnt.iterGet([RadiationAccepter],
		[c_radAccept],function (acceptEnt) {
			var sorted:Array<Float> = [];
			IterateEnt.iterGet([RadiationAffecting],
			[{accepter : accepter, value : val}],
			function () {
				if (accepter == acceptEnt) {
					sorted.push(val);
				}
			});
			sorted.sort(sortFunc);
			// trace(sorted);
			var total = .0;
			for (i in 0...sorted.length) {
				total = total + sorted[i] * Math.pow(c_radAccept.diminish, i);
			}
			c_radAccept.rate = total;
			
		});
		

	}

	#end

	@:expose("testRadiation")
	static function testRadiation(vec:Vector) {
		var ent = ComponentManager.addEntity();
		ent.add_component(new VirtualPosition(REAL(vec, new Angle(0, 0, 0))));
		// ent.add_component(RadiationProducer.createFromType(RadTypes.NEST));
	}

	static function getTotalRadiation(dist:DistSquared, rad:RadiationProducer):Option<Float> {
		if (dist < rad.radius) {
			return Some((rad.maxrate - 1) * ((rad.radius - dist) / rad.radius));
		} else {
			return None;
		}
	}

}

abstract RadiationID(Int) to Int from Int {
	public extern inline function new() {
		this = 0;
	}
}

abstract RadiationType(Int) to Int from Int {}
