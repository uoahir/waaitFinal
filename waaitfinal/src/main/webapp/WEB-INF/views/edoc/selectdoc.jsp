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
	<div>
		<div>문서종류</div>
		<div onclick="window.open('${path}/edoc/basicedoc')">내부보고서</div>
		<div>출장신청서</div>
		<div>휴가신청서</div>
	</div>
</body>
</html>