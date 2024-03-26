// 채팅방 온/오프 함수
function chatAppearHandler() {
	const chatArea = document.querySelector('.chat') // 채팅방 메인창
	const chatOpenBtn = document.getElementById('chat_open_btn')  // 채팅방 온 버튼
	const chatCloseBtn = document.getElementById('chat_close_btn')// 채팅방 오프 버튼
	chatArea.classList.toggle('hidden')
	chatOpenBtn.classList.toggle('hidden')
	chatCloseBtn.classList.toggle('hidden')
}
	   
// 채팅방 목록 화면으로 되돌아가는 함수
function showMainChatHandler() {
	const chatArea = document.querySelector('.chat')
	// room 클래스를 가진 모든 요소를 가져옵니다.
	const rooms = document.querySelectorAll('.room')

	// hidden 클래스가 없는 요소를 저장할 변수를 생성합니다.
	let visibleRoom = null

	// rooms 요소들을 순회하면서 hidden 클래스가 없는 요소를 찾습니다.
	rooms.forEach(room => {
		if (!room.classList.contains('hidden')) {
	       visibleRoom = room
	       return; // hidden 클래스가 없는 요소를 찾았으므로 반복문을 종료합니다.
		   }
		})
	chatArea.classList.remove('hidden')
	visibleRoom.classList.toggle('hidden')
}


// 채팅방 클릭시 해당 채팅방을 표시
function chatRoomHandler(event) {
	let roomName = event.target.getAttribute('roomname')
	
	// 모든 방을 일단 숨김
	const rooms = document.querySelectorAll('.room')
	rooms.forEach(e => e.classList.add('hidden'))
	
	const chatArea = document.querySelector('.chat')
	const chatroom = document.querySelector('.room[roomname="' + roomName +'"]')
	const chatOpenBtn = document.getElementById('chat_open_btn')  // 채팅방 온 버튼
	
	chatArea.classList.toggle('hidden')
	chatroom.classList.toggle('hidden')
	chatOpenBtn.classList.add('hidden')
	
	// 채팅방 스크롤을 맨 밑으로 내려가게 설정
	messageAreaHandler()
	
	// 표시된 알람이 있었다면 알람 숨김
	alarmClose()
}

// 알람 닫기 버튼 클릭시 닫기
function alarmClose() {
	const talkAlarm = document.querySelector('.talkAlarm')
	talkAlarm.style.zIndex = -5
	talkAlarm.style.opacity = 0
}

// 매칭 종료 확인창 표시
function matchingEndHandler(event) {
	let target = event.target
	while(target.tagName != 'SECTION') {
		target = target.parentNode
	}
	const roomName = target.getAttribute('roomname')
	const matchingEnd = document.querySelector('.room[roomname="' + roomName + '"]').querySelector('.matchingEnd')
	matchingEnd.classList.toggle('hidden')
}

// 매칭 종료 처리
async function disconnect(event) {
	let reqUser = user
	let respUser = event.target.getAttribute('oponent')
	let target = event.target
	while(target.tagName != 'SECTION') {
		target = target.parentNode
	}
	const roomName = target.getAttribute('roomname')
	
	const url = cpath + '/matchAjax/disconnect'
	console.log(reqUser)
	console.log(respUser)
	const ob = {
			reqUser: reqUser,
			respUser: respUser
	}	
	const opt = {
			method: "POST",
			body: JSON.stringify(ob),
			headers: {
				"Content-Type" : "application/json; charset=utf-8"
			}
	}
		
	const result = await fetch(url, opt).then(resp => resp.text())
	
	if(result == 1) {
		stomp.send('/app/matchover/' + roomName , {}, JSON.stringify({
			roomName: roomName,
			text: "매칭종료",
			from: username
		}))
	}
}

function chatreloadHandler() {
	const chatArea = document.querySelector('.chat') // 채팅방 메인창
	chatArea.querySelector('.chat_main').innerHTML = ''
	chatListLoadHandler()
	showMainChatHandler()
}

async function chatListLoadHandler() {
	
	stomp.subscribe('/broker/' + user, onReceive)
	
	function ping() {
		stomp.send('/app/ping', {}, "")
	}

	setInterval(ping, 30000)

	const list = await getList()
	
	if(list.length == 0) {
		const chatArea = document.querySelector('.chat')
		chatArea.querySelector('.chat_main').innerHTML = ''
		chatArea.querySelector('.chat_main').innerHTML = '<p align="center">현재 대화 가능한 상대가 없습니다.</p>'
		return;
	}
	
	
	const rooms = document.querySelectorAll('.room')
	rooms.forEach(e => document.body.removeChild(e))
		
//		list.forEach(async dto => {
	for(let i = 0; i < list.length; i++) {
		const chatArea = document.querySelector('.chat') // 채팅방 메인창
		const dto = list[i]
		const roomName = dto.reqUser + dto.respUser
		const oponent = (dto.reqUsername == username ? dto.respUsername  : dto.reqUsername )
		let oponentId = (dto.reqUser == user ? dto.respUser : dto.reqUser)
		
		
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
		room += 	'<div class="chat_back_btn" onclick="showMainChatHandler()">↩</div>'
		room +=		'<div class="matchingEndBtn" onclick="matchingEndHandler(event)">매칭종료</div>'	
		room += 	'<div class="disconnect hidden">'
		room +=			'<div class="disconnectMsg">'
		room +=			'	상대방과의 매칭이 종료되었습니다'
		room +=			'	<br>'
		room +=			'	<a onclick="chatreloadHandler()">확인</a>'
		room +=			'</div>'
		room +=		'</div>'
		
		room += 	'<div class="matchingEnd hidden">'
		room += 		'<p style="text-align: center; color: white; font-size: 15px; font-weight: bold;">정말로 매칭을 종료하시겠어요?</p>'
		room +=			'<div>'
		room +=				'<button onclick="disconnect(event)" class="ch_yes_btn" oponent="' + oponentId +'">네</button>'
		room +=				'<button onclick="matchingEndHandler(event)" class="ch_no_btn" style="margin-left: 20px;">아니오</button>'
		room +=			'</div>'
		room +=		'</div>'
		room += 	'<div id="chatTitle">'
		room += 		'<h2 style="text-align: center; color: white; margin: 0;">' + oponent + '</h2>'
		room += 	'</div>'
		room += 	'<div class="messageArea" roomname="' + roomName +'">'
		
		// 불러온 채팅 목록을 미리 채팅방에 추가
		chatList.forEach(chat => {
			let str = ''
			
			str += '<div class="' + (chat.sendUserId == user ? 'rightMsg' : 'leftMsg') + '">'
			str += '<label class="' + (chat.sendUserId == user ? 'hidden' : '' ) + '" id="oponent">'
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
	}
}