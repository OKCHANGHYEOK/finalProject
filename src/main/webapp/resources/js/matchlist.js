async function kdprofileLoadHandler(event) {
      const userid = event.target.getAttribute('value')
      const kduserInfo = document.querySelector('.kduserInfo')
      const kdoverlay = document.querySelector('.kdoverlay')
      
      console.log(userid)
      
      const url = cpath + '/matchAjax/userInfo/' + userid
      const dto = await fetch(url).then(resp => resp.json())
      console.log(dto)
      
      let tag = '';
      tag += '   <div class="kdSb">'
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
      const kdImgUrl = cpath + '/upload/' + dto.profile
      tag += '      <div class="kduserImg" style="background-image: url(\'' + kdImgUrl + '\');\"></div>'
      tag += '   </div>'
      tag += '   <div>자기소개 : ' + dto.introduce + '</div>'
      tag += '   <div><button onclick="tryMatchHandler(event)" id="tryMatch" value="' + userid + '">매칭 시도</button></div>'
//      
      kduserInfo.innerHTML = tag
//      console.log(kduserInfo)
//      console.log(tag)
      
      kdoverlay.classList.toggle('hidden')
      kduserInfo.style.transitionDuration = '1s'
      kduserInfo.style.top = '50%'
      
   }
   
async function tryMatchHandler(event) {
    const kduserInfo = document.querySelector('.kduserInfo')
    const kdoverlay = document.querySelector('.kdoverlay')
    const reqUser = user
    const respUser = event.target.getAttribute('value')
    event.preventDefault()
    
    stomp.send('/app/tryMatch/' + respUser, {}, JSON.stringify({
            from: reqUser,
            to: respUser
    }))
    
    const tryMatchUrl = cpath + '/matchAjax/tryMatch'
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

function kdoverlayHandler() {
	   const kdoverlay = document.querySelector('.kdoverlay')
	   const kduserInfo = document.querySelector('.kduserInfo')
	   kdoverlay.classList.toggle('hidden')
	   kduserInfo.style.transitionDuration = 'unset'
	   kduserInfo.style.top = '200%'
	}