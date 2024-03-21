<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	.matchBtn {
/* 		border: 1px solid black;  */
		width: 500px; 
		height: 700px; 
		margin: auto; 
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
	}
	#matchStart {
		background-color: light gray;
		width: 100px;
		height: 100px;
	}
	
</style>

<div class="matchBtn">
	<h2>매칭을 시작하시겠습니까?</h2>
	<form method="POST">
		<input type="hidden" name="userid" value="${dto.userid }">
		<input type="hidden" name="username" value="${dto.username }">
		<input type="hidden" name="gender" value="${dto.gender }">
		<input type="hidden" name="grade" value="${dto.grade }">
		<input type="submit" id="matchStart" value="네">
	</form>
</div>

<script>
</script>

</body>
</html>