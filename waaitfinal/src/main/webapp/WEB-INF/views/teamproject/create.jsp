<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import = "com.google.gson.Gson" %> <!-- Gson 받아온것 -->
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
    
    Gson gson = new Gson();
    String employeesJson = gson.toJson(request.getAttribute("employees"));
%>
<c:set var="employees" value="<%=employeesJson %>" />

<script>
 var contextPath = "${path}";
 var employees = JSON.parse('<%= employeesJson %>');
</script>
<jsp:include page="${path}/WEB-INF/views/common/header.jsp" />

<section class="section">
    	<div class="card-title d-flex mb-4">
    	<h1 style="margin: auto; font-size: 50px" id="topbanner">Create Project - Content</h1>
    </div>
   	
  
    <div class="card" style="height: 850px">
    	<div id="projectInfo">
    	
    	<input type="text" name="projectName" id="projectName" style="width: 100%; height: 50px">
         
         <textarea class="form-control mt-5" id="proejctSummary" rows="28" cols="" placeholder="plz in code" name="codeContent"></textarea>
         
       	<input type="date" name ="projectStartDate" id="projectStartDate">
       	<input type="date" name ="projectEndDate" id="projectEndDate">
       		  
    </div>
    
    
    	<div><button onclick="firstStep()" id="firstStep">다음단계</button></div>
    	<div class="d-flex mt-4">
    	<div class="progress progress-primary" style="width: 90%; margin: auto;">
                    <div class="progress-bar progress-label" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
    		
    	</div>
	 </div>
    
</section>
<script src="${path }/resources/waait/yohan/js/teamprojectCreate.js"></script>

	

<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />
