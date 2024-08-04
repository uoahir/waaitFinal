<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2 style="text-align: center;">사원 정보</h2>
	
	<div style="display: flex; justify-content: space-around;">
		<div style="border: 1px solid black;">
			<h2>todo</h2>
			<c:if test="${not empty allocations }">
				<c:forEach var="a" items="${ allocations}">
					<c:if test='${a.functionStatus eq "ToDo" }'>
						<p>${a.functionName }</p>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
		<div>
			<h2>inprogress</h2>
			<c:if test="${not empty allocations }">
				<c:forEach var="a" items="${ allocations}">
					<c:if test='${a.functionStatus eq "inProgress" }'>
						<p>${a.functionName }</p>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
		<div>
			<h2>done</h2>
			<c:if test="${not empty allocations }">
				<c:forEach var="a" items="${ allocations}">
					<c:if test='${a.functionStatus eq "done" }'>
						<p>${a.functionName }</p>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>