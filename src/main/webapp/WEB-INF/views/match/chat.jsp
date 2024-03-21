<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
	.chat {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
	.chat > div {
		box-sizing: border-box;
	}
	
	#chatTitle {
		background-color: #4B89DC;
		width: 600px;
		display: flex;
		justify-content: center;
		align-items: center;
		border: 1px solid black;
	}
	
	.messageArea {
		width: 600px;
		height: 700px;
		border: 1px solid black;
		background-color: #aeceef;
		overflow-y: scroll;
	}
	
	.messageArea::-webkit-scrollbar {
    	display: none; 
	}
	
	.chatting {
		width: 600px;
		height: 80px;
		background-color: white;
		display: flex;
		justify-content: space-between;
	}
	
	#chatMsg {
		all: unset;
		border: 1px solid black; flex : 3;
		height: 100%;
		resize: none;
		box-sizing: border-box;
		padding: 5px;
		flex: 3;
	}
	
	#sendMsg {
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
		width: 200px;
		max-height: 500px;
		border-radius: 10px;
		background-color: white;
		box-sizing: border-box;
		padding: 5px;
		margin-left: 35px;
		margin-bottom: 10px;
	}
	
	.rightMsg > div {
		position: relative;
		width: 200px;
		max-height: 500px;
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
	    right: 94%;
	    margin-top: -8px;
	    border-width: 10px;
	    border-style: solid;
	    border-color: transparent transparent transparent #ffffff;
	    transform: rotate(105deg);
	}
	
	.rightMsg > div::before {
		content: '';
	    position: absolute;
	    left: 90%;
	    margin-top: -15px;
	    border-width: 10px;
	    border-style: solid;
	    border-color: transparent #ffff00 transparent transparent;
	    transform: rotate(25deg);
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
</style>


<script>
	function getCurrentHHmm() {
	    const d = new Date();
	    let h = d.getHours();
	    let m = d.getMinutes();
	    let ampm = '오전';
	
	    // 시간이 12 이상인 경우 오후로 표시하고, 12를 빼줌
	    if (h >= 12) {
	        ampm = '오후';
	        h -= 12;
	    }
	
	    // 시간이 0인 경우 12로 변경 (자정 처리)
	    if (h === 0) {
	        h = 12;
	    }
	
	    // 한 자리 숫자일 경우 앞에 0을 붙임
	    if (h < 10)
	        h = '0' + h;
	    if (m < 10)
	        m = '0' + m;
	
	    return ampm + ' ' + h + ':' + m;
	}


	function receiveChat(chat) {
		const content = JSON.parse(chat.body)
		const from = content.from
		const text = content.text
		const time = content.time
		const profile = content.profile
		const profileUrl = cpath + '/upload/' + profile
		console.log(profile)
		let str = ''
		str += '<div class="' + (from == username ? 'rightMsg' : 'leftMsg')
				+ '">'
 	    str += '<label class="' + (from == username ? 'hidden' : '') + '" id="oponent">'
		str += '<span id="oponent_profile" style="background-image: url(\'' + profileUrl + '\')"></span>'
		str += '<span style="font-size: 12px;">' + from + '</span>'
		str += '</label>'
		str += '<div>'
		str += '<span style="font-size: 13px;">' + text + '</span>'
		str += '<br><sub>' + content.time + '</sub>'
		str += '</div></div>'
		
		messageArea.innerHTML += str
	}

	function entering() {
		console.log('채팅방 입장~')
		stomp.subscribe('/broker/chat', receiveChat)
		stomp.send('/app/enter', {}, "")
	}

	
	function onInput(){
		const text = document.getElementById('chatMsg').value
		if(text == ''){
		   return
		 }
		document.getElementById('chatMsg').value = ''
		      
		stomp.send('/app/message/', {}, JSON.stringify({      // 서버에게 입장 메시지와 시간을 보낸다.
		    from: username,
		    to: '${oponent}',
		    text: text,
		    time: getCurrentHHmm(),
		    userid : '${login.userid}'
		    }))
		   document.getElementById('chatMsg').focus()
		}
	
	const username = '${login.username}'
</script>

<section class="chat frame">
	<div id="chatTitle">
		<h2 style="text-align: center; color: white;">${oponent }님과의 채팅방</h2>
	</div>

	<div class="messageArea">
		<c:forEach var="msg" items="${list }">
			<div class="${msg.sendUser == login.username ? 'rightMsg' : 'leftMsg'}">
				<label class="${msg.sendUser == login.username ? 'hidden' : ''}" id="oponent">
					<span id="oponent_profile" style="background-image: url('${cpath}/upload/${msg.profile }');"></span>
					<span style="font-size: 12px;">${msg.sendUser }</span>
				</label>
				<div>
					<span style="font-size: 12px;">${msg.text }</span>
					<br><sub>${(msg.sendTime).split("-")[1] }</sub>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="chatting">
		<textarea id="chatMsg" placeholder="메시지 입력"></textarea>
		<button id="sendMsg">보내기</button>
	</div>
</section>

<script>
	const sendBtn = document.getElementById('sendMsg')
	const messageArea = document.querySelector('.messageArea')
	const chatMsg = document.getElementById('chatMsg')
	
	stomp.connect({}, entering)
	
	sendBtn.onclick = onInput
	chatMsg.onkeyup = function(e) {
		if(e.key == 'Enter') onInput()
	}
	
	messageArea.scrollTop = messageArea.clientHeight
</script>

</body>
</html>
