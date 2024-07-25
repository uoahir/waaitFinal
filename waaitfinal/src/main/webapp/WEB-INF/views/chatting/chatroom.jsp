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
<link rel="stylesheet" href="${path}/resources/css/ju/chatroom.css">



</head>
<body>

<main>
	
        <div>
            <!-- 상단바 -->
            <div id="chatting_chattingroom_top">
                <div>
                <!-- 
                	chatRoomName -> empName -> chatEmpName
					채팅방이름 -> (그룹)개설자이름 -> (개인)상대방이름
				 -->
                	<c:choose>
                		<c:when test="${chatName.chatRoomName != null}">
                			<p>${chatName.chatRoomName}</p>
                		</c:when>
                		<c:when test="${chatName.chatHistory.empName != null}">
                			<p>${chatName.chatHistory.empName}</p>
                		</c:when>
                		<c:otherwise>
                			<p>${chatName.chatHistory.chatEmpName}</p>
                		</c:otherwise>
                	</c:choose>
                    
                    <!-- 개인톡방 참여자 수 안띄움 -->
                    <c:if test="${chatName.chatRoomType ne 'C1'}">
	                    <p>${chatName.chatJoinCount}</p>                    
                    </c:if>
                    
                    
                </div>
                <div>
                    <button onclick="search();">
                        <img src="https://i.pinimg.com/564x/95/ee/40/95ee408c19f2c9d10629b70c4cea3e51.jpg" alt="검색" width="40" height="40">
                    </button>
                    <button onclick="setting();">
                        <img src="https://i.pinimg.com/564x/23/8b/7f/238b7f2849994039b217c3eeb3706001.jpg" alt="파일 모아보기 and 채팅방 나가기" width="40" height="40">
                    </button>
                </div>
            </div>

            <!-- 채팅내역 -->
            <div id="chatting_chattingroom_content">
            	<!--
            		채팅내역 class
           			상대 : chatting_chattingroom_content_user	
           			나 : chatting_chattingroom_content_my
            	-->
            	<c:forEach var="chatHistory" items="${chatHistorys}">
            		<!-- 로그인된 사원 채팅 -->
	            	<c:if test="${chatHistory.empNo eq employee.empNo }">
	            		<div class="chatting_chattingroom_content_my">
		                    <div>
		                        <p>${chatHistory.chatReadCount}</p>
		                        <p>${chatHistory.chatCreationDate}</p>
		                    </div>
		                    <div>
		                        <p>${chatHistory.chatContent}</p>
		                    </div>
		                </div>
					</c:if>
					
					<!-- 로그인되지 않은 다른 사원 채팅 -->
					<c:if test="${chatHistory.empNo ne employee.empNo }">
	            		<div class="chatting_chattingroom_content_user">
	            			<div>
	            				<img src="${path}/chatHistory.empProfile" alt="프로필" width="50" height="50">
	            			</div>
	            			<div>
	            				<p>${chatHistory.empName}</p>
	            				<p>${chatHistory.chatContent}</p>
	            			</div>
	            			<div>
	            				<p>${chatHistory.chatReadCount}</p>
	            				<p>${chatHistory.chatCreationDate}</p>
	            			</div>
	            		</div>
 					</c:if>                	
            	</c:forEach>
            </div>	<!-- 채팅내역 출력 끝 -->

            <!-- 채팅입력 칸 -->
            <div id="chatting_chattingroom_bottom">
                <div>
                    <textarea name="" id="msg"></textarea>
                </div>
                <div>
                    <button onclick="sendMessage();">전송</button>
                    <button>파일전송</button>
                    <input type="file" class="multiple-files-filepond" value="파일전송" multiple>
                </div>
            </div>

        </div>
    </main>










	<script>
		const loginId = "${employee.empId}";
		const loginEmpName = "${employee.empName}";
		const loginEmpNo = "${employee.empNo}";
		const path = "${pageContext.request.contextPath }";
		const chatRoomNo = "${chatName.chatRoomNo}";
		const chatJoinCount = "${chatName.chatJoinCount -1}";
		
		
		//나중에 삭제함
		console.log("chatName : "+"${chatName}");
		console.log("chatHistorys : "+"${chatHistorys}");
		
	</script>
	
	<!-- script문 -->
	<script type="text/javascript" src="${path}/resources/js/chatroom.js"></script>
	<%-- <script type="text/javascript" src="${path}/resources/js/chatopen.js"></script> --%>
</body>
</html>

