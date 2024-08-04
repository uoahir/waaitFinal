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
<link rel="stylesheet" href="${path}/resources/css/ju/chatinvitation.css">

<!-- jquery -->
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->

<!-- script문 -->
<!-- <script type="text/javascript" src="${path}/resources/js/chatinvitation.js"></script> -->


</head>
<body>

			<main>
		        <!-- 전체 -->
		        <form action="insertchatroom.do" method="post">
		        <div id="chatting_userlist">
		            <!-- 상단 검색창 -->
		            <div id="chatting_userlist_search">
		    			<h2>대화상대 선택</h2>
		    			<div>
							<input type="text" placeholder="채팅방 이름을 입력해주세요" name="chatRoomName">
		                    <p id="delete_chatroomname">✕</p>
		    			</div>
		                <input type="submit" value="채팅방 생성" id="create_chatroom">
		                <!-- <div>
		                    <img src="https://i.pinimg.com/564x/95/ee/40/95ee408c19f2c9d10629b70c4cea3e51.jpg" alt="" width="34px" height="34px">
		                    <input type="text" placeholder="사용자이름, 부서명 검색">
		                    <p onclick="">X</p>
		                </div> -->
		            </div>
		
		            <!-- 사용자 목록 -->
		            <div id="chatting_userlist_printarea_all">
		            
		                <c:if test="${not empty employees }">

		               		<!-- 부서 출력 D1 -->
		               		<div class="chatting_userlist_printarea">
		               		<p>대표실</p>
		               		<c:forEach var="emp" items="${employees}">
			               		<c:if test="${'D1' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}" >
					                       <img class="chatting_userlist_printarea_profile_img_green" onclick="empprofile(${emp.empNo});"
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        <p>${emp.jobLevel.levelName}</p>
				                        	<p>${emp.empName}</p>
				                        	<input type="checkbox" name="chatemps" value="${emp.empNo}">
					                    </div>
			               			</c:if>
			               		</c:if>
		               		</c:forEach>
		               		</div>
		               		
		               		
		               		
		               		<!-- 부서 출력 D2 -->
		       				<div class="chatting_userlist_printarea">
		               		<p>개발부</p>
		               		<c:forEach var="emp" items="${employees}">
			               		<c:if test="${'D2' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}" >
					                       <img class="chatting_userlist_printarea_profile_img_green" onclick="empprofile(${emp.empNo});"
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        <p>${emp.jobLevel.levelName}</p>
				                        	<p>${emp.empName}</p>
				                        	<input type="checkbox" name="chatemps" value="${emp.empNo}">
					                    </div>
			               			</c:if>
			               		</c:if>
		               		</c:forEach>
		               		</div>
		               		
		               		
		               		<!-- 부서 출력 D3 -->
		       				<div class="chatting_userlist_printarea">
		               		<p>개발 1팀</p>
		               		<c:forEach var="emp" items="${employees}">
			               		<c:if test="${'D3' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}" >
					                       <img class="chatting_userlist_printarea_profile_img_green" onclick="empprofile(${emp.empNo});"
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        <p>${emp.jobLevel.levelName}</p>
				                        	<p>${emp.empName}</p>
				                        	<input type="checkbox" name="chatemps" value="${emp.empNo}">
					                    </div>
			               			</c:if>
			               		</c:if>
		               		</c:forEach>
		               		</div>
			               		
			               		
		               		<!-- 부서 출력 D4 -->
		       				<div class="chatting_userlist_printarea">
		               		<p>개발 2팀</p>
		               		<c:forEach var="emp" items="${employees}">
			               		<c:if test="${'D4' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}" >
					                       <img class="chatting_userlist_printarea_profile_img_green" onclick="empprofile(${emp.empNo});"
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        <p>${emp.jobLevel.levelName}</p>
				                        	<p>${emp.empName}</p>
				                        	<input type="checkbox" name="chatemps" value="${emp.empNo}">
					                    </div>
			               			</c:if>
			               		</c:if>
		               		</c:forEach>
		               		</div>
		               		
		               		
		               		<!-- 부서 출력 D5 -->
		       				<div class="chatting_userlist_printarea">
		               		<p>경영관리부</p>
		               		<c:forEach var="emp" items="${employees}">
			               		<c:if test="${'D5' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}" >
					                       <img class="chatting_userlist_printarea_profile_img_green" onclick="empprofile(${emp.empNo});"
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        <p>${emp.jobLevel.levelName}</p>
				                        	<p>${emp.empName}</p>
				                        	<input type="checkbox" name="chatemps" value="${emp.empNo}">
					                    </div>
			               			</c:if>
			               		</c:if>
		               		</c:forEach>
		               		</div>
		               		
		               		
		               		
		               		<!-- 부서 출력 D6 -->
		       				<div class="chatting_userlist_printarea">
		               		<p>재정팀</p>
		               		<c:forEach var="emp" items="${employees}">
			               		<c:if test="${'D6' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}" >
					                       <img class="chatting_userlist_printarea_profile_img_green" onclick="empprofile(${emp.empNo});"
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        <p>${emp.jobLevel.levelName}</p>
				                        	<p>${emp.empName}</p>
				                        	<input type="checkbox" name="chatemps" value="${emp.empNo}">
					                    </div>
			               			</c:if>
			               		</c:if>
		               		</c:forEach>
		               		</div>
		               		
		               		
		               		
		               		<!-- 부서 출력 D7 -->
		       				<div class="chatting_userlist_printarea">
		               		<p>인사팀</p>
		               		<c:forEach var="emp" items="${employees}">
			               		<c:if test="${'D7' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}" >
					                       <img class="chatting_userlist_printarea_profile_img_green" onclick="empprofile(${emp.empNo});"
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        <p>${emp.jobLevel.levelName}</p>
				                        	<p>${emp.empName}</p>
				                        	<input type="checkbox" name="chatemps" value="${emp.empNo}">
					                    </div>
			               			</c:if>
			               		</c:if>
		               		</c:forEach>
		               		</div>
		               		
		               		
		               		
		               		
		               		<!-- 부서 출력 D8 -->
		       				<div class="chatting_userlist_printarea">
		               		<p>영업팀</p>
		               		<c:forEach var="emp" items="${employees}">
			               		<c:if test="${'D8' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}" >
					                       <img class="chatting_userlist_printarea_profile_img_green" onclick="empprofile(${emp.empNo});"
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        <p>${emp.jobLevel.levelName}</p>
				                        	<p>${emp.empName}</p>
				                        	<input type="checkbox" name="chatemps" value="${emp.empNo}">
					                    </div>
			               			</c:if>
			               		</c:if>
		               		</c:forEach>
		               		</div>
		               		
		                </c:if>	<!-- ${not empty employees } 끝남 -->
	
		            </div>
		        </div>
		        <!-- <input type="submit" value="채팅방 생성" id="create_chatroom"> -->
		        </form>
		    </main>

	
	
	<script>
		const loginId = "${employee.empId}";
		const loginEmpNo = "${employee.empNo}";
		const path = "${pageContext.request.contextPath }";
		
	</script>
	
 	
	
</body>
</html>