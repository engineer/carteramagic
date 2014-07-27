(function ($, window, document, undefined) {

    var COKETO = "menu",
        defaults = {
            toggle: true
        };

    function MOVERSE(element, options) {
        this.element = element;
        this.settings = $.extend({}, defaults, options);
        this._defaults = defaults;
        this._name = COKETO;
        this.init();
    }

    MOVERSE.prototype = {
        init: function () {

            var $this = $(this.element),
                $toggle = this.settings.toggle;

            $this.find('li.active').has('ul').children('ul').addClass('collapse in');
            $this.find('li').not('.active').has('ul').children('ul').addClass('collapse');

            $this.find('li').has('ul').children('a').on('click', function (e) {
                e.preventDefault();

                $(this).parent('li').toggleClass('active').children('ul').collapse('toggle');

                if ($toggle) {
                    $(this).parent('li').siblings().removeClass('active').children('ul.in').collapse('hide');
                }
            });
        }
    };

    $.fn[ COKETO ] = function (options) {
        return this.each(function () {
            if (!$.data(this, "coketo_" + COKETO)) {
                $.data(this, "coketo_" + COKETO, new MOVERSE(this, options));
            }
        });
    };

})(jQuery, window, document);
