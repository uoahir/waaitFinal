<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty mailBoxes}">
	<c:forEach var="myBox" items="${mailBoxes }">
		<div style="display:flex">
			<a href="" class="list-group-item" name="myMailBox" id="${myBox.myMailBoxNo }" onclick="selectMenu(event)">
				<div class="fonticon-wrap d-inline me-3">
					<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
				    	<use xlink:href="${path }/resources/assets/static/images/bootstrap-icons.svg#envelope" />
				    </svg>
				</div> ${myBox.myMailBoxName }
			</a>
			<button class="deleteMyMailBoxButton" id="${myBox.myMailBoxNo }" onclick="deleteMyMailBox(event)">삭제</button>
		</div>
	</c:forEach>
</c:if>
