<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
/* 		border: 1px solid black; */
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
					<div class="matchImg" value="${dto.userid }" style="background-image: url('${cpath}/upload/${dto.profile}');"></div>
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
<div class="kdoverlay hidden"></div>


<script>
	const userImgList = document.querySelectorAll('.matchImg')
	const kduserInfo = document.querySelector('.kduserInfo')
	const kdoverlay = document.querySelector('.kdoverlay')
	
	async function kdprofileLoadHandler(event) {
		const userid = event.target.getAttribute('value')
		console.log(userid)
		
		const url = '${cpath}/matchAjax/userInfo/' + userid
		const dto = await fetch(url).then(resp => resp.json())
		console.log(dto)
		
		kduserInfo.innerHTML = '';
		let tag = '';
		tag += '	<div class="kdSb">'
		tag += '		<div class="leftProfile">'
		tag += '			<div>이름 : ' + dto.username + '</div>'
		tag += '			<div>' + dto.birthYear + '년' + dto.birthMonth + '월' + dto.birthDay + '일생</div>'
		tag += '			<div>키 : ' + dto.height + '</div>'
		tag += '			<div>직업 : ' + dto.job + '</div>'
		tag += '			<div>학벌 : ' + dto.education + '</div>'
		tag += '			<div>자가 보유 : ' + dto.estate + '</div>'
		tag += '			<div>자차 보유 : ' + dto.owncar + '</div>'
		tag += '			<div>거주지 : ' + dto.residence + '</div>'
		tag += '			<div>연봉 : ' + dto.salary + '</div>'
		tag += '			<div>종교 : ' + dto.religion + '</div>'
		tag += '			<div>과거 결혼 여부 : ' + dto.marriedCount + '</div>'
		tag += '		</div>'
		const kdImgUrl = cpath + '/upload/' + dto.profile
		tag += '		<div class="kduserImg" style="background-image: url(\'' + kdImgUrl + '\');\"></div>'
		tag += '	</div>'
		tag += '	<div>자기소개 : ' + dto.introduce + '</div>'
		tag += '	<div><button id="tryMatch" value="' + userid + '">매칭 시도</button></div>'
		
		kduserInfo.innerHTML = tag
		console.log(tag)
		
		kdoverlay.classList.toggle('hidden')
		kduserInfo.style.transitionDuration = '1s'
		kduserInfo.style.top = '50%'
		
		const tryMatch = document.getElementById('tryMatch')
		tryMatch.onclick = async function(event) {
			const requestId = '${login.userid}'
			const responseId = event.target.getAttribute('value')
			const reqUser = '${login.userid}'
			const respUser = event.target.getAttribute('value')
			console.log(requestId)
			event.preventDefault()
			
			stomp.send('/app/tryMatch/' + respUser, {}, reqUser)
			
			const tryMatchUrl = '${cpath}/matchAjax/tryMatch'
			const tryMatchOb = { reqUser, respUser }
			
			const tryMatchOpt = {
				method: 'POST',
				body: JSON.stringify(tryMatchOb),
				headers: {
					'Content-Type' : 'application/json;charset=utf-8'
				}
			}
			const map = await fetch(tryMatchUrl, tryMatchOpt).then(resp => resp.json())
			
			kdoverlay.classList.toggle('hidden')
			kduserInfo.style.transitionDuration = 'unset'
			kduserInfo.style.top = '200%'
			
			alert(map.message)
		}
	}
	
	userImgList.forEach(e => e.onclick = kdprofileLoadHandler)
	
	kdoverlay.onclick = function() {
		kdoverlay.classList.toggle('hidden')
		kduserInfo.style.transitionDuration = 'unset'
		kduserInfo.style.top = '200%'
	}
	

</script>

</body>
</html>