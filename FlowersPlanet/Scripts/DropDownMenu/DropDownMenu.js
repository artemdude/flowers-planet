$(document).ready(function() {

    $('#collapseMenu').click(function(e) {

        SetCoordinates();

        $('#menuList').toggle();

        if ($('#menuList').is(':visible')) {
            OpenMenu();
        }
        else {
            CloseMenu();
        }

        e.stopPropagation();
    });

    var cornersOpened = '14px 14px 0 0';
    var corners = '20px';

    function OpenMenu() {
        $('#currentElement').css({ '-moz-border-radius': cornersOpened, '-webkit-border-radius': cornersOpened, 'border-radius': cornersOpened });
        $('#collapseMenu').css({ '-moz-border-radius': '0 14px  0 0 ', '-webkit-border-radius': '0 14px  0 0 ', 'border-radius': '0 14px  0 0 ' });
    }

    function CloseMenu() {
        $('#currentElement').css({ '-moz-border-radius': corners, '-webkit-border-radius': corners, 'border-radius': corners });
        $('#collapseMenu').css({ '-moz-border-radius': '0 20px 20px 0', '-webkit-border-radius': '0 20px 20px 0', 'border-radius': '0 20px 20px 0' });
    }

    function SetCoordinates() {
        var top = $('#currentElement').offset().top;
        var left = $('#currentElement').offset().left;

        $('#menuList').css({ 'top': top + $('#currentElement').outerHeight() - 1, 'left': left });
    }

    $(window).resize(function() {
        SetCoordinates();
    });


    $(document).click(function() {
        $('#menuList').hide();
        CloseMenu();
    });
});