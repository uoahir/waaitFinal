<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h5>전자문서 홈패이지</h5>
	<div onclick = "selectDoc();">문서작성</div>
	
	<script>
		const selectDoc = () => {
			window.open("${path}/edoc/selectdoc", "height= 500, width = 500" )
		}
	</script>
</body>
</html>