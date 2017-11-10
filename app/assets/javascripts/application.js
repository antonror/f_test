//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(document).on('ajax:success', '[data-update-target]', function(evt, data) {
    var targetId = $(this).data('update-target');
    var target = $('#' + targetId);
    target.html(data).show();
    $('html, body').animate({
        scrollTop: target.offset().top
    }, 1500);
});

jQuery.fn.highlight = function (options) {
    opts = options || {};
    duration = opts.duration || 1000;
    opacity = opts.opacity || ".7";
    bgColor = opts.bgColor || "#428bca";

    $(this).each(function () {
        var el = $(this);
        $("<div/>")
            .width(el.outerWidth())
            .height(el.outerHeight())
            .css({
                "position": "absolute",
                "left": el.offset().left,
                "top": el.offset().top,
                "background-color": bgColor,
                "opacity": opacity,
                "z-index": "9999999"
            }).appendTo('body').fadeOut(duration).queue(function () { $(this).remove(); });
    });
}
