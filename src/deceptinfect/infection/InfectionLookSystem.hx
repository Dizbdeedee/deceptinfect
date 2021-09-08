package deceptinfect.infection;

import deceptinfect.ecswip.ReplicatedEntity;
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

	function createLinkEntities(lookerEnt:DI_ID,victimEnt:DI_ID,lookerPlayer:Player) {
		final linkEnt = ComponentManager.addEntity();
		linkEnt.add_component(({
			looker : lookerEnt,
			victim : victimEnt,
			time : 0
		} : InfectionLookTime));
		final crtEnt = ComponentManager.addEntity();
		final inflookData = new InfectionLookData();
		inflookData.fieldsChanged = false;
		crtEnt.add_component(inflookData);
		crtEnt.add_component(new ClientRepresentationTarget(SOME(PLAYERS([lookerPlayer])),victimEnt));
		crtEnt.add_component(new ReplicatedEntity());
		
		trace(crtEnt);
	}

	override function init_server() {
		
		
		IterateEnt.onAdd([InfectionLookInfoAbility,PlayerComponent],[_,{player : lookerPlayer}],
		function (lookerEnt) {
			IterateEnt.iterGet([InfectionComponent,PlayerComponent],[_,_],
			function (victimEnt) {
				if (lookerEnt == victimEnt) continue;
				createLinkEntities(lookerEnt,victimEnt,lookerPlayer);
				trace("Create linkEntities 1");
			});
		});
		IterateEnt.onAdd([InfectionComponent,PlayerComponent],[_,_],
		function (victimEnt) {
			IterateEnt.iterGet([InfectionLookInfoAbility,PlayerComponent],[_,{player : lookerPlayer}],
			function (lookerEnt) {
				if (lookerEnt == victimEnt) continue;
				trace(lookerEnt,victimEnt,lookerPlayer);
				createLinkEntities(lookerEnt,victimEnt,lookerPlayer);
				trace("Create linkEntities 2");
			});
		});
	}

	override function run_server() {
		IterateEnt.iterGet([InfectionLookTime],[c_infLookTime = {looker : looker, victim : victim}],
		function () {
			looker.hasExpr([PlayerComponent,InfectionLookInfoAbility],[{player : infLookPlayer},{threshold : infAbilityThreshold}],
			function () {
				final hitEnt = infLookPlayer.GetEyeTrace().Entity;
				victim.hasExpr([GEntityComponent,InfectionComponent],[{entity : victimGEnt}, {infection : victimInfection}],
				function () {
					if (victimGEnt == hitEnt) {
						c_infLookTime.time += GameSystem.get().getGameManager().diffTime;
					} else {
						c_infLookTime.time -= GameSystem.get().getGameManager().diffTime;
					}
					if (c_infLookTime.time < 0) {
						c_infLookTime.time = 0;
					}
					if (c_infLookTime.time > 2) {{
						c_infLookTime.time = 2;
					}}
					trace(c_infLookTime.time);
					if (c_infLookTime.time >= infAbilityThreshold) {
						IterateEnt.iterGet([InfectionLookData,ClientRepresentationTarget],[c_infLookData,c_crt = {target : crt}],
						function () {
							trace("Attempting to find...");
							if (victim != crt) continue;
							trace("Updating infection...");
							c_infLookData.infection = victimInfection;
						});
					} else {
						IterateEnt.iterGet([InfectionLookData,ClientRepresentationTarget],[c_infLookData,{target : crt}],
						function () {
							if (victim != crt) continue;
						});
					}
				});
			});
		});
	}
	#end
}

