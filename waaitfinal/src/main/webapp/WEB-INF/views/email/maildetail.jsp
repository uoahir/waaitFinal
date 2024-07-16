<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일상세페이지</title>
</head>
<body>
	<h1>maildetail</h1>
	<input type="text" value="${mail.mailNo }" hidden="true" id="mailNo">
	<button onclick="addFavorite()">메일 즐겨찾기</button>
	<ul>
		<li>작성자 이메일주소 : ${mail.senderMailAddress }</li>
		<li>작성자 이름 : ${mail.senderName }</li>
		<li>메일 제목 : ${mail.mailTitle }</li>
		<li>메일 받는 사람 : ${mail.receivers.get(0).mailReceiverAddress }</li>
		<li>받은 날짜 : ${mail.mailWriteDate }</li>
		<li>메일 내용 : ${mail.mailContent }</li>
		<c:if test="${not empty mail.files }" >
			<c:forEach var="mailFile" items="${mail.files }" >
				<li>
					<a href="javascript:mailFileDownload('${mailFile.mailOriginalFileName }','${mailFile.mailRenamedFileName }')">
						${mailFile.mailOriginalFileName }
					</a>
				</li>
			</c:forEach>
		</c:if>
	</ul>
	
	<script>
		const addFavorite = () => {
			const mailNo = document.getElementById("mailNo").value;
			fetch("${path}/mail/addfavorite.do?mailNo=" + mailNo)
			.then(response => response.text())
			.then(data => {
				console.log(data);
				if(data == 1) {
					alert("즐겨찾기 추가");
				} else {
					alert("실패");
				}
			});
		}
		
		const mailFileDownload = (oriName, renamed) => {
			location.assign("${path }/mail/filedownload.do?mailOriginalFileName=" + oriName + "&mailRenamedFileName=" + renamed);
		}
	</script>
</body>
</html>