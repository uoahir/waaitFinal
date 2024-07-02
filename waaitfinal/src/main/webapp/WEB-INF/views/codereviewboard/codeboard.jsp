<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/codereviewboard.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/css/home.css">
<c:set var = "path" value="${pageContext.request.contextPath}"/>
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
            <div id="left_codeRM_mid">
                <div id="left_graph">
                    <div id="code_graph" class="divgraph"></div>
                    <div id="code_graph" class="divgraph"></div>   
                </div>
            </div>
            <div id="left_codeRM_bot">
                <div id="board_top">
                    <span>code review board</span>
                    <button>Write</button>
                </div>
                <div id="code_board"></div>
                
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
</body>
</html>