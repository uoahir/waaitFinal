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

<!-- jquery -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>






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
                    
                    <!-- 
                    	개인톡방 참여자 수 안띄움
                    	
                    	누르면 채팅방에 속한 리스트가 출력되고 프로필 누르면 프로필 출력 (나중에)
                    	리스트 아래 대화 상대초대하기 버튼 누르면 채팅방 만들기 처럼 사원목록 출력 (이미 속한사람은 안뜨게 필터)
                    	form태그 사용해서 클릭된 사원번호 넘겨서 chatjoin테이블에 추가 chatRoomNo도 같이 넘겨줌
                    	완료되면 load? 해서 최신화? 
                   	 -->
                    <c:if test="${chatName.chatRoomType ne 'C1'}">
                    	<div id="chatjoincount"  onclick="chatEmpList();">
	                    	<img src="https://i.pinimg.com/564x/43/14/0a/43140a3803e5f1b39c1ffac1a35a3ec7.jpg" alt="사원수" width="20" height="20">
		                    <p>${chatName.chatJoinCount}</p>                    
                    	</div>
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
            		<!-- 
            			음.... class 초대, 나가기 두개 만들어서 구현하기
            			empNo = 10000초대
            			empNo = 20000나가기
            		 -->
            	
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
                    <textarea name="" id="msg" placeholder="메시지를 입력하세요"></textarea>
                </div>
                <div>
                    <button onclick="sendMessage();">전송</button>
                    <button>파일전송</button>
                    <input type="file" class="multiple-files-filepond" value="파일전송" multiple>
                </div>
            </div>

        </div>
        
        
        <!-- 모달 채팅방 사원수 눌렀을때 사원리스트 출력 -->
        <div id="modal_chatemplist" class="modal">
			<div>
				<div>
					<div id="modal_chatinvitation_groupchat">
						<c:if test="${not empty employees}">
							<c:forEach var="emp" items="${employees}">
								<c:if test="${emp.empNo eq employee.empNo }">
									<div class="chatting_userlist_printarea_profile">
				                        <button onclick="asd(event);">
				                            <img class="chatting_userlist_printarea_profile_img_green" 
				                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
				                        </button>
										<h4>나</h4>
				                        <p>${emp.jobLevel.levelName}</p>
				                        <p>${emp.empName}</p>
				                    </div>
								</c:if>
							</c:forEach>
							<c:forEach var="emp" items="${employees}">
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
							</c:forEach>
						</c:if>
					</div>
				</div>
				<!-- 이걸 누르면 아래 모달이 실행됨 -->
				<div onclick="chatinvitationemplist();">
					<p>+ 채팅상대 초대하기</p>
				</div>
			</div>
		</div>
        <!-- 모달 채팅방 사원수 눌렀을때 사원리스트 출력 닫음 -->
        
        
        
        <!-- 모달창 사원리스트아래에 초대하기 버튼 누르면 출력되는 모달창 -->
        <div id="modal_chatinvitation" class="modal">
	        
				<div>
					<div>
						<div id="modal_chatinvite_search">
			    			<h3>채팅상대 초대하기</h3>
			                <div>
			                    <img src="https://i.pinimg.com/564x/95/ee/40/95ee408c19f2c9d10629b70c4cea3e51.jpg" alt="" width="34px" height="34px">
			                    <input type="text" placeholder="사용자이름, 부서명 검색">
			                    <p onclick="">X</p>
			                </div>
			            </div>
					</div>
					<div>
						<!-- 사용자 목록 -->
		            <div id="chatting_userlist_printarea_all">
		                <c:if test="${not empty employeesnot}">

		               		<!-- 부서 출력 D1 -->
		               		<div class="chatting_userlist_printarea">
			               		<p>대표실 (1/2)</p>
			               		<c:forEach var="emp" items="${employeesnot}">
				               		<c:if test="${'D1' eq emp.deptCode}">
				               			<c:if test="${emp.empNo ne employee.empNo }">
					               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}" >
						                        <button onclick="asd(event);">
						                            <img class="chatting_userlist_printarea_profile_img_green" 
						                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
						                        </button>
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
		               		<p>개발부 (1/2)</p>
		               		<c:forEach var="emp" items="${employeesnot}">
			               		<c:if test="${'D2' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}">
					                        <button onclick="asd(event);">
					                            <img class="chatting_userlist_printarea_profile_img_green" 
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        </button>
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
		               		<p>개발 1팀 (1/2)</p>
		               		<c:forEach var="emp" items="${employeesnot}">
			               		<c:if test="${'D3' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}">
					                        <button onclick="asd(event);">
					                            <img class="chatting_userlist_printarea_profile_img_green" 
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        </button>
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
		               		<p>개발 2팀 (1/2)</p>
		               		<c:forEach var="emp" items="${employeesnot}">
			               		<c:if test="${'D4' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}">
					                        <button onclick="asd(event);">
					                            <img class="chatting_userlist_printarea_profile_img_green" 
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        </button>
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
		               		<p>경영관리부 (1/2)</p>
		               		<c:forEach var="emp" items="${employeesnot}">
			               		<c:if test="${'D5' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}">
					                        <button onclick="asd(event);">
					                            <img class="chatting_userlist_printarea_profile_img_green" 
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        </button>
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
		               		<p>재정팀 (1/2)</p>
		               		<c:forEach var="emp" items="${employeesnot}">
			               		<c:if test="${'D6' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}">
					                        <button onclick="asd(event);">
					                            <img class="chatting_userlist_printarea_profile_img_green" 
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        </button>
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
		               		<p>인사팀 (1/2)</p>
		               		<c:forEach var="emp" items="${employeesnot}">
			               		<c:if test="${'D7' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}">
					                        <button onclick="asd(event);">
					                            <img class="chatting_userlist_printarea_profile_img_green" 
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        </button>
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
		               		<p>영업팀 (1/2)</p>
		               		<c:forEach var="emp" items="${employeesnot}">
			               		<c:if test="${'D8' eq emp.deptCode}">
			               			<c:if test="${emp.empNo ne employee.empNo }">
				               			<div class="chatting_userlist_printarea_profile" data-user-no="${emp.empNo}">
					                        <button onclick="asd(event);">
					                            <img class="chatting_userlist_printarea_profile_img_green" 
					                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
					                        </button>
					                        <p>${emp.jobLevel.levelName}</p>
				                        	<p>${emp.empName}</p>
				                        	<!-- 나중에 label로 업그레이드 해보기 -->
				                        	<input type="checkbox" name="chatemps" value="${emp.empNo}">
					                    </div>
			               			</c:if>
			               		</c:if>
		               		</c:forEach>
		               		</div>
		               		
		                		
		                		
		                </c:if>	<!-- ${not empty employees } 끝남 -->
		                
		                </div>
		            </div>

		        <button class="create_chatjoin" onclick="insertchatjoin();">채팅상대 초대하기</button>
		        <button class="create_chatjoin" id="modal_chatinvite_cancel">취소</button>
		        </div>
			
		</div>
		<!-- 모달창 사원리스트아래에 초대하기 버튼 누르면 출력되는 모달창 닫음-->
		
		
		<!-- 모달창 설정? 처럼 띄우고 일단은 채팅방 나가기 버튼만 만들어서 나가는 기능 구현하기 -->
		<!-- 나가기를 누르면 ajax로 방번호, 로그인된 사원번호를 보내서 chatjoin테이블에서 해당하는 row delete하기 -->
		<div id="modal_chat_exit">
			<div>
				<div id="modal_chat_exit_content">	<!-- 공간 만들어두고 나중에 사용 -->
					<p>다른 기능넣을 공간</p>
				</div>
				<div id="modal_chat_exit_button">
					<button onclick="deletechatjoin();">
						<img src="https://i.pinimg.com/564x/86/a4/e6/86a4e6c3faabedd34bb8229fd5eb8b04.jpg" alt="나가기이미지" width="40px" height="40px">
						<p>채팅방 나가기<p>
					</button>
				</div>
			</div>
		</div>
		
		<!-- 모달 나가기 닫 -->
		
        
    </main>

