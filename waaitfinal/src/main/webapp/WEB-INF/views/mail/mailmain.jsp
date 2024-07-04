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
	<button onclick="mailSetting()">환경설정</button>
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
		
	</script>
</body>
</html>