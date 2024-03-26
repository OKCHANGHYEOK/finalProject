<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../managerheader.jsp" %>

<style>
	#manageReportView {
		border-collapse: collapse;
		width: 900px;
		margin: 100px auto;
		border: 1px solid black;
	}
	#manageReportView td {
		margin: 10px;
/* 		border-bottom: 1px dashed lightgrey; */
		text-align: center;
	}

	#manageReportView th {
		padding: 10px;
		text-align: center;
	}

	#manageReportView>tr>td {
		width: 10px;
	}

	#manageReportView>tr>td >img{
		width: 300px;
		height: 150px;
	
	}

</style>

<form method="POST">
	<table id="manageReportView">
		<tr style="display: flex; justify-content: space-between; width: 600px; margin: auto;">
			<td>작성자 <input type="text" name="reporter" value="${dto.reporter }" readonly></td>
			<td>신고자 <input type="text" name="target" value="${dto.target }" readonly></td>
		</tr>
		
		<tr>
			<td><img src="${cpath}/upload/${dto.img }"></td>
		</tr>
		<tr>
			<td><textarea name="content"
				style="resize: none; width: 600px; height: 200px;" readonly>${dto.content }</textarea></td>
		</tr>	
		<tr>
			<td>
				<label> <input type="checkbox" name="processed" value="0"
						${dto.processed == 1 ? 'checked' : '' }> 신고처리하기
				</label>
			</td>
		</tr>
	</table>
	<div style="width: 900px; display: flex; justify-content: space-between; margin: 0 auto;">
		<div></div>			
		<input type="submit" value="처리완료">
	</div>
</form>

</body>
</html>