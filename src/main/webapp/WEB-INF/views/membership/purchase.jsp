<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>

	section {
	    padding-top: 95px;
	    width: 100%;
	    height: 920px;
	    justify-content: center;
	}
	.bg {
		background-size: 105% 105%;
    	background-repeat: no-repeat;
    	position: absolute;
    	height: 20%;
    	width: 105%;
    	filter: blur(50px);
     	position: relative; 
	}
	.title{
	  	font-family: "Noto Sans KR", sans-serif;
	  	font-optical-sizing: auto;
	  	font-weight: <weight>;
	  	font-style: normal;
	  	font-size: 2.5rem;
	  	margin-top: 40px;
	  	text-align: center;
	  	font-weight: 600;
 	  	position: absolute; 
	  	top: 100px;
	  	left: 50%;
	  	transform: translate(-50%);
/* 	  	z-index: 2; */
	}
</style>


<section>
	<div class ="bg" style="background-image: url(https://www.gstatic.com/youtube/img/promos/growth/premium_lp2_header_background_light_tablet_v1_5760x9600.jpg);
}"></div>
	<h1 class="title">결혼해듀세요의 모든 것을 즐겨보세요</h1>
	
	<span>총 주문 금액</span>
	<span>1000원</span>
	<button id="payment-button">결제하기</button>
</section>


<script>
    var clientKey = 'test_ck_PBal2vxj81yyod7kpj5K85RQgOAN' // 테스트용 클라이언트 키
   	// API 개별 테스트 연동 키
   	// 토스페이먼츠에 회원 가입하기 전이라면 아래 키는 문서 테스트 키입니다.
   	// 토스페이먼츠에 회원 가입하고 로그인한 상태라면 아래 키는 내 테스트 키입니다.
//    	const clientKey = 'test_ck_PBal2vxj81yyod7kpj5K85RQgOAN'
   	const secretKey = 'test_sk_6BYq7GWPVvGgzPg9vMkwrNE5vbo1'

    var tossPayments = TossPayments(clientKey)
    var button = document.getElementById('payment-button')	// 결제하기 버튼
    button.addEventListener('click', function() {
    	tossPayments.requestPayment('카드', {
    		amount: 1000,
    		orderId: 'AD8aZDpbzXs4EQa-UkIX6',
    		orderName: '매칭 5회권',
    		customerName: '왕제은',
    		successUrl: 'http://localhost:8080/duo/membership/purchase',
    		failUrl: 'http://localhost:8080/fail'
    	})
    })
    
    
    
    



</script>


</body>
</html>