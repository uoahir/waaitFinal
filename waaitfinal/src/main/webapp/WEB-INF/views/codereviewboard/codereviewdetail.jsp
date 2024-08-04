<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="employee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />
<c:set var="c" value="${codeReviewBoard}"></c:set>

<!-- 코드 보드 내용 가져온내용 -->

<script>
    // path 값을 JavaScript 변수로 설정
    var contextPath = "${path}";
   	var codeType = "${c.codeType}"; 
</script>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/themes/prism.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/prism.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/plugins/line-numbers/prism-line-numbers.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/plugins/line-numbers/prism-line-numbers.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/prism.min.js" integrity="sha512-hpZ5pDCF2bRCweL5WoA0/N1elet1KYL5mx3LP555Eg/0ZguaHawxNvEjF6O3rufAChs16HVNhEc6blF/rZoowQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/components/prism-java.min.js" integrity="sha512-prE8sqsXm1XwxSKT5BXnOvNd3/RDR3TwfiH/uEDD/yWmNa3uDRdeVTQDnCSvMKgr17+0P5PkM95xSP18bQ9rIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/components/prism-css.min.js" integrity="sha512-prE8sqsXm1XwxSKT5BXnOvNd3/RDR3TwfiH/uEDD/yWmNa3uDRdeVTQDnCSvMKgr17+0P5PkM95xSP18bQ9rIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/components/prism-python.min.js" integrity="sha512-yIpe1UXrH/ZWwu3n7MdHNfMbPXftP0jlg9+lRhzlpbolElt33h3PGx9ICzqf/k+yca3QNzqcO3sdtKJuYRTi4g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/components/prism-sql.min.js" integrity="sha512-yIpe1UXrH/ZWwu3n7MdHNfMbPXftP0jlg9+lRhzlpbolElt33h3PGx9ICzqf/k+yca3QNzqcO3sdtKJuYRTi4g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/9000.0.1/prism.min.js" integrity="sha512-UOoJElONeUNzQbbKQbjldDf9MwOHqxNz49NNJJ1d90yp+X9edsHyJoAs6O4K19CZGaIdjI5ohK+O2y5lBTW6uQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/components/prism-c.min.js" integrity="sha512-2dToLhWzZAAqzVrUz9rEL24ESI8DDiSBTeb+4e9SUzlcO7f6r5YWr0s6PCZUervWLSqGInffFQZ0SIJ7KXhUMg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-sql.min.js" integrity="sha512-sijCOJblSCXYYmXdwvqV0tak8QJW5iy2yLB1wAbbLc3OOIueqymizRFWUS/mwKctnzPKpNdPJV3aK1zlDMJmXQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-cshtml.min.js" integrity="sha512-2wQgFnVoaXxggU4WP6nmo8W15z91WyQOor7iapCRfycFWoAU3fqRfoJfoO5oNg5kl94fGgFlyeHxOcqgjEvaAQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-javascript.min.js" integrity="sha512-jwrwRWZWW9J6bjmBOJxPcbRvEBSQeY4Ad0NEXSfP0vwYi/Yu9x5VhDBl3wz6Pnxs8Rx/t1P8r9/OHCRciHcT7Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 -->
<!-- CDN 방식으로 값을 지정해서 함 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/themes/prism.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/plugins/line-numbers/prism-line-numbers.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/plugins/line-numbers/prism-line-numbers.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-java.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-css.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-python.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-sql.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-c.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-cshtml.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-javascript.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        // Prism.js 언어 정의에서 comment 토큰 제거
        if (Prism.languages[codeType] && Prism.languages[codeType].comment) {
            delete Prism.languages[codeType].comment;
        }
        
        // 코드 블록 하이라이트 적용
        Prism.highlightAll();
    });
</script>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="section">
	<div class="d-flex">
		<h1 style="margin: auto;">${c.codeBoardTitle}</h1>
	</div>
	<div class="mt-5">
		<div id="card" style="height: 700px; width: 90%; margin: auto;">
			  <pre class="line-numbers"><code id="codeBlock" class="lang-${c.codeType}">${fn:escapeXml(c.codeContent)}</code></pre>
				</div>

		<div class="mt-3 " style="width: 90%; margin: auto;">
			<textarea rows="3" style="width: 90%" id="codeComment"></textarea>
			<button class="btn btn-outline-info"  onclick="insertCodeComment('${c.codeBoardNo}')" style="float: right; height: 77px">작성</button>
		</div>
		<div class="card mt-4" style="width: 90%; margin: auto;">
			<div class="mt-1 card" >
			<c:if test="${not empty reviewComments }">
				<c:forEach var="rc" items="${reviewComments}" >
						<div class="d-flex" style="justify-content: space-between;">
						 <p> 작성자:${rc.codeReviewName }</p> <p>작성 날짜:${rc.codeReviewDate }</p> <button class="btn btn-primary">코드 보기</button> 
						</div>
				</c:forEach>
			</c:if>
			
			</div>
		</div>
	</div>
</section>
<script src="${path }/resources/waait/yohan/js/codeDetail.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<style>
pre {
    white-space: pre-wrap;
    word-wrap: break-word;
    background-color: #f5f5f5;
    padding: 10px;
    border-radius: 10px;
    border: 1px solid #ccc;
    position: relative;
    margin: 0;
    max-height: 100%; /* 스크롤을 위한 최대 높이 설정 */
    overflow: auto; /* 스크롤 추가 */
    padding-left: 4em; /* 줄 번호와 코드 사이에 간격 추가 */
    
    height: 94%;
}

pre.line-numbers {
    position: relative;
    padding-left: 3.8em; /* 줄 번호와 코드 사이 간격 추가 */
}

.line-numbers-rows {
    left: 10px; /* 줄 번호 위치 조정 */
}

code {
    font-family: Consolas, "Courier New", monospace;
    font-size: 16px;
    color: #333;
}
</style>