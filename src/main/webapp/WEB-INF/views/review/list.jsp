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
	#nocontent {
	    content: "";
	    width: 100px;
	    height: 5px;
	    background-color: #105dae;
	    position: absolute;
	    left: 50%;
	    margin-left: -50px;
	}
	#marriage_inner{
	    width: 1200px;
	    height: 100%;
	    margin: auto;
	}
	#marriageImg > a > img{
		width: 340px;
		height: 440px;
	}
	#marriageList {
		display: flex;
		flex-flow: wrap;
		margin: auto;
	}
	#marriageContent {
		padding: 5px 30px;
	}
</style>

<section>
	<div>
		<h1 style="text-align: center;">성혼커플 인터뷰</h1>
		<span id="nocontent"></span>
	</div>
    <div id="marriage_inner">
    	<div><a href="${cpath }/review/write"><button>커플후기작성</button></a></div>
   		<div id="marriageList">
    	<c:forEach var="dto" items="${list }">
	    	<div id="marriageContent">
	        	<div id="marriageImg"><a href="${cpath }/review/view/${dto.idx}"><img src="${cpath }/upload/${dto.img}"></a></div>
	       		<div>${dto.title }</div>
	   			<div>${dto.writer }</div>
	    	</div>
    	</c:forEach>
   		</div>
     </div>
</section>

</body>
</html>