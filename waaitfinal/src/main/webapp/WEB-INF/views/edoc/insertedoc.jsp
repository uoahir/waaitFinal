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
    <form action="${path }/edoc/home" method="post" enctype="application/x-www-form-urlencoded" >
		<div id="button">
	        <button type="button" onclick="appline();">결재선 지정</button>
	        <button type="submit" onclick="insertedoc();">승인요청</button>
	        <button type="button" onclick="save();">임시저장</button>
	        <button>인쇄미리보기</button>
	    </div>
	    <div id="title">
	        <label for="docTitle">문서제목
	            <input type="text" id="docTitle" name="docTitle">
	        </label>
	    </div> 
	    <div id="content">
	        <textarea name="basicConent" id="basicContent"></textarea>
	    </div>
	    <div id="life">
	        보존연한
	        <label for="1">
	            <input type="radio" name="docLife" id="1" value="1">
	            1년
	        </label>
	        <label for="3">
	            <input type="radio" name="docLife" id="3" value="3">
	            3년
	        </label>
	        <label for="5">
	            <input type="radio" name="docLife" id="5" value="5">
	            5년
	        </label>
	        <label for="10">
	            <input type="radio" name="docLife" id="10" value="10">
	            10년
	        </label>
	        <label for="permanent">
	            <input type="radio" name="docLife" id="permanent" value="permanent">
	            영구
	        </label>
	    </div>
	    <div id="open">
	        보안등급
	        <label for="a">
	            <input type="radio" name="docOpen" id="a" value="all">
	            a
	        </label>
	        <label for="b">
	            <input type="radio" name="docOpen" id="b" value="dept">
	            b
	        </label>
	        <label for="c">
	            <input type="radio" name="docOpen" id="c" value="private">
	            c
	        </label>
	    </div>
	    <div>
	    	<input type="file" name="docFile">
	    </div>
    </form>
    <script>
    	const insertedoc = () => {
    			
    	}
    	const appline = () => {
    		window.open("${path}/edoc/appline","appline","height=500, width=500");
    	}
    </script>
</body>
</html>