<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
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