<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="${path }/edoc/basicedocend" id="docForm" method="POST" enctype="multipart/form-data">
		<div id="button">
	        <button type="button" onclick="appline();">결재선 지정</button>
	        <button type="button" onclick="insertedoc();">승인요청</button>
	        <button type="button" onclick="save();">임시저장</button>
	        <button>인쇄미리보기</button>
	    </div>
	    <div id="title">
	        <label for="docTitle">문서제목
	            <input type="text" id="docTitle" name="docTitle">
	        </label>
	    </div>
	    <div id="writer">
	    	<input type="text" id="deptName" id="deptName" value="${employee.department.text }" readOnly/>
 	    	<input type="text" id="empName" name = "empName" value = ${employee.empName } readOnly>
	    	<input type="hidden" id="docWriter" name = "docWriter" value = ${employee.empNo }>
	    </div> 
	    <div id="content">
	        <textarea name="basicConent" id="basicContent"></textarea>
	    </div>
	    <div id="life">
	        보존연한
	        <label for="1">
	            <input type="radio" name="docLife" id="1" value="1" checked>
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
	            <input type="radio" name="docOpen" id="a" value="all" checked>
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
	    	<input type="file" name="docFile" multiple>
	    </div>
	    <input type="hidden" name ="docType" value="${type}">
    </form>
    <script>
    	var path = "${path}";
    	alert("contextPath" + path);
    </script>
    <script>
		const insertedoc = () => {
			const form = document.getElementById("docForm");
            const formData = new FormData(form);
            const content = document.querySelector("#basicContent").value;

            const obj = {
                docTitle: formData.get("docTitle"),
                docWriter: formData.get("docWriter"),
                docLife: formData.get("docLife"),
                docOpen: formData.get("docOpen"),
               	docContent : content,
               	docType : formData.get("docType")
            };

            const jsonData = new Blob([JSON.stringify(obj)], { type: 'multipart/form-data' });
            formData.append('obj', jsonData);

            fetch('${path}/edoc/basicedocend', {
                method: "POST",
                /* headers:{
                	'Content-Type':'multipart/form-data'	
                }, */ 
                body: formData
            })
            .then((res) => {
                if (!res.ok) {
                    throw new Error('네트워크 응답이 좋지 않습니다.');
                }
                return res.text();
            })
            .then((data) => {
                console.log(data);
            })
            .catch((error) => {
                console.error('오류 발생:', error);
            });
        };

        const appline = () => {
            window.open("${path}/edoc/appline2", "appline", "height=500, width=500");
        };
    </script>


   <!--  <script>
    	const title = document.querySelector("#docTitle").value;
	  	const writer = document.querySelector("#empNo").value;
    	const content = document.getElementById("basicContent").value;
    	const life = document.querySelector("input[type=radio][name='docLife']:checked").value;
    	const open = document.querySelector("input[type=radio][name='docOpen']:checked").value;
    	
    	/* const data = {
    			method: "POST",
    			body: JSON.stringify(obj)
    	}; */
    	
    	const insertedoc = () => {
    		const form = document.getElementById("docForm");
    		const formData = new FormData(form);
    		
	    	const obj = {
	   			docTitle : formData.get("docTitle"),
	   			docWriter : formData.get("empNo"),
	   			docLife : formData.get("docLife"),
	   			docOpen : formData.get("docOpen")
	    	};
	    
    		
	    	const jsonData = new Blob([JSON.stringify(obj)], {type:'application/json'});
	    	formData.append('obj',jsonData);
	    	
    		fetch('/edoc/basicedocend',{
    			method:"POST",
    			body: formData
    		})
    		.then((res) => res.text())
    		.then(console.log);
    	};
    	
    	const appline = () => {
    		window.open("${path}/edoc/appline","appline","height=500, width=500");
    	}
    </script> -->
</body>
</html>