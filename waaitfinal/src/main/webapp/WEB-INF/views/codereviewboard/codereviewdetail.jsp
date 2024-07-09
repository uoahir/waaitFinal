<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${path }/resources/css/codereviewdetail.css">

<link rel="stylesheet" type="text/css" href="${path }/resources/css/home.css">
<c:set var="employee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />
<c:set var="c" value="${codeReviewBoard}"></c:set> <!-- 코드 보드 내용 가져온내용 -->
<script>
    // path 값을 JavaScript 변수로 설정
    var contextPath = "${path}";
   	var codeType = "${c.codeType}"; 
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/themes/prism.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/prism.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/plugins/line-numbers/prism-line-numbers.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/plugins/line-numbers/prism-line-numbers.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/prism.min.js" integrity="sha512-hpZ5pDCF2bRCweL5WoA0/N1elet1KYL5mx3LP555Eg/0ZguaHawxNvEjF6O3rufAChs16HVNhEc6blF/rZoowQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/components/prism-java.min.js" integrity="sha512-prE8sqsXm1XwxSKT5BXnOvNd3/RDR3TwfiH/uEDD/yWmNa3uDRdeVTQDnCSvMKgr17+0P5PkM95xSP18bQ9rIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/components/prism-c.min.js" integrity="sha512-prE8sqsXm1XwxSKT5BXnOvNd3/RDR3TwfiH/uEDD/yWmNa3uDRdeVTQDnCSvMKgr17+0P5PkM95xSP18bQ9rIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/components/prism-python.min.js" integrity="sha512-yIpe1UXrH/ZWwu3n7MdHNfMbPXftP0jlg9+lRhzlpbolElt33h3PGx9ICzqf/k+yca3QNzqcO3sdtKJuYRTi4g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/9000.0.1/prism.min.js" integrity="sha512-UOoJElONeUNzQbbKQbjldDf9MwOHqxNz49NNJJ1d90yp+X9edsHyJoAs6O4K19CZGaIdjI5ohK+O2y5lBTW6uQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.25.0/components/prism-c.min.js" integrity="sha512-2dToLhWzZAAqzVrUz9rEL24ESI8DDiSBTeb+4e9SUzlcO7f6r5YWr0s6PCZUervWLSqGInffFQZ0SIJ7KXhUMg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- CDN 방식으로 값을 지정해서 함 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header id="header">
		<div id="log">
			<img src="dd" alt="">
		</div>
		<div id="menu">
			<div>
				<a href="#">워크플로우</a>
			</div>
			<div>
				<a href="#">근무/휴가</a> 
			</div>
			<div>
				<a href="#">프로젝트 관리</a>
			</div>
			<div>
				<a href="#">일정관리</a>
			</div>
			<div>
				<a href="#">게시판</a>
			</div>
		</div>
		<div id="noneDiv"></div>
	</header>
	<section id="codereviewboardsection">
		<div id="left_codeRM">
			<div id="left_codeRM_top">
				<div>
					<p>제목:${c.codeBoardTitle }</p>
					<p>설명</p>
				</div>
			</div>

			<div id="left_codeRM_bot">


				<div id="code_board">
			  <pre class="line-numbers"><code class="lang-java">${fn:escapeXml(c.codeContent)}</code></pre>
				</div>
				<!-- 코드board내용부분 -->

			</div>
		</div>
		<div id="right_codeRM">
			<div id="board_search">
				<input type="text" placeholder="검색" id="code_search">
			</div>
			<div id="comment_div">
				<div>
					<span>댓글</span>
				</div>
				<div id="comment_list"></div>
			</div>
		</div>

	</section>
	<script src="${path}/resources/js/codereviewdetail.js"> <!--js파일은 하단에 내려줌-->
		
	</script> 
</body>
</html>