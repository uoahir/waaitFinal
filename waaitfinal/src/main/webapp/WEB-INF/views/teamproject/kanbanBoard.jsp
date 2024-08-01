<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<jsp:include page="${path}/WEB-INF/views/common/header.jsp" />
<script>
 var contextPath = "${path}";
 var empName = "${employee.empName}";
</script>

<section class="section">
 <div class="card-title d-flex mt-4">
    	<h1 style="margin: auto; font-size: 50px">Project</h1>
    </div>
       
     <div class="card mt-3" id="kanbanBoard" style="height: 800px;display: flex; flex-direction: row;">
 		<div id="todo" style="width: 25%; border: 1px solid black; background-color: #d3e5ff">
 			<div><h2 style="text-align: center;">To do</h2></div>
 			<div class="" style="flex-direction: row;">
 			<c:if test="${not empty allocations}">
 				<c:forEach var="al" items="${allocations}">
 					<c:if test='${al.functionStatus  eq "ToDo" }'>
 						  <p class ="mr-5 badge bg-primary" onclick="modelopen('${al.functionSummary}',${al.projectNo},'${al.functionName}');">${al.functionName}</p> 																
 					</c:if>
 				</c:forEach>
 			</c:if>
 			</div>
 		</div>
 		
 		<div id="inprogress" style="width: 50%; border: 1px solid black; background-color: #fffacd">
 		<div><h2 style="text-align: center;">In Progress</h2></div>
 		<div class="" style="flex-direction: row;">
 			<c:if test="${not empty allocations}">
 				<c:forEach var="al" items="${allocations}">
 					<c:if test='${al.functionStatus  eq "inProgress" }'>
 						  
 						<p class ="mr-5 badge bg-warning" onclick="modelopen1('${al.functionStartDate }','${al.functionSummary}',${al.projectNo},'${al.functionName}');">${al.functionName}</p>      
 						  	  
 					
 					</c:if>
 					<c:if test='${al.functionStatus  eq "complete-check" }'>
 						  <p class ="mr-5 badge bg-secondary">${al.functionName}</p>      
 					</c:if>
 				</c:forEach>
 			</c:if>
 			</div>
 		
 		
 		</div>
 		<div id="done" style="width: 25%;border: 1px solid black; background-color: #d4edda ">
 		<div><h2 style="text-align: center;">Done</h2></div>
 		<div class="" style="flex-direction: row;">
 			<c:if test="${not empty allocations}">
 				<c:forEach var="al" items="${allocations}">
 					<c:if test='${al.functionStatus  eq "done" }'>
 						  <p class ="mr-5 badge bg-success">${al.functionName}</p>      
 					</c:if>
 				</c:forEach>
 			</c:if>
 			</div>
 		
 		
 		</div>
 		
 		 
     
     </div>
     <div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 id="modalTitle" style="text-align: center;"></h2>
        
        <p id="functionSummary" style="width: 400px; height: 400px; text-align: center;"></p>                             
        <p id="empName"></p>
        <p id="startDate"></p>
        <p id="endDate"></p>
        <div class="d-flex">
        <button class="btn btn-outline-success" id="functionapproval">승인</button>
        
        </div>
        
    </div>
</div>
     
     <style>
     .modal {
    display: none; 
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgb(0,0,0); 
    background-color: rgba(0,0,0,0.4); 
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto; 
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 500px;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
     
</style>
     
    <!--  <div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 id="modalTitle"></h2>
        <p id="functionSummary"></p>                             
        <p id="empName"></p>
        <p id="startDate"></p>
        <p id="endDate"></p>
        <div class="d-flex">
        <button class="btn btn-outline-success" id="functionapproval">승인</button>
    
        </div>
        
    </div>
</div> -->
	
</section>
<script src="${path }/resources/waait/yohan/js/kanbanBoard.js"></script>
<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />
