<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 메일함</title>
</head>
<body>
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
						<input type="checkbox" name="checkMail" id="${mail.mailNo }">
						${mail.senderMailAddress }
					</td>
					<td>
						<a href="javascript:goMailDetail(${mail.mailNo })">${mail.mailTitle }</a>
					</td>
					<td>${mail.mailWriteDate }</td>
					<td>${mail.mailReadStatus }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<button onclick="deleteMail()">삭제</button>
	<script>
		const deleteMail = () => {
			let checkedCount = 0;
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(e.checked) checkedCount++;
			});
	
			let mailNoStr = "";
			let count = 1;
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(e.checked) {
					if(count == checkedCount) {
						mailNoStr += e.id;
					} else {
						mailNoStr += e.id + ",";
					}
					count++;
				}
			});
			
			fetch("${path }/mail/deletemail.do", {
				method : "POST",
				headers : {
					"content-type" : "application/x-www-form-urlencoded;charset=utf-8"
				},
				body : "mailNoStr=" + mailNoStr
			})
		}
	</script>
</body>
</html>