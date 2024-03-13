<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
/* 창혁 주석 */
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
	display: flex;
	position: relative;
	width: 250px;
	height: 40px;
	border: 1px solid lightgrey;
	background-color: white;
	box-sizing: border-box;
	margin-right: 10px;
	margin-top: 10px;
}

.resText {
	position: absolute;
	width: 100%;
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
	width: 100%;
	height: 40px;
}

input[type="radio"]:checked+.resText {
	color: white;
	background-color: blue;
}

.wrap {
	width: 900px;
	display: flex;
	flex-wrap: wrap;
}

.survey>form>div {
	margin-top: 40px;
}

.numberInput {
	width: 300px;
	height: 40px;
	text-align: center;
	font-size: 20px;
}

.survey input[type="file"] {
	border: 1px solid black;
	border-radius: 8px;
	width: 300px;
	height: 30px;
	box-sizing: border-box;
	padding: 3px 46px;
}

div.profile {
	height: 300px;
	position: relative;
	display: flex;
	flex-flow: column;
}

div.preview {
	position: absolute;
	top: 0;
	left: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 300px;
	height: 300px;
	border: 2px dashed black;
	border-radius: 50%;
}

#profileReg {
	all: unset;
	position: absolute;
	top: 0;
	left: 0;
	width: 300px;
	height: 300px;
	border-radius: 50%;
	opacity: 0;
}

textarea.introduce {
	width: 100%;
	height: 200px;
	border: 1px solid grey;
	font-size: 15px;
	color: black;
	box-sizing: border-box;
	padding: 5px 5px;
}

.stepContainer {
	margin: 50px auto;
}

ul#step {
	padding: 0;
	list-style: none;
	display: flex;
	justify-content: center;
	text-align: center;
}

#arrow {
	font-weight: bold;
	margin: 15px 50px;
}

#nocontent {
	content: "";
	width: 100px;
	height: 5px;
	background-color: #105dae;
	position: absolute;
	left: 50%;
	margin-left: -50px;
}

#con_submit {
	margin-top: 20px;
	width: 400px;
	height: 50px;
	border: 1px solid lightgrey;
	background-color: #105dae;
	font-size: 20px;
	color: white;
	text-align: center;
	font-weight: bold;
}
</style>

