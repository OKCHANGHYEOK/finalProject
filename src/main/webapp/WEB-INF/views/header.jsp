<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>duo</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="${cpath }/resources/js/chatting.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

* {
	user-select: none;
}

body {
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

body, h1, h2, h3, h4, h5, h6, input, textarea, select {
   font-family: 'Noto Sans KR', sans-serif;
}

header {
	position: fixed;
	color: black;
	z-index: 1;
	top: 0;
	left: 0;
	width: 100%;
	height: 95px;
}

header a {
	text-decoration: none;
	color: inherit;
}

.header {
	width: 100%;
	display: flex;
	justify-content: space-between;
}

#logo {
	flex: 1;
}

#logo>a {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 95px;
}

#logo>a>img {
	max-height: 40px;
}

.frame {
	width: 900px;
	margin: 0 auto;
	padding: 95px 0;
}

#menu {
	display: flex;
	justify-content: space-around;
	align-items: center;
	padding: 0;
	list-style: none;
	color: inherit;
	font-size: 22px;
	flex: 4;
}

#menu>li {
	flex: 1;
	text-align: center;
}

#loginUser {
	display: flex;
	justify-content: center;
	align-items: center;
	flex: 1;
}

.link:hover {
	cursor: pointer;
	color: red;
	font-weight: bold;
}

.drop {
	display: flex;
	position: absolute;
	top: 95px;
	left: 0;
	width: 100%;
	height: 0;
	background-color: white;
	overflow: hidden;
	transition-duration: 0.5s;
}

.drop>div:nth-child(1), .drop>div:nth-child(3) {
	flex: 1;
}

.drop>div:nth-child(2) {
	flex: 4;
	display: flex;
	justify-content: space-around;
}

header:hover>.drop {
	height: 300px;
}

header:hover {
	color: black;
	background-color: white;
}

.drop ul {
	width: 100%;
	padding: 0;
	list-style: none;
	color: grey;
}

.drop ul>li {
	width: 100%;
	text-align: center;
	font-size: 18px;
	font-weight: 200;
	margin-top: 10px;
	font-size: 17px;
}

.hidden {
	display: none !important;
}

hr {
	width: 100%;
	position: fixed;
	top: 95px;
	display: none;
	z-index: 5;
}

header:hover>hr {
	display: block;
}

h1 {
	font-size: 30px;
}

