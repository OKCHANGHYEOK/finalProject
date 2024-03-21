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

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


<section>
	<button id="goldBtn">GOLD</button>
	<button id="starBtn">STAR</button>
	<button id="premiumBtn">PREMIUM</button>
	<button id="vipBtn">VIP</button>
</section>



<script>

var IMP = window.IMP; 
IMP.init("imp54062385");	// 가맹점 식별코드 

const goldBtn = document.getElementById('goldBtn')

function goldRequestPay() {
IMP.request_pay({
    pg : 'html5_inicis.INIpayTest', 
    pay_method : 'card',
    merchant_uid: 'duo_' + new Date().getTime() , //상점에서 생성한 고유 주문번호
    name : 'GOLD',
    amount : 100,
    buyer_email : '${login.email}',
    buyer_name : '${login.username}',
    buyer_tel : '${login.phoneNumber}',   	
}, function(rsp) { // callback 로직
	console.log(rsp);
	if(rsp.success){
		var msg = '결제가 완료되었습니다.';
		var result = {
			"userid": '${login.userid}',	// 아이디
			"type": rsp.name,			// 멤버십타입
			"payNum": rsp.merchant_uid,	// 결제번호
			"payMethod": rsp.pay_method,	// 결제방법
			"price": rsp.paid_amount,			// 결제금액
			"matchCount": '10',		// 횟수
		}
		console.log(result);
		console.log(1, rsp);
		$.ajax({
	          url:'insertMPayGold',
	          type:'POST',
	          contentType: 'application/json',
	          data:JSON.stringify(result),
	          success: function (res) {
	            console.log(res);
	            location.href=res;
	          },
	          error: function (err) {
	            console.log(err);
	          }
	        }); //ajax
	      } else {
	          var msg = '결제 실패';
	          msg += '\n에러내용 : ' + rsp.error_msg;
	        }
	      alert(msg);
		});
	}
goldBtn.onclick = goldRequestPay

const starBtn = document.getElementById('starBtn')

function starRequestPay() {
IMP.request_pay({
    pg : 'html5_inicis.INIpayTest', 
    pay_method : 'card',
    merchant_uid: 'duo_' + new Date().getTime() , //상점에서 생성한 고유 주문번호
    name : 'STAR',
    amount : 100,
    buyer_email : '${login.email}',
    buyer_name : '${login.username}',
    buyer_tel : '${login.phoneNumber}',   	
}, function(rsp) { // callback 로직
	console.log(rsp);
	if(rsp.success){
		var msg = '결제가 완료되었습니다.';
		var result = {
			"userid": '${login.userid}',	// 아이디
			"type": rsp.name,			// 멤버십타입
			"payNum": rsp.merchant_uid,	// 결제번호
			"payMethod": rsp.pay_method,	// 결제방법
			"price": rsp.paid_amount,			// 결제금액
			"matchCount": '10'		// 횟수
		}
		console.log(result);
		$.ajax({
	          url:'insertMPayStar',
	          type:'POST',
	          contentType: 'application/json',
	          data:JSON.stringify(result),
	          success: function (res) {
	            console.log(res);
	            location.href=res;
	          },
	          error: function (err) {
	            console.log(err);
	          }
	        }); //ajax
	      } else {
	          var msg = '결제 실패';
	          msg += '\n에러내용 : ' + rsp.error_msg;
	        }
	      alert(msg);
		});
	}
starBtn.onclick = starRequestPay

const premiumBtn = document.getElementById('premiumBtn')

function premiumRequestPay() {
IMP.request_pay({
    pg : 'html5_inicis.INIpayTest', 
    pay_method : 'card',
    merchant_uid: 'duo_' + new Date().getTime() , //상점에서 생성한 고유 주문번호
    name : 'PREMIUM',
    amount : 100,
    buyer_email : '${login.email}',
    buyer_name : '${login.username}',
    buyer_tel : '${login.phoneNumber}',   	
}, function(rsp) { // callback 로직
	console.log(rsp);
	if(rsp.success){
		var msg = '결제가 완료되었습니다.';
		var result = {
			"userid": '${login.userid}',	// 아이디
			"type": rsp.name,			// 멤버십타입
			"payNum": rsp.merchant_uid,	// 결제번호
			"payMethod": rsp.pay_method,	// 결제방법
			"price": rsp.paid_amount,			// 결제금액
			"matchCount": '10'		// 횟수
		}
		console.log(result);
		$.ajax({
	          url:'insertMPayPm',
	          type:'POST',
	          contentType: 'application/json',
	          data:JSON.stringify(result),
	          success: function (res) {
	            console.log(res);
	            location.href=res;
	          },
	          error: function (err) {
	            console.log(err);
	          }
	        }); //ajax
	      } else {
	          var msg = '결제 실패';
	          msg += '\n에러내용 : ' + rsp.error_msg;
	        }
	      alert(msg);
		});
	}
premiumBtn.onclick = premiumRequestPay

const vipBtn = document.getElementById('vipBtn')

function vipRequestPay() {
IMP.request_pay({
    pg : 'html5_inicis.INIpayTest', 
    pay_method : 'card',
    merchant_uid: 'duo_' + new Date().getTime() , //상점에서 생성한 고유 주문번호
    name : 'VIP',
    amount : 100,
    buyer_email : '${login.email}',
    buyer_name : '${login.username}',
    buyer_tel : '${login.phoneNumber}',   	
}, function(rsp) { // callback 로직
	console.log(rsp);
	if(rsp.success){
		var msg = '결제가 완료되었습니다.';
		var result = {
			"userid": '${login.userid}',	// 아이디
			"type": rsp.name,			// 멤버십타입
			"payNum": rsp.merchant_uid,	// 결제번호
			"payMethod": rsp.pay_method,	// 결제방법
			"price": rsp.paid_amount,			// 결제금액
			"matchCount": '10'		// 횟수
		}
		console.log(result);
		$.ajax({
	          url:'insertMPayVip',
	          type:'POST',
	          contentType: 'application/json',
	          data:JSON.stringify(result),
	          success: function (res) {
	            console.log(res);
	            location.href=res;
	          },
	          error: function (err) {
	            console.log(err);
	          }
	        }); //ajax
	      } else {
	          var msg = '결제 실패';
	          msg += '\n에러내용 : ' + rsp.error_msg;
	        }
	      alert(msg);
		});
	}
vipBtn.onclick = vipRequestPay

</script>

</body>
</html>