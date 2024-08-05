<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:if test="${not empty myMailBoxes }">
	<c:forEach var="myBox" items="${myMailBoxes }">
		<div class="mymailbox-container">
			<button class="mailbox-btn" id="${myBox.myMailBoxNo }"
				onclick="moveMailToMyMailBox(event)">${myBox.myMailBoxName }</button>
		</div>
	</c:forEach>
</c:if>