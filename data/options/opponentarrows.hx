var UAmiddleScroll = FlxG.save.data.UAmiddleScroll;

function postCreate() {
	cpuStrums.visible = true;
	if (UAmiddleScroll)
		for (i in 2...4)
			cpuStrums.members[i].x += 633;
}