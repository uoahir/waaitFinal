<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="total">
		<div id="div1">
			<div id="div1-1">
				<form action="${path }/manage/enrollemployee.do" method="post" enctype="multipart/form-data">
					<h1>인사관리</h1>
					<p>사원등록</p>
					<input type="text" name="empId" placeholder="아이디"><br>
					<input type="text" name="empName" placeholder="사원이름"><br>
					<p>프로필 사진</p>
					<input type="file" name="profile"><br>
					<p>성별</p>
					<input type="radio" name="empGender" value="남">남
					<input type="radio" name="empGender" value="여">여<br>
					<input type="date" name="empBirth" placeholder="탄생일"><br>
					<input type="text" name="empPhone" placeholder="전화번호"><br>
					<input type="text" name="empAddress" placeholder="주소"><br>
					<p>싸인 파일</p>
					<input type="file" name="signfile">
					<p>부서선택</p>
					<select name="department.deptName">
						<c:if test="${not empty depts }">
							<c:forEach var="dept" items="${depts }">
								<option value="${dept.deptName }">부서명 : ${dept.deptName }</option>			
							</c:forEach>
						</c:if>
					</select>
					<br>
					<input type="submit" value="전송">
				</form>
			</div>
			<div id="div1-2">
				<h1>인사이동</h1>
					<input type="text" name="searchEmpName" placeholder="이름입력"><br>
					<input type="text" name="searchEmpId" placeholder="아이디입력"><br>
					<button onclick="searchEmpForModifyDepartment()">검색</button>
				<div id="searchResultContainer">
					
				</div>
				<script>
					const searchEmpForModifyDepartment = () => {
						const empName = document.querySelector("input[name='searchEmpName']").value;
						const empId = document.querySelector("input[name='searchEmpId']").value;
						console.log(empName + " " + empId);
						fetch("${path }/manage/searchempformodifydept.do", {
							method : "POST",
							headers : {
								"Content-Type" : "application/json"
							},
							body : JSON.stringify({
								empName : empName,
								empId : empId
							})
						})
						.then(response => response.json())
						.then(data => {
							const searchEmp = data.searchEmployee;
							const dept = data.departments;
							const team = data.teams;
							let count = 0;
							console.log(dept);
							
							let selectTeamString = "<select id='modifyWantTeam'>";
							let selectDeptString = "<select id='modifyWantDept'>";
							for(let key in dept) {
								if(dept[key].deptName == searchEmp.department.deptName) {
									selectDeptString += "<option value='" + dept[key].deptName + "' disabled>" + dept[key].deptName + "</option>"
								} else {
									selectDeptString += "<option value='" + dept[key].deptName + "' data-deptCode='" + dept[key].deptCode + "'>" + dept[key].deptName + "</option>"	
								}
								
								if(count == 0) {
									for(let k in team) {
										if(dept[key].deptCode == team[k].parentCode) {
											selectTeamString += "<option value='" + team[k].deptName + "' data-deptcode='" + team[k].deptCode + "'>" + team[k].deptName + "</option>"
										}										
									}
								}
								count++;
							}
							selectDeptString += "</select>";
							selectTeamString += "</select>";
							
							document.getElementById("searchResultContainer").innerHTML = 
								"<h3>검색결과</h3>"
								+ "<ul>"
									+ "<li id='empIdLi' data-empId='" + searchEmp.empId + "'>아이디 : " + searchEmp.empId + "</li>"
									+ "<li>이름 : " + searchEmp.empName + "</li>"
									+ "<li>출생일 : " + searchEmp.empBirth + "</li>"
									+ "<li>성별 : " + searchEmp.empGender + "</li>"
									+ "<li>휴대폰 : " + searchEmp.empPhone + "</li>"
									+ "<li>거주지 : " + searchEmp.empAddress + "</li>"
									+ "<li>부서 : " + searchEmp.department.deptName + "</li>"
									+ "<li>직급 : " + searchEmp.jobLevel.levelName + "</li>"
								+ "</ul>"
								+ "<h1>현재부서</h1>"
								+ "<p>부서 : " + searchEmp.deptName + " 팀 : " + searchEmp.department.deptName + "</p>"
								+ "<h1>변경할 부서</h1>"
								+ selectDeptString
								+ selectTeamString
								+ "<button onclick='modifyDept()'>변경완료</button>";
								
							document.getElementById("modifyWantDept").addEventListener("change", e => {
								const modifyDeptSelect = e.currentTarget;
								const deptCode = modifyDeptSelect[modifyDeptSelect.selectedIndex].dataset.deptcode;
								fetch("${path }/manage/changedeptselect.do", {
									method : "POST",
									headers : {
										"Content-Type" : "application/json"
									},
									body : JSON.stringify({
										deptCode : deptCode
									})
								})
								.then(response => response.json())
								.then(data => {
									const team = data.teamList;
									let changeOptionString = "";
									for(let key in team) {
										changeOptionString += "<option value='" + team[key].deptName + "' data-deptcode='" + team[key].deptCode + "'>" + team[key].deptName + "</option>"
									}
									document.getElementById("modifyWantTeam").innerHTML = changeOptionString;  
								})
							});
						});
					}
					
					const modifyDept = () => {
						const deptSelect = document.getElementById("modifyWantDept");
						const teamSelect = document.getElementById("modifyWantTeam");
						
						const wantModifyDeptName = deptSelect.value; //안쓸거같음..
						const wantModifyDeptCode = deptSelect[deptSelect.selectedIndex].dataset.deptcode;
						const wantModifyTeamCode = teamSelect[teamSelect.selectedIndex].dataset.deptcode;
						const empId = document.getElementById("empIdLi").dataset.empid;
						console.log("empId : " + empId);
						console.log("teamCode : " + wantModifyTeamCode);
						fetch("${path }/manage/empmodifydept.do", {
							method : "POST",
							headers : {
								"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
							},
							body : "wantModifyDeptName=" + wantModifyDeptName + "&wantModifyDeptCode=" + wantModifyDeptCode
										+ "&empId=" + empId + "&wantModifyTeamCode=" + wantModifyTeamCode
						})
						.then(response => response.text())
						.then(data => {
							console.log(data);
						});
						console.log(wantModifyDeptCode);
						//내일 매핑할 컨트롤러 만들면됨.
					}
					
					
				</script>
			</div>
			<div id="div1-3" style="margin-left : 10px;">
				<div>
					<h1>인사이동 내역조회</h1>
					<select id="joinBySelect">
						<option value="이름">이름으로 조회</option>
						<option value="아이디">아이디로 조회</option>
						<option value="기간">기간으로 조회</option>
					</select>
					<input type="text" name="parameter" placeholder="입력">
					<input type="date" name="startDate" hidden="true">
					<input type="date" name="endDate" hidden="true">
					<button onclick="joinMovingDepartment()">조회하기</button>
				</div>
			</div>
			<script>
				document.getElementById("joinBySelect").addEventListener("change", e => {
					const select = e.currentTarget;
					
					if(select[select.selectedIndex].value == "기간") {
						console.log("조건문 왔음");
						document.querySelector("input[name='startDate']").hidden = false;
						document.querySelector("input[name='endDate']").hidden = false;
						document.querySelector("input[name='parameter']").hidden = true;
					} else {
						document.querySelector("input[name='startDate']").hidden = true;
						document.querySelector("input[name='endDate']").hidden = true;
						document.querySelector("input[name='parameter']").hidden = false;
					}
				});
				
				const joinMovingDepartment = () => {
					const status = document.getElementById("joinBySelect").value;
					let searchParam = "";
					let param;
					
					if(status == "기간") {
						const startDate = document.querySelector("input[name='startDate']").value;
						const endDate = document.querySelector("input[name='endDate']").value;
						param = {
							status : status,
							startDate : startDate,
							endDate : endDate
						}
					} else {
						searchParam = document.querySelector("input[name='parameter']").value;
						param = {
							status : status,
							searchParam : searchParam
						}
					}
					
					fetch("${path }/manage/joinmovingdepartment.do", {
						method : "POST",
						headers : {
							"Content-Type" : "application/json"
						},
						body : JSON.stringify(param)
					})
					.then(response => response.json())
					.then(data => {
						console.log(data);
					});
				}
			</script>
		</div>
		<div id="empInfoContainer">
			<table>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>레벨등급 코드</th>
						<th>사원 이름</th>
						<th>입사일</th>
						<th>퇴사일</th>
						<th>퇴사여부</th>
						<th>사원 이메일주소</th>
						<th>프로필파일</th>
						<th>성별</th>
						<th>출생일</th>
						<th>휴대폰 번호</th>
						<th>거주지 주소</th>
						<th>사인파일</th>
						<th>부서명</th>
						<th>직급</th>
					</tr>
			<c:if test="${not empty employees }">
				<c:forEach var="e" items="${employees }">
					<tr>
						<td>${e.empId }</td>
						<td>${e.empPwd }</td>
						<td>${e.levelCode }</td>
						<td>${e.empName }</td>
						<td>${e.empStartDate }</td>
						<td>${e.empEndDate }</td>
						<td>${e.leaveYN }</td>
						<td>${e.empEmail }</td>
						<td>${e.empProfile }</td>
						<td>${e.empGender }</td>
						<td>${e.empBirth }</td>
						<td>${e.empPhone }</td>
						<td>${e.empAddress }</td>
						<td>${e.empSignfile }</td>
						<td>${e.department.deptName }</td>
						<td>${e.jobLevel.levelName }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty employees }">
				없음
			</c:if>
			</table>
		</div>
	</div>
	<button onclick="departmentTest()">사원테스트</button>
	<button onclick="departmentAddTest()">부서추가테스트</button>
	
	<script>
		const departmentTest = () => {
			fetch("${path }/manage/departmenttest.do")
		}
		
		const departmentAddTest = () => {
			
		}
	</script>
</body>
<style>
	#total {
		display : grid;
		overflow-x : auto;
	}
	#total>div {
		border : 1px solid black;
	}
	#empInfoContainer {
		overflow-x : auto;
	}
	#div1 {
		display : flex;
	}
</style>
</html>