var window_width = $(window).width();
var window_height = $(window).height();
var down = false;
var left;
var top;
function close_modal() {

    //hide the mask
    $('#loading_mask').fadeOut('medium');

    //hide modal window(s)
    $('#modal_window').fadeOut('medium');
};
function show_modal(modal_id) {

    //get the height and width of the modal
    var modal_height = $('#modal_window').outerHeight();
    var modal_width = $('#modal_window').outerWidth();

    //calculate top and left offset needed for centering
    //var top = (window_height - modal_height) / 2;
    var top = $(window).scrollTop() + 130;
    var left = (window_width - modal_width) / 2;

    //set display to block and opacity to 0 so we can use fadeTo
    $('#loading_mask').css({ display: 'block', height: window_height, opacity: 0 });

//    alert($('#modal_window').height());
//    alert(window_height - 60);
    $('#modal_window').css({ top: top  , left: left });//+ $(window).scrollTop()
    if ($('#modal_window').height() > window_height - 60) {
        $('#modal_window').css({
            'height': window_height - 60 + 'px',
            'overflow-y': 'scroll'
        });
    }

    //fade in the mask to opacity 0.8 
    $('#loading_mask').fadeTo('medium', 0.8);

    //show the modal window
    $('#modal_window').fadeIn('medium');

    $('#modal_title').css({ display: 'block' });

}

$(function () {
    $('.close_button').click(function () {

        //use the function to close it
        close_modal();
    });
    $("#modal_title").mousedown(function (e) {
        down = true;
        left = e.pageX - $("#modal_window").position().left;
        top = e.pageY - $("#modal_window").position().top;
    }).mouseup(function () {
        down = false;
    });

    $('html').mousemove(function (e) {
        if (down) {
            $("#modal_window").css({ left: e.pageX - left, top: e.pageY - top });
        }
    });
});