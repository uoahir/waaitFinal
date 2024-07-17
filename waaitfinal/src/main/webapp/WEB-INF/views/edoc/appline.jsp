<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	div#app{
		display:flex;
	}
	div#employeeList{
		width: 50%;
	}
	div#button{
		width: 20%;
	}
	div#approvalLine{
		width: 50%
	}
	div.line{
		display:flex;
	}
	div.line>div{
		width: 30%
	}
</style>
<body>
	<div id="app">
		<div id="employeeList">
			<div>조직도</div>
			<c:if test="${not empty departments && not empty employees}">
				<c:forEach items="${departments }" var="d">
					<div>${d.deptName }</div>
					<c:forEach items="${employees }" var="e">
						<c:if test="${d.deptName eq e.department.deptName}">
							<div onclick="inappline('${e.empName}','${e.empNo }', '${e.department.deptName }', '${e.jobLevel.levelName }');" class="line">
								<div>${e.empName }</div>
								<div>${e.jobLevel.levelName }</div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</c:if>
		</div>
		<!-- <div id="button">
			<button onclick="inappline">&gt;</button>
		</div> -->
		<div id="approvalLine">
			<div>결재라인</div>
			<div class="line">
				<div>부서</div><div>직급</div><div>이름</div>
			</div>
		</div>
	</div>
	
	<div>
		<button onclick="saveApprovalLine();">결재선 저장</button>
	</div>
	
	<script>
		const selectedEmployees = [];
		
		const inappline = (empName, empNo, deptName, levelName) => {
			console.log(empName, empNo, deptName, levelName);
			
			const employee = {empName, empNo, deptName, levelName};
			selectedEmployees.push(employee);
			
			const $div = document.createElement("div");
			$div.classList.add('line');
			$div.innerHTML="<div>" + deptName + "</div><div>"+ levelName+"</div><div>"+ empName+"</div>";
			const $approvalLine = document.getElementById("approvalLine");
			
			$approvalLine.appendChild($div);
		}
		
		const saveApprovalLine = () => {
			console.log(selectedEmployees);
			
			// 부모창으로 데이터 전송 
			if (window.opener) {
				window.opener.setApprovalLine(selectedEmployees);
				window.close();
			}
		}
	</script>

</body>
</html>