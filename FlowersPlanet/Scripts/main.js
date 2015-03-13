
    $(document).ready(function() {

        var curentTagId;

        $('#main-menu a').mouseover(function() {

            curentTagId = $(this).attr('id');

            TagsShow();
        });

        $('#main-menu a, #main-menu-item-content').mouseout(function() {
            $('#main-menu-item-content').hide();
            $('#tagsInMenu_' + curentTagId).hide();

            $('#' + curentTagId).removeClass('main-menu-item-hovered');
        });

        $('#main-menu-item-content').mouseover(function() {
            TagsShow();
        });

        function TagsShow() {

            $('#' + curentTagId).addClass('main-menu-item-hovered');

            $('#main-menu-item-content').show();
            $('#tagsInMenu_' + curentTagId).show();
        }
    });
