
function openUserBox(){
	isShow = $("#isUserTable").val();
	if(isShow == 0 ){
		$("#user-box-header").show();
		$("#isUserTable").attr('value',1);

	}else{
		$("#user-box-header").hide();
		$("#isUserTable").attr('value',0);
	}	
}

function upnav () {
	document.addEventListener('scroll', onScroll, { passive: true });
	var last = 0;
	const nav = document.querySelector('nav');
	var range = 10;
	const headerheight = document.querySelector('nav').clientHeight;
		function onScroll(){
			console.log("스크롤 이벤트");
			var userbtn = document.querySelector(".user-btn");
			const scrollposition = pageYOffset;
			isShow = $("#isNaviFocus").val();
			if (Math.abs(scrollposition) <= range){
				return;
			}
			else if (scrollposition > last || scrollposition<= 10) {
				if(isShow != 0){
					return;
				}
				$("#user-btn-header").hide();
				$("#user-box-header").hide();
			}else if (scrollposition<last) {	
				if(isShow != 0){
					return;
				}	
				$("#user-btn-header").show();
			}
			last = scrollposition;
		}
}
upnav();