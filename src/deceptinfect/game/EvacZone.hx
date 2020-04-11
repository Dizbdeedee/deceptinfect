package deceptinfect.game;

class EvacZone extends Component {
    var touched:Map<DI_ID,Bool> = [];
    
    var in_zone:Map<DI_ID,Bool> = [];

    var blocked:Map<DI_ID,Bool> = [];

    var arrivetime:Float = 10.0;

    var leavetime:Float = 25.0;

    var state:EvacState = NOT_ACTIVE;

}

enum EvacState {

    NOT_ACTIVE;
    ARRIVING(time:tink.CoreApi.Ref<Float>);
    LEAVING(time:tink.CoreApi.Ref<Float>);
}