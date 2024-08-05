<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<thead class="thead-dark">
	<tr>
		<th><input type="checkbox" name="checkAll"></th>
		<th>부서명</th>
		<th>팀명</th>
		<th>동작</th>
		<th></th>
	</tr>
</thead>
<tbody>
	<c:if test="${not empty depts }">
		<c:forEach var="dept" items="${depts }">
			<tr id="${dept.deptCode }">
				<td></td>
				<td colspan="3">${dept.deptName }</td>
			</tr>
			<c:if test="${not empty teams }">
				<c:forEach var="team" items="${teams }">
					<c:if test="${dept.deptCode eq team.parentCode }">
						<tr id="${team.deptCode }">
							<td><input type="checkbox" name="checkTeam"></td>
							<td></td>
							<td>${team.deptName }</td>
							<td>
								<button class="btn btn-primary" onclick="showModifyInput(event)">수정</button>
								<button class="btn btn-danger" onclick="deleteTeam()">삭제</button>
							</td>
							<td><input type="text" name="modifyTeamNameInput"
								class="form-control" id="modifyInput"
								placeholder="팀은 빼고 입력하세요 ex)개발1o 개발1팀x" hidden="true">
								<button class="btn btn-success" onclick="modifyApply(event)"
									hidden="true">적용</button>
								<button class="btn btn-danger" onclick="cancelModify(event)"
									hidden="true">취소</button></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${empty teams }">
				<tr>
					<td colspan="3">팀이 없습니다.
				</tr>
			</c:if>
		</c:forEach>
	</c:if>
</tbody>