<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.memberList {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	.memberList th,
	.memberList td {
		border: 1px solid black;
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
		
		<tbody>
			<c:forEach var="user" items="${list }">			
				<tr>
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

</body>
</html>