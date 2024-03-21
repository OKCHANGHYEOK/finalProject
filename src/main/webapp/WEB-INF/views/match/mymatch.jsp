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
	
	#oponent:hover {
		cursor: pointer;
		background-color: lightgrey;
	}
	
	.enter {
		all: unset;
		position: relative;
		width: 30px;
		height: 30px;
		background-image: url('${cpath}/upload/door.png');
		background-position: center;
		background-size: 100%;
		margin-left: 10px;
	}
	
	.enter:hover {
	  cursor: pointer;
	}
	
	.enter:hover::after {
	  content: "채팅방 입장";
	  position: absolute;
	  background-color: #000;
	  color: #fff;
	  padding: 5px;
	  border-radius: 5px;
	  top: 100%;
	  left: 50%;
	  transform: translateX(-50%);
	  white-space: nowrap;
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
		<form action="${cpath }/match/chat" method="POST">
			<input type="hidden" name="loginUser" value="${login.userid }">
			<input type="hidden" name="oponent" value="${match.reqUser == login.userid ? match.respUser : match.reqUser }">		
			<ul class="matchingList" style="height: 40px;">
				<li id="oponent">		
					${match.reqUser == login.userid ? match.respUser : match.reqUser }
				</li>
				<li>${match.reqUser == login.userid ? '보냄' : '받음' }</li>
				<li>
					<span>				
						${match.matched == 0 ? '매칭 대기' : (match.matched == 1 ? '매칭중' : (match.matched == 2 ? '매칭거부' : '매칭종료')) }
					</span>
					<button class="enter ${match.matched == 1 ? '' : 'hidden'}">
						
					</button>
				</li>
			</ul>
		</form>
	</div>	
	</c:forEach>
</section>


</body>
</html>