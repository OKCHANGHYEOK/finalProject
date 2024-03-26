function onReceive(chat) {
   const content = JSON.parse(chat.body)
   const text = content.text
   const reqUser = content.from
   const respUser = content.to
   const matchingMessage = document.getElementById('matchingMessage')
           
   let tryMatchTag = '';
   tryMatchTag += '   <div>'
   tryMatchTag += '      <div class="requestText">' + text + '</div>';
   tryMatchTag += '      <div class="tryMatchSb">';
   tryMatchTag += '         <div class="consent">수락</div>';
   tryMatchTag += '         <div class="refuse">거절</div>';
   tryMatchTag += '         <div class="defer">보류</div>';
   tryMatchTag += '         <div class="inDetail">상세보기</div>';
   tryMatchTag += '      </div>';
   tryMatchTag += '   </div>';
           
   matchingMessage.innerHTML = tryMatchTag
   matchingMessage.style.bottom = '80%' 
   
   const consent = document.querySelector('.consent')
   const refuse = document.querySelector('.refuse')
   const defer = document.querySelector('.defer')
   const inDetail = document.querySelector('.inDetail')
   
   refuse.onclick = async function(event) {
   const refuseUrl = cpath + '/matchAjax/refuse?reqUser=' + reqUser + '&respUser=' + respUser
   console.log(refuseUrl)
   
   const row = await fetch(refuseUrl).then(resp => resp.text())
   
   if(row === '1') {
      matchingMessage.style.bottom = '200%'
   } else {
      alert('거절 실패 !')
      }
   }
}