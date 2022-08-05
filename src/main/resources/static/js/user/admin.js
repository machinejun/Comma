let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

let index = {
		init: function(){
			$("#btn-delete").bind("click",() => {
				this.deleteById();
			});
		},
		deleteById: function(userId) {
			let deleteCheck = confirm("삭제하시겠습니까?");
			
			if(deleteCheck){
					console.log("userId 들어오나요 ?" + userId);
			
				$.ajax({
					
					beforeSend: function(xhr) {
							xhr.setRequestHeader(header, token)
						},
					
					type:"DELETE",
					url:"/user/delete/" + userId,
				})
				.done(function(data){
					if(data.status){
						alert("삭제가 완료되었습니다.");
						location.href = `/user/searchUsername?role=&q=`;
					}
				}).fail(function(error){
					console.log(error);
					alert("삭제 실패");
				});
			}
		}
}

index.init();