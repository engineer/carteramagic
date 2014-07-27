$(function() {

    $('#side-menu').menu();
    //Sidebar Toggle
    $("#tooglenav").click(function(e) {
        e.preventDefault();
             $("#page-wrapper").toggleClass("collapsed");
             $('.navbar-static-side').toggleClass('collapsed');
    });

});


$(function() {
    $(window).bind("load resize", function() {
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    })
})
