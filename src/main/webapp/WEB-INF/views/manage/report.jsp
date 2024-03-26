<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../managerheader.jsp" %>

<style>
	table#tableManageReport{
		border-collapse: collapse;
		width: 900px;
		margin: 100px auto;
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


</style>

<table id="tableManageReport">
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
			<td><a href="${cpath}/manage/reportView/${dto.idx}">${dto.processed == '0' ? '처리중' : '처리완료'}</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>