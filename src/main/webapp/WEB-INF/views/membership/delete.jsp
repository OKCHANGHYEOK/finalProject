<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script>
	const message = '${message}'
	
	if(message == '환불 성공'){
		alert('멤버십 환불이 정상적으로 처리되었습니다.')
		location.href = '${cpath}'
	} else{
		alert('멤버십 환불이 되지 않았습니다.')
		history.back()
	}
</script>

</body>
</html>