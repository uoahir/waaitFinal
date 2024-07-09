<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<input type="checkbox" name="checkMail" id="${mail.mailNo }" onclick="buttonAble()">
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
</body>
</html>