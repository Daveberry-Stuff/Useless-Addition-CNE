function new() {
    // GAMEPLAY MODIFIERS
    FlxG.save.data.UAplaybackRate ??= 1;

    // GAMEPLAY OPTIONS
    FlxG.save.data.UAmiddleScroll ??= false;
    FlxG.save.data.UAopponentArrows ??= true;
    FlxG.save.data.UAhudType ??= "Codename Engine";
}