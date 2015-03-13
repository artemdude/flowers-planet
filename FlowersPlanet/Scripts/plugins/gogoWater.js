/**
* @author Artem Shkolovy
* @desc Create watermark
* @version 1.0
* @company Ncube
**/

   (function($){
   
    $.fn.gogoWatermark = function(options){
       
        options = jQuery.extend({
            defaultValue: 'search'
        },options);

        return this.each(function() {

                var $this = $(this);

                $this.val(options.defaultValue).css('color', '#aaa');

                $this.blur(function() {
                    if ($(this).val() == ''){
                     $(this).val(options.defaultValue);
                     $(this).css('color', '#aaa'); };
                });

                $this.focus(function() {
                    if($(this).val() == options.defaultValue) {
                     $(this).val('') ; 
                     }; 
                     $(this).css('color','#454545');      
                });

        });

    };

})(jQuery);