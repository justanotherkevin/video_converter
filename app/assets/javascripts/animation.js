// window.onload = hidOnLoad();
// function hidOnLoad() {
//     // hidMyDiv('#upload_div');
//     //  document.getElementById("upload_div").style.display = "none";
// }
function addTransition(selected_class) {
    $(selected_class).addClass('transition_time');
}
function hidMyDiv(selected_class) {
    $(selected_class).fadeOut(1);
    // $(selected_class).addClass('hide_this_div');
}
function unHidMyDiv(selected_class) {
    $(selected_class).fadeIn(500);
    // $(selected_class).removeClass('hide_this_div');
}
function toggleMyDiv() {
    if ($('#upload_div').css('display') === 'none' ) {
        hidMyDiv('#button_wrapper');
        unHidMyDiv('#upload_div');
    } else {
        unHidMyDiv('#button_wrapper');
        hidMyDiv('#upload_div');
    }
}
