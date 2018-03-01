
function DisplayProgress2() {
    document.getElementById('pnlProgress2').style.visibility = 'visible';
    window.setTimeout(HideProgressPanel, 100000);  //handles hiding the progress panel should the operation time out
}

function HideProgressPanel2() {
    document.getElementById('pnlProgress2').style.visibility = "hidden", 100000
}
   