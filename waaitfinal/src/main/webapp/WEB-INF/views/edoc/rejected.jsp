<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="section">
	<div class="card">
		<div class="card-header">
            <h2 class="card-title">
           	Work-Flow
			</h2>
        </div>
		<div class="card-body ">
			<div class="d-flex">
				<div style="width: 90%; margin-left:5px;">
					<h5>Rejected Documents</h5>
				</div>
			</div>
			<div>
	        	<table class="table" id="table1">
					<thead>
						<tr>
							<th>No</th>
							<th>Type</th>
							<th>Title</th>
							<th>Writer</th>
							<th>Submission Date</th>
							<th>Rejected Date</th>
							<th>Reason</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty documents }">
							<c:forEach items="${documents }" var="d">
								<tr onclick = "isFirstOpened('${d.docId}','${d.type.docType }','${d.docWriter }');">
									<td>${d.rnum }</td>
									<td>${d.type.type }</td>
									<td>${d.docTitle }</td>
									<td>${d.employee.empName }</td>
									<td>${d.docDate }</td>
									<td>
										<fmt:formatDate value="${d.approvalOne.appDate }" pattern="yyyy-MM-dd"/>
									</td>
									<td>${d.approvalOne.reason }</td>
								</tr>
							</c:forEach>
						</c:if>
						
	                        
					</tbody>
				</table>
			</div>
		</div> 
	</div>    
	    	<script>
    	var path = "${path}";
    	var employee = {
    		empName : "${employee.empName}",
    		deptName : "${employee.department.deptName}",
    		levelName : "${employee.jobLevel.levelName}",
    		empNo : "${employee.empNo}"
    	}
    </script>
	<script type="text/javascript">
		const isFirstOpened = (docId,docType,docWriter) => {
			window.open("${path}/edoc/openedoc"+docId+"/"+docType +"/"+docWriter,"_blank" ,"width=1200, height=1000");
			// 새 창 열기로 오픈하면 , 여러 문서를 동시에 작업할 수 있음 ~ 
		}
	</script>
	
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />