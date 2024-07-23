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
</body>
</html>