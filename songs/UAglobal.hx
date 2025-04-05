var UAmiddleScroll = FlxG.save.data.UAmiddleScroll;
var UAopponentArrows = FlxG.save.data.UAopponentArrows;

function postCreate() {
    if (!UAopponentArrows)
        for (cpuStrum in cpuStrums)
            cpuStrum.visible = false;
}

function create() {
    // GAMEPLAY
    if (UAmiddleScroll)
        importScript("data/options/middlescroll.hx");
    if (UAopponentArrows)
        importScript("data/options/opponentarrows.hx");
}