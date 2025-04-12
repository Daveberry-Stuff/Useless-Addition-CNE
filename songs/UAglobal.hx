// GAMEPLAY MODIFIERS
public var UAplaybackRate = FlxG.save.data.UAplaybackRate;
public var UAbotplay = FlxG.save.data.UAbotplay;

// GAMEPLAY
// STRINGS
public var UAhudType = FlxG.save.data.UAhudType;
public var UAnoteSkin = FlxG.save.data.UAnoteSkin;

// BOOLS
public var UAmiddleScroll = FlxG.save.data.UAmiddleScroll;
public var UAopponentArrows = FlxG.save.data.UAopponentArrows;
public var UAlerpScore = FlxG.save.data.UAlerpScore;
public var UAlaneUnderlay = FlxG.save.data.UAlaneUnderlay;

// LERP SCORE
public var UAlerpScores:FlxMath;
public var UAscore:Int = 0;

// LANE UNDERLAY
var UAlaneUnderlayBG = FlxSprite;

function postCreate() {
    // GAMEPLAY OPTIONS
    // HIDE OPPONENT ARROWS
    if (!UAopponentArrows)
        for (cpuStrum in cpuStrums)
            cpuStrum.visible = false;

    // SHOW OPPONENT ARROWS
    if (!PlayState.opponentMode) {
		cpuStrums.visible = true;
		if (UAmiddleScroll)
			for (i in 2...4)
				cpuStrums.members[i].x += 633;
	} else {
		playerStrums.visible = true;
		if (UAmiddleScroll) {
			for (i in 0...4)
				playerStrums.members[i].x -= 633;
			for (i in 2...4)
				playerStrums.members[i].x += 633;
		}
	}

    // MIDDLE SCROLL
    if (UAmiddleScroll) {
        for (i in 0...4) {
            if (!PlayState.opponentMode)
                playerStrums.members[i].x -= 322;
            else
                cpuStrums.members[i].x += 322;
        }
    }

    // LANE UNDERLAY
    if (UAlaneUnderlay) {
        UAlaneUnderlayBG = new FlxSprite(0, 0).makeSolid(500, 720, 0xFF000000);
        UAlaneUnderlayBG.camera = camHUD;
        UAlaneUnderlayBG.alpha = 0.5;
        insert(0, UAlaneUnderlayBG);
    }
}

function create() {
    // HUD TYPE
    importScript("data/scripts/hud/" + UAhudType + ".hx");

    // NOTESKIN
    if (UAnoteSkin == "Circles-pixel" || UAnoteSkin == "Arrows-pixel")
        importScript("data/scripts/pixelNote.hx");
}

function onSongStart() {
    // GAMEPLAY MODIFIERS
    inst.pitch = vocals.pitch = UAplaybackRate;
    if (!PlayState.opponentMode)
        playerStrums.cpu = UAbotplay;
    else
        cpuStrums.cpu = UAbotplay;
}

function postUpdate(elapsed:Float) {
    // LERP SCORE
    UAlerpScores = FlxMath.lerp(UAlerpScores, songScore, elapsed * 10);
    if (UAlerpScore)
        UAscore = Math.round(UAlerpScores);
    else
        UAscore = songScore;

    // MIDDLE SCROLL HIDE OPPONENT
    if (UAmiddleScroll) {
        for (i in 0...4)
            cpuStrums.members[i].alpha = 0.5;
        if (PlayState.opponentMode)
            for (i in strumLines.members[1].notes)
                i.alpha = 0.5;
        else
            for (i in strumLines.members[0].notes)
                i.alpha = 0.5;
    }

    // LANE UNDERLAY
    if (UAlaneUnderlay) {
        UAlaneUnderlayBG.x = playerStrums.members[1].x - 100 - 40;
    }
}

// NOTESKIN
function onNoteCreation(event) {
    if (UAnoteSkin != "Circles-pixel" || UAnoteSkin != "Arrows-pixel")
        event.noteSprite = "game/notes/" + UAnoteSkin;
}

function onStrumCreation(event) {
    if (UAnoteSkin != "Circles-pixel" || UAnoteSkin != "Arrows-pixel")
        event.sprite = "game/notes/" + UAnoteSkin;
}