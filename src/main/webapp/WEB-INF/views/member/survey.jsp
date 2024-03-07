<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	header {
		color: black;
		border-bottom: 1px solid lightgrey;
	}
	
	.survey {
		padding: 95px;
		width: 700px;
		margin: 0 auto;
		margin-top: 150px;
	}
	
	.resOption {
		display: inline-block;
		position: relative;
		width: 100px;
		height: 40px;
		border: 1px solid lightgrey;
		background-color: white;
		box-sizing: border-box;
		margin-right: 10px;
		margin-top: 10px;
	}
	
	.resText {
		position: absolute;
		width: 100px;
		height: 40px;
		color: grey;
		font-size: 16px;
		display: flex;
		justify-content: center;
		align-items: center;
	}	
	
	input[type="radio"] {
		all: unset;
		position: absolute;
		width: 100px;
		height: 40px;
	}
	
	input[type="radio"]:checked + .resText {
		color: white;
		background-color: blue;
	}
	
	.wrap {
		width: 350px;
		display: flex;
		flex-wrap: wrap;
	}	
	
	
</style>

<section class="survey">
<h1 align="center">내 정보입력</h1>
	<form>
		<div>
			<h2>거주지 선택</h2>
			<div class="wrap">
				<label class="resOption">
					<input type="radio" name="residence" value="서울/경기" required>
					<span class="resText">서울/경기</span>
				</label>
				<label class="resOption">
					<input type="radio" name="residence" value="강원도" required>
					<span class="resText">강원도</span>
				</label>
				<label class="resOption">
					<input type="radio" name="residence" value="충청도" required>
					<span class="resText">충청도</span>
				</label>
				<label class="resOption">
					<input type="radio" name="residence" value="전라도" required>
					<span class="resText">전라도</span>
				</label>
				<label class="resOption">
					<input type="radio" name="residence" value="부산/경상" required>
					<span class="resText">부산/경상</span>
				</label>
				<label class="resOption">
					<input type="radio" name="residence" value="제주도" required>
					<span class="resText">제주도</span>
				</label>
			</div>
		</div>
		<div>
		
		</div>
	</form>
</section>
<script>
	history.pushState(null, document.title, location.href);
	window.addEventListener('popstate', function(event) {
	    history.pushState(null, document.title, location.href); 
	});
</script>	



</body>
</html>