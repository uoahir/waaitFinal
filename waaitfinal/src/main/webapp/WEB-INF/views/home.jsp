<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/home.css">
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<script type="text/javascript" src="${path}/resources/js/home.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/home.css">
</head>
<body>
	<header id="header">
        <div id="log"><img src="dd" alt=""></div>
        <div id="menu">
            <div><a href="${path }/edoc/home">워크플로우</a></div>
            <div><a href="#">근무/휴가</a></div>
            <div><a href="#">프로젝트 관리</a></div>
            <div><a href="${path }/schedule/myschedule">일정관리</a></div>           
            <div><a href="#">게시판</a></div>
        </div>
        <div id="noneDiv"></div>
    </header>
    <section id="homeSection" >
        <div>
            <div id="section_1">
                <div id="info">  <!--사원정보표기-->
                    <div id="empDetail">
                        <div id="imgInfo">
                            <img src="./img/icons8-lol-40.png" alt="" width="60px" height="60px">
                        </div>
                        <div>
                        <div id="emp">
                            <p id="empName">${employee.empName }</p>
                            <p id="jobCode">사원</p>
                        </div>
                        <div id="dept">
                            <p id="deptCode">개발부</p>
                            <p id="deptDetail">개발1팀</p>
                        </div>
                    </div>
                    </div>
                    <div id="check">
                        <!--출근/퇴근-->
                        <button id="workstaus">출근하기</button> 
                    </div>
                    <div id="msgpart">
                        <div onclick="chatting();">
                            <img src="./img/icons8-메시지-30.png" alt="" width="50px ">
                            <p>메신저</p>
                        </div>
                        <div>
                            <img src="./img/icons8-메시지-40.png" alt="" width="50px">
                            <a href="${path }/mail/mailmain.do">메일</a>
                        </div>
                    </div>
                </div>
                <div id="temp">

                </div>
            </div>
            <div id="section_2">
                <div id="workflow">
                    <div>
                        <div id="overword" class="midTop">
                            <div><p>초과근무</p></div> <!-- 초과 근무 -->
                    
                            <div><p>0일</p></div> <!--초과 근무 표기-->
                        </div> 
                        <div id="breakwork" class="midTop">
                            <div><p>남은 연가일수</p></div><!-- 남은 연가일수 -->
                            <div><p>21일</p></div> <!--남은 연가표기-->
                        </div> 
                        <div id="approval" class="midTop">
                            <div><p>결재함</p></div> <!-- 결재함 글씨 -->
                            <div><p>2개</p></div> <!--결재함 표기-->
                        </div> 
                    </div>
                </div>
                <div id="section_2_mid">
                    <div></div>
                    <div></div>
                </div>
              
            </div>
            <div id="section_3">  
            </div>
        </div>
    </section>
	<a href = "${path }/codeboard">코드 작성하는 페이지</a>
	
	

	<div onclick="location.assign('${path }/edoc/home')">전자결재</div>
	<div onclick="location.assign('${path }/edoc/insertedoc')">전자결재 작성</div>
	
	<div onclick="location.assign('${path }/chat/home')">채팅</div>

</body>
</html>