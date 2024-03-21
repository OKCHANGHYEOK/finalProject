<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
   section {
       padding-top: 95px;
       width: 100%;
       height: 920px;
       justify-content: center;
   }
   .bg {
      background-size: 105% 105%;
       background-repeat: no-repeat;
       position: absolute;
       height: 20%;
       width: 105%;
       filter: blur(50px);
        position: relative; 
   }
   .title{
        font-family: "Noto Sans KR", sans-serif;
        font-optical-sizing: auto;
        font-weight: <weight>;
        font-style: normal;
        font-size: 2.5rem;
        margin-top: 40px;
        text-align: center;
        font-weight: 600;
         position: absolute; 
        top: 100px;
        left: 50%;
        transform: translate(-50%);
/*         z-index: 2; */
   }
   #mbsTitleImg > img {
   		width: 100%;
   		margin: auto;
   }
   #mbsTitle, #mbsMain1, #mbsMain2 {
   		margin: 140px;
   
   }
   #mbsTitleBoxThree {
   		width: 650px;
   		margin: 90px auto;
   		display: flex;
   		justify-content: space-around;
   }
   #mbsBoxOne, #mbsBoxTwo, #mbsBoxThree {
   		width: 200px;
   		height: 200px;
   		background-color: #f2f2f0;
   		box-shadow: 5px 8px 9px 0px rgba(0,0,0,0.14);
   }
   #mbsBoxTwo {
   		background-color: #4e5e76;
   		color: white;
   }
   .mbsBoxName {
   		font-size: 20px;
   		font-weight: bold;
   		padding: 30px;
   }
   .mbsBoxMent {
   		text-align: center;
   		padding: 10px 20px;
   		font-size: 16px;
   }
   #mbsMainCheck {
   		width: 650px;
   		margin: 20px auto;
   		text-align: center;
   		
   }
   .mbsMainCheckMent{
   		display: flex;
   		padding: 10px;
   }
	.checkList {
		padding-right: 10px;
	}
   
</style>

<section>
	<div class="bg"
		style="background-image: url(https://www.gstatic.com/youtube/img/promos/growth/premium_lp2_header_background_light_tablet_v1_5760x9600.jpg);"></div>
	<h1 class="title">결혼해듀세요만의 특별함을 즐겨보세요</h1>

	<div id="mbsTitleImg">
		<img src="${cpath }/resources/image/결혼1.jpg">
	</div>

	<div id="mbsTitle">
		<div style="text-align: center; font-size: 35px;">멤버십 가입부터 결혼까지</div>
		<div id="mbsTitleBoxThree">
			<div id="mbsBoxOne">
				<div class="mbsBoxName">옥00 (37세, 男)</div>
				<div class="mbsBoxMent">❝ 회사일로 바빠 결혼할 시기를 놓쳤어요 ❞</div>
			</div>
			<div id="mbsBoxTwo">
				<div class="mbsBoxName">왕00 (32세, 女)</div>
				<div class="mbsBoxMent">❝ 배우자를<br> 어디서 만나야 할 지 <br>모르겠어요 ❞</div>
			</div>
			<div id="mbsBoxThree">
				<div class="mbsBoxName">이00 (38세, 男)</div>
				<div class="mbsBoxMent">❝ 저도 이쁜 가정을<br>꾸리고 싶어요 ❞</div>
			</div>
		</div>
		
	</div>
	<div id="mbsMain1">
		<div style="text-align: center; font-size: 35px;">이러한 고민들은 <br> 듀세요와 함께 해듀세요</div>
		<div id="mbsMainCheck">
			<div class="mbsMainCheckMent">
				<div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
				<div>듀오 멤버십 서비스는 안정적인 회원수를 기반으로 폭넓은 만남을 제공합니다.</div>
			</div>
			<div class="mbsMainCheckMent">
				<div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
				<div>과학과 감성이 만난 매칭시스템을 통해 최상의 짝을 찾는 차별화된 서비스를 제공합니다.</div>
			</div>
			<div class="mbsMainCheckMent">
				<div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
				<div>매칭부터 만남, 에프터에 이르는 일련의 과정을 체계적으로 관리해 드립니다.</div>
			</div>
		</div>
	</div>
	<div id="mbsMain2">
		<div style="text-align: center; font-size: 35px;">멤버십 소개</div>
		<div class="mbsIntroduce">
			<div class="mbsIntroduceBox">
				<div class="mbsIntroduceBoxName">GOLD</div>
				<div class="mbsIntroduceBoxcontent"></div>
			</div>
			<div class="mbsIntroduceBox">
				<div class="mbsIntroduceBoxName">STAR</div>
				<div class="mbsIntroduceBoxcontent"></div>
			</div>
		</div>
	</div>
</section>
</body>
</html>