<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<table class="table mb-0">
	<thead class="thead-dark">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>출생일</th>
			<th>직급</th>
			<th>부서/팀</th>
			<th>핸드폰 번호</th>
			<th>거주지 주소</th>
			<th>성별</th>
			<th>퇴사여부</th>
			<th>남은연차</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty employees}">
		<tr>
			<td colspan="8">사원이 존재하지 않습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty employees }">
		<c:forEach var="emp" items="${employees }">
			<tr onclick="location.assign('${path }/manage/joinempdetail.do?empNo=${emp.empNo }')">
				<td>${emp.empName }</td>
				<td>${emp.empId }</td>
				<td>${emp.empBirth }</td>
				<td>${emp.jobLevel.levelName }</td>
				<td>${emp.deptName } / ${emp.teamName }</td>
				<td>${emp.empPhone }</td>
				<td>${emp.empAddress }</td>
				<td>${emp.empGender }</td>
				<c:if test="${emp.leaveYN eq 'Y' }">
					<td>퇴사</td>
				</c:if>
				<c:if test="${emp.leaveYN eq 'N' }">
					<td>재직</td>
				</c:if>
				<c:if test="${emp.leaveYN ne 'Y' and emp.leaveYN ne 'N' }">
					<td>왜 yn이 아닌데</td>
				</c:if>
				<td>${emp.remainingAnnualLeave }</td>
			</tr>
		</c:forEach>
		
	</c:if>
	</tbody>
</table>
<div id="pageBarContainer">
	${pageBar }
</div>