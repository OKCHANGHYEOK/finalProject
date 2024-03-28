async function onReceive(chat) {
   const content = JSON.parse(chat.body)
   const text = content.text
   const userid = content.from
   const respUser = content.to
           
   if (text.includes('거부')) {
   		return alert(text)
   }
           
  const reqUserInfo = document.querySelector('.reqUserInfo')
  const reqUseroverlay = document.querySelector('.reqUseroverlay')


  const url = cpath + '/matchAjax/userInfo/' + userid
  const dto = await fetch(url).then(resp => resp.json())
  
  let tag = '';
  tag += '	<h2 class="userRequest">'+ text +'</h2>'
  tag += '   <div class="reqUserSb">'
  tag += '      <div class="leftProfile">'
  tag += '         <div>이름 : ' + dto.username + '</div>'
  tag += '         <div>' + dto.birthYear + '년' + dto.birthMonth + '월' + dto.birthDay + '일생</div>'
  tag += '         <div>키 : ' + dto.height + '</div>'
  tag += '         <div>직업 : ' + dto.job + '</div>'
  tag += '         <div>학벌 : ' + dto.education + '</div>'
  tag += '         <div>자가 보유 : ' + dto.estate + '</div>'
  tag += '         <div>자차 보유 : ' + dto.owncar + '</div>'
  tag += '         <div>거주지 : ' + dto.residence + '</div>'
  tag += '         <div>연봉 : ' + dto.salary + '</div>'
  tag += '         <div>종교 : ' + dto.religion + '</div>'
  tag += '         <div>과거 결혼 여부 : ' + dto.marriedCount + '</div>'
  tag += '      </div>'
  const reqUserImgUrl = cpath + '/upload/' + dto.profile
  tag += '      <div class="reqUserImg" style="background-image: url(\'' + reqUserImgUrl + '\');\"></div>'
  tag += '   </div>'
  tag += '   <div>자기소개 : ' + dto.introduce + '</div>' 
  tag += '	 <div class="tryMatchSb">'
  tag += '   	<div class="consent">수락</div>'  		
  tag += '   	<div class="refuse">거절</div>'  		
  tag += '   	<div class="defer">보류</div>'  
  tag += '	 </div>'		
   
   reqUserInfo.innerHTML = tag  
   
   reqUseroverlay.classList.toggle('hidden')
   reqUserInfo.style.transitionDuration = '1s'
   reqUserInfo.style.top = '50%'    
   
   const consent = document.querySelector('.consent')
   const refuse = document.querySelector('.refuse')
   const defer = document.querySelector('.defer')
   
   
   
   consent.onclick = async function(event) {
   		const consentUrl = cpath + '/matchAjax/consent?reqUser=' + userid + '&respUser=' + respUser
   		console.log(consentUrl)
   		
   		const consentRow = await fetch(consentUrl).then(resp => resp.text())
   		
   		if(consentRow === '1') {
   			reqUserInfo.style.top = '200%'
   			reqUseroverlay.classList.toggle('hidden')
   		} else {
   			alert('수락 실패 !')
   		}
   }
   
   
   refuse.onclick = async function(event) {
   		stomp.send('/app/refuseMessage/' + userid, {}, JSON.stringify({
   			to: username
   		}))
   
   		const refuseUrl = cpath + '/matchAjax/refuse?reqUser=' + userid + '&respUser=' + respUser
   		console.log(refuseUrl)
   
   		const row = await fetch(refuseUrl).then(resp => resp.text())
   
   		if(row === '1') {
     	 	reqUserInfo.style.top = '200%'
     	 	reqUseroverlay.classList.toggle('hidden')
   		} else {
      		alert('거절 실패 !')
      	}
   }
   
   
   
   defer.onclick = function(event) {
   		reqUserInfo.style.top = '200%'
   		reqUseroverlay.classList.toggle('hidden')
   		alert('매칭을 보류했어요 ! 마이 매칭을 확인하세요 :)')
   }
   

}



