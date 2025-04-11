import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;

public var PsychScoreTxt:FunkinText;
var PsychScoreTxtTween:FlxTween;

var PsychRating:String;
var PsychratingFC:String;

var sick:Int = 0;
var good:Int = 0;
var bad:Int = 0;
var shit:Int = 0;

function postCreate() {
    scoreTxt.visible = false;
    missesTxt.visible = false;
    accuracyTxt.visible = false;

    PsychScoreTxt = new FunkinText(0, 0, 0, "Score: " + songScore + " | Misses: " + misses + " | Rating: ?", 40, true);
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
    // RATING TEXT
    if (accuracy < 0.3) PsychRating = "You Suck!";
    if (accuracy > 0.3 && accuracy < 0.4) PsychRating = "Shit";
    if (accuracy > 0.4 && accuracy < 0.5) PsychRating = "Bad";
    if (accuracy > 0.5 && accuracy < 0.6) PsychRating = "Bruh";
    if (accuracy > 0.6 && accuracy < 0.69) PsychRating = "Meh";
    if (accuracy > 0.69 && accuracy < 0.7) PsychRating = "Nice";
    if (accuracy > 0.7 && accuracy < 0.8) PsychRating = "Good";
    if (accuracy > 0.8 && accuracy < 0.9) PsychRating = "Great";
    if (accuracy > 0.9 && accuracy < 1) PsychRating = "Sick!";
    if (accuracy == 1) PsychRating = "Perfect!!!";

    // RATING FC (haha took from psych :3)
	PsychratingFC = "";
	if(misses == 0)
	{
		if (bad > 0 || shit > 0) PsychratingFC = 'FC';
		else if (good > 0) PsychratingFC = 'GFC';
		else if (sick > 0) PsychratingFC = 'SFC';
	}
	else {
		if (misses < 10) PsychratingFC = 'SDCB';
		else PsychratingFC = 'Clear';
	}

    // CHANGING THE TEXT
    if (accuracy < 0) {
        PsychScoreTxt.text = "Score: " + UAscore + " | Misses: " + misses + " | Rating: ?";
        PsychScoreTxt.screenCenter(FlxAxes.X);
    }
    else {
        PsychScoreTxt.text = "Score: " + UAscore + " | Misses: " + misses + " | Rating: " + PsychRating + " (" + CoolUtil.quantize(accuracy * 100, 100) + "%) - " + PsychratingFC;
        PsychScoreTxt.screenCenter(FlxAxes.X);
    }
}

function onPlayerHit(event) {
    if (!event.note.isSustainNote) {
        // Score Text
        if (PsychScoreTxtTween != null) PsychScoreTxtTween.cancel();
        PsychScoreTxt.scale.x = 1.075;
        PsychScoreTxt.scale.y = 1.075;
        PsychScoreTxt.screenCenter(FlxAxes.X);
        PsychScoreTxtTween = FlxTween.tween(PsychScoreTxt.scale, {x: 1, y: 1}, 0.2);

        if (event.rating == "sick") sick += 1;
        if (event.rating == "good") good += 1;
        if (event.rating == "bad") bad += 1;
        if (event.rating == "shit") shit += 1;
    }
}