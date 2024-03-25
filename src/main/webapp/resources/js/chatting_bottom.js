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
	const chatBackBtn = document.getElementById('chat_back_btn')
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
			
	chatBackBtn.classList.toggle('hidden')
	chatArea.classList.remove('hidden')
	visibleRoom.classList.toggle('hidden')
}


//채팅방 클릭시 해당 채팅방을 표시
function chatRoomHandler(event) {
	let roomName = event.target.getAttribute('roomname')
	
	// 모든 방을 일단 숨김
	const rooms = document.querySelectorAll('.room')
	rooms.forEach(e => e.classList.add('hidden'))
	
	const chatBackBtn = document.getElementById('chat_back_btn')
	const chatArea = document.querySelector('.chat')
	const chatroom = document.querySelector('.room[roomname="' + roomName +'"]')
	const chatOpenBtn = document.getElementById('chat_open_btn')  // 채팅방 온 버튼
	
	
	// 뒤로가기 버튼, 해당 채팅방은 활성화 시키고 채팅 목록화면, 채팅방 열기 버튼은 비활성화
	chatBackBtn.classList.toggle('hidden')
	if(event.target.tagName == 'BUTTON') {
		chatBackBtn.classList.remove('hidden')
	}
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
