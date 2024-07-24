package deceptinfect;
//ugh.
#if !macro
import lua.Table.AnyTable;
import haxe.extern.Rest;
import haxe.Constraints.Function;

import gmod.gclass.Entity;
import gmod.gclass.Vector;
import gmod.gclass.CTakeDamageInfo;
import gmod.gclass.Player;
import gmod.gclass.Angle;
import gmod.gclass.Weapon;
import gmod.gclass.CNavArea;
import gmod.gclass.ITexture;
import gmod.gclass.CSEnt;
import gmod.libs.HookLib;
import gmod.libs.PlayerLib;
import gmod.libs.SurfaceLib;
import gmod.libs.MathLib;
import gmod.libs.GameLib;
import gmod.libs.ResourceLib;
import gmod.libs.UtilLib;
import gmod.libs.EntsLib;
import gmod.libs.FileLib;
import gmod.libs.TimerLib;
import gmod.libs.GameeventLib;
import gmod.libs.NavmeshLib;
import gmod.libs.DebugoverlayLib;
import gmod.libs.StringLib;

import lua.Table.AnyTable;
import lua.Table;
import haxe.extern.EitherType;
import haxe.extern.Rest;
import haxe.Constraints.Function;
import gmod.helpers.net.NET_Server;

using gmod.helpers.PairTools;
using gmod.helpers.TableTools;
using tink.CoreApi;

import deceptinfect.macros.IterateEnt;
import gmod.Gmod;
import deceptinfect.ecswip.Component;
import deceptinfect.ecswip.System;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.SystemManager;

using deceptinfect.util.MinMax;
using deceptinfect.util.EntityExt;
#end
