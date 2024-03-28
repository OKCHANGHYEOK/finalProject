<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.matchingList {
		display: flex;
		width: 100%;
		list-style: none;
		margin: 0;
		padding: 0;
		border-bottom: 1px solid black;
	}
	
	
	.matchingList > li {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.matchingList > li:nth-child(1) {
		flex: 2;
	}
	
	.matchingList > li:nth-child(2) {
		flex: 1;
	}
	
	.matchingList > li:nth-child(3) {
		flex: 1;
	}
	
	#oponent {
		width: 100%;
	}
	
	.ch_match_btns > a {
		text-decoration: none;
		color: white;
		font-size: 14px;
		font-weight: bold;
	}
	
	.ch_match_btns {
		margin-right: -70px;
		transform: translate(6px);
	}
	
	.ch_match_btns button {
		all: unset;
		display: inline-block;
		width: 40px;
		height: 30px;
		text-align: center;
		background-color: black;
		border-radius: 5px;
	}
	
	.ch_match_btns button:hover {
		cursor: pointer;
		background-color: rgba(0, 0, 0, 0.7);
	}
	
	.ch_profile_view {
		all: unset;
		display: inline-block;
		width: 60px;
		height: 30px;
		text-align: center;
		background-color: black;
		border-radius: 5px;
		font-size: 14px;
		font-weight: bold;
		color: white;
		margin-right: -60px;
    	transform: translate(10px);
	}
	
	.ch_profile_view:hover {
		cursor: pointer;
		background-color: rgba(0, 0, 0, 0.7);
	}
	
	#ch_oponent_profile {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		box-shadow: 1px 1px 15px ${login.gender == '남성' ? 'hotpink' : 'skyblue'};
		border-radius: 15px;
		width: 600px;
		height: 0px;
		z-index: 5;
		transition-duration: 1.2s;
		overflow-y: hidden;
	}
	
	#ch_oponent_profile > div {
		width: 100%;
		height: 50%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	#ch_oponent_profile > div:nth-child(2) {
		justify-content: flex-start;
		align-items: flex-start;
	}
	
	#ch_profile_overlay {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		border-radius: 15px;
		width: 600px;
		height: 0px;
		background-color: white;
		z-index: 4;
		transition-duration: 1s;
	}
	
	.ch_height_toggle {
		height: 750px !important;
	}
	
	#ch_profile_close {
		all: unset;
		color: white;
		font-size: 15px;
		font-weight: bold;
		position: absolute;
		bottom: 5px;
		right: 10px;
	}
	
	#ch_oponent_img > div {
		width: 350px;
		height: 350px;
		border-radius: 50%;
		box-shadow: 1px 1px 15px grey inset;
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	
	#ch_oponent_detail {
		width: 100%;
	}
	
	#ch_oponent_detail > p {
		margin: 2px auto;
		width: fit-content;
		font-size: 17px;
		font-weight: bold;
		color: white;
	}
	
	#ch_oponent_detail > pre {
		margin: 5px auto;
		color: white;
		font-size: 15px;
		font-weight: bold;
		width: 300px;
		height: 120px;
		white-space: pre-wrap; 
    	word-wrap: break-word; 
		box-sizing: border-box;
		border-radius: 15px;
		box-shadow: 1px 1px 40px ${login.gender == '남성' ? 'hotpink' : 'skyblue'} inset;
		padding: 10px;
	}
	
	.ch_bg_women {
		background-color: rgba(242, 140, 191, 0.4);
	}
	.ch_bg_men {
		background-color: rgb(135, 206, 235, 0.4);
	}
</style>

