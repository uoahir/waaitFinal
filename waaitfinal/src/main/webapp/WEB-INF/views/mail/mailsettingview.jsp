<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<form method="Post" action="${path }/mail/applymailsetting.do" >
	<p>페이지당 보여줄 데이터수</p>    
	<select name="numPerpage">
		<option value="5">5</option>
		<option value="7">7</option>
		<option value="10">10</option>
		<option value="20">20</option>
	</select>
	
	<p>스팸메일주소 등록</p>
	<input type="text" name="spamMailAddress" placeholder="입력하세요">
	<input type="text" name="spamMailAddress" placeholder="입력하세요">
	<input type="text" name="spamMailAddress" placeholder="입력하세요">
	
	<input type="submit" value="설정완료">
</form>

<p>등록된 스팸메일 주소</p>
<c:if test="${not empty spamDomains }">
	<c:forEach var="address" items="${spamDomains }">
		<span>스팸메일주소 : ${address.spamDomainAddress }</span>
		<button onclick="deleteSpamMailAddress('${address.spamDomainAddress }')">스팸도메인삭제</button>
	</c:forEach>
</c:if>


<!-- <input type="number" name="numPerpage" placeholder="페이지당 보여줄 데이터수"> -->