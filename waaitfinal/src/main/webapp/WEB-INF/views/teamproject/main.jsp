<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="${path}/WEB-INF/views/common/header.jsp" />
  
<section class="section">
     <div class="card-title d-flex mt-4">
    	<h1 style="margin: auto; font-size: 50px">WAAIT PROJECT</h1>
    </div>
    
    <div class="card mt-4" style="height:800px; width: 95%;">
    	<div class="mt-5 d-flex" style="height: 200px;">
    	<button class="" style="width: 500px; height: 200px; margin: auto;"
		onclick="location.assign('${path}/teamproject/create')"	>Create Project</button>
    	
    	</div>
    	
    	
    
    </div>
</section>
<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />



