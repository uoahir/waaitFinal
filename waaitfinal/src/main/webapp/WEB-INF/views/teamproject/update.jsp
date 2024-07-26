<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="${path}/WEB-INF/views/common/header.jsp" />
<script >
var contextPath = "${path}";
</script>


<section class="section">
	<div class="card-title d-flex mt-4">
		<h1 style="margin: auto; font-size: 50px">No.${teamProject.projectNo}
			${teamProject.projectName}</h1>

	</div>
	<div class="card mt-3" style="height: 800px;">
		<div class="accordion accordion-flush" style="width: 400px">
			<!-- 첫번째 -->
			<div class="accordion-item">
				<h1 class="accordion-header" id="flush-headingOne">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
						aria-expanded="false" aria-controls="flush-collapseOne">
						ProjectSummary</button>
				</h1>
				<div id="flush-collapseOne" class="accordion-collapse collapse"
					aria-labelledby="flush-headingOne"
					data-bs-parent="#accordionFlushExample" style="">
					<div class="accordion-body">${teamProject.projectSummary }</div>
				</div>
			</div>
			<!-- 두번째 -->
			<div class="accordion-item">
				<h1 class="accordion-header" id="flush-headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
						aria-expanded="false" aria-controls="flush-collapseTwo">
						Project-EmployeeList</button>
				</h1>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="flush-headingTwo"
					data-bs-parent="#accordionFlushExample" style="">
					<div class="accordion-body">
						<c:if test="${not empty teamProject.projectEmployee}">
							<c:forEach var="tpel" items="${teamProject.projectEmployee }">
								<div class="d-flex">
									<p>${tpel.empName}</p>
									<p id="deptCode">${tpel.deptCode }</p>
									<p id="levelCode">${tpel.levelCode}</p>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			<!-- 세 번째 -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
						project-Function-List</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					aria-labelledby="flush-headingThree"
					data-bs-parent="#accordionFlushExample" style="">
					<div class="accordion-body">
						<c:if test="${not empty teamProject.projectFunctionList}">
							<div class="card">
								<h2>TO-DO</h2>
								<c:forEach var="tpfl"
									items="${teamProject.projectFunctionList }">
									<c:if test='${tpfl.functionStatus eq "To Do"}'>
										<p>${tpfl.functionName}</p>

									</c:if>

								</c:forEach>
							</div>
							<div class="card">
								<h2>In-Progress</h2>
								<c:forEach var="tpfl"
									items="${teamProject.projectFunctionList }">
									<c:if test='${tpfl.functionStatus eq "In Progress"}'>
										<p>${tpfl.functionName}</p>

									</c:if>

								</c:forEach>
							</div>
							<div class="card">
								<h2>Complete-check</h2>
								<c:forEach var="tpfl"
									items="${teamProject.projectFunctionList }">
								<div class="d-flex" style="flex-direction: row;">	
									<c:if test='${tpfl.functionStatus eq "complete-check"}'>
										<p style="width: 120px">${tpfl.functionName}</p>
										<button class="btn btn-success" onclick='functionApprove(${tpfl.projectNo},"${tpfl.functionName}");'>승인</button>
										<button class="btn btn-danger" onclick='functionReject(${tpfl.projectNo},"${tpfl.functionName}");'>반려</button>
									</c:if>
								</div>
								</c:forEach>
							</div>
							<div clas  s="card">
								<h2>Done</h2>
								<c:forEach var="tpfl"
									items="${teamProject.projectFunctionList }">
									<c:if test='${tpfl.functionStatus eq "Done"}'>
										<p>${tpfl.functionName}</p>
										
									</c:if>
									
								</c:forEach>
							</div>

						</c:if>
					</div>
				</div>
			</div>
		</div>


	</div>



</section>
<script src="${path }/resources/waait/yohan/js/teamprojectUpdate.js"></script>

<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />
