<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
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

div.tablePosition>h2 {
	text-align: center;
}

.buttons {
	position: relative;
	top: 215px;
	left: 193px;
	z-index: 1;
}

#modalReport>.contentReport {
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

#modalReport>.overlay {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	position: fixed;
	top: 0;
	left: 0;
	z-index: 2;
}

#modalReport.hidden>.contentReport {
	top: 150%;
	transition-duration: unset;
}

#modalReport.hidden>.overlay {
	display: none;
}

#modalReportModify>.contentReport {
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

#modalReportModify>.overlayModify {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	position: fixed;
	top: 0;
	left: 0;
	z-index: 2;
}

#modalReportModify.hidden>.contentReport {
	top: 150%;
	transition-duration: unset;
}

#modalReportModify.hidden>.overlayModify {
	display: none;
}

#reportImg {
	background-size: auto 100%;
	margin: auto;
	display: block;
	width: 400px;
	height: 550px;
}
</style>

<div id="modalReport" class="hidden">
	<div class="contentReport">
		<form id="addReport" method="POST" enctype="multipart/form-data">
			<h3>신고하기</h3>
			<p>
				<input type="hidden" name="reporter" value="${login.userid }">
			</p>
			<p>
				<input type="text" name="target" placeholder="신고 대상 아이디" required>
			</p>
			<p><input type="file" name="upload"></p>
			<p>
				<textarea name="content" rows="10" cols="50" placeholder="신고 내용 입력"></textarea>
			<p>
				<input type="submit" value="신고"> <input id="close"
					type="button" value="돌아가기">
			</p>
		</form>
	</div>
	<div class="overlay"></div>
</div>

<div id="modalReportModify" class="hidden">
</div>

<div class="buttons">
	<button id="open">신고하기</button>
</div>

<div class="tablePosition" id="reportList"></div>

