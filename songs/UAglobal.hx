// GAMEPLAY MODIFIERS
var UAplaybackRate = FlxG.save.data.UAplaybackRate;
var UAbotplay = FlxG.save.data.UAbotplay;

// GAMEPLAY
var UAmiddleScroll = FlxG.save.data.UAmiddleScroll;
var UAopponentArrows = FlxG.save.data.UAopponentArrows;
var UAhudType = FlxG.save.data.UAhudType;

function postCreate() {
    if (!UAopponentArrows)
        for (cpuStrum in cpuStrums)
            cpuStrum.visible = false;
}

function create() {
    // GAMEPLAY OPTIONS
    importScript("data/options/hud/" + UAhudType + ".hx");
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