package deceptinfect.ecswip;

import deceptinfect.infection.InfectionPointsSystem;
import deceptinfect.game.BatteryInfoSystem;
import deceptinfect.game.DarkenSystem;
import deceptinfect.game.RunUntilDoneSystem;
import deceptinfect.game.GameInProgressSystem;
import deceptinfect.game.ClientTranslateSystem;
import deceptinfect.game.ItemOwnerSystem;
import deceptinfect.items.ScannerSystem;
import deceptinfect.radiation.ContaminationSystem;
// import deceptinfect.radiation.ContaminationSystem;
import deceptinfect.game.EvacSystem;
import deceptinfect.game.NestSystem;
import deceptinfect.statuses.Walkthroughable.WalkthroughSystem;
import deceptinfect.game.WinSystem;
import deceptinfect.game.BatterySystem;
import deceptinfect.game.RagdollSystem;
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


class SystemManager {
	static var getSystems(default, never):ObjectMap<Class<Dynamic>, System> = new ObjectMap();

	public static var runSystems(default, null):Array<Class<Dynamic>> = [
		
		GameSystem, GameInProgressSystem, RunUntilDoneSystem, InfectionSystem, GeigerSystem, 
		RadiationSystem, 
		GrabSystem, HiddenHealthSystem, WinSystem, BatterySystem, SpawnSystem, WalkthroughSystem, NestSystem,
		EvacSystem, RagdollSystem, SlowMotionSystem,Spread, InfectionLookSystem, 
		ContaminationSystem, // Problem!
		RadSourceSystem, LowHealthSystem, ScannerSystem,DarkenSystem,
		CRTSystem,
		deceptinfect.game.BatteryInfoSystem,
		InfectionPointsSystem,
		WeaponSystem, ItemOwnerSystem,DummySystem,
		ClientTranslateSystem	
	];

	public static var initSystems(default, null):Array<Class<Dynamic>> = [
		ClientTranslateSystem, GameInProgressSystem,deceptinfect.game.BatteryInfoSystem,GameSystem, RunUntilDoneSystem, InfectionSystem, GeigerSystem, 
		
		RadiationSystem, 
		GrabSystem, HiddenHealthSystem, WinSystem, BatterySystem, SpawnSystem, WalkthroughSystem, NestSystem,
		EvacSystem, RagdollSystem, SlowMotionSystem,Spread, InfectionLookSystem, 
		ContaminationSystem, // Problem!
		RadSourceSystem, LowHealthSystem, ScannerSystem,DarkenSystem,
		CRTSystem,
		InfectionPointsSystem,
		WeaponSystem, ItemOwnerSystem,DummySystem
	];

	static function make() {
		getSystems.set(RunUntilDoneSystem, new RunUntilDoneSystem());
		getSystems.set(GameSystem, new GameSystem());
		getSystems.set(GameInProgressSystem, new GameInProgressSystem());
		getSystems.set(InfectionSystem, new InfectionSystem());
		getSystems.set(GeigerSystem, new GeigerSystem());
		getSystems.set(RadiationSystem, new RadiationSystem());
		getSystems.set(GrabSystem, new GrabSystem());
		getSystems.set(HiddenHealthSystem, new HiddenHealthSystem());
		getSystems.set(WinSystem, new WinSystem());
		getSystems.set(BatterySystem, new BatterySystem());
		getSystems.set(SpawnSystem, new SpawnSystem());
		getSystems.set(WalkthroughSystem, new WalkthroughSystem());
		getSystems.set(NestSystem, new NestSystem());
		getSystems.set(EvacSystem, new EvacSystem());
		getSystems.set(RagdollSystem, new RagdollSystem());
		getSystems.set(SlowMotionSystem, new SlowMotionSystem());
		getSystems.set(InfectionLookSystem, new InfectionLookSystem());
		getSystems.set(ContaminationSystem, new ContaminationSystem());
		getSystems.set(RadSourceSystem, new RadSourceSystem());
		getSystems.set(LowHealthSystem, new LowHealthSystem());
		getSystems.set(ScannerSystem, new ScannerSystem());
		getSystems.set(WeaponSystem, new WeaponSystem());
		getSystems.set(ItemOwnerSystem, new ItemOwnerSystem());
		getSystems.set(DummySystem, new DummySystem());
		getSystems.set(Spread, new Spread());
		getSystems.set(ClientTranslateSystem,new ClientTranslateSystem());
		getSystems.set(DarkenSystem, new DarkenSystem());
		getSystems.set(CRTSystem, new CRTSystem());
		getSystems.set(deceptinfect.game.BatteryInfoSystem, new BatteryInfoSystem());
		getSystems.set(InfectionPointsSystem, new InfectionPointsSystem());
	}

	public static function getSystem<T:System>(cls:Class<T>):Null<T> {
		return cast getSystems.get(cls);
	}

	public static function getSystem2<T:System>(cls:Class<T>):Option<T> {
		final result = getSystems.get(cls);
		return if (getSystems.get(cls) == null) {
			None;
		} else {
			Some(cast result);
		}
	}

	@:expose("getSystem")
	@:noCompletion
	static function getSystemExp(name:String) {
		final result = getSystems.get(Type.resolveClass(name));
		return if (result == null) {
			throw 'Can\'t find $name';
		} else {
			result;
		}
	}

	static var profile:Profiler = new Profiler();

	public static function runAllSystems() {
		profile.profile("start", true);
		for (clsSystem in runSystems) {
			final name = Type.getClassName(clsSystem);
			profile.profile(name);
			getSystems.get(clsSystem).run();
		}
		profile.resetprofile();
		profile.report();
	}

	@:expose("systemReport")
	public static function beginReporting() {
		profile = new Profiler();
		profile.beginProfiling();
	}

	public static function initAllSystems() {
		make();
		for (clsSystem in initSystems) {
			getSystems.get(clsSystem).init();
		}
	}

	public static function destroySystems() {
		getSystems.clear();
	}
}
