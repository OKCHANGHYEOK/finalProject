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
   #ch_main {
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
   
   #ch_member_slide {
   	  position: absolute;
   	  top: 1000px;
   	  width: 130%;
   	  height: 800px;
   	  background-color: white;
   	  opacity: 0.6;
   }
   
   .profiles {
   	  width: 200%;
   	  display: flex;
   }
   
   #ch_member_women {
	  position: absolute;
      top: 0;
      left: 0px;
   }
   
   #ch_member_men {
   	  position: absolute;
   	  top: 55%;
   	  left: -2446px;
   }
   
   .ch_profile_img {
   	  width: 400px;
   	  height: 400px;
   	  background-size: cover;
      background-position: center;
      display: flex;
      justify-content: center;
      align-items: center;
   	  box-sizing: border-box;
   	  padding: 5px;
   	  box-shadow: 1px 1px 10px grey;
   	  margin-right: 15px;
   }
</style>
<section id="ch_main">
   <video src="${cpath }/upload/duseo_main.mp4" autoplay loop muted></video>
</section>

<section id="ch_member_slide">
	<div class="profiles" id="ch_member_women">
		<c:forEach var="img" items="${wProfiles }">
			<div class="ch_profile_img" style="background-image: url('${cpath}/upload/${img}');"></div>
		</c:forEach>
	</div>
	<div class="profiles" id="ch_member_men">
		<c:forEach var="img" items="${mProfiles }">
			<div class="ch_profile_img" style="background-image: url('${cpath}/upload/${img}');"></div>
		</c:forEach>
	</div>
</section>

<script>
	let waitCount = '${wait_count}'
	function showConfirm() {
	    // SweetAlert를 사용하여 confirm 창 표시
	    Swal.fire({
	        title: '매칭알림',
	        html: "신청받은 매칭이 " + waitCount + '건 있습니다. <br>확인 페이지로 이동하시겠습니까?',
	        showCancelButton: true,
	        confirmButtonText: '네',
	        cancelButtonText: '아니오',
	      }).then((result) => {
	        if (result.isConfirmed) {
	          // 확인 버튼이 클릭되었을 때 수행할 동작
			  location.href = cpath + '/match/mymatch'
	        } else if (result.dismiss === Swal.DismissReason.cancel) {
	          // 취소 버튼이 클릭되었을 때 수행할 동작
				return false
	        }
	      });
	    }
	
	if(waitCount != '') {
		setTimeout(showConfirm, 500)
	}

	function profileSlideHandlerW() {
		const wProfile = document.querySelector('#ch_member_women')
		const currentLeft = parseFloat(wProfile.style.left) || 0; 
		wProfile.style.left = (currentLeft - 1) + 'px'; 
		const firstImg = wProfile.children[0]	// wProfile의 첫번째 요소
		let firstImgRect = firstImg.getBoundingClientRect()	
		let firstImgX = firstImgRect.left + window.pageXOffset // 그 요소의 X축 값
		
		// 첫번째 요소가 화면을 벗어나면
		if(firstImgX <= -415) {
			const firstClone = firstImg.cloneNode(true)
			wProfile.appendChild(firstClone)
			wProfile.removeChild(firstImg)
			wProfile.style.left = 0
		}
}
	
	function profileSlideHandlerM() {
		const mProfile = document.querySelector('#ch_member_men')
		const currentLeft = parseFloat(mProfile.style.left) || 0; 
		mProfile.style.left = (currentLeft + 1) + 'px'; 
		const lastImg = mProfile.lastElementChild
		let lastImgRect = lastImg.getBoundingClientRect()	
		let lastImgX = lastImgRect.left + window.pageXOffset // 그 요소의 X축 값
		
		// 마지막 요소가 화면을 벗어나면
		if(lastImgX >= window.innerWidth) {
			const lastClone = lastImg.cloneNode(true)
			mProfile.insertBefore(lastClone, mProfile.children[0])
			mProfile.removeChild(lastImg)
			mProfile.style.left = '-2446px'
		}
}
	
	
	document.addEventListener('DOMContentLoaded', function() {
	    setInterval(profileSlideHandlerW, 10);
	});
	
	document.addEventListener('DOMContentLoaded', function() {
	    setInterval(profileSlideHandlerM, 10);
	});
</script>

</body>
</html>