<script>
	
	console.log("jsp 변수선언한 스크립트");

	var loginId = "${employee.empId}";
	var loginEmpName = "${employee.empName}";
	var loginEmpNo = "${employee.empNo}";
	var path = "${pageContext.request.contextPath}";
	var chatRoomNo = "${chatName.chatRoomNo}";
	var chatJoinCount = "${chatName.chatJoinCount - 1}";
	var chatRoomType = "${chatName.chatRoomType}";
		
	// 디버깅용 콘솔 로그 추가
    console.log("loginId: " + loginId);
    console.log("loginEmpName: " + loginEmpName);
    console.log("loginEmpNo: " + loginEmpNo);
    console.log("path: " + path);
    console.log("chatRoomNo: " + chatRoomNo);
    console.log("chatJoinCount: " + chatJoinCount);
    console.log("chatRoomType: " + chatRoomType);
	
	//나중에 삭제함
	/* console.log("chatName : "+"${chatName}");
	console.log("chatHistorys : "+"${chatHistorys}");
	console.log("chatEmployees : "+"${employees}"); */
	
	// 특정 조건이 충족될 때 외부 스크립트를 비동기로 로드
    /* var script = document.createElement("script");
    script.src = "${path}/resources/js/chatroom.js";
    script.async = true;
    document.body.appendChild(script); */
	
</script>

<script type="text/javascript" src="${path}/resources/js/chatroom.js" defer></script>
	
	
</body>


</html>

