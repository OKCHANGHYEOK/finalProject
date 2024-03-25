<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
    section {
        padding-top: 95px;
        width: 100%;
        height: 500px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    
    table#pay {
        border-collapse: collapse;
        width: 900px;
        margin: 20px auto;
        border: 1px solid black;
    }
    
    #refundBtn {
        margin-top: 20px;
        width: 300px;
        height: 50px;
        border: 2px solid pink;
        border-radius: 10px;
        background-color: white;
        font-size: 20px;
        color: pink;
        text-align: center;
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
    }
</style>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<script>
    function cancelPay() {
        jQuery.ajax({
            // 예: http://www.myservice.com/payments/cancel
            "url": "${cpath}/membership/refund",
            "type": "POST",
            "contentType": "application/json",
            "data": JSON.stringify({
                "merchant_uid": "${dto.payNum}" // 예: ORD20180131-0000011
                // 나머지 필드는 필요에 따라 추가할 수 있습니다
            }),
            "dataType": "json"
        });
    }
</script>

<section>
    <h3 align="center">결제 내역</h3>
    
    <table id="pay" border="1" cellpadding="10" cellspacing="0">
        <tr>
            <td>payNum</td>
            <td>멤버십 유형</td>
            <td>결제 방법</td>
            <td>금액</td>
            <td>matchCount</td>
            
        </tr>
        <tr>
            <td>${dto.payNum }</td>
            <td>${dto.type }</td>
            <td>${dto.payMethod }</td>
            <td>${dto.price }</td>
            <td>${dto.matchCount }</td>
        </tr>
        
    </table>
    
    <button id="refundBtn" onclick="cancelPay()">환불하기</button>
</section>

</body>
</html>
