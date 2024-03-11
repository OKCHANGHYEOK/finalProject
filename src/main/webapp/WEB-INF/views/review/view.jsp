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
	#marriageReviewImg > img{
		width: 500px;
		height: 700px;
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
	#reviewRecommendContent {
		padding: 10px;
	}

	#reviewRecommendImg > a > img {
		width: 200px;
 		height: 250px;
	}
	
	
</style>


<section>
	<div id="marriageView_inner">
		<div id="reviewHeader">
			<div>${dto.title }</div>
			<div>${dto.writer } 🩷 배우자</div>
		</div>
		<div style="text-align: center;">
			<div id="marriageReviewImg"><img src="${cpath }/upload/${dto.img}"></div>
			<div>${dto.content }</div>
		</div>
		<button id="reviewBtn">목록보기</button>
		<div id="reviewRecommend">
			<h2 style="text-align: center;">다른 추천 인터뷰</h2>
			<div id="reviewRecommendList">
				<c:forEach var="dto" items="${list }">
				<div id="reviewRecommendContent">
					<div id="reviewRecommendImg"><a href="${cpath }/review/view/${dto.idx}"><img src="${cpath }/upload/${dto.img}"></a></div>
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

</script>

</body>
</html>