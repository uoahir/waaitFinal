<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/home.css">
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
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
    <form action="${path }/codereviewboard/insert" method="post" enctype="multipart/form-data">
    	작성자: <div>${employee.empName }</div>
    	작성일 :<div id="current_date"><script>
        date = new Date();
        year = date.getFullYear();
        month = date.getMonth() + 1;
        day = date.getDate();
        document.getElementById("current_date").innerHTML = year + "/" + month + "/" + day;
    </script>
    	</div>
    	제목<input type="text" name="codeBoardTitle">
    		<select name="codeType">
    			<option value="c">C</option>
    			<option value="c#">C#</option>
    			<option value="c++">C++</option>
    			<option value="java">Java</option>
    			<option value="python">python</option>
    			<option value="rust">Rust</option>
    			<option value="linux">Linux</option>
    		</select>
			<select name="developmentType">
    			<option value="fornt">프론트</option>
    			<option value="back">백엔드</option>
    			<option value="server">서버</option>
    			<option value="nft">NFT</option>
    			<option value="ai">인공지능</option>
    			<option value="bigdata">빅데이터</option>
    			<option value="etc">기타</option>
    		</select>
    		내용:<input type="text" name="codeContent">
    		설명: <input type="text" name="comment">
    			<input type="file" name="upFile">
			   <input type="submit" value="전송"> 		
    		
    </form>
</body>
</html>