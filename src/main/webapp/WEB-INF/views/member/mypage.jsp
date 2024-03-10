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
   
   #root {
   		display: flex;
   }
   
   aside > div.item {
   		text-align: center;
   }
   
   aside > div.item.selected {
   		font-weight: bold;
   }
   
   aside > div.item:hover {
   		cursor: pointer;
   }
   
   div.content {
   		position: relative;
   		top: 150px;
   		left: 350px;
   }
   
   div.content > div.item {
   		position: absolute;
   		top: 0;
   		left: 0;
   		display: none;
   		
   }
   
   div.content > div.item.selected {
   		display: block;
   }
   

</style>

<section id="root">
    <aside class="menu">
        <h3>마이페이지</h3>
       	<div class="item selected">내 정보 수정</div>
       	<div class="item">신고 목록</div>
       	<div class="item">내가 쓴 글</div>
    </aside>
    <div class="content">
    	<div class="item selected">1</div>
    	<div class="item">2</div>
    	<div class="item">3</div>
    </div>
</section>


<script>
	
	const menuItems = document.querySelectorAll('.menu > .item')
	const contentItems = document.querySelectorAll('.content > .item')
	

	const menuItemsHandler = (element, index) => {
		element.addEventListener('click', function(event) {
			menuItems.forEach(menuItem => menuItem.classList.remove('selected'))
			contentItems.forEach(contentItem => contentItem.classList.remove('selected'))
			
			menuItems[index].classList.add('selected')
			contentItems[index].classList.add('selected')
		})
	}
	
	menuItems.forEach(menuItemsHandler)
	
</script>


</body>
</html>