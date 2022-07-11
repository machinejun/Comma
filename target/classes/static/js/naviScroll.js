var didScroll;

var st = $(this).scrollTop();
var lastScrollTop = 0;
var delta = 5;  // 동작의 구현이 시작되는 위치 
var navbarHeight = $("header").outerHeight();  // 영향을 받을 요소를 선택


$(window).scroll(function(event){
    didScroll = true;
});


setInterval(function() {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
 
}
