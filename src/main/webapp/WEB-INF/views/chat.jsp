<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Chatting</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating p{
			color: #fff;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
	</style>
</head>

<script type="text/javascript">
	var ws;
	var isShow= false;

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chatting");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				$("#chating").append("<p>" + msg + "</p>");
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var uN = $("#userName").val();
		var msg = $("#chatting").val();
		ws.send(uN+" : "+msg);
		$('#chatting').val("");
	}
	
	function showUserList(){
		if(isShow == false){
			$("#user-list").fadeIn();
			isShow = true;
		}else{
			$("#user-list").fadeOut();
			isShow=false;
		}
		
	}
</script>
<body>
	<div id="container" class="container" style="position: relative;">
		<h1>채팅</h1>
		<a onclick="showUserList()" style="color: orange; position: absolute;  right: 5%; top:10%; z-index: 4">유저목록</a>
		<div id="chating" class="chating"  style="position: relative; overflow-x:hidden; ">
			<div id="user-list" style="background-color: transparent; color: white; position: absolute ; z-index: 3;   right: -1%; display:none;">		
				<ul >
					<li style="width: 100px; list-style:none; text-align: center">sample1</li>
					<li style="width: 100px; list-style:none; text-align: center">sample2</li>
					<li style="width: 100px; list-style:none; text-align: center">sample3</li>
					<li style="width: 100px; list-style:none; text-align: center">sample4</li>
					<li style="width: 100px; list-style:none; text-align: center">sample5</li>
					<li style="width: 100px; list-style:none; text-align: center">sample6</li>
					<li style="width: 100px; list-style:none; text-align: center">sample7</li>
					<li style="width: 100px; list-style:none; text-align: center">sample8</li>
					<li style="width: 100px; list-style:none; text-align: center">sample9</li>
					<li style="width: 100px; list-style:none; text-align: center">sample10</li>
					<li style="width: 100px; list-style:none; text-align: center">sample11</li>
					<li style="width: 100px; list-style:none; text-align: center">sample12</li>
					<li style="width: 100px; list-style:none; text-align: center">sample13</li>
					<li style="width: 100px; list-style:none; text-align: center">sample14</li>
					<li style="width: 100px; list-style:none; text-align: center">sample15</li>
					<li style="width: 100px; list-style:none; text-align: center">sample16</li>
					<li style="width: 100px; list-style:none; text-align: center">sample17</li>
					<li style="width: 100px; list-style:none; text-align: center">sample18</li>
					<li style="width: 100px; list-style:none; text-align: center">sample19</li>
					<li style="width: 100px; list-style:none; text-align: center">sample20</li>
					<li style="width: 100px; list-style:none; text-align: center">sample21</li>
					<li style="width: 100px; list-style:none; text-align: center">sample22</li>
					<li style="width: 100px; list-style:none; text-align: center">sample23</li>
					<li style="width: 100px; list-style:none; text-align: center">sample24</li>
					<li style="width: 100px; list-style:none; text-align: center">sample25</li>
				</ul>
			</div>
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<input type="hidden" value="${principal.user.username}"/>
					<th><input type="text" name="userName" id="userName"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>