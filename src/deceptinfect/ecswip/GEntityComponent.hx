package deceptinfect.ecswip;

class GEntityComponent extends Component {
    public var entity:Entity;

    public function new(e:Entity) {
        super();
        entity = e;
    }
}