<section class="survey">
	<div>	
		<h1 align="center">내 정보입력</h1>
		<span id="nocontent"></span>
	</div>
	<div class="stepContainer">
		<ul id="step">
			<li><small>STEP1</small>
				<p>회원정보입력</p></li>
			<li id="arrow">></li>
			<li style="color: #105dae; font-weight: bold;"><small>STEP2</small>
				<p>회원조건입력</p></li>
		</ul>
	</div>
	<form method="POST" enctype="multipart/form-data">
		<input type="hidden" name="userid" value="${userid }">
		<div>
			<h2>신장</h2>
			<input class="numberInput" type="number" name="height"
				placeholder="키 입력" required autofocus>
		</div>
		<div>
			<h2>과거 결혼 여부</h2>
			<div class="wrap">
				<label class="resOption"> <input type="radio"
					name="marriedCount" value="0" required> <span
					class="resText">미혼</span>
				</label> <label class="resOption"> <input type="radio"
					name="marriedCount" value="1" required> <span
					class="resText">1회 있음</span>
				</label> <label class="resOption"> <input type="radio"
					name="marriedCount" value="2" required> <span
					class="resText">2회 이상</span>
				</label>
			</div>
		</div>
		<div>
			<h2>거주지 선택</h2>
			<div class="wrap">
				<label class="resOption"> <input type="radio"
					name="residence" value="서울/경기" required> <span
					class="resText">서울/경기</span>
				</label> <label class="resOption"> <input type="radio"
					name="residence" value="강원도" required> <span
					class="resText">강원도</span>
				</label> <label class="resOption"> <input type="radio"
					name="residence" value="충청도" required> <span
					class="resText">충청도</span>
				</label> <label class="resOption"> <input type="radio"
					name="residence" value="전라도" required> <span
					class="resText">전라도</span>
				</label> <label class="resOption"> <input type="radio"
					name="residence" value="부산/경상" required> <span
					class="resText">경상도</span>
				</label> <label class="resOption"> <input type="radio"
					name="residence" value="제주도" required> <span
					class="resText">제주도</span>
				</label>
			</div>
		</div>
		<div>
			<h2>학력</h2>
			<div class="wrap">
				<label class="resOption"> <input type="radio"
					name="education" value="중졸" required> <span class="resText">중졸</span>
				</label> <label class="resOption"> <input type="radio"
					name="education" value="고졸" required> <span class="resText">고졸</span>
				</label> <label class="resOption"> <input type="radio"
					name="education" value="2년제 학사" required> <span
					class="resText">2년제 학사</span>
				</label> <label class="resOption"> <input type="radio"
					name="education" value="4년제 학사" required> <span
					class="resText">4년제 학사</span>
				</label> <label class="resOption"> <input type="radio"
					name="education" value="석사" required> <span class="resText">석사</span>
				</label> <label class="resOption"> <input type="radio"
					name="education" value="박사" required> <span class="resText">박사</span>
				</label>
			</div>
		</div>
		<div>
			<h2>직업</h2>
			<div class="wrap">
				<label class="resOption"> <input type="radio" name="job"
					value="전문직" required> <span class="resText">전문직</span>
				</label> <label class="resOption"> <input type="radio" name="job"
					value="공기업/금융" required> <span class="resText">공기업/금융</span>
				</label> <label class="resOption"> <input type="radio" name="job"
					value="공무원" required> <span class="resText">공무원</span>
				</label> <label class="resOption"> <input type="radio" name="job"
					value="사기업" required> <span class="resText">사기업</span>
				</label> <label class="resOption"> <input type="radio" name="job"
					value="교육직" required> <span class="resText">교육직</span>
				</label> <label class="resOption"> <input type="radio" name="job"
					value="예체능" required> <span class="resText">예체능</span>
				</label>
			</div>
		</div>
		<div>
			<h2>연봉</h2>
			<select class="numberInput" name="salary" required>
				<option>======= 연봉 선택 =======</option>
				<option value="2999">3천만원 이하</option>
				<option value="3000">3-4000만원</option>
				<option value="4000">4-5000만원</option>
				<option value="5000">5000만원 ~ 1억원</option>
				<option value="10000">1억원 이상</option>
			</select>
		</div>
		<div>
			<h2>종교</h2>
			<div class="wrap">
				<label class="resOption"> <input type="radio" name="religion"
					value="무교" required> <span class="resText">무교</span>
				</label> <label class="resOption"> <input type="radio" name="religion"
					value="기독교" required> <span class="resText">기독교</span>
				</label> <label class="resOption"> <input type="radio" name="religion"
					value="불교" required> <span class="resText">불교</span>
				</label> <label class="resOption"> <input type="radio" name="religion"
					value="천주교" required> <span class="resText">천주교</span>
				</label> <label class="resOption"> <input type="radio" name="religion"
					value="기타" required> <span class="resText">기타</span>
				</label>
			</div>
		</div>
		<div>
			<h2>부동산 보유여부</h2>
			<input class="numberInput" type="number" name="estate"
				placeholder="보유수를 입력하세요" required>
		</div>
		<div>
			<h2>자가용 보유여부</h2>
			<input class="numberInput" type="number" name="owncar"
				placeholder="보유수를 입력하세요" required>
		</div>
		<div>
			<h2>프로필 사진</h2>
			<div class="profile">
				<div class="preview">
					파일을 끌어서 놓거나 <br> 직접 선택하세요.
				</div>
				<input id="profileReg" type="file" name="upload" placeholder="프로필 이미지 선택"
					style="margin-top: 10px;" required>
			</div>
		</div>
		<div>
			<h2>자기소개</h2>
			<textarea name="introduce" class="introduce" placeholder="자기소개를 작성하세요." required></textarea>
		</div>
		<button id="con_submit">입력 완료</button>
	</form>
</section>
<script>	
	const inputFile = document.querySelector('input[name="upload"]')
	const preview = document.querySelector('.preview')
	
	function previewHandler(event) {
        if(event.target.files && event.target.files[0]) {
            const reader = new FileReader()
            reader.onload = function(e) {
                preview.style.backgroundImage = 'url(' + e.target.result + ')'
                preview.style.backgroundSize = '100%'
                preview.style.fontSize = 0
            }
            reader.readAsDataURL(event.target.files[0])
        }
        else {
        	preview.style.fontSize = '14px'		
        }
	}
	
	inputFile.onchange = previewHandler
	preview.onchange = previewHandler
	
	const conditionForm = document.forms[0]
	conditionForm.onsubmit = function(event) {
		const userid = '${userid}'
		event.preventDefault()
		stomp.send('/app/register', {}, userid)
		conditionForm.submit()
	}
</script>



</body>
</html>