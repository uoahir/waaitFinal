<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="employee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<style>


    .table-custom {
        width: 100%; /* 테이블을 부모 컨테이너에 맞게 100%로 설정 */
        border-collapse: collapse; /* 테이블 셀의 경계를 결합 */
    }
    
    .table-custom th, .table-custom td {
       /*  border: 1px solid #dee2e6; /* 진한 테두리 설정 */ */
        padding: 8px; /* 셀의 패딩 설정 */
        text-align: center; /* 텍스트를 중앙 정렬 */
    }
    
    .table-custom th {
        /* background-color: #f8f9fa; /* 헤더의 배경색 설정 */ */
        font-weight: bold; /* 헤더 글씨 두껍게 설정 */
    }
    
    .table-custom .title-column {
        width: 30%; /* 제목 열의 너비를 30%로 설정 (길게 설정) */
    }
</style>


<section class="section">
    <div>
        <div class="card-body d-flex align-items-center justify-content-between mb-4">
            <div style="margin-left:10px;">
                <h2>Work-Flow</h2>
            </div>
            <div style="float: right; width:10%;">
                <div class="dropdown">
                    <button class="btn icon icon-left btn-primary dropdown-toggle me-1" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit">
                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                        </svg>
                        Write
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <div class="dropdown-item" onclick="window.open('${path}/edoc/write3?type=T01','_blank','width=1200, height=1000')">기본보고서</div>
                        <div class="dropdown-item" onclick="window.open('${path}/edoc/write4?type=T03','_blank','width=1200, height=1000')">출장신청서</div>
                        <div class="dropdown-item" onclick="window.open('${path}/edoc/write2?type=T04','_blank','width=1200, height=1000')">휴가신청서</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="d-flex">
                <div style="width: 90%; margin-left:5px;">
                    <h6>상신함</h6>
                    <h5>Document In Progress</h5>
                </div>
            </div>
            <div>
                <table class="table table-custom" id="table1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Type</th>
                            <th class="title-column">Title</th>
                            <th>Approver</th>
                            <th>Submission Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty documents }">
                            <c:forEach items="${documents }" var="d">
                                <tr onclick="isFirstOpened('${d.docId}','${d.type.docType }','${d.docWriter }');">
                                    <td>${d.rnum }</td>
                                    <td>${d.type.type }</td>
                                    <td>${d.docTitle }</td>
                                    <td>
                                    	<div class="avatar avatar-sm">
											<img src="${path }/resources/upload/emp/profile/${d.employee.empProfile}">
										</div>
                                    	${d.employee.empName }
                                    </td>
                                    <td>${d.docDate }</td>
                                    <td>
                                        <span class="badge bg-light-primary">${d.docStat }</span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
                ${pageBar1 }
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="d-flex">
                <div style="width: 90%; margin-left:5px;">
                    <h6>승인대기함</h6>
                    <h5>Document waiting for approval</h5>
                </div>
            </div>
            <div>
                <table class="table table-custom" id="table2">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Type</th>
                            <th class="title-column">Title</th>
                            <th>Writer</th>
                            <th>Submission Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty waitdocuments }">
                            <c:forEach items="${waitdocuments }" var="w">
                                <tr onclick="isFirstOpened('${w.docId}','${w.type.docType }','${w.docWriter }');">
                                    <td>${w.rnum }</td>
                                    <td>${w.type.type }</td>
                                    <td>${w.docTitle }</td>
                                    <td>
                                    	<div class="avatar avatar-sm">
											<img src="${path }/resources/upload/emp/profile/${w.employee.empProfile}">
										</div>
                                    ${w.employee.empName }</td>
                                    <td>${w.docDate }</td>
                                    <td>
                                    	<c:if test="${w.approvalOne.appEmp eq employee.empNo }">
		                                    	<span class="badge bg-light-primary">${w.approvalOne.appStat }</span>	
                                    	</c:if>
									</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
                ${pageBar2 }
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
        const isFirstOpened = (docId, docType, docWriter) => {
            window.open("${path}/edoc/openedoc"+docId+"/"+docType+"/"+docWriter,"_blank" ,"width=1200, height=1000");
        }
    </script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
