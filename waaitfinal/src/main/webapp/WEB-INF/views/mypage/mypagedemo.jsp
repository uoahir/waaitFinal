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
	<h1>마이페이지 데모</h1><br>
	<h2><나의 연차 조회></h2>
	
	<table>
		<thead>
		<tr>	
			<th>사원번호</th>
			<th>사원이름</th>
		</tr>
					<tr>
						<td>${total.get(0).empNo }</td>
						<td>${total.get(0).empName }</td>
					</tr>			
		</thead>
	</table><br>
	
	<table>
		<thead>
		<tr>	
			<th>잔여연차 / </th>
			<th>총연차</th>
		</tr>
			<c:forEach var="m" items="${total }">
					<tr>
						<td>${m.vacaLeft }</td>
						<td>${m.basicAnnualLeave }</td>
					</tr>
				</c:forEach>
		</thead>
	</table>
	
	<table>
		<thead>
			<tr>
				<th>문서제목</th>
				<th>승인상태</th>
				<th>연차구분</th>
				<th>연차시작일</th>
				<th>연차끝</th>
			</tr>
			<c:forEach var="m" items="${total}">
				<tr>
					<td>휴가신청서</td>
					<td>${m.vacaPermit }</td>
					<td>${m.vacaType }</td>
					<td>${m.startDate }</td>
					<td>${m.endDate }</td>
				</tr>
			</c:forEach>
		</thead>
	</table>
	
	<br>
	<br>
	<h2><나의 근태 현황 조회></h2>
	







</body>
</html>