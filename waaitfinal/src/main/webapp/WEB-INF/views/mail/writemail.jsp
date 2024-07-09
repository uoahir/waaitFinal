<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#editor {
		border: 1px solid #ccc;
		min-height: 200px;
		padding: 10px;
		font-family: Arial, sans-serif;
	}
	
	.toolbar {
		margin-bottom: 10px;
	}
	
	.toolbar button {
		margin-right: 5px;
	}
</style>

<c:if test="${not empty temporaryWriteMail.receivers}">
    <c:set var="receiverAddresses">
    	<c:forEach var="receiverAddress" items="${temporaryWriteMail.receivers }">
    		${receiverAddress.mailReceiverAddress }
    		<c:if test="${not status.last }">, </c:if>
    	</c:forEach>
    </c:set>
</c:if>

</head>
<body>
	<form action="${path }/mail/sendmail.do" method="post" onsubmit="contentInnerTextHidden()">
		<div id="titleContainer">
			<input type="text" name="mailWrtier" value="${writerName } (${writerMailAddress })">
			<input type="text" name="mailReceiver" placeholder="받는사람" 
           			value="${not empty temporaryWriteMail.receivers ? receiverAddresses : ''}">
			<input type="text" name="mailTitle" placeholder="제목"
					value="${not empty temporaryWriteMail.mailTitle ? temporaryWriteMail.mailTitle : ''}">
		</div>
		<div class="toolbar">
	        <button type = "button" onclick="execCmd('bold')">굵게</button>
	        <button type = "button" onclick="execCmd('italic')">Italic</button>
	        <button type = "button" onclick="execCmd('underline')">밑줄</button>
	        <button type = "button" onclick="execCmd('insertOrderedList')">Numbered List</button>
	        <button type = "button" onclick="execCmd('insertUnorderedList')">Bullet List</button>
	        <select onchange="execCmd('fontSize', this.value)">
	            <option value="1">매우작게</option>
	            <option value="2">작게</option>
	            <option value="3" selected>보통</option>
	            <option value="4">크게</option>
	            <option value="5">매우크게</option>
	        </select>
	        <input type="color" onchange="execCmd('foreColor', this.value)">
	    </div>
	    <div id="editor" contenteditable="true">
	        <c:if test="${temporaryWriteMail != null}">
	        	${temporaryWriteMail.mailContent }
	        </c:if>
	    </div>
	    <input type="hidden" name="mailContent">
	    <input type="submit" value="전송" name="mailStatus">
	    <input type="submit" value="임시저장" name="mailStatus">
	</form>
    <form action="#" method="POST">
    	<button onclick="testFunction()">test</button>
    </form>
    <script>
        function execCmd(command, value = null) {
        	document.execCommand(command, false, value);
        };
        
        contentInnerTextHidden = () => {
        	document.querySelector("input[name='mailContent']").value = document.getElementById("editor").innerHTML;
        };
        
        /* const testFunction =() => {
        	console.log("이게 왜 넘어가");
        } */
    </script>
</body>
</html>