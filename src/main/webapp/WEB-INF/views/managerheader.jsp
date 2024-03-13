<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>duseo.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
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
	
	#managerMenu {
		margin-left: 20px;
		padding: 0;
		list-style: none;
		display: flex;
		justify-content: flex-start;
		font-size: 20px;
		color: black;
	}
	
	#managerMenu > li {
		margin-right: 10px;
	}
</style>
</head>
<body>

<header>
	<ul id="managerMenu">
		<li>회원 목록</li>
		<li>신고 처리</li>
		<li>성혼 회원 관리</li>
	</ul>
</header>

<script>
	const cpath = '${cpath}'

	// 회원이 조건 입력까지 완료했을 때 관리자가 받을 메시지
	function onReceive(text) {
		alert(text)
	}

	// 관리자가 admin 채널을 구독하는 함수
	function onConnect() {
	    console.log('STOMP Connection')
	    stomp.subscribe('/broker/admin', onReceive)      
	 }
	
	function ping() {
		stomp.send('/app/ping', {}, "")
	}
	
	const sockJS = new SockJS(cpath + '/endpoint')
	const stomp = Stomp.over(sockJS)
	
	stomp.connect({}, onConnect)
	
	setInterval(ping, 30000)
</script>
