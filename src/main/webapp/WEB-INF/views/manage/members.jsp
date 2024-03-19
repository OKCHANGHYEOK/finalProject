<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../managerheader.jsp" %>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Kumar+One&family=Rubik+Maps&display=swap');
	
	.memberList {
		width: 900px;
		border-collapse: collapse;
		margin: 0 auto;
	}
	
	.memberList th,
	.memberList td {
		text-align: center;
		border-bottom: 1px solid black;
	}
	
	.userlist > tr:hover {
		background-color: lightskyblue;
	}
	
	.userInfo {
	    position: fixed;
	    top: 200%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    width: 700px;
	    height: 900px;
	    background-color: white;
	    box-shadow: 1px 1px 10px 1px black;
	    z-index: 2;
	    transition-duration: 1s;
	}
	
	#userInfoInner {
		display: flex;
		justify-content: space-between;
		height: 30%;
	}
	
	#userInfoInner > div {
		height: 100%;
	}
	
	#userProfile {
		flex: 2;
		display: flex;
		justify-content: center;
		margin-top: 20px;
	}
	
	#profileImg {
	    width: 180px;
	    height: 242px;
	    background-position: center;
	    background-size: 100% 100%;
	    background-repeat: no-repeat;
	    border: 1px solid black;
	}
	
	#userDetail {
		margin-top: 10px;
		flex: 3;
	}
	
	.userInfo_overlay {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 1;
	}
	
	.userProfileR {
		display: flex;
	    justify-content: center;
	    align-items: center;
	    flex-direction: column;
	}
	
	.userProfileR > p {
		width: 300px;
	    margin: 10px 0;
	    border-bottom: 1px solid black;
	    font-size: 13px;
	    font-weight: 400;
	    box-sizing: border-box;
	    padding: 3px 0;
	}
	
	#userSpecs {
		width: 100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	#userGrade {
		flex: 2;
		height: 200px;
		display: flex;
		justify-content: center;
	}
	
	#userGrade_box {
		width: 180px;
		height: 150px;
		border: 1px solid black;
		display: flex;
	  	justify-content: center;
	  	align-items: center;
	}
	
	#stamp {
		width: 120px;
	    height: 120px;
	    border-radius: 50%;
	    font-weight: bold;
	    display: flex;
	    justify-content: center;
	    box-sizing: border-box;
	    padding: 5px 0px;
	}
	
	
	#userSpec {
		flex: 3;
		height: 200px;
	}
	
	.grade {
		font-size: 60px;
		font-family: "Kumar One", serif;
		align-items: unset;
	}
	
	.needGrading {
		border: 0 !important;
		color: black !important;
		font-size: 29px;
		font-family: '궁서체';
		align-items: center;
	}
</style>


<section class="frame" style="margin: 70px auto; width: 900px; height: 900px; overflow-x: hidden; overflow-y: scroll;">
	<h2 align="center" style="font-weight: 200;">회원 목록</h2>
	
	<table class="memberList">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>가입일자</th>
				<th>최종접속일</th>
			</tr>
		</thead>
		
		<tbody class="userlist">
			<c:forEach var="user" items="${list }">			
				<tr value="${user.userid }">
					<td>${user.userid }</td>
					<td>${user.username }</td>
					<td>${user.email }</td>
					<td>${user.gender }</td>
					<td>${user.phoneNumber }</td>
					<td>${user.joinDate }</td>
					<td>${user.lastLoginDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>

<div class="userInfo">
	<h2 align="center" id="username" style="font-weight: 300; margin: 5px;"></h2>
	<div id="userInfoInner">
		<div id="userProfile">
			<div id="profileImg"></div>
		</div>
		<div id="userDetail">
			
		</div>
	</div>
	<h2 style="font-weight: 300; width: 280px; text-align: center;">등급</h2>
	<div id="userSpecs">
		<div id="userGrade">		
			<div id="userGrade_box">
				<div id="stamp"></div>
			</div>
		</div>	
		<div id="userSpec">
			
		</div>
	</div>
</div>
<div class="userInfo_overlay hidden"></div>

<script>
	const userlist = document.querySelectorAll('.userlist > tr')
	const userInfo = document.querySelector('.userInfo')
	const overlay = document.querySelector('.userInfo_overlay')
	async function profileLoadHandler(event) {
		const userid = event.target.parentNode.getAttribute('value')
		const profileImg = document.getElementById('profileImg')
		const userDetail = document.getElementById('userDetail')
		
		const url = '${cpath}/manage/userDetail/' + userid
		const dto = await fetch(url).then(resp => resp.json())
		
		const username = document.getElementById('username')
		username.innerText = dto.username + '님의 프로필'
		
		profileImg.style.backgroundImage = 'url(\'' + cpath + '/upload/' + dto.profile + '\')'
		
		let tag = ''
		tag += '<div class="userProfileR">'
		tag += '<p>아이디 : ' + dto.userid + '</p>'
		tag += '<p>성별 : ' + dto.gender + '</p>'
		tag += '<p>이메일 : ' + dto.email + '</p>'
		
		let birth = dto.birthYear + '-' + (dto.birthMonth < 10 ? '0' + dto.birthMonth : dto.birthMonth) + '-' + (dto.birthDay < 10 ? '0' + dto.birthDay : dto.birthDay)
		
		tag += '<p>생년월일 : ' + birth + '</p>'
		
		let tmp = new Date(dto.joinDate)
		let yyyy = tmp.getFullYear()
		let MM = tmp.getMonth() + 1
		MM = (MM < 10 ? '0' : '') + MM
		let dd = tmp.getDay()
		dd = (dd < 10 ? '0' : '') + dd
		let joinDate = yyyy + '-' + MM + '-' + dd
		tag += '<p>가입일 : ' + joinDate + '</p>'
		
		tmp = new Date(dto.lastLoginDate)
		yyyy = tmp.getFullYear()
		MM = tmp.getMonth() + 1
		MM = (MM < 10 ? '0' : '') + MM
		dd = tmp.getDay()
		dd = (dd < 10 ? '0' : '') + dd
		
		let last = yyyy + '-' + MM + '-' + dd
		
		tag += '<p>최종접속일 : ' + last + '</p>'
		tag += '</div>'
		userDetail.innerHTML = tag
		
		const stamp = document.getElementById('stamp')
		const colors = {
			"S" : "blue",
			"A" : "red",
			"B" : "orange",
			"C" : "yellow",
			"D" : "grey"
		}
		if(dto.grade == 'U') {
			stamp.innerText = '책정요망'
			stamp.classList = 'needGrading'
		}
		else {
			stamp.style.border = '10px solid ' + colors[dto.grade]
			stamp.style.color = colors[dto.grade]
			stamp.classList = 'grade'
			stamp.innerText = dto.grade
		}
		
		const userSpec = document.getElementById('userSpec')
		let tag2 = ''
		const marriage = dto.marriedCount == 0 ? '미혼' : dto.marriedCount == 1 ? '1회' : '2회 이상'
		tag2 += '<p>결혼여부 : ' + marriage  + '</p>'
		userSpec.innerHTML = tag2
		
		overlay.classList.toggle('hidden')
		userInfo.style.transitionDuration = '1s'
		userInfo.style.top = '50%'
	}
	
	userlist.forEach(e => e.onclick = profileLoadHandler)
	
	
	overlay.onclick = function() {
		overlay.classList.toggle('hidden')
		userInfo.style.transitionDuration = 'unset'
		userInfo.style.top = '200%'
	}
	
</script>

</body>
</html>