package deceptinfect.infection;

import deceptinfect.ecswip.ClientRepresentationTarget;
import deceptinfect.infection.components.InfectionLookData;
import deceptinfect.game.GameSystem;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.infection.components.InfectionLookTime;
import deceptinfect.macros.IterateEnt;
import deceptinfect.GEntCompat.GPlayerCompat;
import gmod.gclass.Entity.EntityGetHitBoxBoundsReturn;
import deceptinfect.ecswip.PlayerComponent;

typedef ND_InfInfo = {
	target:Entity,
	?inf:Float,
	isinfected:Bool
}

class InfectionLookSystem extends System {
	static var infectioninfo = new gmod.helpers.net.NET_Server<"di_infinfo", ND_InfInfo>();

	#if server

	override function init_server() {
		InfectionLookInfoAbility.getAddSignal().map((data) -> data.ent)
		.filter((id) -> id.has_comp(PlayerComponent)).join(
			PlayerComponent.getAddSignal().map((data) -> data.ent)
		.filter((id) -> id.has_comp(InfectionLookInfoAbility))).handle(
			function (lookerEnt) {
				final lookerPlayer = lookerEnt.get_2(PlayerComponent).player;
				IterateEnt.iterGet([InfectionComponent,PlayerComponent],[_,_],
				function (victimEnt) {
					if (lookerEnt == victimEnt) continue;
					final linkEnt = ComponentManager.addEntity();
					linkEnt.add_component(({
						looker : lookerEnt,
						victim : victimEnt,
						time : 0
					} : InfectionLookTime));
					final crtEnt = ComponentManager.addEntity();
					final infLookData = new InfectionLookData();
					infLookData.fieldsChanged = false;
					final crt = new ClientRepresentationTarget(SOME(PLAYERS([lookerPlayer])),victimEnt);
					crtEnt.add_component(infLookData);
					crtEnt.add_component(crt);
					trace('Added from looker');
				});
			});
		InfectionComponent.getAddSignal().map((data) -> data.ent)
		.filter((id) -> id.has_comp(PlayerComponent)).join(
		PlayerComponent.getAddSignal().map((data) -> data.ent)
		.filter((id) -> id.has_comp(InfectionComponent))).handle((victimEnt) -> {
			IterateEnt.iterGet([InfectionLookInfoAbility,PlayerComponent],[_,{player : lookerPlayer}],
			function (lookerEnt) {
				if (lookerEnt == victimEnt) continue;
				final linkEnt = ComponentManager.addEntity();
				linkEnt.add_component(({
					looker: lookerEnt,
					victim: victimEnt,
					time: 0
				} : InfectionLookTime));
				final ent = ComponentManager.addEntity();
				final infLookdata = new InfectionLookData();
				infLookdata.fieldsChanged = false;
				final crt = new ClientRepresentationTarget(SOME(PLAYERS([lookerPlayer])),victimEnt);
				ent.add_component(infLookdata);
				ent.add_component(crt);
				trace("Added from victim");
			});
		});
	}

	override function run_server() {
		IterateEnt.iterGet([InfectionLookTime],[c_infLookTime = {looker : looker, victim : victim}],
		function () {
			looker.hasExpr([PlayerComponent,InfectionLookInfoAbility],[{player : infLookPlayer},{threshold : infAbilityThreshold}],
			function () {
				final hitEnt = infLookPlayer.GetEyeTrace().Entity;
				victim.hasExpr([GEntityComponent,InfectionComponent],[{entity : victimGEnt}, {infection : victimInfection}],function () {
					if (victimGEnt == hitEnt) {
						c_infLookTime.time += GameSystem.get().getGameManager().diffTime;
					} else {
						c_infLookTime.time -= GameSystem.get().getGameManager().diffTime;
					}
					if (c_infLookTime.time < 0) {
						c_infLookTime.time = 0;
					}
					// trace(c_infLookTime.time);
					if (c_infLookTime.time > infAbilityThreshold) {
						IterateEnt.iterGet([InfectionLookData,ClientRepresentationTarget],[c_infLookData,{target : crt}],function () {
							if (victim != crt) continue;
							trace("updating");
							c_infLookData.infection = victimInfection;
						});
					} else {
						IterateEnt.iterGet([InfectionLookData,ClientRepresentationTarget],[c_infLookData,{target : crt}],function () {
							if (victim != crt) continue;
						});
					}
				});
			});
		});
	}
	#end
}

