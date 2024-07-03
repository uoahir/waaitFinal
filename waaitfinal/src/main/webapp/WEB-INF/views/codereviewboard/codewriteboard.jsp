<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/home.css">
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header id="header">
        <div id="log"><img src="dd" alt=""></div>
        <div id="menu">
            <div><a href="#">워크플로우</a></div>
            <div><a href="#">근무/휴가</a></div>
            <div><a href="#">프로젝트 관리</a></div>
            <div><a href="#">일정관리</a></div>
            <div><a href="#">게시판</a></div>
        </div>
        <div id="noneDiv"></div>
    </header>
    <form action="${path }/codereviewboard/insert">
    	제목<input type="text" name="codeBoardTitle">
    		<select>
    			<option>C</option>
    			<option>C#</option>
    			<option>C++</option>
    			<option>Java</option>
    			<option>python</option>
    			<option>Rust</option>
    			<option></option>
    		</select>
    </form>
</body>
</html>