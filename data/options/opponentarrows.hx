var UAmiddleScroll = FlxG.save.data.UAmiddleScroll;

function postCreate() {
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
}