/**
* @author Artem Shkolovy
* @desc element wich will be always on screen
* @version 1.1
* @company Junkystudio
**/

/**
Example of usage:
$('#stickedButtons').fixedElement({byElement:'body'});

**/

(function($) {

    $.fn.fixedElement = function(options) {

        options = jQuery.extend({
            top: 20,
            byElement: 'startScroll'
        }, options);

        return this.each(function() {

            var $this = $(this);

            //element must to exist
            if ($('#' + options.byElement).length == 0) {
                return false;
            }

            $(window).scroll(function() {
                var top = $(this).scrollTop();

                if ($('#' + options.byElement).offset().top < top + options.top) {

                    if ($this.css('position') != 'fixed') {
                        $this.css({ 'position': 'fixed', 'top': options.top + 'px' });
                    }
                }
                else {
                    $this.css({ 'position': 'relative', 'top': "0px" });
                }
            });

        });

    };

})(jQuery);