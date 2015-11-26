(function (a, b) { $window = a(b), a.fn.lazyload = function (c) { function f() { var b = 0; d.each(function () { var c = a(this); if (e.skip_invisible && !c.is(":visible")) return; if (!a.abovethetop(this, e) && !a.leftofbegin(this, e)) if (!a.belowthefold(this, e) && !a.rightoffold(this, e)) c.trigger("appear"); else if (++b > e.failure_limit) return !1 }) } var d = this, e = { threshold: 0, failure_limit: 0, event: "scroll", effect: "show", container: b, data_attribute: "original", skip_invisible: !0, appear: null, load: null }; return c && (undefined !== c.failurelimit && (c.failure_limit = c.failurelimit, delete c.failurelimit), undefined !== c.effectspeed && (c.effect_speed = c.effectspeed, delete c.effectspeed), a.extend(e, c)), $container = e.container === undefined || e.container === b ? $window : a(e.container), 0 === e.event.indexOf("scroll") && $container.bind(e.event, function (a) { return f() }), this.each(function () { var b = this, c = a(b); b.loaded = !1, c.one("appear", function () { if (!this.loaded) { if (e.appear) { var f = d.length; e.appear.call(b, f, e) } a("<img />").bind("load", function () { c.hide().attr("src", c.data(e.data_attribute))[e.effect](e.effect_speed), b.loaded = !0; var f = a.grep(d, function (a) { return !a.loaded }); d = a(f); if (e.load) { var g = d.length; e.load.call(b, g, e) } }).attr("src", c.data(e.data_attribute)) } }), 0 !== e.event.indexOf("scroll") && c.bind(e.event, function (a) { b.loaded || c.trigger("appear") }) }), $window.bind("resize", function (a) { f() }), f(), this }, a.belowthefold = function (c, d) { var e; return d.container === undefined || d.container === b ? e = $window.height() + $window.scrollTop() : e = $container.offset().top + $container.height(), e <= a(c).offset().top - d.threshold }, a.rightoffold = function (c, d) { var e; return d.container === undefined || d.container === b ? e = $window.width() + $window.scrollLeft() : e = $container.offset().left + $container.width(), e <= a(c).offset().left - d.threshold }, a.abovethetop = function (c, d) { var e; return d.container === undefined || d.container === b ? e = $window.scrollTop() : e = $container.offset().top, e >= a(c).offset().top + d.threshold + a(c).height() }, a.leftofbegin = function (c, d) { var e; return d.container === undefined || d.container === b ? e = $window.scrollLeft() : e = $container.offset().left, e >= a(c).offset().left + d.threshold + a(c).width() }, a.inviewport = function (b, c) { return !a.rightofscreen(b, c) && !a.leftofscreen(b, c) && !a.belowthefold(b, c) && !a.abovethetop(b, c) }, a.extend(a.expr[":"], { "below-the-fold": function (c) { return a.belowthefold(c, { threshold: 0, container: b }) }, "above-the-top": function (c) { return !a.belowthefold(c, { threshold: 0, container: b }) }, "right-of-screen": function (c) { return a.rightoffold(c, { threshold: 0, container: b }) }, "left-of-screen": function (c) { return !a.rightoffold(c, { threshold: 0, container: b }) }, "in-viewport": function (c) { return !a.inviewport(c, { threshold: 0, container: b }) }, "above-the-fold": function (c) { return !a.belowthefold(c, { threshold: 0, container: b }) }, "right-of-fold": function (c) { return a.rightoffold(c, { threshold: 0, container: b }) }, "left-of-fold": function (c) { return !a.rightoffold(c, { threshold: 0, container: b }) } }) })(jQuery, window)
var window_width = $(window).width();
var window_height = $(window).height();
var down = false;
var left;
var top;
var layoutName = '';
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
    $('#modal_window').css({ top: top, left: left }); //+ $(window).scrollTop()
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
/*
* JqNews - JQuery NewsTicker
* Author: Gravagnola Saverio and Iuliano Renato
* Version: 1.0
*/
var newsVisual = 4; // Numero di news da visualizzare - news to be displayed
var intervallo = 5000; // >1500
$(document).ready(function () {
    // Totale news
    var numNews = $("#jqnews").children().length;
    // Controllo di overflow
    if (newsVisual > numNews) {
        newsVisual = numNews;
    }
    // Hide delle news superflue all'inizializzazione
    for (var i = newsVisual; i < numNews; i++) {
        $($("#jqnews").children()[i]).css("opacity", "0");
    }
    var gestInter = setInterval(jqNewsRotate, intervallo);
    // Gestione del mouseover-mouseout
    $("#jqnews").mouseover(function () { clearInterval(gestInter) });
    $("#jqnews").mouseout(function () { gestInter = setInterval(jqNewsRotate, intervallo); });
});
function jqNewsRotate(_newsVisual) {
    // Inserire lo stesso valore utilizzato per definire l'altezza ed i margini dei div nel file css/style.css
    var altezzaDiv = -60;
    var margineDiv = 5;
    // Hide della prima news
    $($("#jqnews").children()[0]).animate({ opacity: 0 }, 1000, "linear", function () {
        // Movimento verso l'alto
        $($("#jqnews").children()[0]).animate({ marginTop: altezzaDiv }, 1000, "linear", function () {
            // Ripristino posizione elemento nascosto
            $($("#jqnews").children()[0]).css("margin", margineDiv);
            // Spostamento in coda dell'elemento nascosto
            $("#jqnews").append($($("#jqnews").children()[0]));
            // Visualizzazione dell'ultima news
            $($("#jqnews").children()[(newsVisual - 1)]).animate({ opacity: 1 }, 1000);
        });
    });
}

