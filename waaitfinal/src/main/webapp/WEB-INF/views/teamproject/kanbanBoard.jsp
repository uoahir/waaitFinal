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
 						  <p class ="mr-5 badge bg-primary" onclick="allocationtodo('${al.functionSummary}',${al.projectNo},'${al.functionName}');">${al.functionName}</p>      
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
 						  <p class ="mr-5 badge bg-warning" onclick="allocationinProgress('${al.functionSummary}',${al.projectNo},'${al.functionName}');">${al.functionName}</p>      
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
 			<c:if test="${not empty teamProject.allocationList}">
 				<c:forEach var="allocation" items="${teamProject.allocationList}">
 					<c:if test="${allocation.functionStartDate != null && allocation.functionEndDate != null}">
  					<p class="mr-5 badge bg-Success" <%-- onclick="allocationtodo(event,${projectNo},${empNo});" --%>>${allocation.allocationFun}</p>      
					</c:if>
 				</c:forEach>
 			</c:if>
 			</div>
 		
 		
 		</div>
 		
 		    
     
     </div>
     

     
     
	
</section>
<script src="${path }/resources/waait/yohan/js/kanbanBoard.js"></script>
<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />
