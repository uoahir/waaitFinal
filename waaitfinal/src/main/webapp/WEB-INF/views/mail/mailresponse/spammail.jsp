<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty spamMail }">
	<ul>
		<c:forEach var="spam" items="${spamMail }">
			<li><p>${spam.senderMailAddress }</p></li>
		</c:forEach>
	</ul>
</c:if>
<c:if test="${empty spamMail }">
	<p>없음</p>
</c:if>
