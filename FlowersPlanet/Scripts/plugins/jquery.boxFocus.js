  /**
* @author Artem Shkolovy
* @desc Create watermark
* @version 1.0
* @company Ncube
**/

/**
Example of usage:


**/

(function ($) {

    $.fn.boxFocus = function (options) {

        options = jQuery.extend({
            cssClass: 'textbox-selected'
        }, options);

        return this.each(function () {

            var $this = $(this);

        $($this).focus(function() {
            $(this).addClass(options.cssClass);
        });

        $($this).blur(function() {
            $(this).removeClass(options.cssClass);
        });

    });

};

})(jQuery);