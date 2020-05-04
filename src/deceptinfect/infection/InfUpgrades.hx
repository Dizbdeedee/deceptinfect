package deceptinfect.infection;

class InfUpgrades extends Component {
    var upgrades:Array<UpgradeStatus> = [];
}

enum UpgradeStatus {
    NONE;
    HAS_UPGRADE(x:Upgrade);
}

class Upgrade {

    public var type:UpgradeType;
}

enum UpgradeType {
    MAJOR;
    MINOR;

}