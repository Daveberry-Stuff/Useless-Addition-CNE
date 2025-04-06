function postCreate() {
    missesTxt.visible = false;
    accuracyTxt.visible = false;

    scoreTxt.x -= 70;
    if (downscroll)
        scoreTxt.y -= 60;
}

function postUpdate() {
    scoreTxt.text = "Score: " + UAscore;
}