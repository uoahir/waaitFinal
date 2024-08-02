<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="${path}/WEB-INF/views/common/header.jsp" />
<script>
    var contextPath = "${path}";
</script>

<section class="section">
    <div>
        <div>
            <h4 style="text-align: center;">진행률</h4>
            <c:set var="todo" value="0" />
            <c:set var="inProgress" value="0" />
            <c:set var="complete_check" value="0" />
            <c:set var="done" value="0" />

            <c:if test="${not empty allocations}">
                <c:forEach var="al" items="${allocations}">
                    <c:choose>
                        <c:when test="${al.functionStatus eq 'ToDo'}">
                            <c:set var="todo" value="${todo + 1}" />
                        </c:when>
                        <c:when test="${al.functionStatus eq 'inProgress'}">
                            <c:set var="inProgress" value="${inProgress + 1}" />
                        </c:when>
                        <c:when test="${al.functionStatus eq 'complete-check'}">
                            <c:set var="complete_check" value="${complete_check + 1}" />
                        </c:when>
                        <c:when test="${al.functionStatus eq 'done'}">
                            <c:set var="done" value="${done + 1}" />
                        </c:when>
                    </c:choose>
                </c:forEach>
            </c:if>
            <div class="mt-4" style="display: flex; justify-content: space-around;">
                <div><p style="text-align: center;"> ToDo : ${todo}</p>
                	<div class="card mt-4" style="width: 250px; height: 700px">
                		<c:if test="${not empty allocations }">
                			<c:forEach var="al" items="${allocations }">
                				<c:if test="${al.functionStatus eq 'ToDo' }">
                				<div class="d-flex mt-2" style="justify-content: space-around;"> <p class="mr-3">${al.functionName }</p> <button class="btn btn-outline-info mr-3" onclick="modelopen('${al.functionName}','${al.functionSummary}','${al.empName}')">상세 정보</button></div>
                				</c:if>
                			</c:forEach>
                		</c:if>
                	</div>
                
                
                </div>
               	<div><p style="text-align: center;">InProgress:  ${inProgress}</p>
               		<div class="card mt-4" style="width: 250px; height: 700px">
                	<c:if test="${not empty allocations }">
                			<c:forEach var="al" items="${allocations }">
                				<c:if test="${al.functionStatus eq 'inProgress' }">
                				<div class="d-flex mt-2" style="justify-content: space-around;"> <p class="mr-3">${al.functionName }</p> <button class="btn btn-outline-info mr-3" onclick="modelopen1('${al.functionName}','${al.functionSummary}','${al.empName}','${al.functionStartDate }')">상세 정보</button></div>
                				</c:if>
                			</c:forEach>
                		</c:if>
                	
                	</div></div>
                <div><p style="text-align: center;">Request-Check : ${complete_check}</p>
                	<div class="card mt-4" style="width: 250px; height: 700px">
                	<c:if test="${not empty allocations }">
                			<c:forEach var="al" items="${allocations }">
                				<c:if test="${al.functionStatus eq 'complete-check' }">
                				<div class="d-flex mt-2" style="justify-content: space-around;"> <p class="mr-3">${al.functionName }</p> <button class="btn btn-outline-info mr-3" onclick="modelopen2('${al.functionName}','${al.functionSummary}','${al.empName}','${al.functionStartDate }','${al.projectNo }')">상세 정보</button></div>
                				</c:if>
                			</c:forEach>
                		</c:if>
                	
                	</div>
                </div>
                <div><p style="text-align: center;">Done : ${done}</p>
                	<div class="card mt-4" style="width: 250px; height: 700px">
                	<c:if test="${not empty allocations }">
                			<c:forEach var="al" items="${allocations }">
                				<c:if test="${al.functionStatus eq 'done' }">
                				<div class="d-flex mt-2" style="justify-content: space-around;"> <p class="mr-3">${al.functionName }</p> <button class="btn btn-outline-info mr-3" onclick="modelopen3('${al.functionName}','${al.functionSummary}','${al.empName}','${al.functionStartDate }','${al.functionEndDate }')">상세 정보</button></div>
                				</c:if>
                			</c:forEach>
                		</c:if>
                	
                	</div>
                </div>
            </div>
            
            
        </div>
    </div>
    
</section>
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 id="modalTitle"></h2>
        <p id="functionSummary" style="width: 400px; height: 400px; text-align: center;"></p>                             
        <p id="empName"></p>
        <p id="startDate"></p>
        <p id="endDate"></p>
        <div class="d-flex">
        <button class="btn btn-outline-success" id="functionapproval">승인</button>
        <button class="btn btn-outline-danger" id="functionreject">반려</button>
        </div>
        
    </div>
</div>

 	<script type="text/javascript">
 // teamprojectUpdate.js 파일에 추가

</script>
<style>
/* teamprojectUpdate.js 파일에 추가 */
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
<script src="${path}/resources/waait/yohan/js/teamprojectUpdate.js"></script>

<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />
