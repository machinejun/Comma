let index = {
		init: function(){
			$("#btn-delete").bind("click",() => {
				this.deleteById();
			});
		},
	deleteById: function() {
		let id = $("#user.id");
		$.ajax({
			type:"DELETE",
			url:`/user/delete/${id}`,
			dataType: "json"
		})
		.done(function(data){
			if(data.status){
				alert("삭제가 완료되었습니다.");
				location.href = `/user/searchUsername?role=&q=`;
			}
		})
		.fail(function(){
			alert("삭제 실패");
		});
	}
}

index.init();