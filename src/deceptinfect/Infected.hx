package deceptinfect;

import gmod.gclass.Entity;

interface Infected {
    
}

interface GrabComponent {

}

interface GrabbableComponent {
    var grab:Entity;
    var isGrabbed:Bool;
}

interface FormComponent {
    var health:Float;
    var maxHealth:Float;
    function formAvaliable():Bool;



}

enum Form {
    INFECTED(a:FormComponent);
    HUMAN(d:FormComponent);

}
interface CanChangeForm {
    var form:Form;
}

// interface InfectionComponent {
//     var infection:Float;
//     var rate:Float;

//     public function handleInfection():Void;

    
// }

interface ContaminationComponent {


}

