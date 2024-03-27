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
					<button class="ch_profile_view" value="${match.reqUser == login.userid ? match.respUser : match.reqUser }">프로필</button>
				</li>
				<li>${match.reqUser == login.userid ? '보냄' : '받음' }</li>
				<li>
					<span>				
						${match.matched == 0 ? '매칭 대기' : (match.matched == 1 ? '매칭중' : (match.matched == 2 ? '매칭거부' : '매칭종료')) }
					</span>
					<span class="ch_match_btns ${match.matched != 0 or match.reqUser == login.userid ? 'hidden' : '' }">
						<a href="${cpath }/match/accept"><button>수락</button></a>
						<a href="${cpath }/match/deny"><button>거절</button></a>
					</span>
				</li>
			</ul>
	</div>	
	</c:forEach>
</section>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const profileBtns = document.querySelectorAll('.ch_profile_view');

        function ChProfileLoadHandler(event) {
            console.log(event.target.getAttribute('value'));
        }

        profileBtns.forEach(btn => {
            btn.addEventListener('click', ChProfileLoadHandler);
        });
    });
</script>
</body>
</html>