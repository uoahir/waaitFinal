<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${path }/insertcodeboard" method="post">
		제목 : <input type="text" name="codeBoardTitle">
			  <select name="codeType">
			  	<option  value="c">C++</option>
			  	<option value="java">JAVA</option>
			  	<option value="c#">C#</option>
			  	<option value="python">Python</option>
			  	<option value ="linux">Linux</option>
			  </select>	
		<input type="submit" value="전송">
	
	</form>
</body>
</html>