<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>마이페이지 데모</h3>
	
	<table>
		<thead>
			<c:forEach var="m" items="${total }">
					<tr>
						<td>"EMPNO: "+${m.empNo }</td>
						<td>"EMPNAME: "+${m.empName }</td>
						<td>"vacationNo: "+${m.vacationNo }</td>
						<td>"workNo: "+${m.workNo }</td>
					</tr>
				</c:forEach>
		</thead>
	</table>







</body>
</html>