<script>
		async function reportListLoadHandler() {
			var reportListDiv = document.getElementById('reportList')
			
			const url = '${cpath}/reportAjax/list?userid=${login.userid}'
			const list = await fetch(url).then(resp => resp.json())
			
			

			reportListDiv.innerHTML = '';
			    
		    let tag = '';
		    
		    tag += '<table id="tableReport">';
		    tag += '    <h2>📌 ${login.userid}님의 신고</h2>';
		    tag += '    <thead>';
		    tag += '        <tr>';
		    tag += '            <th>번호</th>';
		    tag += '            <th>신고자</th>';
		    tag += '            <th>신고대상</th>';
		    tag += '            <th>처리여부</th>';
		    tag += '        </tr>';
		    tag += '    </thead>';
		    tag += '	<tbody>'	

// 			list.forEach(async dto => {
			for(let i = 0; i < list.length; i++) {
					const dto = list[i]		
			
			        tag += '    <tr>';
			        tag += '        <td>' + dto.idx + '</td>';
			        tag += '        <td>' + dto.reporter + '</td>';
			        tag += '        <td>';
			        tag += '            <div style="display: flex; justify-content: center; align-items: center;">';
			        tag += '                <details>';
			        tag += '                    <summary>' + dto.target + '</summary>';
			        const imgUrl = cpath + '/upload/' + dto.img
			        tag += '                    <p><div id="reportImg" style="background-image: url(\'' + imgUrl + '\');\"></div>' + dto.content + '</p>';
			        tag += '                </details>';
			        tag += '            </div>';
			        tag += '        </td>';
			        tag += '        <td>' 
			        				+ (dto.processed == '0' ? '처리중 <button idx=\"' + dto.idx + '\"class="modifyReport">수정</button> <button idx=\"' + dto.idx + '\"class="deleteReport">삭제</button>' : '처리완료') + 
			        				'</td>';
			        tag += '    </tr>';
					const replyUrl = '${cpath}/reportAjax/reportReply?idx=' + dto.idx
					const reportReply = await fetch(replyUrl).then(resp => resp.json())
// 					console.log(reportReply)
// 					console.log(reportReply.reportIdx)
// 					console.log(dto.idx)
					if(reportReply.reportIdx == dto.idx) {
// 						console.log(333)
						let tag2 = ''
				        tag2 += '    <tr>';
				        tag2 += '        <td>';
				        tag2 += '            <div class="reportReply">' + 'Re: ' + reportReply.content + '</div>';
						tag2 += '		</td>';
						tag2 += '	</tr>';
						tag += tag2
					}
// 			        console.log(222, tag)
// 			    });
				}
				
				tag += '</tbody>'
			    tag += '</table>';

			    reportListDiv.innerHTML = tag;
			    
				const deleteReportBtns = document.querySelectorAll('.deleteReport')
				console.log(deleteReportBtns)
				deleteReportBtns.forEach(e => {
					e.addEventListener('click', async function(event) {
					const flag = confirm('정말 삭제하시겠습니까?')
					if(flag) {
						const deleteUrl = '${cpath}/reportAjax/deleteReport?idx=' + event.target.getAttribute('idx')
						await fetch(deleteUrl)
							.then(resp => resp.text())
							.then(() => reportListLoadHandler());
					}
					
				})
				
				})
				
				
				const modifyReportBtns = document.querySelectorAll('.modifyReport')
				modifyReportBtns.forEach(e => {
					e.addEventListener('click', async function(event) {
						const modifyUrl = '${cpath}/reportAjax/view?idx=' + event.target.getAttribute('idx')
						await fetch(modifyUrl)
							.then(resp => resp.json())
							.then(dto => {
								const modalReportModify = document.getElementById('modalReportModify')
								
								let tag = '';
								tag += '<div class="contentReport">';
								tag += '    <form id="updateReport">';
								tag += '        <h3>신고하기</h3>';
								tag += '        <p>';
								tag += '            <input type="hidden" name="idx" value=\"' + dto.idx + '\">';
								tag += '        </p>';
								tag += '        <p>';
								tag += '            <input type="text" name="target" value=\"' + dto.target + '\" placeholder="신고 대상 아이디" required>';
								tag += '        </p>';
								tag += '		<p><input type="file" name="upload"></p>'
								tag += '        <p>';
								tag += '            <textarea name="content" rows="10" cols="50" placeholder="신고 내용 입력">' + dto.content + '</textarea>';
								tag += '        </p>';
								tag += '        <p>';
								tag += '            <input type="submit" value="수정"> <input id="closeModify" type="button" value="돌아가기">';
								tag += '        </p>';
								tag += '    </form>';
								tag += '</div>';
								tag += '<div class="overlayModify"></div>';
								
								modalReportModify.innerHTML = tag;
								modalReportModify.classList.remove('hidden');
								
								const modifyBtns = [
									document.getElementById('closeModify'),
									document.querySelector('div.overlayModify'),
								]
								modifyBtns.forEach(b => b.onclick = event => modalReportModify.classList.toggle('hidden'))
								
								const form = document.getElementById('updateReport')
								form.onsubmit = async function(event) {
									event.preventDefault()
									const url = '${cpath}/reportAjax/reportModify'
									const formData = new FormData(form)
									const opt = {
										method: 'POST',
										body: formData,
									}
									await fetch(url, opt)
										.then(resp => resp.text())
										.then(() => reportListLoadHandler())
										
									document.getElementById('closeModify').dispatchEvent(new Event('click'))
								}
							})
						
						
					})
				})
			
			

			
		
		}
			
			
		
		
		
	const modalReport = document.getElementById('modalReport')
	const btns = [
		document.getElementById('open'),
		document.getElementById('close'),
		document.querySelector('div.overlay'),
	]
	btns.forEach(b => b.onclick = event => modalReport.classList.toggle('hidden'))
	
	
		
		
	async function reportSubmitHandler(event) {
		event.preventDefault()
		
		const url = '${cpath}/reportAjax/report'
		const form = document.getElementById('addReport')
		const formData = new FormData(form)
		const opt = {
				method: 'POST',
				body: formData,
		}
		
		await fetch(url, opt)
			.then(resp => resp.text())
			.then(() => {location.href = '${cpath}/report/myreport'});
		
		
		document.getElementById('close').dispatchEvent(new Event('click'))
	}
		
		
		
		
	const form = document.forms[0]
	
	form.onsubmit = reportSubmitHandler
	
	
		
		
		
	window.addEventListener("DOMContentLoaded", reportListLoadHandler)
</script>










</body>
</html>