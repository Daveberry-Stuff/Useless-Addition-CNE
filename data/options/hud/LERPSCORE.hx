public var lerpScore:FlxMath;
public var displayScore:Int;
public var UAscore:Int = 0;

function postUpdate(elapsed:Float) {
    lerpScore = FlxMath.lerp(lerpScore, songScore, elapsed * 10);
    displayScore = Math.round(lerpScore);

    if (UAlerpScore)
        UAscore = displayScore;
    else
        UAscore = songScore;
}