var top = window;
$(document).ready(function () {
    $("#bottom").corner("8px");
    //$("#menu ul .active").corner("top:8px");
});
$(document).ready(function () {
    $("#featured > ul").tabs({
        fx: {
            opacity: "toggle"
        }
    }).tabs("rotate", 10000, true);
});

menu_status = new Array();
function showHide(theid) {
    if (document.getElementById) {
        var switch_id = document.getElementById(theid);

        if (menu_status[theid] != 'show') {
            switch_id.className = 'show';
            menu_status[theid] = 'show';
        } else {
            switch_id.className = 'hide';
            menu_status[theid] = 'hide';
        }
    }
}
function GetActiveMenu(e, cls) {
    var c = $(e);
    for (var b = 0; b < c.length; b++) {
        //if (!$(c[b]).attr("activekey")) continue;
        var a = $(c[b]).attr("activekey").toLowerCase();
        if (a != "" && window.location.href.toString().toLowerCase().indexOf(a, 10) > 10) {
            if (cls) $(c[b]).parents('li').addClass(cls);
            else $(c[b]).parents('li').addClass("current");
            //return c[b];
        }
    }
}
function formatMenu() {

    if ((window.location.href.indexOf('/hotrodoanhnghiep/trang-chu.html') > 0 || window.location.href.indexOf('/hotrodoanhnghiep/index.html') > 0) || window.location.pathname == '/hotrodoanhnghiep/') {
        $('div#menu >li:nth-child(2) a').attr('href', '#');
        $('div#menu ul >li:nth-child(2) a').parent().hide();
    }
    if (window.location.href.indexOf('/hotrodoanhnghiep/') > 0) {
        $('div#menu ul li:nth-child(2) a.parent').attr('href', '#');
    }
    $("#navmenu li").hover(function () { $(this).find('ul:first').css({ visibility: "visible", display: "none" }).slideDown(400); }, function () { $(this).find('ul:first').css({ visibility: "hidden" }); }); $('#navmenu ul ul').parent('li').addClass('sub');
    $("#navmenu ul").each(function (index, value) {
        var child = $(this).find('>li');
        var col = 1;
        if (child.length > 6) {

            col = Math.round(child.length / 6)+1;
            child.css('width', 200);
            var percent = Math.round(100 % col);
            $(this).css('width', 200 * col);
            $(this).css('padding', 10);
            $(this).css('background-color', '#7aa9dd');
        }
    });
    $("#navmenu li#277 >ul >li").css({ 'width': '250' });
    $("#navmenu li#280 >ul >li").css({ 'width': '200' });

    $('#menu_doc .menu ul li a').each(function () {
        if ($(this).html().length > 38) {
            $(this).parent().css({ 'height': '40px' });
            $(this).css({ 'height': '40px' });
        }
    });
}
function LoadAjax() {
    AjaxCall('/hotrodoanhnghiep/Ajax/Ajax_Video.aspx', '#ajax_videoBox', function () {
        $('#VideoBox1_Panel1').vTicker({
            speed: 500,
            pause: 3000,
            showItems: 5,
            animation: 'fade',
            mousePause: true,
            height: 0,
            direction: 'up'
        });
    });
    AjaxCall('/hotrodoanhnghiep/Ajax/Ajax_NewsHot.aspx', '#ajax_newbox');
    AjaxCall('/hotrodoanhnghiep/Ajax/Ajax_BankBox.aspx', '#bank_box');
    AjaxCall('/hotrodoanhnghiep/Ajax/Ajax_BusinessStatistic.aspx', '#ajax_bstatistal');
    AjaxCall('/hotrodoanhnghiep/Ajax/Ajax_GalleryBox.aspx', '#ajax_gallery', function () {
        $('#jqnews2').jCarouselLite({ mouseWheel: false, hoverPause: true, auto: 800, vertical: true, speed: 2000, visible: 4, scroll: 1 });
        $('a.lightbox').lightBox({ fixedNavigation: true });
    });
    AjaxCall('/hotrodoanhnghiep/Ajax/Ajax_Gallery_Top5.aspx', '#gallary-box-top5', function () {
        $(".video_galery_box").cycle({
            fx: 'fade',
            speed: 2000,
            random: true
        });
    });
    AjaxCall('/hotrodoanhnghiep/Ajax/Ajax_Gallery1_Top5.aspx', '#gallary1-box-top5', function () {
        $(".video_galery_box").cycle({
            fx: 'fade',
            speed: 2000,
            random: true
        });
    });
}
$(document).ready(function () {
    GetActiveMenu('div#menu a', 'active');
    GetActiveMenu('#menu_doc a', 'active');
    
    var a = $('#menu_doc li.active a').click();
    $("img.lazy-image").lazyload({ effect: "fadeIn" });
    $('img').each(function () {
        if ($(this).attr('src').length ==0 || $(this).attr('src').indexOf('http://') == -1) $(this).hide();
    })
    $('p.soluoc').each(function () {
        if ($(this).html().length < 65) { $(this).hide(); if ($(this).next().length < 65) $(this).next().hide(); }
    });
    formatMenu();

    //INNSERT SUBMENU
    $('li[templateid="CACPHONGBAN"]').append($('#popup-box1').html());
    $('li[templateid="CACPHONGBAN"] #popup').hide();
    $('li[templateid="CACPHONGBAN"]').mouseover(function () {
        $('li[templateid="CACPHONGBAN"] #popup').slideDown();
    });
    //$('li[templateid="CACPHONGBAN"]').mouseleave(function () {
    //    if ($('li[templateid="CACPHONGBAN"]').attr('class') != 'active') {
    //        $('li[templateid="CACPHONGBAN"] #popup').stop(true, true).slideUp();
    //   }
    //});
    if ($('li[templateid="CACPHONGBAN"]').attr('class') == 'active') {

        $('li[templateid="CACPHONGBAN"] #popup').slideDown();
    }
    $('li[templateid="CACPHONGBAN"] li:nth-child(1)').remove();

})
function AjaxCall(url, container, fun) {
    if ($(container).length) {
        $(container).html('<div style="text-align:justify;width:100%;margin:0 auto"><img src="/Images/WebImage/loading2.gif"></div>');
        $.post(url, function (data) {
            $(container).html(data).hide().fadeIn("slow");
            if (fun) fun();
        });
    }
}
function Search1(key) {
    var kWord = $("#txtsearch").val().trim();
    var url = '/sokhdt/' + key + '.html?keyword='.concat(kWord);
    window.location.href = url;
}
function Search(key) {
    var kWord = $("#txtsearch").val().trim();
    var url = '/ttdd/' + key + '.html?keyword='.concat(kWord);
    window.location.href = url;
}
function scroll(y, f) {
    $('html, body').animate({ scrollTop: y }, 1000, null, function () {if (f) f(); });
}

