<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>waait chat</title>

	<style>
	
		body{
            margin: 0;
            padding: 0;
        }
        
        #chatting_main{
        	width: 100%;
        	/* border: 1px solid red; */
        	display: flex;
        }
        
        #chatting_main_aside{
        	width: 80px;
        	position: fixed;
        	/* border: 1px solid red; */
        	/* height: 100px; */
        }
        
        #chatting_main_content{
        	width: 100%;
        	margin-left: 80px;
        	/* border: 1px solid red; */
        	/* height: 100px; */
        }
        
	</style>

</head>
<body>
	<div id="chatting_main">
		<div id="chatting_main_aside">
			<jsp:include page="/WEB-INF/views/chatting/chataside.jsp"/>
		</div>
		
		<div id="chatting_main_content">
			<jsp:include page="/WEB-INF/views/chatting/chatuserlist.jsp"/>
		</div>
		
	</div>
	
	
</body>
</html>