package deceptinfect;



class PlayerExt {
    public static function setWalkthroughable(p:Player,b:Bool) {
        if (b) {
            p.SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR);
        } else {
            p.SetCollisionGroup(COLLISION_GROUP_PLAYER);
        }
    }
    public static function shouldFreeRoam(p:Player) {
        var wrongMode = p.GetObserverMode() == OBS_MODE_NONE;
        var targetDead = GlobalLib.IsValid(p.GetObserverTarget()) && !(cast p.GetObserverTarget():Player).Alive();
        var keyPressed = p.KeyPressed(IN_JUMP);
        var freeRoaming = p.GetObserverMode() == OBS_MODE_ROAMING;
        return wrongMode || targetDead || (keyPressed && !freeRoaming);
    }
    static function randomIncDec(x:Int):Int {
        return switch (MathLib.random(1,2)) {
            case 1:
                x;
            case 2:
                -x;
            default:
                throw ("Something went spectacularly wrong");
        }
    }

    public static function disorientate(p:Player) {
        var curangs = p.EyeAngles();
        var curY = curangs.y;
        var punchY = randomIncDec(MathLib.random(10,80));
        curY += punchY;
        //TODO improve?
        if (curY >= 90) {
            var diff = curY - 90;
            curY = -90 + diff;
        } else if (curY <= -90) {
            var diff = curY + 90;
            curY = 90 + diff;
        }
        var punchR = randomIncDec(MathLib.random(20,160));
        var finalR = MathLib.NormalizeAngle(curangs.r + punchR);
        p.SetEyeAngles(new Angle(curY,finalR,0));
    }

    
}