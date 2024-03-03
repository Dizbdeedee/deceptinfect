import deceptinfect.infection.DoomedSystem;
import deceptinfect.infection.InfectionPointsSystem;
import deceptinfect.game.BatteryInfoSystem;
import deceptinfect.game.DarkenSystem;
import deceptinfect.game.RunUntilDoneSystem;
import deceptinfect.game.GameInProgressSystem;
import deceptinfect.game.ClientTranslateSystem;
import deceptinfect.items.ScannerSystem;
import deceptinfect.radiation.ContaminationSystem;
import deceptinfect.game.EvacSystem;
import deceptinfect.game.NestSystem;
import deceptinfect.statuses.Walkthroughable.WalkthroughSystem;
import deceptinfect.game.WinSystem;
import deceptinfect.game.BatterySystem;
import deceptinfect.game.RagdollSystem;
import deceptinfect.Spread;
import deceptinfect.radiation.RadiationSystem;
import deceptinfect.infection.InfectionSystem;
import deceptinfect.game.SpawnSystem;
import deceptinfect.game.CRTSystem;
import haxe.ds.ObjectMap;
import deceptinfect.client.GeigerSystem;
import deceptinfect.game.SlowMotionSystem;
import deceptinfect.infection.InfectionLookSystem;
import deceptinfect.radiation.RadSourceSystem;
import deceptinfect.game.LowHealthSystem;
import deceptinfect.game.GameSystem;
import deceptinfect.items.ScannerSystem;
import deceptinfect.WeaponSystem;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.SystemManager;
import deceptinfect.ecswip.System;
import deceptinfect.grab.SearchSystem;
import deceptinfect.abilities.FormSystem;
#if client
import deceptinfect.client.Hud;
#end
import deceptinfect.infection.doom.DoomedSystem2;
import deceptinfect.infection.doom.ActiveDoomSystem;
import deceptinfect.infection.doom.ActiveDoomClientSystem;

function initSystemsArr():Array<Class<Dynamic>> {
	return [
		ClientTranslateSystem,
		GameInProgressSystem,
		deceptinfect.game.BatteryInfoSystem,
		GameSystem,
		RunUntilDoneSystem,
		InfectionSystem,
		GeigerSystem,
		// RadiationSystem,
		// GrabSystem,
		WinSystem,
		BatterySystem,
		SpawnSystem,
		// WalkthroughSystem, //needs a rework anyway
		// NestSystem,
		SearchSystem,
		EvacSystem,
		RagdollSystem,
		SlowMotionSystem,
		InfectionLookSystem,
		Spread,
		RadSourceSystem,

		// LowHealthSystem,
		// ScannerSystem,
		DarkenSystem,
		CRTSystem,
		#if client
		Hud,
		#end
		deceptinfect.infection.doom.DoomedSystem2,
		deceptinfect.infection.doom.ActiveDoomSystem,
		deceptinfect.infection.doom.ActiveDoomClientSystem // InfectionPointsSystem,

		// DoomedSystem,
		// WeaponSystem
		// DummySystem,
		// DoomedSystem
	];
}

function runSystemsArr():Array<Class<Dynamic>> {
	return [
		GameSystem,
		GameInProgressSystem,
		RunUntilDoneSystem,
		InfectionSystem,
		GeigerSystem,
		// RadiationSystem,
		// GrabSystem,
		WinSystem,
		BatterySystem,
		SpawnSystem,
		// WalkthroughSystem,
		// NestSystem,
		SearchSystem,
		EvacSystem,
		RagdollSystem,
		SlowMotionSystem,
		// Spread,
		InfectionLookSystem,
		Spread,
		// ContaminationSystem, // Problem!
		RadSourceSystem,
		// LowHealthSystem,
		// ScannerSystem,
		DarkenSystem,
		CRTSystem,
		#if client
		Hud,
		#end
		deceptinfect.infection.doom.DoomedSystem2,
		deceptinfect.infection.doom.ActiveDoomSystem,
		deceptinfect.infection.doom.ActiveDoomClientSystem,
		deceptinfect.game.BatteryInfoSystem,
		// InfectionPointsSystem,
		// DoomedSystem,
		// WeaponSystem,
		// DummySystem,
		ClientTranslateSystem
	];
}

function makeSystems(componentManager:ComponentManager, systemManager:SystemManager) {
	var map = new haxe.ds.ObjectMap<Class<Dynamic>, System>();
	map.set(GameSystem, new GameSystemDef(componentManager, systemManager));
	map.set(GameInProgressSystem, new GameInProgressSystem(componentManager, systemManager));
	map.set(RunUntilDoneSystem, new RunUntilDoneSystem(componentManager, systemManager));
	map.set(InfectionSystem, new InfectionSystem(componentManager, systemManager));
	map.set(WinSystem, new WinSystem(componentManager, systemManager));
	map.set(InfectionLookSystem, new InfectionLookSystem(componentManager, systemManager));
	map.set(SpawnSystem, new SpawnSystemDef(componentManager, systemManager));
	map.set(EvacSystem, new EvacSystem(componentManager, systemManager));
	#if client
	map.set(Hud, new Hud(componentManager, systemManager));
	#end
	map.set(Spread, new Spread(componentManager, systemManager));
	map.set(FormSystem, new FormSystem(componentManager, systemManager));
	map.set(GeigerSystem, new GeigerSystem(componentManager, systemManager));
	map.set(RagdollSystem, new RagdollSystem(componentManager, systemManager));
	map.set(SlowMotionSystem, new SlowMotionSystemDef(componentManager, systemManager));
	map.set(RadSourceSystem, new RadSourceSystem(componentManager, systemManager));
	map.set(CRTSystem, new CRTSystem(componentManager, systemManager));
	map.set(ClientTranslateSystem, new ClientTranslateSystem(componentManager, systemManager));
	map.set(InfectionPointsSystem, new InfectionPointsSystem(componentManager, systemManager));
	map.set(DoomedSystem, new DoomedSystem(componentManager, systemManager));
	map.set(RadiationSystem, new RadiationSystem(componentManager, systemManager));
	map.set(WeaponSystem, new WeaponSystem(componentManager, systemManager));
	map.set(BatteryInfoSystem, new BatteryInfoSystem(componentManager, systemManager));
	map.set(BatterySystem, new BatterySystem(componentManager, systemManager));
	map.set(DarkenSystem, new DarkenSystem(componentManager, systemManager));
	map.set(SearchSystem, new SearchSystemDef(componentManager, systemManager));
	map.set(DoomedSystem2, new DoomedSystemDef(componentManager, systemManager));
	map.set(ActiveDoomSystem, new ActiveDoomSystemDef(componentManager, systemManager));
	map.set(ActiveDoomClientSystem,
		new ActiveDoomClientSystemDef(componentManager, systemManager));
	return map;
}
