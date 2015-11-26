/*
* JqNews - JQuery NewsTicker
* Author: Gravagnola Saverio and Iuliano Renato
* Version: 1.0
*/

var newsVisual = 4; // Numero di news da visualizzare - news to be displayed
var intervallo = 5000; // >1500

$(document).ready(function () {
    // Totale news
    var numNews = $("#jqnews2").children().length;

    // Controllo di overflow
    if (newsVisual > numNews) {
        newsVisual = numNews;
    }

    // Hide delle news superflue all'inizializzazione
    for (var i = newsVisual; i < numNews; i++) {
        $($("#jqnews2").children()[i]).css("opacity", "0");
    }

    var gestInter = setInterval(jqNewsRotate, intervallo);

    // Gestione del mouseover-mouseout
    $("#jqnews2").mouseover(function () { clearInterval(gestInter) });
    $("#jqnews2").mouseout(function () { gestInter = setInterval(jqNewsRotate, intervallo); });
});

function jqNewsRotate(_newsVisual) {

    // Inserire lo stesso valore utilizzato per definire l'altezza ed i margini dei div nel file css/style.css
    var altezzaDiv = -60;
    var margineDiv = 5;

    // Hide della prima news
    $($("#jqnews2").children()[0]).animate({ opacity: 0 }, 1000, "linear", function () {
        // Movimento verso l'alto
        $($("#jqnews2").children()[0]).animate({ marginTop: altezzaDiv }, 1000, "linear", function () {
            // Ripristino posizione elemento nascosto
            $($("#jqnews2").children()[0]).css("margin", margineDiv);
            // Spostamento in coda dell'elemento nascosto
            $("#jqnews2").append($($("#jqnews2").children()[0]));
            // Visualizzazione dell'ultima news
            $($("#jqnews2").children()[(newsVisual - 1)]).animate({ opacity: 1 }, 1000);
        });
    });
}