<section class="frame">
	<h2 style="font-weight: 300; text-align: center;">매칭 현황</h2>
	<div>
		<ul class="matchingList" style="border-top: 1px solid black;">
			<li>매칭 상대</li>
			<li>신청 여부</li>
			<li>상태</li>
		</ul>
	</div>
	<c:forEach var="match" items="${list }">
	<div class="mymatches">
			<ul class="matchingList" style="height: 40px;">
				<li id="oponent">		
					${match.reqUser == login.userid ? match.respUsername : match.reqUsername }
					<button onclick="ChProfileLoadHandler(event)" class="ch_profile_view" value="${match.reqUser == login.userid ? match.respUser : match.reqUser }">프로필</button>
				</li>
				<li>${match.reqUser == login.userid ? '보냄' : '받음' }</li>
				<li>
					<span>				
						${match.matched == 0 ? '매칭 대기' : (match.matched == 1 ? '매칭중' : (match.matched == 2 ? '매칭거부' : '매칭종료')) }
					</span>
					<span class="ch_match_btns ${match.matched != 0 or match.reqUser == login.userid ? 'hidden' : '' }">
						<a href="${cpath }/match/accept?reqUser=${match.reqUser}"><button>수락</button></a>
						<a href="${cpath }/match/deny?reqUser=${match.reqUser}"><button>거절</button></a>
					</span>
				</li>
			</ul>
	</div>	
	</c:forEach>
</section>

<div class="${login.gender == '남성' ? 'ch_bg_women' : 'ch_bg_men' }" id="ch_oponent_profile">
	
</div>

<div id="ch_profile_overlay">

</div>

<script>
	function profileToggle() {
	    const profile = document.getElementById('ch_oponent_profile')
	    const overlay = document.getElementById('ch_profile_overlay')
	    profile.classList.toggle('ch_height_toggle')
	    overlay.classList.toggle('ch_height_toggle')
	}

	async function ChProfileLoadHandler(event) {
		let oponent = event.target.value
		const profile = document.getElementById('ch_oponent_profile')
		const url = cpath + '/matchAjax/userInfo/' + oponent
		const info = await fetch(url).then(resp => resp.json())
		let year = new Date()
		profile.innerHTML = ''
		let profileURL = cpath + '/upload/' + info.profile
		let tag = ''
		tag += '<div id="ch_oponent_img">'
		tag += 		'<div style="margin-top: 15px; background-image: url(\'' + profileURL +'\')">'
		tag += 		'</div>'
		tag += '</div>'
		tag += '<div id="ch_oponent_detail">'
		tag += 		'<p>' + info.username + ' (' + (year.getFullYear() - info.birthYear + 1) + ' 세)' + '</p>'
		tag +=		'<p>' + info.birthYear + '년 ' + info.birthMonth + '월 ' + info.birthDay + '일생' + '</p>'
		tag +=		'<p>결혼여부 : ' + (info.marriedCount == 0 ? '없음' : (info.marreidCount == 1 ? '1회 있음' : '2회 이상') ) + '</p>'
		tag +=		'<p>거주지역 : ' + info.residence + '</p>'
		tag +=		'<p>직업 : ' + info.job + '</p>'
		
		const salarys = {
				"2999" : "3000만원 이하",
				"3000" : "3천만원대",
				"4000" : "4천만원대",
				"5000" : "5천이상 ~ 1억원 이하",
				"10000" : "1억원 이상"
		}
		
		tag +=		'<p>연봉 : ' + salarys[info.salary] + '</p>'
		tag +=		'<p>종교 : ' + info.religion + '</p>'
		tag +=		'<p style="font-size: 20px; margin-top: 10px;">자기소개</p>'
		tag	+=		'<pre>' + info.introduce + '</pre>'
		tag += '</div>'
		tag += '<button id="ch_profile_close">닫기</button>'
		
		
		
		profile.innerHTML = tag
		profileToggle()
		const profileCloseBtn = document.getElementById('ch_profile_close')
	    profileCloseBtn.onclick = profileToggle
	}
	
	function showMatchSuccess() {		
		if('${matching}' != '') {
		    Swal.fire({
		        title: '매칭성사',
		        html: '상대방과의 매칭이 성사되어 채팅방이 열렸습니다! <br>우측 하단의 채팅 아이콘을 눌러보세요~',
		        icon: 'success',
		        confirmButtonText: '확인'
		    });
		}
	}
	
    document.addEventListener('DOMContentLoaded', showMatchSuccess)
    
</script>
</body>
</html>