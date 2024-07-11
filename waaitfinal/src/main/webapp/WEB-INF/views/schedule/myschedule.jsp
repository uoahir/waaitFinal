<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- <style>
.table{
	bord:solid red;
}
</style> -->

<body>
	<h3>나의 일정</h3>
	
	<table>
		<thead>
			<tr>
				<th>scheNo</th>
				<th>empNo</th>
				<th>deptCode</th>
				<th>scheTime</th>
				<th>startNo</th>
				<th>endNo</th>
				<th>scheTitle</th>
				<th>scheContent</th>
			</tr>
			<c:forEach var="s" items="${total }"> <!-- s는 여기서 정해줌, total은 model에 저장해둔 값. total값이 s로 들어가서 하나씩 for문 반복 -->
				<tr> 
					<td>${s.scheNo}</td>
					<td>${s.empNo}</td>
					<td>${s.deptCode}</td>
					<td>${s.scheTime}</td>
					<td>${s.startNo}</td>
					<td>${s.endNo}</td>
					<td>${s.scheTitle}</td>
					<td>${s.scheContent}</td>
				</tr>
			</c:forEach>
		</thead>
	</table>
	
	
</body>
</html>
