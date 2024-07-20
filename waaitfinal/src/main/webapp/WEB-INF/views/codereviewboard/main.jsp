<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>

<jsp:include page="${path}/WEB-INF/views/common/header.jsp" />

<section class="section">
    <div class="card align-items-center">
    	<h1 id="title">CodeReview Board</h1>
    </div>
    <div class="d-flex align-items-center">
    	     <div class="col-md-5">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Language part</h4>
                    </div>
                    <div class="card-body">
                        <canvas id="bar2"></canvas>
                    </div>
                </div>
            </div>
    </div>
    
    <div class="d-flex align-items-center">
    	     <div class="col-md-5">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Language part</h4>
                    </div>
                    <div class="card-body">
                        <canvas id="bar"></canvas>
                    </div>
                </div>
            </div>
    </div>
    
	<div class="card">
		<table class="table">
			<tr>
				<td><h5>번호</h5></td>
				<td><h5>제목</h5></td>
				<td><h5>개발언어</h5></td>
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
		
		<div class="test">
			${pageBar}
		</div>
		
	</div>    
    <div class="card"><a href = "${path }/codereviewboard/writeboard">작성하기</a></div>
	<script>
	
	
	
	</script>    

</section>
<script src="${path }/resources/assets/extensions/chart.js/chart.umd.js"></script>
<script src="${path }/resources/assets/static/js/pages/ui-chartjs.js"></script>
<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />