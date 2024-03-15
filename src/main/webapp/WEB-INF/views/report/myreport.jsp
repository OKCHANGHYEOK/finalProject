<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	table#tableReport {
		border-collapse: collapse;
		width: 900px;
		margin: 20px auto;
		border: 1px solid black;
	}
	
	table#tableReport td {
		margin: 10px;
		border-bottom: 1px dashed lightgrey;
		text-align: center;
	}
	
	table#tableReport th {
		padding: 10px;
		text-align: center;
	}
	
	table#tableReport>tr>td {
		width: 10px;
	}
	
	div.tablePosition {
	    position: relative;
    	top: 150px;
	}
	
	div.tablePosition > h2 {
		text-align: center;
	}
	
	.buttons {
		position: relative;
		top: 215px;
		left: 193px;
		z-index: 1;
	}
	
	#modalReport > .contentReport {
		width: 700px;
		height: 500px;
		background-color: white;
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		box-shadow: 20px 20px 0px black;
		z-index: 3;
		transition-duration: 0.5s;
		border-radius: 25px;
		
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	#modalReport > .overlay {
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.5);
		position: fixed;
		top: 0;
		left: 0;
		z-index: 2;
	}
	
	#modalReport.hidden > .contentReport {
		top: 150%;
		transition-duration: unset;
	}
	#modalReport.hidden > .overlay {
		display: none;
	}
</style>

<div id="modalReport" class="hidden">
	<div class="contentReport">
		<form id="addReport">
			<h3>신고하기</h3>
			<p><input type="hidden" name="reporter" value="${login.userid }"></p>
			<p><input type="text" name="target" placeholder="신고 대상 아이디" required></p>
			<p><textarea name="content" rows="10" cols="50">신고 내용 입력</textarea>
			<p>
				<input type="submit" value="신고">
				<input id="close" type="button" value="돌아가기">
			</p>
		</form>
	</div>
	<div class="overlay"></div>
</div>

<div class="buttons">
	<button id="open">신고하기</button>
</div>

<div class="tablePosition">
	<table id="tableReport">
		<h2>📌 ${login.userid }님이 쓴 글</h2>
		<thead>
			<tr>
				<th>번호</th>
				<th>신고자</th>
				<th>신고대상</th>
			</tr>
		</thead>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.idx }</td>
				<td>${dto.reporter }</td>
				<td>
					<div style="display: flex; justify-content: center; align-items: center;">
						<details>
							<summary>${dto.target}</summary>
							<p>${dto.content }</p>
						</details>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<script>
	function reportHandler() {
		
		const modalReport = document.getElementById('modalReport')
		const btns = [
			document.getElementById('open'),
			document.getElementById('close'),
			document.querySelector('div.overlay'),
		]
		btns.forEach(b => b.onclick = event => modalReport.classList.toggle('hidden'))
	
		
		
		async function reportSubmitHandler() {
			event.preventDefault()
			
			const ob = {
				reporter: event.target.querySelector('input[name="reporter"]').value,
				target: event.target.querySelector('input[name="target"]').value,
				content: event.target.querySelector('textarea[name="content"]').value,
			}
			
			const url = '${cpath}/reportAjax/report'
			const opt = {
					method: 'POST',
					body: JSON.stringify(ob),
					headers: {
						'Content-Type': 'application/json; charset=utf-8'
					}
			}
			
			const result = await fetch(url,opt).then(resp => resp.text())
			
			
			
			document.getElementById('close').dispatchEvent(new Event('click'))
		}
		
		
		
		
		const form = document.forms[0]
		
		form.onsubmit = reportSubmitHandler
	}
	
	window.addEventListener("DOMContentLoaded", reportHandler)
</script>










</body>
</html>