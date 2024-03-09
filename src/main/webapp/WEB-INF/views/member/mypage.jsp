<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
   .button {
      z-index: 2;
   }
   aside {
           position: fixed;
           top: 100px;
           left: 0;
           width: 300px;
           height: 100%;
           background-color: lightpink;
           box-shadow: 1px 1px 1px black;
           z-index: 3;
           transition-duration: 0.5s;
       }
    aside > * {
          margin: 20px;
       }
     
   div.overlay {
       z-index: 0;
       position: fixed;
       top: 0;
       left: 0;
       width: 100%;
       height: 100%;
   }

   aside.hidden {
       left: -350px;
   }
   div.overlay.hidden {
       display: none;
   }
</style>

<section>
    <aside>
        <h3>마이페이지</h3>
        <ul>
            <li class="link" id="mpmodifyLInk" category="guide">내 정보 수정</li>
            <li class="link" id="mysocLink" category="guide">신고 목록</li>
            <li class="link" id="myboardLink" category="guide">내가 쓴 글</li>
        </ul>
    </aside>
    <div class="overlay"></div>
</section>

<script>
//        document.addEventListener('DOMContentLoaded', function() {
//         document.querySelector('aside').classList.remove('hidden');
//         document.querySelector('div.overlay').classList.remove('hidden');
//     });
       
       const mpmodifyLInk = document.getElementById('mpmodifyLInk')
       mpmodifyLInk.onclick = () => {location.href = '${cpath}/member/mpmodify'}
       
       const mysocLink = document.getElementById('mysocLink')
       mpmodifyLInk.onclick = () => {location.href = '${cpath}/member/mysoc'}
       
       const myboardLink = document.getElementById('myboardLink')
       mpmodifyLInk.onclick = () => {location.href = '${cpath}/member/myboard'}
</script>


</body>
</html>