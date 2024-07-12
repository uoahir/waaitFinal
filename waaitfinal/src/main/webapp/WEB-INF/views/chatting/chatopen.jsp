<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- 로그인된 사용자 객체 불러오기 -->
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>waait chat</title>

<!-- 스타일 적용 -->
<link rel="stylesheet" href="${path}/resources/css/ju/chatopen.css">

<!-- jquery -->
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->

<!-- script문 -->
<script type="text/javascript" src="${path}/resources/js/chatopen.js"></script>


</head>
<body>
	<div id="chatting_main">
		<div id="chatting_main_aside">
		
			<aside>
		        <div id="chatting_aside">
		            <div id="chatting_aside_icon_area">
		                <div class="chatting_aside_icon">
		                    <button onclick="chatuserlist();">
		                        <img src="https://i.pinimg.com/564x/e1/d1/7d/e1d17d8b51f6bbde73947ec16e0a0e91.jpg" alt="사용자목록" width="70" height="70">
		                    </button>
		                </div>
		                <div class="chatting_aside_icon">
		                    <button onclick="chatroomlist();">
		                        <img src="https://i.pinimg.com/236x/c7/87/d4/c787d46e63b49b0ab99e98bd7a759c8a.jpg" alt="채팅방목록" width="70" height="70">
		                    </button>
		                </div>
		                <div class="chatting_aside_icon">
		                    <button onclick="chatopenroomlist();">
		                        <img src="https://i.pinimg.com/564x/36/18/e2/3618e24520a95abf9f7a2c32b9856fb2.jpg" alt="오픈채팅방목록" width="70" height="70">
		                    </button>
		                </div>
		                <div class="chatting_aside_icon">
		                    <a href="#">
		                        <img src="data:image/png;base64,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" alt="채팅방추가" width="70" height="70">
		                    </a>
		                </div>
		            </div>
		        </div>
		    </aside>
		    <!-- aside 끝 -->
		    
		</div>
		
		<!-- 오른쪽 content 시작 -->
		<div id="chatting_main_content">
			
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

		</div>
		<!-- 오른쪽 content 끝 -->
		
		
	</div>
	
	
	
	
</body>
</html>