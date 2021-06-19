package deceptinfect.ecswip;

import deceptinfect.ecswip.ComponentManager;
import haxe.ds.ObjectMap;

// typedef FamilyMap = ObjectMap<Class<Component>,Bool>;
// class Family {
//     var familyMap:Array<Class<Component>>;
//     public function new(a:Array<Class<Component>>) {
//         a = familyMap;
//     }
//     //TODO someday, use macros to make lovely
//     public function retrieveComponents(ent:DI_ID):Option<ObjectMap<Class<Component>,Component>> {
//         var map = new ObjectMap();
//         for (component in familyMap) {
//             switch (ent.get(component)) {
//                 case Comp(comp):
//                     map.set(component,comp);
//                 case NONE:
//                     return None;
//             }
//         }
//         return Some(map);
//     }
// }
