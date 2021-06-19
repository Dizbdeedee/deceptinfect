package deceptinfect.macros;

import haxe.macro.Expr.ComplexType;
#if macro
import haxe.macro.Context;

using Lambda;
#end

class ProxyMacros {
	public static function build() {
		#if macro
		final fields = Context.getBuildFields();
		final type = Context.getLocalType();
		final complexType = Context.toComplexType(type);
		var compID;
		final arr = switch (type) {
			case TInst(_.get() => {name: clsString, module: clsModule}, _):
				compID = ClassToID.getIDStr(clsString);
				final str = clsModule + "." + clsString;
				str.split(".");
			default:
				throw "Can not find type path";
		}
		final basePath = arr.copy();
		arr.push("net_proxy");
		arr.push("send");
		// for (field in fields) {
		//     if (field.meta != null && field.meta.exists((item) -> item.name == ":s")) {
		// 	var type;
		// 	#if server
		// 	// field.kind = switch (field.kind) {
		// 	//     case FVar(t, e):
		// 	// 	type = t;
		// 	// 	FProp("default","set",t,e);
		// 	//     default:
		// 	// 	throw "not supported netsend type";
		// 	// }
		// 	#end
		// 	final setName = 'set_${field.name}';
		// 	final fieldName = field.name;
		//     }

		// }

		final exprArray = fields.filter((field) -> {
			field.meta != null
			&& field.meta.exists((item) -> item.name == ":s");
		}).map((field) -> {
			final name = field.name;
			// trace(name);
			macro comp.$name = x.item.$name;
		});
		final netMessage = (macro:{
			proxy:deceptinfect.ecswip.ProxyComponent.NetProxy,
			item:$complexType
		});

		final macroClass = macro class {
			// public function $setName(x:$type):$type {
			// }
			public function proxySend() {
				final id = deceptinfect.ecswip.ComponentManager.getIDFromComponent(this);
				for (recipient in recipients) {
					$p{arr}({
						proxy: new deceptinfect.ecswip.ProxyComponent.NetProxy(id, $v{compID}),
						item: this
					}, recipient);
				}
			}

			public static function proxyInit() {
				trace("we're runnin btw");
				net_proxy.signal.handle((x:$netMessage) -> {
					trace(x);
					final id = getSystem(ClientTranslateSystem).getID(cast x.proxy.id);
					switch (id.get($p{basePath})) {
						case Comp(comp):
							$a{exprArray} default:
							x.item.proxyCreated();
							id.add_component(x.item);
					}
					return;
				});
			}

			public function proxyCreated() {}

			public var recipients:Array<gmod.gclass.Player> = [];
		}
		final expr = macro $p{basePath};
		final proxyCreatedExists = fields.exists((field) -> field.name == "proxyCreated");
		// final netProxyName = (macro : "net_proxy$compID")
		final expr = macro new gmod.helpers.net.NET_Server<"net_proxy", {proxy:deceptinfect.ecswip.ProxyComponent.NetProxy, item:$complexType}>();
		switch (expr) {
			case {expr: ENew({params: arr}, _)}:
				arr[0] = TPExpr(macro $v{'net_proxy$compID'});
			default:
				throw "non";
		}
		fields.push({
			name: "net_proxy",
			kind: FVar(null, expr),
			access: [AStatic, AFinal, APublic],
			pos: Context.currentPos()
		});
		#if server
		fields.push(macroClass.fields[0]);
		fields.push(macroClass.fields[3]);
		#elseif client
		fields.push(macroClass.fields[1]);
		if (!proxyCreatedExists) {
			fields.push(macroClass.fields[2]);
		}
		#end
		return fields;
		#end
	}
}
// class ProxyComponent extends Component {
//     var recipients:Array<Player> = [];
// }
