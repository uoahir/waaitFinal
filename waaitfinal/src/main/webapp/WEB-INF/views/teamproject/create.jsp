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
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="section" style="">
    	<div class="card-title d-flex mb-4">
    	<h1 style="margin: auto; font-size: 50px" id="topbanner">Create Project - Content</h1>
    </div>
   	
  
    <div class="" style="height: 900px;">
    	<div id="projectInfo" >
    	
    	<input type="text" name="projectName" id="projectName" style="width: 100%; height: 50px">
         
         <textarea class="form-control mt-5" id="proejectSummary" rows="17" cols="" placeholder="plz in code" name="proejectSummary"></textarea>
   <div class="d-flex" style="justify-content: space-around;">
   <div class="card mt-4 d-flex" style="width: 40%">
    <form id="repoForm" >
    	<div class="card-header">
    		<h2 class="card-title">Git Repository Create</h2>
    	</div>
        <div class="d-flex" style="justify-content: center; width: 500px">
        <label for="name" style="width: 150px">Repository Name : </label>
        <input class="form-control" style="margin: auto; width: 300px" type="text" id="name" name="name" required>
        </div>
        <div class="d-flex" style="justify-content: center; width: 500px">
        <label for="description" style="width: 150px">Description:</label>
        <input class="form-control" style="margin: auto; width: 300px" type="text" id="description" name="description">
        </div>
        <label for="isPrivate">Private</label>
        <input class="form-check-input" style="" type="checkbox" id="isPrivate" name="isPrivate">
        <br>
        <button type="submit">Create Repository</button>
    </form> 
    </div>
    
    <div class="card mt-4 ml-4" style="width: 15%">   	
       	<div class="d-flex" style="justify-content: space-around;"> <p>시작 기간 </p>  <p>종료 기간</p></div>
       	<div class="d-flex">
       	<input type="date" name ="projectStartDate" id="projectStartDate">
       	<p>~</p>  <input type="date" name ="projectEndDate" id="projectEndDate">
      	</div>
      </div> 		  
    </div>
    </div>	
    
       
    	<div class="d-flex mb-3">
    	<div><button onclick="firstStep()" id="firstStep">다음단계</button></div>
    	<div class="progress progress-primary" style="width: 90%; margin: auto;">
                    <div class="progress-bar progress-label" role="progressbar" style="width: 33%" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
    		
    	</div>
	 </div>
    
</section>
<script src="${path }/resources/waait/yohan/js/githubProject.js"></script>
<script src="${path }/resources/waait/yohan/js/teamprojectCreate.js"></script>

	

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
