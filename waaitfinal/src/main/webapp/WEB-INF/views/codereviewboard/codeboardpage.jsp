<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/codeboardpage.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/css/home.css">
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<script>
    // path 값을 JavaScript 변수로 설정
    var contextPath = "${path}";
</script>

<!DOCTYPE html>
<html>
<head>	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<header id="header">
        <div id="log"><img src="dd" alt=""></div>
        <div id="menu">
            <div><a href="#">워크플로우</a></div>
            <div><a href="#">근무/휴가</a></div>
            <div><a href="#">프로젝트 관리</a></div>
            <div><a href="#">일정관리</a></div>                                                                                                                             
            <div><a href="#">게시판</a></div>
        </div>
        <div id="noneDiv"></div>
    </header>
    <section id="codereviewboardsection">
        <div id="left_codeRM">
            <div id="left_codeRM_top">
                <p>Code Review Board</p>
            </div>
          
            <div id="left_codeRM_bot">
            	 

               <div id="code_board">
 
                <div class = selectboard>
                 <div>번호</div> <div>제목</div> <div>개발분야</div> <div>코드타입</div> <div>작성자</div> <div>작성날짜</div>
               	</div>
               	<c:if test="${not empty codeReviewBoards}">	
               		<c:forEach items="${codeReviewBoards }" var="c">
               			<div class = selectboard onclick="location.assign('${contextPath}/codereviewboard/codereview${c.codeBoardNo}');">
               			<div>NO.${c.codeBoardNo}</div>
               			<div>${c.codeBoardTitle }</div>
               			<div> ${c.developmentType }</div>
              
               			<div>${c.codeType }</div>
               			<div>${c.codeWrite }</div>
               			<div>${c.writeDate }</div>
               			</div>
               		</c:forEach>		
               	</c:if>
                <div></div>
                </div> <!-- 코드board내용부분 -->
                
            </div>
        </div>
        <div id="right_codeRM">
            <div id="board_search">
                <input type="text" placeholder="검색" id="code_search">
            </div>
            <div id="comment_div">
                <div><span>댓글</span></div>
                <div id="comment_list"></div>
            </div>
        </div> 

    </section>
    <script src="${path}/resources/js/codereviewboard.js"> <!--js파일은 하단에 내려줌-->
</script>
</body>
</html>