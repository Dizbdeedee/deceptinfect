package deceptinfect;

import gmod.gclass.Entity;

interface Infected {
    
}

interface GrabComponent {

}

interface GrabbableComponent {
    var grab:Entity;
}

interface FormComponent {
    var health:Float;
    var maxHealth:Float;
    function formAvaliable():Bool;



}

enum Form {
    INFECTED(a:FormComponent);
    HUMAN(a:FormComponent);

}
interface CanChangeForm {
    var form:Form;
}

interface InfectedComponent {
    var infection:Float;
    
    var rate:Float;
}

interface ContaminationComponent {

}