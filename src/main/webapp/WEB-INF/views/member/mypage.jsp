<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
aside {
	position: fixed;
	top: 100px;
	left: 0;
	width: 300px;
	height: 100%;
	background-color: lightpink;
	box-shadow: 1px 1px 1px black;
	z-index: 3;
	transition-duration: 0.5s;
}

aside>* {
	margin: 20px;
}

#root {
	display: flex;
}

aside>div.item {
	text-align: center;
}

aside>div.item.selected {
	font-weight: bold;
}

aside>div.item:hover {
	cursor: pointer;
}

div.content {
	position: relative;
	top: 150px;
	left: 350px;
}

mpmodify {
	padding-top: 95px;
	width: 100%;
	height: 920px;
	display: flex;
	justify-content: center;
}

.mpmodify_inner {
	width: 700px;
	margin-top: 80px;
	margin-bottom: 150px;
}

#mpmodifyForm {
	position: relative;
	display: flex;
	flex-flow: column;
	justify-content: center;
	align-items: center;
}

.inputframe {
	width: 500px;
	height: 60px;
	border: 1px solid lightgrey;
	box-sizing: border-box;
	padding: 5px 10px;
	font-size: 16px;
}

label {
	width: 248px;
	height: 50px;
	border: 1px solid lightgrey;
	position: relative;
	color: lightgray;
}

label:first-child {
	margin-right: 5px;
}

input[type="radio"] {
	all: unset;
	display: inline-block;
	position: absolute;
	width: 250px;
	height: 50px;
}

input[type="radio"]:checked+span {
	background-color: blue;
}

.radiotext {
	position: absolute;
	display: flex;
	width: 250px;
	height: 50px;
	justify-content: center;
	align-items: center;
}

#mpmodifyBtn {
	
}

button:hover {
	cursor: pointer;
}

#mpmodifyBtn:disabled {
	background-color: lightgrey;
	cursor: not-allowed;
}

#mpmodifyForm>* {
	margin-top: 15px;
}

p {
	margin: 0;
	margin-top: 5px;
}

.birthday>select {
	width: 165px;
	height: 50px;
	border: 1px solid lightgrey;
	position: relative;
}

.modifyBtn {
	position: relative;
	display: flex;
	flex-flow: column;
	justify-content: center;
	align-items: center;
}

#mpmodifyBtn, #pwmodifyBtn, #specmodifyBtn {
	margin-top: 20px;
	width: 400px;
	height: 50px;
	border: 1px solid lightgrey;
	background-color: blue;
	font-size: 20px;
	color: white;
	text-align: center;
	font-weight: bold;
}

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
	display: flex;
	flex-flow: column;
}

