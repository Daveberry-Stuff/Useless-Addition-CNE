// GAMEPLAY MODIFIERS
public var UAplaybackRate = FlxG.save.data.UAplaybackRate;
public var UAbotplay = FlxG.save.data.UAbotplay;

// GAMEPLAY
public var UAmiddleScroll = FlxG.save.data.UAmiddleScroll;
public var UAopponentArrows = FlxG.save.data.UAopponentArrows;
public var UAhudType = FlxG.save.data.UAhudType;
public var UAlerpScore = FlxG.save.data.UAlerpScore;

function postCreate() {
    // GAMEPLAY OPTIONS
    if (!UAopponentArrows)
        for (cpuStrum in cpuStrums)
            cpuStrum.visible = false;
}

function create() {
    // GAMEPLAY OPTIONS
    importScript("data/options/hud/" + UAhudType + ".hx");
    importScript("data/options/hud/LERPSCORE.hx");
    if (UAmiddleScroll)
        importScript("data/options/middlescroll.hx");
    if (UAopponentArrows)
        importScript("data/options/opponentarrows.hx");
}

function onSongStart() {
    // GAMEPLAY MODIFIERS
    inst.pitch = vocals.pitch = UAplaybackRate;
    playerStrums.cpu = UAbotplay;
}