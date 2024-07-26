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
    	<div>
    	
    	<c:if test="${not empty teamProjects}">
    	<table class="table">
    		<tr>
    		<th>번호</th>
    		<th>제목</th>
    		<th>시작일</th>
    		<th>종료일</th>
    		<th>PM</th>
    		<th>진행 상황</th> 
    		<th>상세정보</th>
    		<th>프로젝트 변경</th>
    		</tr>
    		
    		<c:forEach var="tp" items="${teamProjects }">
    			<tr>
    			<td>${tp.projectNo }</td>
    			<td>${tp.projectName}</td>
    			<td>${tp.projectStartDate }</td>
    			<td>${tp.projectEndDate }</td>
    			<td>${tp.employee.empName}</td>
    			<td id="empNo" hidden="true">${tp.employee.empNo}</td>	
    			<td><span id="projectStatus">${tp.projectStatus}</span></td>
    			<td><button class="btn btn-info" onclick="location.assign('${path}/teamproject${tp.projectNo}/info')">Info</button></td>
    			<td><button class="btn btn-secondary" onclick="teamprojectUpdate(${tp.projectNo})">Update</button></td>
    			</tr>
    				
    		</c:forEach>
    	</table>	
    	</c:if>
   		 	
    	</div>
   	
   
    </div>
		

    <script src="${path }/resources/waait/yohan/js/teamprojectMain.js"></script>

</section>

<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />



