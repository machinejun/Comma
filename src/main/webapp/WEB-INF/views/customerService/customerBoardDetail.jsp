<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<style>
.csdetial-title {
	font-family: 'SUIT-Medium';
}

h3 {
	text-align: center;
}

h6 {
	text-align: right;
	color: rgba(60, 60, 60, 0.8);
}


.csdetail-content {
	padding-top: 20px;
	padding-left: 10px;
	padding-bottom: 20px;
	width: 100%;
	color: black;
	background-color: white;
	border-bottom: 2px solid rgba(208, 205, 205, 0.5);
	border-top: 2px solid rgba(208, 205, 205, 0.5);
	min-height: 250px;
	padding-bottom: 20px;
}

.btn-groub {
	margin-top: 20px;
	float: right;
}

.btn-groub>a {
	color: rgba(60, 60, 60, 0.8);
}

.reply_view {
	background-color: white;
}

.reply-list-table {
	position: relative;
}

.reply-dbtn {
 margin-left: 90%;
}
</style>
<section class="detail">
	<div class="page-title">
		<div class="container">
			<h3 class="csdetial-title">${board.title }</h3>
			<h6 class="csdetial-title">조회수 : ${board.count }</h6>
			<h6 class="csdetial-title">작성자 : ${board.user.username }</h6>
		</div>

	</div>

	<div id="board-list">

		<div class="container justify-content-center">
			<div class="detail-table">

				<div class="csdetail-content container">${board.content}</div>
				<div class="btn-groub">
					<a class="detail-a" href="/user/cs">[목록으로]</a>
					<c:if test="${principal.user.id eq board.user.id }">
						<a class="detail-a" href="/user/cs/updateform/${board.id}">[수정]</a>
						<a class="detail-a" onclick="deleteBoard(${board.id})">[삭제]</a>
					</c:if>
				</div>

				<br />
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div class="reply_view">
						<h5>댓글</h5>
						<div class="dap_lo">
							<div class="dap_to comt_edit"></div>
							<div class="rep_me dap_to"></div>
						</div>

						<div class=>
							<div style="margin-top: 10px;">
								<textarea name="content" class="form-control" id="re_content"></textarea>
								<button style="margin-top: 10px;" id="rep_bt" class="btn btn-dark float-right" onclick="writeReply(${board.id})">댓글</button>
							</div>
						</div>

					</div>
				</sec:authorize>
				<!--- 댓글 불러오기 끝 -->
				<br /> <br />

				<div class="reply-wrap">
					<ol id="reply-list-table" style="padding: 5px; list-style: none;">
						<c:forEach var="reply" items="${board.replys}">
							<li class="reply-list-${reply.id }">
								<hr />
								<div class="name time" style="font-size: 20px;">
									<strong>운영자</strong><a style="margin-left: 10px; color: blue;"><fmt:formatDate pattern="yyyy.MM.dd hh:mm" value="${reply.createTime}" /></a>
								</div>
								<div class="comment_content" style="font-family: sans-serif;">${reply.content }</div> 
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<button class="reply-dbtn custom-sm-btn" onclick="deleteReply(${reply.id})">삭제</button>
								</sec:authorize>
							</li>
						</c:forEach>
					</ol>
				</div>
			</div>
		</div>
	</div>




	<!--- 댓글 불러오기 -->


</section>
<script src="/js/customerService/board.js"></script>
<%@ include file="../layout/footer.jsp"%>