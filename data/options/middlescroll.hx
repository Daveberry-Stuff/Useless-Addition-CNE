function postCreate() {
    for (i in 0...4) {
        if (!PlayState.opponentMode)
            playerStrums.members[i].x -= 322;
        else
            cpuStrums.members[i].x += 322;
    }
}