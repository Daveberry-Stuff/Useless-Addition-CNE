//
import funkin.options.OptionsScreen;
import funkin.options.OptionsMenu;
import funkin.options.type.TextOption;
import funkin.options.type.ArrayOption;
import funkin.options.type.Checkbox;
import funkin.options.type.NumOption;

function postCreate() {
	main.add(new TextOption("Useless Additions >", "The options of Useless Additions", function() {
		optionsTree.add(new OptionsScreen("Useless Additions", "Change the options of Useless Additions", menus()));
	}));
}

function menus() {
	return [
		new TextOption("Gameplay Modifiers >", "Gameplay Modifiers like Playback rate and other!", function() {
			optionsTree.add(new OptionsScreen("Gameplay Modifiers", "Gameplay Modifiers like Playback rate and other!", gpOptions()));
		}),
		new TextOption("Gameplay >", "Gameplay Settings!", function() {
			optionsTree.add(new OptionsScreen("Gameplay", "Gameplay Settings!", pOptions()));
		})
	];
}

function gpOptions() {
	return [
		new NumOption("Playback Rate", "Change how fast you want the song to be! (Note, If a song has split vocals, It cannot pitch the vocals.)", 0.2, 10, 0.1, "UAplaybackRate", null, FlxG.save.data)
		new Checkbox("Botplay", "Too tired? Let the CPU Play for you!", "UAbotplay", FlxG.save.data)
	];
}

function pOptions() {
	return [
		new ArrayOption("HUD Type", "What kind of hud would you like?", [
			"Disabled",
			"Codename Engine",
			"FNF",
			"Psych Engine"
		], [
			"Disabled",
			"Codename Engine",
			"FNF",
			"Psych Engine"
		], "UAhudType", null, FlxG.save.data),
		new ArrayOption("Note Skins", "Gettin' tired with the normal note skin? change em! (Disabled type will not change the notes, meaning songs with custom notes will function correctly!)", [
			"Disabled",
			"Arrows",
			"Arrows-pixel",
			"Circles",
			"Circles-pixel"
		], [
			"Disabled",
			"Arrows",
			"Pixel Arrows",
			"Circle",
			"Pixel Circle"
		], "UAnoteSkin", null, FlxG.save.data),
		new Checkbox("Middle Scroll", "Tired of looking right (or left) for your arrows? Fear no more, have your arrows in the middle!", "UAmiddleScroll", FlxG.save.data),
		new Checkbox("Show Opponent Arrows", "Want to hide your opponent arrows? Uncheck this option!", "UAopponentArrows", FlxG.save.data),
		new Checkbox("Lerp Score", "Make the score... lerp?", "UAlerpScore", FlxG.save.data),
		new Checkbox("Lane Underlay", "Too blind too see the notes? Turn on this for easier reading!", "UAlaneUnderlay", FlxG.save.data)
	];
}
