function new() {
    // GAMEPLAY MODIFIERS
    FlxG.save.data.UAplaybackRate ??= 1;
    FlxG.save.data.UAbotplay ??= false;

    // GAMEPLAY OPTIONS
    FlxG.save.data.UAhudType ??= "Codename Engine";
    FlxG.save.data.UAnoteSkin ??= "Arrows";
    FlxG.save.data.UAmiddleScroll ??= false;
    FlxG.save.data.UAopponentArrows ??= true;
    FlxG.save.data.UAlerpScore ??= false;
    FlxG.save.data.UAlaneUnderlay ??= false;
}