h1, h2 {
	font-weight: 200;
}

	/* 채팅 */
	.room { /* 특정 상대방과의 채팅방 */
		display: flex;
		position: fixed;
		width: 400px;
		height: 600px;
		right: 0;
		bottom: 0;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		z-index: 5;
	}
	
	.chat { /* 채팅방 메인화면 */
		display: flex;
		position: fixed;
		width: 400px;
		height: 600px;
		right: 0;
		bottom: 0;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		z-index: 5;
	}
	
	.chat > div {
		box-sizing: border-box;
	}
	
	#chatTitle {
		background-color: #4B89DC;
		width: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		border: 1px solid black;
	}
	
	.chat_main {
		width: 100%;
		height: 100%;
		border: 1px solid black;
		background-color: white;
	}
	
	#chat_close_btn {
		font-size: 24px;
	    font-weight: bold;
	    color: lime;
	    position: fixed;
	    top: 35%;
	    right: 22%;
	    z-index: 5;
	    transform: translate(5px, 5px);
	}
	
	#chat_close_btn:hover {
		cursor: pointer;
	}
	
	#chat_back_btn {
		font-size: 24px;
	    font-weight: bold;
	    color: lime;
	    position: fixed;
	    top: 35%;
	    right: 22%;
	    z-index: 10;
	    transform: translate(5px, 5px);
	}
	
	#chat_back_btn:hover {
		cursor: pointer;
	}
	
	#chat_open_btn {
		position: fixed;
		bottom: 20px;
		right: 20px;
		width: 70px;
		height: 70px;
		border-radius: 8px;
		background-color: hotpink;
		color: white;
		font-size: 20px;
		display: flex;
		justify-content: center;
		align-items: center;
		z-index: 10;
	}
	
	#chat_open_btn:hover {
		cursor: pointer;
	}
	
	#chat_open_btn > span {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	
	
	
	.chatroom {
		width: 100%;
		height: 50px;
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: 20px;
		font-weight: 300;
	}
	
	.chatroom:hover {
		cursor: pointer;
		background-color: skyblue;
	}
	
	#chat_heart {
		font-size: 50px;
		transform: translate(-50%, -55%) !important;
	}
	
	.messageArea {
		width: 100%;
		height: 100%;
		border: 1px solid black;
		background-color: #aeceef;
		overflow-y: scroll;
	}
	
	.messageArea::-webkit-scrollbar {
    	display: none; 
	}
	
	.chatting {
		width: 100%;
		height: 80px;
		background-color: white;
		display: flex;
		justify-content: space-between;
	}
	
	.chatMsg {
		all: unset;
		border: 1px solid black; 
		flex : 3;
		height: 100%;
		resize: none;
		box-sizing: border-box;
		padding: 5px;
		flex: 3;
	}
	
	.sendMsg {
		all: unset;
		flex: 1;
		height: 100%;
		background-color: yellow;
		font-weight: bold;
		text-align: center;
		border: 2px solid black;
		box-sizing: border-box;
	}
	
	.leftMsg {
		margin-top: 10px;
		margin-left: 10px;
		display: flex;
		align-items: flex-start;
		flex-direction: column;
	}
	
	.rightMsg {
		margin-top: 20px;
		margin-right: 5px;
		display: flex;
		align-items: flex-end;
		flex-direction: column;
	}
	
	.leftMsg > div {
		position: relative;
		width: fit-content;
		min-width: 30px;
		max-width: 150px;
		max-height: 300px;
		border-radius: 10px;
		background-color: white;
		box-sizing: border-box;
		padding: 5px;
		margin-left: 35px;
		margin-bottom: 10px;
		transform: translate(10px, -14px);
	}
	
	.rightMsg > div {
		position: relative;
		width: fit-content;
		min-width: 30px;
		max-width: 150px;
		max-height: 300px;
		border-radius: 5px;
		background-color: yellow;
		box-sizing: border-box;
		padding: 5px;
		margin-right: 10px;
		margin-bottom: 10px;
	}
	
	.leftMsg > div::before {
		content: '';
	    position: absolute;
	    right: 100%;
	    margin-top: -8px;
	    border-width: 10px;
	    border-style: solid;
	    border-color: transparent transparent transparent #ffffff;
	    transform: rotate(105deg) translate(0, -11px);
	}
	
	.rightMsg > div::before {
		content: '';
	    position: absolute;
	    left: 100%;
	    margin-top: -15px;
	    border-width: 10px;
	    border-style: solid;
	    border-color: transparent #ffff00 transparent transparent;
	    transform: rotate(20deg) translate(-18px, 8px);
	}
	
	
	.leftMsg sub {
		font-size: 12px;
	    position: absolute;
	    top: 100%;
	    left: 100%;
	    width: 70px;
	    transform: translate(6px, -16px);
   	}
   	
   	.rightMsg sub {
	    font-size: 12px;
	    position: absolute;
	    width: 70px;
	    top: 100%;
	    right: 100%;
	    transform: translate(2px, -16px);
   	}
   	
   	#oponent {
   		display: flex;
   	}
   	
   	#oponent_profile {
   		display: inline-block;
   		width: 35px;
   		height: 35px;
   		border-radius: 5px;
   		background-position: center;
   		background-size: 100%;
   		margin-right: 10px;
   	}
   	
   	.chatOpt {
   		position: absolute;
   		top: 0;
   		left: 0;
   	}
   	
   	#kick {
   		all: unset;
   		font-size: 13px;
   		display: inline-block;
   		width: 68px;
   		height: 30px;
   		border: 2px solid hotpink;
   		color: hotpink;
   		text-align: center;
   		background-color: white;
   	}
   	
   	#kick:hover {
   		cursor: pointer;
   	}
   	
   	.matchingEnd {
		position: fixed;
	    display: flex;
	    width: 250px;
	    height: 100px;
	    flex-direction: column;
	    justify-content: center;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    background-color: rgba(0, 0, 255, 0.5);
	    align-items: center;
	    border-radius: 20px;
   	}
   	
   	
   	.matchingEnd button {
   		all: unset;
   		cursor: pointer;
   		color: white;
   		font-weight: bold;
   		text-align: center;
   	}
   	
   	.disconnect {
		position: absolute;
   		top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
   		background-color: rgba(0, 0, 0, 0.6);
   		display: flex;
	    width: 600px;
	    height: 860px;
   		justify-content: center;
   		align-items: center;
   		color: white;
   		font-size: 17px;
   		font-weight: bold;
   		z-index: 5;
   	}
   	
   	#disconnectMsg {
   		text-align: center;
   	}
   	
   	#disconnectMsg > a {
   		all: unset;
   		margin-top: 10px;
   	}
   	
   	#disconnectMsg > a:hover {
   		cursor: pointer;
   		color: lightgrey;
   	}
   	
   	.talkAlarm {
   		position: fixed;
   		top: 50%;
   		left: 50%;
   		border-radius: 10px;
   		transform: translate(-50%, -50%);
   		background-color: rgba(0, 0, 0, 0.7);
   		display: flex;
   		justify-content: center;
   		align-items: center;
   		width: 300px;
   		flex-direction: column;
   		height: 200px;
   		z-index: -5;
   		opacity: 0;
   		transition-duration: 1s;
   	}
   	
   	#ch_alarm {
   		width: 100%;
   		height: 70%;
   		font-size: 16px;
   		color: white;
   		display: flex;
   		justify-content: center;
   		align-items: center;
   	}
   	
   	#ch_alarm_btns {
   		display: flex;
   		width: 100%;
   		height: 30%;
   	}
   	
   	#ch_alarm_btns > button {
   		all: unset;
   		width: 100%;
   		color: white;
   		font-size: 16px;
   		font-weight: bold;
   		text-align: center;
   	}
   	
   	#ch_alarm_btns > button:hover {
   		cursor: pointer;
   		color: lightgrey;
   	}
   	
   	#ch_alarm_profile {
   		width: 50px;
   		height: 50px;
   		border-radius: 10px;
   		background-position: center;
   		background-size: 100%;
   		background-repeat: no-repeat;
   	}
   	
   	#ch_alarm_text {
   		white-space: nowrap; 
    	overflow: hidden; 
    	text-overflow: ellipsis; 
    	width: 200px;
    	transform: translate(30px);
   	}
   	
   	#matchingMessage {
	   position: fixed;
	   left: 30%;
	   bottom: 200%;
	   width: 500px;
	   height: 200px;
	   background-color: white;
	   box-shadow: 1px 1px 1px grey;
	   border-radius: 20px;
	   display: flex;
	   justify-content: center;
	   align-items: center;
	   font-size: 14px;
	   transition-duration: 1s;
	   z-index: 3;
	}
