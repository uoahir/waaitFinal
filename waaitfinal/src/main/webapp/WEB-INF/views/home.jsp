<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사원추가(회원가입)</h2>
	<form action="${path }/insertemp" method="post">
		아이디:<input type="text" name="empId"> 비밀번호:<input
			type="password" name="empPwd"> 이름:<input type="text"
			name="empName"> <input type="submit" value="전송">
	</form>
	<h2>로그인페이지</h2>
	<form action="${path }/login" method="post">
	아이디:<input type="text" name="empId"> 
	비밀번호:<input type="password" name="empPwd">
	</form>
	<a href = "${path }/codeboard">코드 작성하는 페이지</a>
	
	
	<div onclick="location.assign('${path }/edoc/home')">전자결재</div>
	<div onclick="location.assign('${path }/edoc/insertedoc')">전자결재 작성</div>
	
	<div onclick="location.assign('${path }/chat/home')">채팅</div>
	
</body>
</html>