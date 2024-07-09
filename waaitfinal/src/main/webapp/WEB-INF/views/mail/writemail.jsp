<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<form action="${path }/mail/sendmail.do" method="post" onsubmit="contentInnerTextHidden()">
		<div id="titleContainer">
			<input type="text" name="mailWrtier" value="${writerName } (${writerMailAddress })">
			<input type="text" name="mailReceiver" placeholder="받는사람">
			<input type="text" name="mailTitle" placeholder="제목">
		</div>
		<div class="toolbar">
	        <button onclick="execCmd('bold')">굵게</button>
	        <button onclick="execCmd('italic')">Italic</button>
	        <button onclick="execCmd('underline')">밑줄</button>
	        <button onclick="execCmd('insertOrderedList')">Numbered List</button>
	        <button onclick="execCmd('insertUnorderedList')">Bullet List</button>
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
	        
	    </div>
	    <input type="hidden" name="mailContent">
	    <input type="submit" value="전송">
    </form>
    <script>
        function execCmd(command, value = null) {
            document.execCommand(command, false, value);
        }
        
        contentInnerTextHidden = () => {
        	document.querySelector("input[name='mailContent']").value = document.getElementById("editor").innerHTML;
        	console.log(document.querySelector("input[name='mailContent']").value);
        }
    </script>
</body>
</html>