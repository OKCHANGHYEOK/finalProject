<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../managerheader.jsp" %>

<style>
	#reportTBTitle {
		margin: 90px auto;
		text-align: center;
	}
	table#tableManageReport{
		width: 900px;
		margin: 30px auto;
		border: 1px solid black;
	}
	#tableManageReport td {
		margin: 10px;
		border-bottom: 1px dashed lightgrey;
		text-align: center;
	}

	#tableManageReport th {
		padding: 10px;
		text-align: center;
	}

	#tableManageReport>tr>td {
		width: 10px;
	}
	
	div.tablePosition {
		position: relative;
		top: 150px;
	}
	.processing {
		color: red;
	}
	.processed {
		color: blue;
	}
	.processing:hover {
		cursor: pointer;
		font-weight: bold;
	}
	.processed:hover {
		cursor: pointer;
		font-weight: bold;
	}
	

</style>

<table id="tableManageReport">
	<h2 id="reportTBTitle">📌 신고 처리 목록</h2>
	<thead>
	<tr>
	   <th>번호</th>
	   <th>신고자</th>
	   <th>신고대상</th>
	   <th>처리여부</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${reportList }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.reporter }</td>
			<td>${dto.target }</td>
			<td><a href="${cpath}/manage/reportView/${dto.idx}" class="${dto.processed == '0' ? 'processing' : 'processed'}">${dto.processed == '0' ? '처리중' : '처리완료'}</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>