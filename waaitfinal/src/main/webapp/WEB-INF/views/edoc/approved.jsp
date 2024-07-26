<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="${path}/WEB-INF/views/common/header.jsp" />

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
					<h5>Approved Document</h5>
				</div>
				<div style="float: right; width:10%;" class="mb-5">
					<div class="dropdown">
						<button class="btn icon icon-left btn-primary dropdown-toggle me-1" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit">
								<path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7">
								</path>
								<path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z">
								</path>
							</svg>
						Write
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style>
							<div class="dropdown-item" onclick="window.open('${path}/edoc/basicedoc?type=T01','_blank','width=1200, height=1000')">내부보고서</div>
							<div class="dropdown-item" onclick="window.open('${path}/edoc/basicedoc?type=T02','_blank','width=1200, height=1000')">지출결의서</div>
							<div class="dropdown-item" onclick="window.open('${path}/edoc/tripedoc?type=T03','_blank','width=1200, height=1000')">출장신청서</div>
							<div class="dropdown-item" onclick="window.open('${path}/edoc/offedoc?type=T04','_blank','width=1200, height=1000')">휴가신청서</div>
						</div>
					</div>
				</div>
			</div>
			<div>
	        	<table class="table" id="table1">
					<thead>
						<tr>
							<th>Document Number</th>
							<th>Type</th>
							<th>Title</th>
							<th>Submission Date</th>
							<th>Approved Date</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty documents }">
							<c:forEach items="${documents }" var="d">
								<tr onclick = "isFirstOpened('${d.docId}','${d.type.docType }','${d.docWriter }');">
									<td>${d.docNumber }</td>
									<td>${d.type.type }</td>
									<td>${d.docTitle }</td>
									<td>${d.docDate }</td>
									<td>${d.approvalOne.appDate }</td><!-- appDate -->
								</tr>
							</c:forEach>
						</c:if> 
					</tbody>
				</table>
			</div>
		</div> 
	</div>    
	<script type="text/javascript">
		const isFirstOpened = (docId,docType,docWriter) => {
			window.open("${path}/edoc/openedoc"+docId+"/"+docType+"/"+docWriter,"_blank" ,"width=1200, height=1000");
			// 새 창 열기로 오픈하면 , 여러 문서를 동시에 작업할 수 있음 ~ 
		}
	</script>
	
</section>
<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />