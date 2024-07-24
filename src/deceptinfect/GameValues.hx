package deceptinfect;

// -> game
@:expose("GameValues")
class GameValues {
	public static var DOOM_THRESHOLD_MAX = 98;

	public static var DOOM_THRESHOLD_MIN = 93;

	public static var DOOM_WAIT_FOR_IDLE = 8;

	public static var DOOM_IDLE_THRESHOLD = 0.1;

	public static var DOOM_MAX = 45;

	public static var DOOM_MIN = 5;

	/**
		Min players to start game
	**/
	public static var MIN_PLAYERS(default, never) = 3;

	/**
		Min infection to begin game with
	**/
	public static var INF_INIT_MIN(default, never) = 1.5;

	/**
		Max infection to begin game with
	**/
	public static var INF_INIT_MAX(default, never) = 7.5;

	/**
		Time to wait before being notified you are contaminated
	**/
	public static var CONTAMINATE_WARNING_TIME = 4;

	/**
		Time to wait before feedback about radiation
	**/
	public static var RADIATION_WARNING_TIME = 1.5;

	/**
		Maximum infection rate from base. 
	**/
	public static var MAX_INF_RATE = 12;

	/**
		How long the game should last (assuming everyone starts at 0%)
	**/
	public static var GAME_TIMER = 540;

	/**
		Variance from game time
	**/
	public static var GAME_TIMER_VARIANCE = 45;

	/**
		How long until evac arrives
	**/
	public static var EVAC_ARRIVAL = 25;

	/**
		How much you are slowed by at min health (percent)
	**/
	public static var LOW_HEALTH_SLOW = 0.75;

	/**
		How much your infection is multiplied by at low health
	**/
	public static var LOW_HEALTH_RATE = 1.6;

	/**
		When should low health start? (Percent)
	**/
	public static var LOW_HEALTH_SLOW_START = 0.4;

	/**
		When shoud low health rates increase (percent)
	**/
	public static var LOW_HEALTH_RATE_START = 0.25;

	/**
		For use in potentially infected system - how many samples should we take for average?
	**/
	public static var AVERAGE_RATE_SAMPLES = 15;

	/**
		How long do we take samples for?
	**/
	public static var AVERAGE_RATE_TIME = 3;

	/**
		Minimium time to spawn another battery
	**/
	public static var MIN_BATTERY_TIME = 45;

	/**
		Maximum time to spawn another battery
	**/
	public static var MAX_BATTERY_TIME = 90;

	/**
		Probably not going to be used
	**/
	public static var MULTIPLE_SOURCES_MODE = 0;

	/**
		How much shoud we apply diminishing returns to each subsequent source in an ordered list?
	**/
	public static var MULTIPLE_SOURCES_DIMINISH_PERCENT = 0.75;

	/**
		Identity system, may become in use
	**/
	public static var MAX_IDENT_DIST = 1000;

	/**
		How many batteries are spawned in each wave
	**/
	public static var BATTERIES_SPAWNED = 2;

	/**
		We should reduce infection in the evac zone, maybe?
	**/
	public static var EVAC_INFECTION_RATE = 0.5;

	/**
		When should we start evac?
	**/
	public static var BEGIN_EVAC_INF = 0.65;

	/**
		Batteries required to win game
	**/
	public static var BATTERIES_REQUIRED = 4;

	public static var GRAB_TIME = 6;

	public static var SETUP_TIME = 10;
}
