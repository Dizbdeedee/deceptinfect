package deceptinfect;

import gmod.Gmod;
import gmod.libs.MathLib;

using Safety;

class Profiler {
	final inital:Array<Map<String, Float>> = [];
	final vinal:Array<Map<String, Float>> = [];

	var pass = 0;

	var lastname = "";

	var profileState:ProfilingState = NOT_PROFILING;

	var cumulativeTime = 0.0;
	var totalProfileTime = 0.0;

	final totalPasses:Int = 500;

	public function new() {
		
	}

	public function beginProfiling() {
		pass = 0;
		totalProfileTime = Gmod.SysTime();
		cumulativeTime = 0.0;
		profileState = PROFILING;
	}

	public function report() {
		if (profileState != PROFILE_FINISHED)
			return;
		final total:Map<String, Float> = [];
		final avg:Map<String, Int> = [];
		trace("report");
		for (pass in vinal) {
			for (str => time in pass) {
				total.set(str, total.get(str).or(0.0) + time);
			}
		}
		for (str => time in total) {
			trace('total $str : $time | avg: ${time / pass} | prcnt: ${(time / cumulativeTime) * 100}');
		}
		trace('Cumulative time $cumulativeTime / Total time $totalProfileTime');
		final percent = MathLib.Round(cumulativeTime / totalProfileTime * 100, 3);
		trace('Overall runtime impact $percent');
		profileState = NOT_PROFILING;
	}

	public #if !profile inline #end function profile(zone:String, first = false) {
		#if profile
		if (profileState != PROFILING)
			return;
		if (!first)
			profileend(); // ambigous

		if (inital[pass] == null) {
			inital[pass] = [];
			vinal[pass] = [];
		}
		inital[pass].unsafe().set(zone, Gmod.SysTime());
		lastname = zone;
		#end
	}

	public #if !profile inline #end function profileend() {
		#if profile
		if (profileState != PROFILING)
			return;
		final diff = Gmod.SysTime() - inital[pass].get(lastname).unsafe();
		vinal[pass].set(lastname, diff);
		cumulativeTime += diff;
		#end
	}

	public #if !profile inline #end function resetprofile() {
		#if profile
		if (profileState != PROFILING)
			return;
		profileend();
		if (pass > totalPasses) {
			totalProfileTime = Gmod.SysTime() - totalProfileTime;
			profileState = PROFILE_FINISHED;
		}
		pass++;
		#end
	}
}

enum ProfilingState {
	NOT_PROFILING;
	PROFILING;
	PROFILE_FINISHED;
}
