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
	<button onclick="addSpamDomain()">스팸도메인추가</button><br>
	<input type="text" placeholder="차단해제할 도메인" name="domainAddress">
	<input type="text" placeholder="차단해제할 도메인" name="domainAddress">
	<input type="text" placeholder="차단해제할 도메인" name="domainAddress">
	<button onclick="deleteSpamDomain()">스팸 도메인 삭제</button><br>
	<button onclick="joinSpamMailBox()">스팸메일함</button>
	<div id="resultContainer">
		<c:if test="${not empty mails }">
			<table>
				<tr>
					<th>보낸 사람</th>
					<th>제목</th>
					<th>받은 날짜</th>
					<th>읽음 상태</th>
				</tr>
				<c:forEach var="mail" items="${mails }">
					<tr class="mailListTr" id="${mail.mailNo }">
						<td>
							<input type="checkbox" name="checkMail">
							${mail.senderMailAddress }
						</td>
						<td>
							<a href="">${mail.mailTitle }</a>
						</td>
						<td>${mail.mailWriteDate }</td>
						<td>${mail.mailReadStatus }</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	<div id="resultContainer">
	
	</div>
	<div id="myMailBoxContainer">
		<input type="text" name="myMailBoxName" placeholder="내 메일함 이름">
	</div>
	<div id="userBox">
		
	</div>
	<script>
		const addSpamDomain = () => {
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
		
		document.querySelector("input[name='myMailBoxName']").addEventListener("blur", e => {
			const wantBoxName = e.target.value;
			if(e.target.value == "") {
				return;
			}
			console.log("wantBoxName : " + wantBoxName);
			fetch("${path}/mail/enrollmymailbox.do?wantBoxName=" + wantBoxName)
			.then(response => response.text())
			.then(data => {
				if(data == "") {
					alert("메일함 이름은 중복될 수 없습니다.");
				} else {
					document.getElementById("userBox").innerHTML = "<button onclick='goMyMailBox()'>" + data + "</button>";					
				}
			});
		})
		
		const deleteSpamDomain = () => {
			const domainAddress = document.querySelectorAll("input[name='domainAddress']");
			let domainAddressStr = "";
			
			for(let i = 0; i < domainAddress.length; i++) {
				if(domainAddress.length - 1 == i) {
					domainAddressStr += domainAddress[i].value;
				} else {
					domainAddressStr += domainAddress[i].value + ",";				
				}
			}
			
			console.log("domainAddressStr : " + domainAddressStr);
			fetch('${path }/mail/deletespamdomain.do', {
				method : 'POST',
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded;charset=UTF-8'
				},
				body : "domainAddresses=" + domainAddressStr
			})
		}
		
		document.querySelectorAll(".mailListTr").forEach(e => {
			e.addEventListener("click", e => {
				const mailPkNo = e.target.parentElement.id;
				location.assign("${path }/mail/maildetail.do?mailNo=" + mailPkNo);
			})
		});
	</script>
</body>
</html>