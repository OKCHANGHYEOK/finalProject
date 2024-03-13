<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${login.isManager == 1}">
        <%@ include file="managerheader.jsp"%>
    </c:when>
    <c:otherwise>
        <%@ include file="header.jsp" %>
    </c:otherwise>
</c:choose>
<style>
   header {
   		color: white;
   }

   main {
      position: absolute;
      top: -200px;
      left: 0;
      z-index : 0;
      width: 100%;
      height: 1200px;
   }
   
   video {
      width: 100%;
      height: 100%;
   }
</style>

<main>
   <video src="${cpath }/upload/duseo_main.mp4" autoplay loop muted></video>
</main>


</body>
</html>