</style>
</head>
<body>
	

	<header>
		<div class="header">
			<div id="logo">
				<a href="${cpath }"><img src="https://www.duo.co.kr/html/main_img_2019/logo.svg"></a>
			</div>
			<ul id="menu">
				<li category="match">듀세요소개</li>
				<li category="guide">가입안내</li>
				<li>고객문의</li>
				<li category="marrige">회원&성혼</li>
				<li>러브테스트</li>
				<li category="membership">파티&이벤트</li>
			</ul>
			<div id="loginUser">
				<h2 style="color: inherit;" class="${empty login ? 'hidden' : '' }">${login.username }
					님 로그인 중</h2>
			</div>
		</div>
		<hr style="border: 0; height: 1px; background-color: lightgrey;">
		<div class="drop">
			<div></div>
			<div>
				<ul>
					<li class="link" id="match_mainLink" category="match"><a href="${cpath}/match/match_main?userid=${login.userid}">매칭</a></li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
				<ul>
					<li class="link" id="logLink"
						value="${empty login ? 'login' : 'logout' }" category="guide">
						<a href="${cpath }/member/${empty login ? '/login' : '/logout'}">${empty login ? '로그인' : '로그아웃' }</a>
						
					</li>
					<li class="link" id="joinLink" category="guide">
						<a href="${cpath }/member/join">회원가입</a>
					</li>
					<li class="link" id="mypageLink" category="guide">
						<a href="${cpath }/member/mypage">마이페이지</a>
					</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
				<ul>
					<li class="link" id="reportLink" category="inquiry">
						<a href="${cpath }/report/myreport">신고</a>
					</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
				<ul>
					<li class="link" id="marrigeReviewLink" category="marrige">
						<a href="${cpath }/review/list/1">성혼커플 인터뷰</a>
					</li>
						
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
				<ul>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
				<ul>
					<li class="link" id="membershipLink" category="membership">
						<a href="${cpath }/membership/purchase">멤버십</a>
					</li>
               		<li class="link" id="membershipIntroduceLink" category="membership">
               			<a href="${cpath }/membership/introduce">멤버십 소개</a>
               		</li>
               		<li class="link" id="myMembershipLink" category="membership">
               			<a href="${cpath }/membership/myMembership">마이멤버십</a>
               		</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
			</div>
			<div></div>
		</div>
	</header>
	
	<section class="chat hidden">
		<div id="chatTitle">
			<h2 style="text-align: center; color: white; margin: 0;">CHAT</h2>
		</div>
		

		<div class="chat_main">
			<h2 style="text-align:center; font-weight: 300;">대화상대</h2>
		</div>
	</section>
	<div class="hidden" id="chat_close_btn" onclick="chatAppearHandler()">➖</div>
	<div class="hidden" id="chat_back_btn" onclick="showMainChatHandler()">↩</div>


	<div class="${empty login ? 'hidden' : '' }" id="chat_open_btn" onclick="chatAppearHandler()">
		<span id="chat_heart">💗</span>
		<span>CHAT</span>
	</div>
	
	<div id="matchingMessage"></div>
	
	<div class="talkAlarm">
		<div id="ch_alarm">상대방으로부터 메시지가 왔습니다</div>
		<div id="ch_alarm_btns">
			<button onclick="chatRoomHandler(event)">보기</button>
			<button onclick="alarmClose()">닫기</button>
		</div>
	</div>
	
	<script src="${cpath }/resources/js/chatting_bottom.js"></script>
	
	<script>
		// 로그인 중인 유저 확인
		const user = '${login.userid}'
		const username = '${login.username}'
		const cpath = '${cpath}'
		const sockJS = new SockJS(cpath + '/endpoint') // WebSocket 엔드포인트 설정
		const stomp = Stomp.over(sockJS)
		
		function onReceive(chat) {
	         const content = JSON.parse(chat.body)
	         const text = content.text
	         const matchingMessage = document.getElementById('matchingMessage')
	         matchingMessage.innerText = text
	         matchingMessage.style.bottom = '80%' 
     	}

		
		// 채팅 리스트 가져오는 함수
		const getList = async function() {
			const url =  cpath + '/matchAjax/matchList/' + user
			
			const list = await fetch(url).then(resp => resp.json())
			
			return list
		}

		// 매칭 진행중(채팅중인 상대방)인 채팅방 생성/구독
		const chatListLoadHandler =  function() {
			stomp.connect({}, async function() {
				
				stomp.subscribe('/broker/' + user, onReceive)
				
				function ping() {
					stomp.send('/app/ping', {}, "")
				}
			
				setInterval(ping, 30000)
			
				const list = await getList()
				
				if(list.length == 0) {
					const chatArea = document.querySelector('.chat')
					chatArea.querySelector('.chat_main').innerHTML += '<p align="center">현재 대화 가능한 상대가 없습니다.</p>'
					return;
				}
				
				
				list.forEach(async dto => {
					const chatArea = document.querySelector('.chat') // 채팅방 메인창
					const roomName = dto.reqUser + dto.respUser
					const oponent = (dto.reqUsername == '${login.username}' ? dto.respUsername  : dto.reqUsername )
					let oponentId = (dto.reqUser == '${login.userid}' ? dto.respUser : dto.reqUser)
					
					
					// 대화 상대 리스트 생성
					let tag = ''
					tag += '<div class="chatroom" roomname="' + roomName + '" onclick="chatRoomHandler(event)">' + oponent + '님 과의 채팅방</div>' 
					chatArea.querySelector('.chat_main').innerHTML += tag
					
					// 각 방에 구독
					stomp.subscribe('/broker/chat/' + roomName, receiveChat)
					stomp.send('/app/enter', {}, "")
					
					// 채팅 목록 불러오기
					const url =  cpath + '/chat/load'
					const ob = {
							reqUser : dto.reqUser,
							respUser : dto.respUser
					}
					const opt = {
							method: "POST",
							body: JSON.stringify(ob),
							headers: {
								"Content-Type" : "application/json; charset=utf-8"
							}
					}
					const chatList = await fetch(url, opt).then(resp => resp.json())

					// 채팅방 생성
					let room = ''
					room += '<section class="room hidden" roomname="' + roomName +'">'
					room += 	'<div id="chatTitle">'
					room += 		'<h2 style="text-align: center; color: white; margin: 0;">' + oponent + '</h2>'
					room += 	'</div>'
					room += 	'<div class="messageArea" roomname="' + roomName +'">'
					
					
					// 불러온 채팅 목록을 미리 채팅방에 추가
					chatList.forEach(chat => {
						let str = ''
						
						str += '<div class="' + (chat.sendUserId == '${login.userid}' ? 'rightMsg' : 'leftMsg') + '">'
						str += '<label class="' + (chat.sendUserId == '${login.userid}' ? 'hidden' : '' ) + '" id="oponent">'
						let profileURL = cpath + '/upload/' + chat.profile
						str += '<span id="oponent_profile" style="background-image: url(\'' + profileURL +'\')"></span>'
						str += '<span style="font-size: 12px;">' + chat.sendUser + '</span>'
						str += '</label>'
						str += '<div>'
						str += '<span style="font-size: 12px;">' + chat.text + '</span>'
						str += '<br><sub>' + chat.sendTime.split("-")[1] + '</sub>'
						str += '</div>'
						str += '</div>'
						room += str
					})
					
					
					room += 	'</div>'
					room += 	'<div class="chatting" roomname="' + roomName + '" oponent="' + oponentId + '">'
					room +=			'<textarea class="chatMsg" placeholder="메시지 입력" onkeyup="sendChat(event)"></textarea>'
					room +=  		'<button class="sendMsg" onclick="onInput(event)">보내기</button>'
					room +=		'</div>'
					room +=  '</section>'
					
					document.body.innerHTML += room
				})
			})	
		}
		if(user != '') {
			document.addEventListener('DOMContentLoaded', chatListLoadHandler)
		}
	</script>
	