div.preview {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 300px;
	height: 300px;
	border: 2px dashed black;
	border-radius: 50%;
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
</style>

<section id="root">
	<aside class="menu">
		<h3>마이페이지</h3>
		<div class="item selected">내 정보 수정</div>
		<div class="item">스펙 수정</div>
		<div class="item">신고 목록</div>
		<div class="item">내가 쓴 글</div>
	</aside>
	<div class="content"></div>
</section>



<script>
	
	const menuItems = document.querySelectorAll('.menu > .item')
// 	const contentItems = document.querySelectorAll('.content > .item')
    const content = document.querySelector('.content')
	

	const menuItemsHandler = (element, index) => {
		element.addEventListener('click', function(event) {
			menuItems.forEach(menuItem => menuItem.classList.remove('selected'))
// 			contentItems.forEach(contentItem => contentItem.classList.remove('selected'))
			
			menuItems[index].classList.add('selected')
// 			contentItems[index].classList.add('selected')
		})
	}
	
	menuItems.forEach(menuItemsHandler)
	
	
	
   const myInfoLoadHandler = function() {
		const getmyInfo = function(){
			let tag = '';

		      tag += '<div class="mpmodify">';
		      tag += '    <div class="mpmodify_inner">';
		      tag += '        <h1 align="center">회원 정보 수정</h1>';
		      tag += '        <div>';
		      tag += '            <form id="mpmodifyForm">';
		      tag += '                <input class="inputframe" type="text" value="' + '${login.userid}' + '" name="userid" readonly required>';
		      tag += '                <input class="inputframe" type="text" value="' + '${login.username}' + '" name="username" placeholder="이름" required>';
		      tag += '                <div style="display: flex;">';
		      tag += '                    <label>';
		      tag += '                        <input type="radio" name="gender" value="남성"';
		      tag += '${login.gender}' == '남성' ? ' checked' : '';
		      tag += ' required>';
		      tag += '                        <span class="radiotext">남성</span>';
		      tag += '                    </label>';
		      tag += '                    <label>';
		      tag += '                        <input type="radio" name="gender" value="여성"';
		      tag += '${login.gender}' == '여성' ? ' checked' : '';
		      tag += ' required>';
		      tag += '                        <span class="radiotext">여성</span>';
		      tag += '                    </label>';
		      tag += '                </div>';
		      tag += '                <div class="birthday">';
		      tag += '                    <select class="birthYear_sel" title="출생년"  name="birthYear" style="padding: 5px 10px;">';
		      tag += '                        <option value="">출생년</option>';
		      for (var year = 1944; year <= 2005; year++) {
		          tag += '<option value="' + year + '">' + year + '년</option>';
		      }
		      tag += '                    </select>';
		      tag += '                    <select class="birthMonth_sel" title="월 선택" name="birthMonth" style="padding: 5px 10px;">';
		      tag += '                        <option value="">월 선택</option>';
		      for (var month = 1; month <= 12; month++) {
		          tag += '<option value="' + month + '">' + month + '월</option>';
		      }
		      tag += '                    </select>'; 
		      tag += '                    <select class="birthDay_sel" title="일 선택" name="birthDay" style="padding: 5px 10px;">';
		      tag += '                        <option value="">일 선택</option>';
		      for (var day = 1; day <= 31; day++) {
		          tag += '<option value="' + day + '">' + day + '일</option>';
		      }
		      tag += '                    </select>';
		      tag += '                </div>';
		      tag += '                <input class="inputframe" type="text" value="' + '${login.phoneNumber}' + '" name="phoneNumber" placeholder="전화번호" required>';
		      tag += '                <div class="modifyBtn">';
		      tag += '                    <button id="mpmodifyBtn" type="submit">정보수정</button>';
		      tag += '                </div>';
		      tag += '                <div class="modifyBtn">';
		      tag += '                    <button id="pwmodifyBtn">비밀번호 변경</button>';
		      tag += '                </div>';
		      tag += '            </form>';
		      tag += '        </div>';
		      tag += '    </div>';
		      tag += '</div>';
		      content.innerHTML = tag;
		}
      
	  getmyInfo()

	  const form = document.forms[0]
	  form.onsubmit = async function(event) {
		   event.preventDefault()
		   const url = '${cpath}/ajax/mpmodify?userid=${login.userid}'
		   const formData = new FormData(event.target)
		   const ob = {}
		   for(let key of formData.entries()) {
			   ob[key[0]] = key[1]
		   }
		   console.log(ob)
		   const opt = {
			   method: 'POST',
			   body: JSON.stringify(ob),
			   headers: {
				   'Content-Type' : 'application/json;charset=utf-8'
			   }
		   }
		   const result = await fetch(url, opt).then(resp => resp.text())
		   if(result == 1) {
			   getmyInfo()
		   }
		}
	  
	}
	
   const selectHandler = function() {
      var loginBirthYear = "${login.birthYear}";
      var loginBirthMonth = "${login.birthMonth}";   
      var loginBirthDay = "${login.birthDay}";
       
      var birthYearOptions = document.getElementsByClassName("birthYear_sel")[0].options;
      var birthMonthOptions = document.getElementsByClassName("birthMonth_sel")[0].options;
      var birthDayOptions = document.getElementsByClassName("birthDay_sel")[0].options;
       
       for (var i = 0; i < birthYearOptions.length; i++) {
           if (birthYearOptions[i].value === loginBirthYear) {
               birthYearOptions[i].setAttribute("selected", "selected");
           }
       }
       
      for (var i = 0; i < birthMonthOptions.length; i++) {
         if (birthMonthOptions[i].value === loginBirthMonth) {
            birthMonthOptions[i].setAttribute("selected", "selected");
         }
      }
      
      for (var i = 0; i < birthDayOptions.length; i++) {
         if (birthDayOptions[i].value === loginBirthDay) {
            birthDayOptions[i].setAttribute("selected", "selected");
         }
      }
   }
   
   const myInfo = function() {
      myInfoLoadHandler()
      selectHandler()
   }
   
   document.addEventListener('DOMContentLoaded', myInfo)


   menuItems[0].onclick = myInfo
	
	
	
	async function specModify() {
    var contentDiv = document.querySelector('.content')
    
    const url = '${cpath}/member/spec?userid=${login.userid}'
    const dto = await fetch(url).then(resp => resp.json())
    
    const getSpec = function(){
    	contentDiv.innerHTML = '';

        var tag = "";
        tag += '<form method="POST" enctype="multipart/form-data">';
        tag += '    <div>';
        tag += '        <h2>신장</h2>';
        tag += '        <input class="numberInput" type="number" name="height" value="' + dto.height + '">';
        tag += '    </div>';
        tag += '    <div>';
    	tag += '        <h2>과거 결혼 여부</h2>';
    	tag += '        <div class="wrap">';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="marriedCount" value="0" ' + (dto.marriedCount === 0 ? 'checked' : '') + '>';;
    	tag += '                <span class="resText">미혼</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="marriedCount" value="1" ' + (dto.marriedCount === 1 ? 'checked' : '') + '>';
    	tag += '                <span class="resText">1회 있음</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="marriedCount" value="2" ' + (dto.marriedCount === 2 ? 'checked' : '') + '>';
    	tag += '                <span class="resText">2회 이상</span>';
    	tag += '            </label>';
    	tag += '        </div>';
    	tag += '    </div>';
    	tag += '    <div>';
    	tag += '        <h2>거주지 선택</h2>';
    	tag += '        <div class="wrap">';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="residence" value="서울/경기" ' + (dto.residence === '서울/경기' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">서울/경기</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="residence" value="강원도" ' + (dto.residence === '강원도' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">강원도</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="residence" value="충청도" ' + (dto.residence === '충청도' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">충청도</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="residence" value="전라도" ' + (dto.residence === '전라도' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">전라도</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="residence" value="경상도" ' + (dto.residence === '경상도' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">경상도</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="residence" value="제주도" ' + (dto.residence === '제주도' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">제주도</span>';
    	tag += '            </label>';
    	tag += '        </div>';
    	tag += '    </div>';
    	tag += '    <div>';
    	tag += '        <h2>학력</h2>';
    	tag += '        <div class="wrap">';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="education" value="중졸" ' + (dto.education === '중졸' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">중졸</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="education" value="고졸" ' + (dto.education === '고졸' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">고졸</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="education" value="2년제 학사" ' + (dto.education === '2년제 학사' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">2년제 학사</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="education" value="4년제 학사" ' + (dto.education === '4년제 학사' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">4년제 학사</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="education" value="석사" ' + (dto.education === '석사' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">석사</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="education" value="박사" ' + (dto.education === '박사' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">박사</span>';
    	tag += '            </label>';
    	tag += '        </div>';
    	tag += '    </div>';
    	tag += '    <div>';
    	tag += '        <h2>직업</h2>';
    	tag += '        <div class="wrap">';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="job" value="전문직" ' + (dto.job === '전문직' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">전문직</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="job" value="공기업/금융" ' + (dto.job === '공기업/금융' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">공기업/금융</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="job" value="공무원" ' + (dto.job === '공무원' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">공무원</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="job" value="사기업" ' + (dto.job === '사기업' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">사기업</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="job" value="교육직" ' + (dto.job === '교육직' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">교육직</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="job" value="예체능" ' + (dto.job === '예체능' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">예체능</span>';
    	tag += '            </label>';
    	tag += '        </div>';
    	tag += '    </div>';
    	tag += '    <div>';
    	tag += '        <h2>연봉</h2>';
    	tag += '<select class="numberInput" name="salary">';
    	tag += '<option>======= 연봉 선택 =======</option>';
    	tag += '<option value="2999" ' + (dto.salary <= 2999 ? 'selected' : '') + '>3천만원 이하</option>';
    	tag += '<option value="3000" ' + (dto.salary === 3000 ? 'selected' : '') + '>3-4000만원</option>';
    	tag += '<option value="4000" ' + (dto.salary === 4000 ? 'selected' : '') + '>4-5000만원</option>';
    	tag += '<option value="5000" ' + (dto.salary === 5000 ? 'selected' : '') + '>5000만원 ~ 1억원</option>';
    	tag += '<option value="10000" ' + (dto.salary === 10000 ? 'selected' : '') + '>1억원 이상</option>';
    	tag += '</select>';
    	tag += '    </div>';
    	tag += '    <div>';
    	tag += '        <h2>종교</h2>';
    	tag += '        <div class="wrap">';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="religion" value="무교" ' + (dto.religion === '무교' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">무교</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="religion" value="기독교" ' + (dto.religion === '기독교' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">기독교</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="religion" value="불교" ' + (dto.religion === '불교' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">불교</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="religion" value="천주교" ' + (dto.religion === '천주교' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">천주교</span>';
    	tag += '            </label>';
    	tag += '            <label class="resOption">';
    	tag += '			<input type="radio" name="religion" value="기타" ' + (dto.religion === '기타' ? 'checked' : '') + '>';
    	tag += '                <span class="resText">기타</span>';
    	tag += '            </label>';
    	tag += '        </div>';
    	tag += '    </div>';
    	tag += '    <div>';
    	tag += '        <h2>부동산 보유여부</h2>';
    	tag += '		<input class="numberInput" type="number" name="estate" placeholder="보유수를 입력하세요" value="' + dto.estate + '" required>';
    	tag += '    </div>';
    	tag += '    <div>';
    	tag += '        <h2>자가용 보유여부</h2>';
    	tag += '		<input class="numberInput" type="number" name="owncar" placeholder="보유수를 입력하세요" value="' + dto.owncar + '" required>';
    	tag += '    </div>';
    	tag += '    <div>';
    	tag += '        <h2>프로필 사진</h2>';
    	tag += '        <div class="profile">';
    	tag += '            <div class="preview">';
    	tag += '                파일을 끌어서 놓거나 <br>';
    	tag += '                직접 선택하세요.';
    	tag += '            </div>';
    	tag += '            <input type="file" name="upload" placeholder="프로필 이미지 선택" style="margin-top: 10px;" required>';
    	tag += '        </div>';
    	tag += '    </div>';
    	tag += '    <div>';
    	tag += '        <h2>자기소개</h2>';
    	tag += '		<textarea name="introduce" class="introduce" placeholder="자기소개를 작성하세요." required>' + dto.introduce + '</textarea>';
    	tag += '    </div>';
        tag += '    <div class="modifyBtn">';
        tag += '        <button id="specmodifyBtn" type="submit">스펙 수정</button>';
        tag += '     </div>';
    	tag += '</form>';
    	
//     	content.innerHTML += tag
       
        contentDiv.innerHTML += tag;
    	
    }
    
    getSpec()
    
    const form = document.forms[0]
    form.onsubmit = async function(event){
    	event.preventDefault()
    	const url = '${cpath}/member/spec?userid=${login.userid}'
    	const formData = new FormData(event.target)
    	const opt = {
    		method: 'POST',
    		body: formData,
//     		headers: {
// 				   'Content-Type' : 'multipart/form-data; charset=utf-8'
// 			   }
    	}
    	const result = await fetch(url, opt).then(resp => resp.text())
    	if(result == 1){
    		getSpec()
    	}
    }
    

   
}
	
	menuItems[1].onclick = specModify


	
	
</script>


</body>
</html>