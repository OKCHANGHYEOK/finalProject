<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
	main {
		position: absolute;
		top:0;
		left: 0;
		z-index : 0;
		width: 100%;
		height: 920px;
		background-image: url('${cpath}/upload/main1.jpg');
		background-repeat: no-repeat;
		background-position: center center;
		background-size: 100% 100%;
	}
</style>

<c:if test="${not empty login}">
   <div style="width: fit-content; position: absolute; z-index: 5;">
      <div style="width: 140px;">${login.userid }님이 로그인중</div>
      <button id="logout">로그아웃</button>
   </div>
</c:if>

<main>

</main>

<script>
   const logout = document.getElementById('logout')
   logout.onclick = () => {location.href = '${cpath }/member/logout'}
</script>

</body>
</html>