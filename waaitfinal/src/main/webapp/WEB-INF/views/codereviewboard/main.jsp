<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
  			<c:set var="javascript" value="0" />
            <c:set var="java" value="0" />
            <c:set var="sql" value="0" />
            <c:set var="c" value="0" />
			<c:set var="python" value="0" />
		
			
	
	<c:if test="${ not empty codes}">
			<c:forEach var = "cd" items="${codes}">
				
					<c:if test='${cd.codeType eq "javascript" }'>
					<c:set var="javascript" value="${javascript + 1}" />
					</c:if>
					<c:if test='${cd.codeType eq "java" }'>
					<c:set var="java" value="${java + 1}" />
					</c:if>
					<c:if test='${cd.codeType eq "sql" }'>
					<c:set var="sql" value="${sql + 1}" />
					</c:if>
					<c:if test='${cd.codeType eq "c" }'>
					<c:set var="c" value="${c + 1}" />
					</c:if>
					<c:if test='${cd.codeType eq "python" }'>
					<c:set var="python" value="${python + 1}" />
					</c:if>
			</c:forEach>
		</c:if>
	
			<c:set var ="etc" value="0"/>
			<c:set var ="ai" value="0"/>
			<c:set var ="front" value="0"/>
			<c:set var ="back" value="0"/>
			<c:set var ="server" value="0"/>
		
		<c:if test="${ not empty codes}">
			<c:forEach var = "cd" items="${codes}">
				
					<c:if test='${cd.developmentType eq "server" }'>
					<c:set var="server" value="${server + 1}" />
					</c:if>
					<c:if test='${cd.developmentType eq "back" }'>
					<c:set var="back" value="${back + 1}" />
					</c:if>
					<c:if test='${cd.developmentType eq "front" }'>
					<c:set var="front" value="${front + 1}" />
					</c:if>
					<c:if test='${cd.developmentType eq "ai" }'>
					<c:set var="ai" value="${ai + 1}" />
					</c:if>
					<c:if test='${cd.developmentType eq "etc" }'>
					<c:set var="etc" value="${etc + 1}" />
					</c:if>
			</c:forEach>
		</c:if>
		
<section class="section">
    <div class="align-items-center">
    	<h1 id="title" style="text-align: center;">CodeReview Board</h1>
    </div>
    <div class="d-flex" style="justify-content: space-between;">
    <div class="card" style="width: 49%; height: 300px">
    	    <div>
    	    <h3 class="card-title" style="text-align: center;">언어</h3>
    	    </div>
    	    <div>
    	    <div class="progress progress-primary mt-4" style="width: 90%; margin: auto;">
                   <p class="" style="width: 50px">script</p> <div class="progress-bar progress-label" role="progressbar" style="width: ${100 * javascript / codes.size()}%" aria-valuenow="${100 * javascript / codes.size()}" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
            <div class="progress progress-primary mt-4" style="width: 90%; margin: auto;">
                   <p class="" style="width: 50px" >c</p> <div class="progress-bar progress-label" role="progressbar" style="width: ${100 * c / codes.size()}%" aria-valuenow="${100 * c / codes.size()}" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
                    <div class="progress progress-primary mt-4" style="width: 90%; margin: auto;">
                   <p class="" style="width: 50px">java</p> <div class="progress-bar progress-label" role="progressbar" style="width: ${100 * java / codes.size()}%" aria-valuenow="${100 * java / codes.size()}" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
                    <div class="progress progress-primary mt-4" style="width: 90%; margin: auto;">
                   <p class="" style="width: 50px">sql</p> <div class="progress-bar progress-label" role="progressbar" style="width: ${100 * sql / codes.size()}%" aria-valuenow="${100 * sql / codes.size()}" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
                      <div class="progress progress-primary mt-4" style="width: 90%; margin: auto;">
                   <p class="" style="width: 50px">python</p> <div class="progress-bar progress-label" role="progressbar" style="width: ${100 * python / codes.size()}%" aria-valuenow="${100 * python / codes.size()}" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
                
    	    </div> 
    </div>
    
    <div class="card" style="width: 49%; height: 300px">
      		<div>
    	    <h3 class="card-title" style="text-align: center;">개발분야</h3>
    	    </div>
    	    <div>
    	        <div class="progress progress-primary mt-4" style="width: 90%; margin: auto;">
                   <p class="" style="width: 50px">server</p> <div class="progress-bar progress-label" role="progressbar" style="width: ${100 * server / codes.size()}%" aria-valuenow="${100 * server / codes.size()}" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
            <div class="progress progress-primary mt-4" style="width: 90%; margin: auto;">
                   <p class="" style="width: 50px" >back</p> <div class="progress-bar progress-label" role="progressbar" style="width: ${100 * back / codes.size()}%" aria-valuenow="${100 * back / codes.size()}" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
                    <div class="progress progress-primary mt-4" style="width: 90%; margin: auto;">
                   <p class="" style="width: 50px">front</p> <div class="progress-bar progress-label" role="progressbar" style="width: ${100 * front / codes.size()}%" aria-valuenow="${100 * front / codes.size()}" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
                    <div class="progress progress-primary mt-4" style="width: 90%; margin: auto;">
                   <p class="" style="width: 50px">ai</p> <div class="progress-bar progress-label" role="progressbar" style="width: ${100 * al / codes.size()}%" aria-valuenow="${100 * al / codes.size()}" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
                      <div class="progress progress-primary mt-4" style="width: 90%; margin: auto;">
                   <p class="" style="width: 50px">etc</p> <div class="progress-bar progress-label" role="progressbar" style="width: ${100 * etc / codes.size()}%" aria-valuenow="${100 * etc / codes.size()}" aria-valuemin="0" aria-valuemax="100" 
                    id="persentBar"></div>
                </div>
    	    
    	    </div> 
    	     
    </div>
    </div>
	<div class="card">
		<table class="table">
			<tr>
				<td><h5>번호</h5></td>
				<td><h5>제목</h5></td>
				<td><h5>언어</h5></td>
				<td><h5>개발분야</h5></td>
				<td><h5>작성자</h5></td>
				<td><h5>작성시간</h5></td>	
			</tr>
			<c:if test="${not empty codeReviewBoards }">
				<c:forEach var="c" items="${codeReviewBoards}">
					<tr onclick="location.assign('${contextPath}/codereviewboard/codereview${c.codeBoardNo}');">
					  <td>NO.${c.codeBoardNo }</td>
					  <td>${c.codeBoardTitle }</td>
					  <td>${c.codeType }</td>
					  <td>${c.developmentType }</td>
					  <td>${c.codeWrite }</td>
					  <td>${c.writeDate }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<div class="d-flex">
		<div style="margin: auto;">${pageBar} </div> 
		<button class="btn btn-success"  style="height: 100%"   onclick = "location.assign('${path }/codereviewboard/writeboard')"; >글 작성</button>
		</div>
		
	</div>    
	<script>
	
	
	
	</script>    

</section>
<script src="${path }/resources/assets/extensions/chart.js/chart.umd.js"></script>
<script src="${path }/resources/assets/static/js/pages/ui-chartjs.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />