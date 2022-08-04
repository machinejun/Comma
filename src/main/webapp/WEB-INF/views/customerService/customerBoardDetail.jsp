<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<section class="notice">
	<div class="page-title">
        <div class="container">
            <h3 class="font-weight-bold">title : ${board.title }</h3>
            <h6 class="font-weight-bold float-right p-3">조회수 : ${board.count }</h6>
            <h6 class="font-weight-bold float-right p-3">작성자 : ${board.user.username }</h6>    
        </div>
        
    </div>
	        
	<div id="board-list">
	 	
        <div class="container justify-content-center">
        <hr/>
            <div class="detail-table">
            	
            	<div class="container justify-content-center">
            		${board.content}
        		</div>
	            <div class="float-right">    		
		             <a class="detail-a" href="/">[목록으로]</a>
		             <c:if test="${principal.user.id eq board.user.id }">
		             	<a class="detail-a" href="/board/update/${board.id}">[수정]</a>
		             	<a class="detail-a" onclick="deleteBoard(${board.id})">[삭제]</a>
		             </c:if>
		        </div>
		        <hr/>
		        <br/>
		        <div class="reply_view">
				    <h5>댓글</h5>
				        <div class="dap_lo">
				            <div class="dap_to comt_edit"></div>
				            <div class="rep_me dap_to"></div>
				        </div>
 					<sec:authorize access="hasRole('ROLE_ADMIN')">
 						<div class=>					        
					            <div style="margin-top:10px;">
					                <textarea name="content" class="form-control" id="re_content" ></textarea>
					                <button style="margin-top:10px;" id="rep_bt" class="btn btn-dark float-right" onclick="writeReply(${board.id})">댓글</button>
					            </div>
					    </div>
 					</sec:authorize>  
				</div><!--- 댓글 불러오기 끝 --> 
				<br/> <br/>

				<div class="reply-wrap">
					<ol id="reply-list-table" style="background-color: #EBE5E5; padding: 5px">
						<c:forEach var="reply" items="${board.replys}">
							<li class="reply-list-${reply.id }">
								<hr/>
								<div class="name time"  style="font-size: 20px; ">
									<strong>${board.user.username}</strong><a  style="margin-left: 10px; color: blue;"><time>${reply.createTime }</time></a>
								</div>
								<div class="comment_content" style="font-family: sans-serif;">${reply.content }</div>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<a class="btn icon block reply" onclick="deleteReply(${reply.id})"><span class="ico ico_reply"></span> 삭제</a>
								</sec:authorize>  
							</li>
						</c:forEach>
					</ol>		
			</div>
		</div>
	</div> 
	   
	 
	       
	  
	
	  <!--- 댓글 불러오기 -->
	  
	
</section> 
<script src="/js/customerService/board.js"></script>
<%@ include file="../layout/footer.jsp" %>