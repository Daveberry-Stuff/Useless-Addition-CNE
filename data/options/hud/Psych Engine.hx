import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;

public var PsychScoreTxt:FunkinText;
var PsychScoreTxtTween:FlxTween;

function postCreate() {
    scoreTxt.visible = false;
    missesTxt.visible = false;
    accuracyTxt.visible = false;

    PsychScoreTxt = new FunkinText(0, 685, 0, "Score: " + songScore + " | Misses: " + misses + " | Accuracy: ?", 40, true);
    PsychScoreTxt.setFormat(Paths.font("vcr.ttf"), 20, 0xFFFFFFFF, FlxTextAlign.MIDDLE, FlxTextBorderStyle.OUTLINE, 0xFF000000);
    PsychScoreTxt.borderSize = 1.5;
    PsychScoreTxt.camera = camHUD;
    PsychScoreTxt.screenCenter(FlxAxes.X);

    add(PsychScoreTxt);

    if (downscroll) {
        PsychScoreTxt.y = 605;
    }
    else {
        PsychScoreTxt.y = 685;
    }
}

function update(elapsed:Float) {
    if (accuracy < 0) {
        PsychScoreTxt.text = "Score: " + songScore + " | Misses: " + misses + " | Accuracy: ?";
        PsychScoreTxt.screenCenter(FlxAxes.X);
    }
    else {
        PsychScoreTxt.text = "Score: " + songScore + " | Misses: " + misses + " | Accuracy: " + CoolUtil.quantize(accuracy * 100, 100) + "%";
        PsychScoreTxt.screenCenter(FlxAxes.X);
    }
}


function onPlayerHit(event) {
    if (!event.note.isSustainNote) {
        // Score Text
        if (PsychScoreTxtTween != null) PsychScoreTxtTween.cancel();
        PsychScoreTxt.scale.x = 1.05;
        PsychScoreTxt.scale.y = 1.05;
        PsychScoreTxt.screenCenter(FlxAxes.X);
        PsychScoreTxtTween = FlxTween.tween(PsychScoreTxt.scale, {x: 1, y: 1}, 1, {ease: FlxEase.expoOut});
    }
}