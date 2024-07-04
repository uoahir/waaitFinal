<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메일 메인</h1>
	
	<c:if test="${not empty mails }">
		<table>
			<tr>
				<th>보낸 사람</th>
				<th>제목<th>
				<th>받은 날짜<th>
			</tr>
		</table>
	</c:if>
	<input type="text" placeholder="차단할 이메일 주소 입력" name='spamDomain'>
	<input type="text" placeholder="차단할 이메일 주소 입력" name='spamDomain'>
	<input type="text" placeholder="차단할 이메일 주소 입력" name='spamDomain'>
	<button onclick="mailSetting()">스팸도메인추가</button>
	<button onclick="joinSpamMailBox()">스팸메일함</button>
	<div id="resultContainer">
		<c:if test="${not empty mails }">
			<table>
				<tr>
					<th>보낸 사람</th>
					<th>제목<th>
					<th>받은 날짜<th>
				</tr>
			</table>
		</c:if>
	</div>
	<div id="resultContainer">
	
	</div>
	<div id="myMailBoxContainer">
		<input type="text" name="myMailBoxName">
	</div>
	<div id="userBox">
		
	</div>
	<script>
		const mailSetting = () => {
			const spamDomain = document.querySelectorAll("input[name='spamDomain']");
			let spamDomainString = "";
			
			for(let i = 0; i < spamDomain.length; i++) {
				if(spamDomain.length - 1 == i) {
					spamDomainString += spamDomain[i].value;
				} else {
					spamDomainString += spamDomain[i].value + ",";				
				}
			}
			
			console.log("spamDomainString : " + spamDomainString);
			fetch('${path }/mail/settingspamdomain.do', {
				method : 'POST',
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded;charset=UTF-8'
				},
				body : "spamDomain=" + spamDomainString
			})			
		}
		
		const joinSpamMailBox = () => {
			fetch("${path}/mail/joinspammail.do")
			.then(response => response.text())
			.then(data => {
				document.getElementById("resultContainer").innerHTML = data;
			});
		}
		
		document.querySelecctor("input[name='myMailBoxName']").addEventListener("blur", e => {
			const wantBoxName = e.target.value;
			fetch("${path}/mail/enrollmymailbox.do?wantBoxName=" + wantBoxName)
		})
	</script>
</body>
</html>