let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");


$(document).ready(function() {
	$('.summernote').summernote({
		placeholder: '',
        tabsize: 2,
        height: 200,
        theme: 'monokai',
         toolbar: [
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		  ]	
	});
		
	$("#btn-write").bind("click", () => {
		location.href="/user/cs/writeform";
	});
	
});

function updateBoard(boardid){
	let data={
		id: boardid,
		title: $("#title").val(),
		content: $("#content").val(),
		secret: $("#secret-check").prop('checked') ? 1 : 0,
	}
	$.ajax({
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token)
		},
		type: "put",
		url:"/user/api/cs-update",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(data),
		dataType:"json"
	}).done(function(response){
		if(response.status == 200){
			alert("게시글 작성 완료");
			location.href="/user/cs";
		}else{
			alert("게시글 작성 실패");
		}
	}).fail(function(){
		alert("게시글 작성 실패");
	})
	
}

function deleteBoard(boardid){
	console.log("delete 호출" + boardid);
	$.ajax({
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token)
		},
		type: "delete",
		url:`/user/api/cs-delete?boardId=${boardid}`,
		dataType:"json"
	}).done(function(response){
		if(response.status == 200){
			location.href="/user/cs"
		}
	}).fail(function(){
		alert("게시글 삭제 실패");
	})
}


function writeBoard(){	
	let data={
		title: $("#title").val(),
		content: $("#content").val(),
		secret: $("#secret-check").prop('checked') ? 1 : 0,
	}
	console.log(data);
	
	$.ajax({
		beforeSend: function(xhr) {
			console.log("xhr: " + xhr)
			xhr.setRequestHeader(header, token)
		},
		type: "post",
		url:"/user/api/cs-write",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(data),
		dataType:"json"
	}).done(function(response){
		if(response.status == 200){
			alert("게시글 작성 완료");
			location.href="/user/cs";
		}
	}).fail(function(){
		alert("게시글 작성 실패");
	})
	
}

function formatDate(createdate){
	let data = createdate.tolSOString.substring(0,10);
	return data;
}

function writeReply(boardid){
	let replydata={
		content: $("#re_content").val(),
	}
	if(replydata.content == ""){
		console.log(replydata.content)
		alert("댓글을 입력해주세요");
		return;
	}
	
	$.ajax({
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token)
		},
		type: "post",
		url:`/user/api/cs-write/reply?boardId=${boardid}`,
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(replydata),
		dataType:"json"
	}).done(function(response){
		if(response.status == 200){
			alert("댓글 등록 완료");
			addReply(response.data);
		}
	}).fail(function(){
		alert("게시글 작성 실패");
	})
	
}
function addReply(data){
	let replyLi = `<li class="reply-list-${data.id }">
								<hr />
								<div class="name time" style="font-size: 20px;">
									<strong>운영자</strong><a style="margin-left: 10px; color: blue;"><time>${data.createTime }</time></a>
								</div>
								<div class="comment_content" style="font-family: sans-serif;">${data.content}</div> 
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<button class="reply-dbtn custom-sm-btn" onclick="deleteReply(${data.id})"><span class="ico ico_reply"></span> 삭제</button>
								</sec:authorize>
							</li>`;
	$("#reply-list-table").prepend(replyLi);
}


function deleteReply(id){
	$.ajax({
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token)
		},
		type: "delete",
		url:`/user/api/cs-delete/reply?replyId=${id}`,
		dataType:"json"
	}).done(function(response){
		if(response.status == 200){
			window.location.reload();
		}
	}).fail(function(){
		alert("게시글 삭제 실패");
	})
}
