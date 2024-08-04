<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<script>
var contextPath = "${path}";
var employee = "${employee}";
var empNo = "${employee.empNo}";
</script>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
  <style>
    .custom-select {
        background-color: white !important;
    }
</style>
<section class="section">
     <div class="card-title d-flex mt-4">
    	<h1 style="margin: auto; font-size: 50px">WAAIT PROJECT</h1>
    </div>
    
    <div class="card mt-4" style="height:800px; width: 95%;">
    	<div class="mt-1 d-flex"  style="height: 100px;">
    	<button class="btn btn-Success" style="width: 250px; height: 50px; margin: auto;"
		onclick="location.assign('${path}/teamproject/create')"	>Create Project</button>
    	
    	</div>
    	
    	
    	<div style="height: 700px">
    	
    	<c:if test="${not empty teamProjects}">
    	<table class="table">
    		<tr>
    		<th>번호</th>
    		<th>제목</th>
    		<th>시작일</th>
    		<th>종료일</th>
    		<th>PM</th>
    		<th>상태</th> 
    		<th>상세정보</th>
    		<th>진행 사항</th>
    		</tr>
    	
    		<c:forEach var="tp" items="${teamProjects }">
    			<tr>
    			<td>${tp.projectNo }</td>
    			<td>${tp.projectName}</td>
    			<td>${tp.projectStartDate }</td>
    			<td>${tp.projectEndDate }</td>
    			<td>${tp.employee.empName}</td>
    			<td id="empNo" hidden="true">${tp.employee.empNo}</td>
    			<c:if test='${tp.projectStatus eq  "preparation" }'>
    			<td><span id="projectStatus" class="badge bg-dark">${tp.projectStatus}</span></td>
    			</c:if>
    			<c:if test='${tp.projectStatus  !=  "preparation" }'>
    			<td><span id="projectStatus" class="badge bg-dark">${tp.projectStatus}</span></td>
    			</c:if>
    			<td><button class="btn btn-info" onclick="location.assign('${path}/teamproject${tp.projectNo}/info')">Info</button></td>
    			<td><button class="btn btn-secondary" onclick="location.assign('${path}/project${tp.projectNo}/update');">Update</button></td>
    			</tr>
    					
    		</c:forEach>
    	</table>	
    	</c:if>
   		 	
   		 	
   		 	
    	</div>
   	<div>${pageBar }</div>
   
    </div>
		

    <script src="${path }/resources/waait/yohan/js/teamprojectMain.js"></script>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />



