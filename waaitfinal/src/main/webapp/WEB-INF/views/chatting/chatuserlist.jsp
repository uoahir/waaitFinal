<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
    
<!-- 로그인된 사용자 객체 불러옴 -->
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
    
<!-- deptcode 순차적으로 출력할 때 사용 // 나중에 업그레이드 시도 -->
<%-- <c:set var="deptCount" value="D1"/> --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>

        body{
            margin: 0;
            padding: 0;
        }

        #chatting_userlist{
           /*  border: 1px solid red; */
            width: 100%;
            /* height: 100vh; */
            display: flex;
            flex-direction: column;
            
        }

        /* 검색창 */
        #chatting_userlist_search{
            /* border: 1px solid blue; */
            width: 100%;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: -2px;
            padding-top: 20px;
            position: fixed;
            background-color: white;
        }

        #chatting_userlist_search>div{
            border: 1px solid black;
            width: 100%;
            height: 40px;
            /* background-color: aqua; */
            border-radius: 15px;
            display: flex;
            align-items: center;
            
           
            margin: 0 100px 0 20px;
        }

        #chatting_userlist_search>div>img{
           /*  border: 1px solid red; */
            margin-left: 10px;
        }

        #chatting_userlist_search>div>input{
            /* border: 1px solid red; */
            height: 80%;
            width: 100%;
           	border: 0;
        }

        #chatting_userlist_search>div>p{
            /* border: 1px solid red; */
            height: 100%;
            font-size: 20px;
            align-content: center;
            margin-left: auto;
            margin-right: 10px;
            cursor: pointer;
        }
        /* 검색창 끝 */
        
        #chatting_userlist_printarea_all{
            margin-top: 70px;
            padding: 0 20px 0 20px;
        }

        .chatting_userlist_printarea{
            /* border: 1px solid red; */
            width: 100%;
        }

        .chatting_userlist_printarea_profile{
            display: flex;
            margin-bottom: 10px;
        }

        .chatting_userlist_printarea_profile>button{
            border: 0;
            background-color: transparent;
        }
        

        .chatting_userlist_printarea_profile>*{
            margin-left: 20px;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        /* 출근 중 직원 */
        .chatting_userlist_printarea_profile_img_green{
            border-radius: 100%;
            border: 3px solid #46EA4D;
        }

        /* 출근 안한 직원 */
        .chatting_userlist_printarea_profile_img_gray{
            border-radius: 100%;
            border: 3px solid #AEAEAE;
        }

    </style>

</head>
<body>
    
    <main>
    
        <!-- 전체 -->
        <div id="chatting_userlist">
            <!-- 상단 검색창 -->
            <div id="chatting_userlist_search">
                <div>
                    <img src="https://i.pinimg.com/564x/95/ee/40/95ee408c19f2c9d10629b70c4cea3e51.jpg" alt="" width="34px" height="34px">
                    <input type="text" placeholder="사용자이름, 부서명 검색">
                    <p onclick="">X</p>
                </div>
            </div>

            <!-- 사용자 목록 -->
            <div id="chatting_userlist_printarea_all">
            
                <c:if test="${not empty employees }">
                	<c:forEach var="emp" items="${employees}">
		               	<!-- 나의 사용자 목록 -->
                		<c:if test="${emp.empNo == employee.empNo }">
                			<div class="chatting_userlist_printarea">
			                    <p>나</p>
			                    <div class="chatting_userlist_printarea_profile">
			                        <button onclick="asd(event);">
			                            <img class="chatting_userlist_printarea_profile_img_green" 
			                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
			                        </button>
			                        <p>${emp.jobLevel.levelName}</p>
			                        <p>${emp.empName}</p>
			                    </div>
			                </div>
                		</c:if>
                	</c:forEach>
                		
                		
               		<!-- 부서 출력 D1 -->
               		<div class="chatting_userlist_printarea">
               		<p>대표실 (1/2)</p>
               		<c:forEach var="emp" items="${employees}">
	               		<c:if test="${'D1' eq emp.deptCode}">
	               			<c:if test="${emp.empNo ne employee.empNo }">
		               			<div class="chatting_userlist_printarea_profile">
			                        <button onclick="asd(event);">
			                            <img class="chatting_userlist_printarea_profile_img_green" 
			                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
			                        </button>
			                        <p>${emp.jobLevel.levelName}</p>
		                        	<p>${emp.empName}</p>
			                    </div>
	               			</c:if>
	               		</c:if>
               		</c:forEach>
               		</div>
               		
               		
               		
               		<!-- 부서 출력 D2 -->
       				<div class="chatting_userlist_printarea">
               		<p>개발부 (1/2)</p>
               		<c:forEach var="emp" items="${employees}">
	               		<c:if test="${'D2' eq emp.deptCode}">
	               			<c:if test="${emp.empNo ne employee.empNo }">
		               			<div class="chatting_userlist_printarea_profile">
			                        <button onclick="asd(event);">
			                            <img class="chatting_userlist_printarea_profile_img_green" 
			                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
			                        </button>
			                        <p>${emp.jobLevel.levelName}</p>
		                        	<p>${emp.empName}</p>
			                    </div>
	               			</c:if>
	               		</c:if>
               		</c:forEach>
               		</div>
               		
               		
               		<!-- 부서 출력 D3 -->
       				<div class="chatting_userlist_printarea">
               		<p>개발 1팀 (1/2)</p>
               		<c:forEach var="emp" items="${employees}">
	               		<c:if test="${'D3' eq emp.deptCode}">
	               			<c:if test="${emp.empNo ne employee.empNo }">
		               			<div class="chatting_userlist_printarea_profile">
			                        <button onclick="asd(event);">
			                            <img class="chatting_userlist_printarea_profile_img_green" 
			                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
			                        </button>
			                        <p>${emp.jobLevel.levelName}</p>
		                        	<p>${emp.empName}</p>
			                    </div>
	               			</c:if>
	               		</c:if>
               		</c:forEach>
               		</div>
	               		
	               		
               		<!-- 부서 출력 D4 -->
       				<div class="chatting_userlist_printarea">
               		<p>개발 2팀 (1/2)</p>
               		<c:forEach var="emp" items="${employees}">
	               		<c:if test="${'D4' eq emp.deptCode}">
	               			<c:if test="${emp.empNo ne employee.empNo }">
		               			<div class="chatting_userlist_printarea_profile">
			                        <button onclick="asd(event);">
			                            <img class="chatting_userlist_printarea_profile_img_green" 
			                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
			                        </button>
			                        <p>${emp.jobLevel.levelName}</p>
		                        	<p>${emp.empName}</p>
			                    </div>
	               			</c:if>
	               		</c:if>
               		</c:forEach>
               		</div>
               		
               		
               		<!-- 부서 출력 D5 -->
       				<div class="chatting_userlist_printarea">
               		<p>경영관리부 (1/2)</p>
               		<c:forEach var="emp" items="${employees}">
	               		<c:if test="${'D5' eq emp.deptCode}">
	               			<c:if test="${emp.empNo ne employee.empNo }">
		               			<div class="chatting_userlist_printarea_profile">
			                        <button onclick="asd(event);">
			                            <img class="chatting_userlist_printarea_profile_img_green" 
			                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
			                        </button>
			                        <p>${emp.jobLevel.levelName}</p>
		                        	<p>${emp.empName}</p>
			                    </div>
	               			</c:if>
	               		</c:if>
               		</c:forEach>
               		</div>
               		
               		
               		
               		<!-- 부서 출력 D6 -->
       				<div class="chatting_userlist_printarea">
               		<p>재정팀 (1/2)</p>
               		<c:forEach var="emp" items="${employees}">
	               		<c:if test="${'D6' eq emp.deptCode}">
	               			<c:if test="${emp.empNo ne employee.empNo }">
		               			<div class="chatting_userlist_printarea_profile">
			                        <button onclick="asd(event);">
			                            <img class="chatting_userlist_printarea_profile_img_green" 
			                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
			                        </button>
			                        <p>${emp.jobLevel.levelName}</p>
		                        	<p>${emp.empName}</p>
			                    </div>
	               			</c:if>
	               		</c:if>
               		</c:forEach>
               		</div>
               		
               		
               		
               		<!-- 부서 출력 D7 -->
       				<div class="chatting_userlist_printarea">
               		<p>인사팀 (1/2)</p>
               		<c:forEach var="emp" items="${employees}">
	               		<c:if test="${'D7' eq emp.deptCode}">
	               			<c:if test="${emp.empNo ne employee.empNo }">
		               			<div class="chatting_userlist_printarea_profile">
			                        <button onclick="asd(event);">
			                            <img class="chatting_userlist_printarea_profile_img_green" 
			                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
			                        </button>
			                        <p>${emp.jobLevel.levelName}</p>
		                        	<p>${emp.empName}</p>
			                    </div>
	               			</c:if>
	               		</c:if>
               		</c:forEach>
               		</div>
               		
               		
               		
               		
               		<!-- 부서 출력 D8 -->
       				<div class="chatting_userlist_printarea">
               		<p>영업팀 (1/2)</p>
               		<c:forEach var="emp" items="${employees}">
	               		<c:if test="${'D8' eq emp.deptCode}">
	               			<c:if test="${emp.empNo ne employee.empNo }">
		               			<div class="chatting_userlist_printarea_profile">
			                        <button onclick="asd(event);">
			                            <img class="chatting_userlist_printarea_profile_img_green" 
			                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
			                        </button>
			                        <p>${emp.jobLevel.levelName}</p>
		                        	<p>${emp.empName}</p>
			                    </div>
	               			</c:if>
	               		</c:if>
               		</c:forEach>
               		</div>
               		
                		
                		
                </c:if>	<!-- ${not empty employees } 끝남 -->
                
                
            </div>
        </div>
    </main>

</body>
</html>