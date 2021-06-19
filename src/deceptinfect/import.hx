package deceptinfect;

#if !macro
import lua.Table.AnyTable;
import haxe.extern.Rest;
import haxe.Constraints.Function;
import gmod.gclass.*;
import gmod.libs.*;
import gmod.types.*;
import lua.Table.AnyTable;
import lua.Table;
import lua.UserData;
import haxe.extern.EitherType;
import haxe.extern.Rest;
import haxe.Constraints.Function;

using gmod.helpers.PairTools;
using gmod.helpers.TableTools;
using tink.CoreApi;

import deceptinfect.macros.CompileTime.C_square;
import gmod.Gmod.IsValid;
import gmod.Gmod;
import deceptinfect.ecswip.Component;
import deceptinfect.ecswip.System;
import deceptinfect.ecswip.ComponentManager.entities;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.SystemManager.getSystem;
import deceptinfect.ecswip.SystemManager.getSystem2;

using deceptinfect.util.MinMax;
using deceptinfect.util.EntityExt;
#end
