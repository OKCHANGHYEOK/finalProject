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
	.marriageImg > a {
		background-size: auto 100%;
		display: block;
		width: 340px;
		height: 440px;
	}
	#marriageList {
		display: flex;
		flex-flow: wrap;
		margin: auto;
	}
	.marriageContent {
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
	    	<div class="marriageContent">
	        	<div class="marriageImg"><a href="${cpath }/review/view/${dto.idx}" style="background-image: url('${cpath}/upload/${dto.img}');"></a></div>
	       		<div>${dto.title }</div>
	   			<div>${dto.writer }</div>
	    	</div>
    	</c:forEach>
   		</div>
   		<div id="marriageListPage">
   			<form>
   				<input type="text" name="search" value="${param.search }">
   				<button>검색</button>
   			</form>
   			<c:if test="${paging.prev }">
   				<a href="${cpath }/review/list/${paging.begin - 3}">◀</a>
   			</c:if>
   			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
   				<a class="${paging.page == i ? 'bold' : '' }"
   					href="${cpath }/review/list/${i}?search=${param.search}">${i}</a>
   			</c:forEach>
			<c:if test="${paging.next }">
				<a href="${cpath }/review/list/${paging.end + 1}?search=${param.search}">▶</a>
			</c:if>
		</div>
     </div>
</section>

</body>
</html>