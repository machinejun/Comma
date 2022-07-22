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
	const headerheight = document.querySelector('nav').clientHeight;
		function onScroll(){
			const scrollposition = pageYOffset;
			isShow = $("#isNaviFocus").val();
			if (scrollposition < headerheight + 100){
				$("#naviBar").show();
				$("#user-btn-header").show();
				return;
			}
			else if (scrollposition > last || scrollposition<= headerheight) {
				if(isShow != 0){
					return;
				}
				$("#naviBar").hide();
				$("#user-btn-header").hide();
				$("#user-box-header").hide();
			}else if (scrollposition<last) {	
				if(isShow != 0){
					return;
				}
				$("#naviBar").show();
				$("#user-btn-header").show();
			}
			last = scrollposition; 
		}
}
upnav();