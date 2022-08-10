<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/customerServiceStyle/customerService.css" rel="stylesheet">
<!-- Page Content -->
<c:set var="isMine" value=""/>
<c:set var="isNotMine" value="hrefDisabled"/>

<section class="notice">
	<div class="page-title">
		<div class="container">
			<h3 class="font-weight-bold">고객센터</h3>
		</div>
	</div>

	<!-- board seach area -->
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<form action="/" method="get">
					<div class="search-wrap">
						<label for="search" class="blind">공지사항 내용 검색</label> <input id="search" type="search" name="q" placeholder="검색어를 입력해주세요." value="">
						<button type="submit" class="btn btn-dark">검색</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- board list area -->
	<div id="board-list">
		<div class="container">
			<table class="board-table">
				<thead>
					<tr>
						<th scope="col" class="th-num">번호</th>
						<th scope="col" class="th-title">제목</th>
						<th scope="col" class="th-title">작성자</th>
						<th scope="col" class="th-date">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="${notices}">
						<tr>
							<td style="color: red;">공지사항</td>
							<th><a class="cs-detail" style="color: red;" onclick="location.href='/user/cs/detail/${notice.id}'"><i class="bi bi-megaphone-fill"></i>&nbsp;${notice.title}</a></th>
							<td>${notice.user.username}</td>
							<td>${notice.createTime}</td>
						</tr>
					</c:forEach>
					<c:forEach var="board" items="${boards.content}">
						<tr>
							<c:choose>
								<c:when test="${board.secret eq 1 }">
									<td>${board.id}</td>
									<th><a class="cs-detail" onclick="location.href='/user/cs/detail/${board.id}'"><i class="bi bi-lock-fill"></i>&nbsp;${board.title }</a></th>
								</c:when>
								<c:otherwise>
									<td>${board.id}</td>
									<th><a class="cs-detail" onclick="location.href='/user/cs/detail/${board.id}'">&nbsp;${board.title }</a></th>
								</c:otherwise>
							</c:choose>
							<td>${board.user.username}</td>
							<td>${board.createTime}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<!-- 페이지네이션 -->
			<div style="text-align: center">
				<div class="pagination">

					<div style="width: 35%; margin: 5px;">
						<c:if test="${boards.first ne true}">
							<a class="abutton" href="/user/cs?page=0">first</a>
							<a class="abutton" href="/user/cs?page=${boards.number - 1 }">◀</a>
						</c:if>

					</div>

					<div style="width: 30%; margin: 5px;">
						<c:forEach var="num" items="${pageNums }">
							<c:choose>
								<c:when test="${num eq boards.number}">
									<span class=""><a href="/user/cs?page=${num}" style="font-weight: bold; font-size: 18px;">${num + 1}</a></span>
								</c:when>
								<c:otherwise>
									<span class=""><a href="/user/cs?page=${num}">${num + 1}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>

					<div style="width: 35%; margin: 5px;">
						<c:if test="${boards.last ne true}">
							<a class="abutton" href="/user/cs?page=${boards.number + 1 }">▶</a>
							<a class="abutton" href="/user/cs?page=${boards.totalPages -1 }">last</a>
						</c:if>
					</div>

				</div>
			</div>
			<button id="btn-write" class="custom-sm-btn float-right ${principal.username eq null ? isNotlogin : islogin}">글쓰기</button>

		</div>
	</div>
</section>
<script src="/js/customerService/board.js"></script>
<%@ include file="../layout/footer.jsp"%>
