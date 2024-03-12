<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>duo</title>
<style>
	body {
		margin: 0;
	}
	
	header {
		position: fixed;
		color: black;
		z-index: 1;
		top: 0;
		left: 0;
		width: 100%;
		height: 95px;
	}
	
	.header {
		width: 100%;
		display: flex;
		justify-content: space-between;
	}
	
	#logo {
		flex: 1;
	}
	
	#logo>a {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 95px;
	}
	
	#logo>a>img {
		max-height: 40px;
	}
	
	.frame {
		width: 900px;
		margin: 0 auto;
		padding: 95px 0;
	}
	
	#menu {
		display: flex;
		justify-content: space-around;
		align-items: center;
		padding: 0;
		list-style: none;
		color: inherit;
		font-size: 22px;
		flex: 4;
	}
	
	li {
		user-select: none;
	}
	
	#menu > li {
		flex: 1;
		text-align: center;
	}
	
	#loginUser {
		display: flex;
		justify-content: center;
		align-items: center;
		flex: 1;
	}
	
	
	.link:hover {
		cursor: pointer;
		color: red;
		font-weight: bold;
	}
	
	.drop {
		display: flex;
		position: absolute;
		top: 95px;
		left: 0;
		width: 100%;
		height: 0;
		background-color: white;
		overflow: hidden;
		transition-duration: 0.5s;
	}
	
	.drop > div:nth-child(1),
	.drop > div:nth-child(3) {
		flex: 1;
	}
	
	.drop > div:nth-child(2) {
		flex: 4;
		display: flex;
		justify-content: space-around;
	}
	
	header:hover >.drop {
		height: 300px;
	}
	
	header:hover {
		color: black;
		background-color: white;
	}
	
	.drop ul {
		width: 100%;
		padding: 0;
		list-style: none;
		color: grey;
	}
	
	.drop ul > li {
		width: 100%;
		text-align: center; 
		font-size : 18px;
		font-weight: 200;
		margin-top: 10px;
		font-size: 17px;
	}
	
	.hidden {
		display: none;
	}
	
	hr {
		width: 100%;
		position: fixed;
		top: 95px;
		display: none;
		z-index: 5;
	}
	
	header:hover > hr {
		display: block;
	}
	
	h1 {
		font-size: 30px;
	}
	
	h1, h2 {
		font-weight: 200;
	}
</style>
</head>
<body>

	<header>
		<div class="header">
			<div id="logo">
				<a href="${cpath }"><img
					src="https://www.duo.co.kr/html/main_img_2019/logo.svg"></a>
			</div>
			<ul id="menu">
				<li>듀세요소개</li>
				<li category="guide">가입안내</li>
				<li>고객문의</li>
            	<li category="marrige">회원&성혼</li>
				<li>러브테스트</li>
				<li>파티&이벤트</li>
			</ul>
			<div id="loginUser">
				<h2 style="color: inherit;" class="${empty login ? 'hidden' : '' }">${login.username } 님 로그인 중</h2>
			</div>
		</div>
		<hr style="border: 0; height: 1px; background-color: lightgrey;">
		<div class="drop">
			<div></div>
			<div>
				<ul>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
				<ul>
					<li class="link" id="logLink" value="${empty login ? 'login' : 'logout' }" category="guide">${empty login ? '로그인' : '로그아웃' }</li>
					<li class="link" id="joinLink" category="guide">회원가입</li>
					<li class="link" id="mypageLink" category="guide">마이페이지</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
				<ul>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
				<ul>
               		<li class="link" id="marrigeReviewLink" category="marrige">성혼커플 인터뷰</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
				<ul>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
				<ul>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
					<li>테스트</li>
				</ul>
			</div>
			<div></div>
		</div>
	</header>

	<script>	
		const joinLink = document.getElementById('joinLink')
		joinLink.onclick = () => {location.href = '${cpath}/member/join'}
	
		const logLink = document.getElementById('logLink')
		logLink.onclick = function(event) {
			const href = event.target.getAttribute('value')
			location.href = '${cpath}/member/' + href
		}
		
		const mypageLink = document.getElementById('mypageLink')
	    mypageLink.onclick = () => {location.href = '${cpath}/member/mypage'}
	    
	    const marrigeReviewLink = document.getElementById('marrigeReviewLink')
	    marrigeReviewLink.onclick = () => {location.href = '${cpath}/review/list'}
	       

		
		const links = document.querySelectorAll('.link')
		const menus = document.querySelectorAll('#menu > li')
		
		links.forEach(e => {
			e.addEventListener('mouseover', function(event) {
				menus.forEach(m => {
					if(e.getAttribute('category') == m.getAttribute('category')) {
						m.style.color = 'red'
					}
				})
			})
			e.addEventListener('mouseout', function(event) {
				menus.forEach(m => {
					if(e.getAttribute('category') == m.getAttribute('category')) {
						m.style.color = 'inherit'
					}
				})
			})
		})
		
		const header = document.querySelector('header')
		window.onscroll = function() {
			const scrollY = window.scrollY
			if(scrollY > 100) {
				header.style.backgroundColor = 'white'
			}
			else {
				header.style.backgroundColor = ''
			}
		}
</script>