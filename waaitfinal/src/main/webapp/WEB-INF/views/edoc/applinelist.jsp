<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재라인 지정</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    #app {
        display: flex;
        margin-top: 20px;
    }
    #departmentList, #employeeList, #approvalLine {
        width: 30%;
        margin: 0 2.5%;
    }
    .card {
        margin-bottom: 10px;
    }
    .employee, .approval, .department {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 5px;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 5px;
        cursor: pointer;
        background-color: #f8f9fa;
        transition: background-color 0.2s;
    }
    .employee:hover, .department:hover {
        background-color: #e2e6ea;
    }
    .approval {
        background-color: #e9ecef;
    }
    .header {
        font-weight: bold;
        padding: 10px;
        background-color: #343a40;
        color: white;
        text-align: center;
    }
    .btn-save {
        margin-top: 20px;
        display: block;
        width: 100%;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-12 header">
                결재라인 지정
            </div>
        </div>
        <div id="app">
            <div id="departmentList">
                <div class="header">부서 목록</div>
                <c:if test="${not empty departments}">
                    <c:forEach items="${departments}" var="d">
                        <div class="department mt-3" onclick="showEmployees('${d.deptName}')">
                            ${d.deptName}
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <div id="employeeList">
                <div class="header">직원 목록</div>
                <!-- 직원 목록이 동적으로 표시됩니다 -->
            </div>
            <div id="approvalLine">
                <div class="header">결재라인</div>
                <div class="approval mt-3">
                    <span>부서</span><span>직급</span><span>이름</span>
                </div>
            </div>
        </div>
        <button class="btn btn-primary btn-save" onclick="saveApprovalLine();">결재선 저장</button>
    </div>

    <script>
   		const employees = []; 
    	window.onload = function(){
    		
    		fetch("/edoc/appline")
    		.then(response => response.json())
    		.then(data => {
    			console.log(data);
    			for(let i of data){
    				employees.push(i);
    			}
    		})
    	} 
        console.log(employees);
    	
        const selectedEmployees = [];

        const showEmployees = (deptName) => {
            const employeeList = document.getElementById("employeeList");
            employeeList.innerHTML = '<div class="header">직원 목록</div>';

     		const deptEmployees = employees.filter(e => e.department.deptName === deptName);
            deptEmployees.forEach(e => {
            	console.log(e);
            	console.log(e.empName, e.empNo, e.department.deptName);
            	const empName = e.empName;
            	const empNo = e.empNo;
            	const deptName = e.department.deptName;
            	const levelName = e.jobLevel.levelName;
            	
                const div = document.createElement("div");
                div.classList.add('employee');   
                div.classList.add('mt-3');   
                div.onclick = () => inappline(empName, empNo, deptName, levelName);
                /* div.addEventListener('click', (e)=>{
                	console.log("Test");
                	inappline(empName,empNo,deptName,levelName);
                	console.log(e.target);
                	e.target.setAttribute('disabled', 'true');
                }); */
                div.innerHTML =  e.empName + " "+ e.jobLevel.levelName;
                employeeList.appendChild(div);
                
            });
        };
       
		
        const inappline = (empName, empNo, deptName, levelName, empProfile)=>{
            console.log(empName, empNo, deptName, levelName);

            const employee = { empName, empNo, deptName, levelName };
            selectedEmployees.push(employee);

            const div = document.createElement("div");
            div.classList.add('approval');
            div.classList.add('mt-3');
            div.innerHTML = "<span>" + deptName + "</span><span>" + levelName + "</span><span>" + empName+ "</span>";
            const approvalLine = document.getElementById("approvalLine");

            approvalLine.appendChild(div);
        };

        const saveApprovalLine = () => {
            console.log(selectedEmployees);

            // 부모창으로 데이터 전송 
            if (window.opener) {
                window.opener.setApprovalLine(selectedEmployees);
                window.close();
            }
        };
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
