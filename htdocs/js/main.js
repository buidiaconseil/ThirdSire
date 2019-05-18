AOS.init({ duration: 800, easing: "slide" }),
    function(s) { "use strict";
        s(window).stellar({ responsive: !0, parallaxBackgrounds: !0, parallaxElements: !0, horizontalScrolling: !1, hideDistantElements: !1, scrollProperty: "scroll" });
        s(".js-fullheight").css("height", s(window).height()), s(window).resize(function() { s(".js-fullheight").css("height", s(window).height()) });
        setTimeout(function() { 0 < s("#ftco-loader").length && s("#ftco-loader").removeClass("show") }, 1), s.Scrollax();
        s(".carousel-testimony").owlCarousel({ autoplay: !0, autoHeight: !0, center: !0, loop: !0, items: 1, margin: 30, stagePadding: 0, nav: !1, dots: !0, navText: ['<span class="ion-ios-arrow-back">', '<span class="ion-ios-arrow-forward">'], responsive: { 0: { items: 1 }, 600: { items: 1 }, 1e3: { items: 1 } } }), s(".carousel-causes").owlCarousel({ autoplay: !0, autoHeight: !0, center: !0, loop: !0, items: 1, margin: 30, stagePadding: 0, nav: !1, dots: !0, navText: ['<span class="ion-ios-arrow-back">', '<span class="ion-ios-arrow-forward">'], responsive: { 0: { items: 1 }, 600: { items: 3 }, 1e3: { items: 5 } } }), s("nav .dropdown").hover(function() { var a = s(this);
            a.addClass("show"), a.find("> a").attr("aria-expanded", !0), a.find(".dropdown-menu").addClass("show") }, function() { var a = s(this);
            a.removeClass("show"), a.find("> a").attr("aria-expanded", !1), a.find(".dropdown-menu").removeClass("show") }), s("#dropdown04").on("show.bs.dropdown", function() { console.log("show") });
        s(window).scroll(function() { var a = s(this).scrollTop(),
                e = s(".ftco_navbar"),
                o = s(".js-scroll-wrap");
            150 < a && (e.hasClass("scrolled") || e.addClass("scrolled")), a < 150 && e.hasClass("scrolled") && e.removeClass("scrolled sleep"), 350 < a && (e.hasClass("awake") || e.addClass("awake"), 0 < o.length && o.addClass("sleep")), a < 350 && (e.hasClass("awake") && (e.removeClass("awake"), e.addClass("sleep")), 0 < o.length && o.removeClass("sleep")) });
        s("#section-counter, .hero-wrap, .ftco-counter, .ftco-volunteer").waypoint(function(a) { if ("down" === a && !s(this.element).hasClass("ftco-animated")) { var o = s.animateNumber.numberStepFactories.separator(",");
                s(".number").each(function() { var a = s(this),
                        e = a.data("number");
                    console.log(e), a.animateNumber({ number: e, numberStep: o }, 7e3) }) } }, { offset: "95%" });
        s(".ftco-animate").waypoint(function(a) { "down" !== a || s(this.element).hasClass("ftco-animated") || (s(this.element).addClass("item-animate"), setTimeout(function() { s("body .ftco-animate.item-animate").each(function(a) { var e = s(this);
                    setTimeout(function() { var a = e.data("animate-effect"); "fadeIn" === a ? e.addClass("fadeIn ftco-animated") : "fadeInLeft" === a ? e.addClass("fadeInLeft ftco-animated") : "fadeInRight" === a ? e.addClass("fadeInRight ftco-animated") : e.addClass("fadeInUp ftco-animated"), e.removeClass("item-animate") }, 50 * a, "easeInOutExpo") }) }, 100)) }, { offset: "95%" });
        s(".smoothscroll[href^='#'], #ftco-nav ul li a[href^='#']").on("click", function(a) { a.preventDefault(); var e = this.hash,
                o = s(".navbar-toggler");
            s("html, body").animate({ scrollTop: s(e).offset().top }, 700, "easeInOutExpo", function() { window.location.hash = e }), o.is(":visible") && o.click() }), s("body").on("activate.bs.scrollspy", function() { console.log("nice") }), s(".image-popup").magnificPopup({ type: "image", closeOnContentClick: !0, closeBtnInside: !1, fixedContentPos: !0, mainClass: "mfp-no-margins mfp-with-zoom", gallery: { enabled: !0, navigateByImgClick: !0, preload: [0, 1] }, image: { verticalFit: !0 }, zoom: { enabled: !0, duration: 300 } }), s(".popup-youtube, .popup-vimeo, .popup-gmaps").magnificPopup({ disableOn: 700, type: "iframe", mainClass: "mfp-fade", removalDelay: 160, preloader: !1, fixedContentPos: !1 }) }(jQuery);