<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	header {
		color: black;
	}
	
	section {
		padding-top: 95px;
		width: 100%;
		height: 920px;
		display: flex;
		justify-content: center;
	}
	
	.join_inner {
		width: 700px;
		margin-top: 150px;
	}
	
	#joinForm {
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
	
	input[type="radio"]:checked + span {
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
	
	#joinBtn {
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
	
	button:hover {
		cursor: pointer;
	}
	
	#joinBtn:disabled {
		background-color: lightgrey;
		cursor: not-allowed;
	}
	
	#check {
		position: absolute;
		font-size: 30px;
    	top: 8px;
    	right: 110px;
	}
	
	
	#joinForm > * {
		margin-top: 15px;
	}

	p {
		margin: 0;
		margin-top: 5px;
	}
	
/* 	다빈수정(240308) */
	.mailSend > p > input,
	.mailAuth > p > input{
		width: 350px;
		height: 50px;
		border: 1px solid lightgrey;
		position: relative;
		color: inherit;
		padding: 5px 10px;
		font-size: 16px;
	}
	#mailBtn,
	#authBtn {
		width: 130px;
		border: 1px solid lightgrey;
		background-color: blue;
		color: white;
		text-align: center;
		font-weight: bold;
	}
	.hidden {
 		display: none;
 	}
 	

</style>

<section>
	<div class="join_inner">
		<h1 align="center">회원가입</h1>
		<div>
			<form method="POST" id="joinForm">
				<input class="inputframe" type="text" name="userid" placeholder="아이디" required autofocus>
				<span id="check"></span>
				<p id="duplicate" style="color: red; width: 500px; font-size: 13px; display: none;">이미 사용중인 아이디입니다</p>
				<p style="width: 500px; font-size: 13px; color: blue;">아이디는 4글자 이상 10글자 이하의 영문자 + 숫자로만 조합할 수 있습니다.</p>
				<input class="inputframe" type="password" name="userpw" placeholder="패스워드" required> 
				<input class="inputframe" type="text" name="username" placeholder="이름" required>
				<div style="display: flex;">				
					<label>
						<input type="radio" name="gender" value="남성" required> 
						<span class="radiotext">남성</span>			
					</label> 
					<label>
						<input type="radio" name="gender" value="여성" required> 
						<span class="radiotext">여성</span>		
					</label>
				</div>
				<input class="inputframe" type="date" name="birthDay" placeholder="생년월일" required>
				<div class="mailSend">
					<p style="display: flex;">
						<input type="email" name="email" placeholder="이메일">
						<button id="mailBtn">인증요청</button>
					</p>
					<p class="mailMessage"></p>
				</div>
				<div class="mailAuth hidden">
					<p style="display: flex;">
						<input type="text" name="authNumber" placeholder="인증번호 입력">
						<button id="authBtn">확인</button>
					</p>
					<p class="mailMessage"></p>
				</div>
				<input class="inputframe" type="text" name="phoneNumber" placeholder="전화번호" required>
				<button id="joinBtn" disabled>가입하기</button>
			</form>
		</div>
	</div>
</section>
<script>
	const check = document.getElementById('check')
	const joinBtn = document.getElementById('joinBtn')
	async function IdCheckHandler(event) {
		var userid = event.target.value
		var lengthCheck = userid.length >= 4
		if(userid.length > 10) {
			event.target.value = event.target.value.slice(0, 10)
		}
		var combCheck = /^[a-zA-Z0-9]+$/.test(userid)
		var prefixCheck = /^[a-zA-Z]{4}/.test(userid)
		
		const url = '${cpath}/duplicateCheck?userid=' + userid
		const duplicateCheck = await fetch(url)
			.then(resp => resp.text())
			.then(text => {
				if(text == 1) {
					return false
				}
				else {
					return true
				}
			})
		const duplicate = document.getElementById('duplicate')
		if(lengthCheck && combCheck && prefixCheck && duplicateCheck) {
			check.innerText = '✅'
			joinBtn.disabled = false
			duplicate.style.display = 'none'
		}
		else {
			check.innerText = '❌︎'
			joinBtn.disabled = true
			if(!duplicateCheck) {
				duplicate.style.display = 'block'
			}
			else {
				duplicate.style.display = 'none'
			}
		}
	}
	const IdInput = document.querySelector('input[name="userid"]')
	IdInput.addEventListener('keyup', IdCheckHandler)
	
	const mailBtn = document.getElementById('mailBtn')
	const authBtn = document.getElementById('authBtn')
	const mailAuth = document.querySelector('.mailAuth')
	const mailSend = document.querySelector('.mailSend')
	
	mailBtn.onclick = async function(event){
		event.preventDefault()
		const url = '${cpath}/ajax/sendMail'
		const opt = {
			method: 'POST',
			body: JSON.stringify({
				address: mailSend.querySelector('input[name="email"]').value
			}),
			headers: {
				'Content-Type': 'application/json;charset=utf-8'
			}
		}
		const result = await fetch(url, opt).then(resp => resp.text())
		const message = mailSend.querySelector('p.mailMessage')
		if(result == 1){
			message.innerText = '인증번호를 발송하였습니다'
			message.style.color = 'blue'
			mailAuth.classList.remove('hidden')
		}
		else {
			message.innerText = '메일을 보낼 수 없습니다'
			message.style.color = 'red'
		}
	}
	
	authBtn.onclick = async function(event){
		event.preventDefault()
		const inputNumber = mailAuth.querySelector('input[name="authNumber"]').value
		const url = '${cpath}/ajax/authNumber/' + inputNumber
		const result = await fetch(url).then(resp => resp.text())
		const message = mailAuth.querySelector('p.mailMessage')
		
		if(result == 1){
			message.innerText = '인증 성공'
			message.style.color = 'blue'
			joinBtn.disabled = false
		}
		else {
			message.innerText = '인증 실패'
			message.style.color = 'red'
			joinBtn.disabled = true
		}
	}
</script>

</body>
</html>