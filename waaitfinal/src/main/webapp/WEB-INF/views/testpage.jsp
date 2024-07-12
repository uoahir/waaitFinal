<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="${path}/WEB-INF/views/common/header.jsp" />

<section>
    <h2>Test Page</h2>
    <p>This is the content of the test page.</p>
	<div class="card"> 으ㅏㅁㄴ우ㅡ마으ㅏ믕</div>
</section>


<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />
