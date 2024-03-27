<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

 <script>
     // 경고창 표시
     
     const msg = '${msg}'
     const url = '${url}'
     
     alert(msg)
     location.href = cpath + url
     
</script>

</body>
</html>