<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../managerheader.jsp" %>
<style>
	.memberList {
		border: 1px solid black;
		border-collapse: collapse;
		margin: 0 auto;
	}
	
	.memberList th,
	.memberList td {
		border: 1px solid black;
	}
	
	.userlist > tr:hover {
		background-color: lightskyblue;
	}
	
	.userInfo {
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    width: 800px;
	    height: 500px;
	    background-color: white;
	    box-shadow: 1px 1px 10px 1px black;
	    border-radius: 30px;
	}
	
	#userInfoInner {
		display: flex;
		justify-content: space-between;
		align-items: center;
		height: 100%;
	}
	
	#userInfoInner > div {
		height: 100%;
	}
	
	#userProfile {
		flex: 1;
	}
	
	#userProfile > img {
		width: 100px;
		height: 100px;
		border-radius: 50%;
	}
	
	#userDetail {
		flex: 3;
	}
</style>

<section class="frame">
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

<div class="userInfo hidden">
	<div id="userInfoInner">
		<div id="userProfile">
			<img src="">
		</div>
		<div id="userDetail">
			
		</div>
	</div>
</div>

<script>
	const userlist = document.querySelectorAll('.userlist > tr')
	async function profileLoadHandler(event) {
		const userid = event.target.parentNode.getAttribute('value')
		const userProfile = document.getElementById('userProfile')
		const userDetail = document.getElementById('userDetail')
		
		const url = '${cpath}/manage/userDetail/' + userid
		const dto = await fetch(url).then(resp => resp.json())
		
		console.log(dto)
	}
	
	userlist.forEach(e => e.onclick = profileLoadHandler)
</script>

</body>
</html>