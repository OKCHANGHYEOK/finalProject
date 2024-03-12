<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
section {
	padding-top: 95px;
	width: 100%;
	height: 920px;
	justify-content: center;
}

#marriageView_inner {
	width: 1200px;
	height: 100%;
	margin: auto;
}

#reviewHeader {
	width: 900px;
	margin: auto;
	border-bottom: 1px solid grey;
	border-top: 1px solid grey;
	padding: 40px;
	text-align: center;
}

#marriageReviewImg {
	background-image: url('${cpath}/upload/${dto.img}');
	background-size: auto 100%;
	margin: auto;
	display: block;
	width: 400px;
	height: 550px;
}

#reviewBtn {
	display: block;
	margin: 50px auto;
	width: 270px;
	height: 52px;
	border: 1px solid #cdcdcd;
	font-size: 18px;
	color: #555555;
	background-color: white;
	text-align: center;
	line-height: 49px;
}

#reviewRecommend {
	margin-top: 200px;
}

#reviewRecommendList {
	display: flex;
	justify-content: center;
	margin: auto;
}

.reviewRecommendContent {
	padding: 10px;
}

.reviewRecommendImg>a {
	background-size: auto 100%;
	display: block;
	width: 200px;
	height: 250px;
}

.reviewReply {
	width: 900px;
	height : 300px;
	border: 1px solid #cdcdcd;
	margin: auto;
}

textarea[name="content"] {
	resize: none;
}
</style>


<section>
	<div id="marriageView_inner">
		<div id="reviewHeader">
			<div>${dto.title }</div>
			<div>${dto.writer } 🩷 배우자</div>
		</div>
		<div style="text-align: center;">
			<div id="marriageReviewImg"></div>
			<div>${dto.content }</div>
		</div>
		<button id="reviewBtn">목록보기</button>
		
		<div id="reviewReplyRoot"></div>
		
		<div id="reviewRecommend">
			<h2 style="text-align: center;">다른 추천 인터뷰</h2>
			<div id="reviewRecommendList">
				<c:forEach var="dto" items="${list }">
				<div class="reviewRecommendContent">
					<div class="reviewRecommendImg"><a href="${cpath }/review/view/${dto.idx}" style="background-image: url('${cpath}/upload/${dto.img}');">
													</a></div>
					<div style="text-align: center;">${dto.writer } 🩷 배우자 커플</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>

<script>
	const reviewBtn = document.getElementById('reviewBtn')
	reviewBtn.onclick = () => {location.href = '${cpath}/review/list'}
	
	const reviewReplyRoot = document.getElementById('reviewReplyRoot')
	const ReplyLoadHandler = function() {
		let tag = '';
		tag += '<div class="reviewReply">';
		tag += '	<div class="reviewReplyWrite ${empty login ? 'hidden' : ''}">';
		tag += '		<form id="reviewReplyForm">';
		tag += '			<div>🧑🏻 ${login.userid }</div>'
		tag += '			<textarea name="content" rows="5" cols="80" required></textarea>';
		tag += '			<input type="hidden" name="board_idx" value="' + '${dto.idx}' + '">';
		tag += '			<input type="hidden" name="writer" value="' + '${login.userid}' + '">';
		tag += '			<button id="reviewReplyBtn" type="submit">등록</button>';
		tag += '		</form>';
		tag += '	</div>';
		tag += '</div>';
		reviewReplyRoot.innerHTML = tag;
	}
	document.addEventListener('DOMContentLoaded', ReplyLoadHandler)
	
// 	async function reviewReplyWrite(){
// 		const url = '${cpath}/review/write'
// 		const dto = await fetch(url).then(resp => resp.json())
		
		
		
// 	}
	
</script>

</body>
</html>