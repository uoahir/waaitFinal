<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div#empContainer{
        width: 200px;
        height: 200px;
        overflow: scroll;
        border: 1px solid black;
    }
    div#lineContainer{
        width: 200px;
        height: 200px;
        border: 1px solid black;
    }
    div#appline{
        display: flex;
    }
    div#button{
    	margin-top:20px;
    	display:flex;
    	flex-direction:column;
    }
    li{
    	list-style:none;
    }
    div#line{
    	display:flex;
    	flex-direction:column;
    }
</style>
<body>
	<div id="appline">
		<div id="line">
	  		<div>조직도</div>
	        <div id="empContainer">        	
	        	<c:if test="${not empty employees }">
	       			<c:forEach var="i" items="${employees }">
	       				<div>
	       					<label><input name="emp" type="checkbox" value="${i.empNo }, ${i.department.deptName}"> ${i.empName }</label>
	       				</div>
	       			</c:forEach>
	        	</c:if>
	        </div>
        </div>
        <div id="button">
        	<button id="inappall">&gt;&gt;</button>
        	<button id="inapp" onclick="inappline();">&gt;</button>
        	<button id="outapp">&lt;</button>
        	<button id="outappall">&lt;&lt;</button>
        </div>
        <div id="line">
	        <div>결재선</div>
	        <div id="lineContainer">
	            <table>
	                <thead>
	                    <tr>
	                        <th>결재</th>
	                        <th>부서명</th>
	                        <th>직급</th>
	                        <th>이름</th>
	                    </tr>
	                </thead>
	                <tbody id="here">
	                    <tr>
	                        <td>
	                            <select name="appType" id="appType">
	                                <option value="">결재</option>
	                                <option value="">참조</option>
	                            </select>
	                        </td>
	                        <td>${i.kasjf }</td>
	                        <td>직급</td>
	                        <td>이름</td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
        </div>
	</div>
	<div>
		<button>저장하기</button>
	</div>
	
	<script>
		const inappline = () => {
			let appArray = document.getElementsByName('emp');
			const $tr = document.createElement("tr");
			for(let i = 0; i < appArray.length; i++){
				if(appArray[i].checked == true){
					const $td = document.createElement("td");
					$td.innerText=appArray[i].value;
					const $td2 = document.createElement("td");
					$td2.innerText=appArray[i].value;
					const $td3 = document.createElement("td");
					$td3.innerText=appArray[i].value;
					const $td4 = document.createElement("td");
					$td4.innerText=appArray[i].value;

					$tr.appendChild($td);
					$tr.appendChild($td2);
					$tr.appendChild($td3);
					$tr.appendChild($td4); 
				}
			}
			const $tbody = document.querySelector("#here");
			$tbody.appendChild($tr);
		}
	</script>
	<script>
/* 		const inappline = () => {
			const appArray = document.getElementsByName("emp");
			for(let i = 0; i < appArray.length; i++){
				if(appArray)
			}
			location.assingn()
		} */
	</script>
	
</body>
</html>