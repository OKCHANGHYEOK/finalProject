<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../managerheader.jsp" %>

<style>
	#manageReportView {
		border-collapse: collapse;
		width: 900px;
		margin: 100px auto;
/* 		border: 1px solid black; */
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
	#reportReplyForm {
		width: 600px;
		margin: auto;
	
	}
	.reportReply {
		width: 700px;
	/* 	border: 1px solid #cdcdcd; */
		margin: auto;
	}
	#reportReplyBtn {
		background-color: #105dae;
		color: white;
		padding: 5px;
		border: 0;
	}
	.textarea[name="content"] {
		resize: none;
		width: 580px;
		height: 100px;
		margin: auto;
	}
	#reportReplyForm > textarea {
		width: 600px;
		height: 100px;
		resize: none;
	}

</style>


<table id="manageReportView">
	<tr style="display: flex; justify-content: space-between; width: 600px; margin: auto;">
		<td>신고자 <input type="text" name="reporter" value="${dto.reporter }" readonly></td>
		<td>신고대상 <input type="text" name="target" value="${dto.target }" readonly></td>
		<td><input type="hidden" name="idx" value="${dto.idx }"></td>
	</tr>
	<tr>
		<td><img src="${cpath}/upload/${dto.img }" style="width: 600px; height: auto; margin: 30px auto;"></td>
	</tr>
	<tr>
		<td><textarea name="content"
			style="resize: none; width: 600px; height: 200px;" readonly>${dto.content }</textarea></td>
	</tr>	
</table>

<div id="manageReportReply">
	<div class="reportReply">
		<div class="reportReplyWrite ${empty login ? 'hidden' : ''}">
  			<form method="POST" id="reportReplyForm">
  				<div style="display: flex; justify-content: space-between; width: 200px; margin: 5px;">
  				<div>🧑🏻 ${login.userid }</div>
  				<div><button id="reportReplyBtn" type="submit">댓글 작성</button></div>
  				</div>
  				<textarea name="content" required></textarea>
  				<input type="hidden" name="reportIdx" value="${dto.idx }">
   			</form>
   		</div>
	</div>
</div>


</body>
</html>