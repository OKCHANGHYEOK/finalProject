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

.center {
	text-align: center;
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

.withdrawMember_inner {
	width: 700px;
	margin-top: 150px;
}

#withdrawMemberForm {
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
	color: black;
	font-size: 16px;
}
input::placeholder {
    color: black;
}

label {
	width: 248px;
	height: 50px;
	border: 1px solid lightgrey;
	position: relative;
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
	background-color: #105dae;
	color: white;
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
	background-color: #105dae;
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

#withdrawMemberForm>* {
	margin-top: 15px;
}

p {
	margin: 0;
	margin-top: 5px;
}

/* 	다빈수정(240308) */
.mailSend>p>input, .mailAuth>p>input {
	width: 350px;
	height: 50px;
	border: 1px solid lightgrey;
	position: relative;
	color: black;
	padding: 5px 10px;
	font-size: 16px;
}

#mailBtn, #authBtn {
	width: 130px;
	border: 1px solid lightgrey;
	background-color: #105dae;
	color: white;
	text-align: center;
	font-weight: bold;
}

.hidden {
	display: none;
}

.birthday > select {
	width: 165px;
	height: 50px;
	border: 1px solid lightgrey;
	position: relative;
}

</style>

<section>
	<div class="withdrawMember_inner">
		<div>
			<h1 style="text-align: center;">회원탈퇴</h1>
			<span id="nocontent"></span>
		</div>
		<div>
			<form method="POST" id="withdrawMemberForm">
				<input class="inputframe" type="text" name="userid"
					value="${dto.userid }" required readonly> <span id="check"></span>
				<input class="inputframe" type="password" name="userpw"
					placeholder="패스워드" required>
				<input class="inputframe" type="text" name="username"
					value="${dto.username }" required>
				<p class="inputframe"><input type="submit" value="회원탈퇴"></p>
			</form>
		</div>
	</div>
</section>

</body>
</html>