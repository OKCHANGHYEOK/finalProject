<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="${cpath }/resources/js/matchlist.js"></script>
<style>
   #match_list_section {
       padding-top: 95px;
       width: 100%;
       height: 920px;
       justify-content: center;
   }
   
   #kdnocontent {
       content: "";
       width: 100px;
       height: 5px;
       background-color: #105dae;
       position: absolute;
       left: 50%;
       margin-left: -50px;
   }
   
   .matchListBox {
/*       border: 1px solid black; */
       width: 1200px;
       height: 100%;
       margin: auto;
   }
   
   #matchList {
      display: flex;
      flex-flow: wrap;
      margin: auto;
   }
   
   .matchContent {
      padding: 5px 30px;
      margin-top: 10px;
   }
   
   .matchImg {
      background-size: auto 100%;
      display: block;
      width: 340px;
      height: 440px;
   }
   
   .matchContent > div {
      text-align: center;
   }
   
   .kduserInfo {
      position: fixed;
      top: 200%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 500px;
      height: 600px;
      background-color: white;
      box-shadow: 1px 1px 10px 1px black;
      z-index: 2;
      transition-duration: 1s;
   }
   
   .kdoverlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 1;
   }
   
    .kduserImg { 
       background-size: auto 100%; 
        display: block;  
       width: 150px; 
       height: 200px;   
       border: 1px solid black; 
    } 
   
    .kdSb { 
       display: flex; 
       justify-content: space-between; 
    } 
    
    #tryMatch {
       position: absolute;
       bottom: 10px;
       left: 36%;
       width: 140px;
       height: 60px;
    }

</style>

<section id="match_list_section">
   <div>
      <h1 style="text-align: center;">추천 매칭 상대</h1>
      <span id="kdnocontent"></span>
   </div>
   <div class="matchListBox">
      <div id="matchList">
         <c:forEach var="dto" items="${list }">
            <div class="matchContent">
               <div onclick="kdprofileLoadHandler(event)" class="matchImg" value="${dto.userid }" style="background-image: url('${cpath}/upload/${dto.profile}');"></div>
               <div>이름 : ${dto.username }</div>
               <div>${dto.birthYear }년 ${dto.birthMonth }월 ${dto.birthDay }일생</div>
               <div>등급 : ${dto.grade }</div>
            </div>
         </c:forEach>
      </div>
   </div>
</section>

<div class="kduserInfo">
   <h2 align="center" id="kdusername" style="font-weight: 300; margin: 5px;"></h2>

</div>
<div class="kdoverlay hidden" onclick="kdoverlayHandler()"></div>


</body>
</html>