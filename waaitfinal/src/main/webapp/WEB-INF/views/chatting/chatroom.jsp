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
                    <p>여기저기</p>
                    <p>5</p>
                </div>
                <div>
                    <button>
                        <img src="https://i.pinimg.com/564x/95/ee/40/95ee408c19f2c9d10629b70c4cea3e51.jpg" alt="검색" width="40" height="40">
                    </button>
                    <button>
                        <img src="https://i.pinimg.com/564x/23/8b/7f/238b7f2849994039b217c3eeb3706001.jpg" alt="파일 모아보기 and 채팅방 나가기" width="40" height="40">
                    </button>
                </div>
            </div>

            <!-- 채팅내역 -->
            <div id="chatting_chattingroom_content">
                <!-- 채팅 내역한줄 -->
                <div class="chatting_chattingroom_content_user">
                    <div>
                        <img src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg"  alt="프로필" width="50" height="50">
                    </div>
                    <div>
                        <p>안녕이름</p>
                        <p>오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자</p>
                    </div>
                    <div>
                        <p>1</p>
                        <p>오후 5:31</p>
                    </div>
                </div>  <!-- 채팅 내역 한줄 끝 -->

                <div class="chatting_chattingroom_content_user">
                    <div>
                        <img src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg"  alt="프로필" width="50" height="50">
                    </div>
                    <div>
                        <p>안녕이름</p>
                        <p>오늘 샤브샤브먹자</p>
                    </div>
                    <div>
                        <p>1</p>
                        <p>오후 5:31</p>

                        
                    </div>
                </div>  <!-- 채팅 내역 한줄 끝 -->

                <div class="chatting_chattingroom_content_my">
                    <div>
                        <p>1</p>
                        <p>오후 5:31</p>
                    </div>
                    <div>
                        <p>오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자</p>
                    </div>
                    
                </div>  <!-- 채팅 내역 한줄 끝 -->

                <div class="chatting_chattingroom_content_my">
                    <div>
                        <p>1</p>
                        <p>오후 5:31</p>
                    </div>
                    <div>
                        <p>오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자</p>
                    </div>
                    
                </div>  <!-- 채팅 내역 한줄 끝 -->

                <div class="chatting_chattingroom_content_my">
                    <div>
                        <p>1</p>
                        <p>오후 5:31</p>
                    </div>
                    <div>
                        <p>오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자</p>
                    </div>
                    
                </div>  <!-- 채팅 내역 한줄 끝 -->

                <div class="chatting_chattingroom_content_my">
                    <div>
                        <p>1</p>
                        <p>오후 5:31</p>
                    </div>
                    <div>
                        <p>오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자</p>
                    </div>
                    
                </div>  <!-- 채팅 내역 한줄 끝 -->

                <div class="chatting_chattingroom_content_my">
                    <div>
                        <p>1</p>
                        <p>오후 5:31</p>
                    </div>
                    <div>
                        <p>오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자오늘 샤브샤브먹자</p>
                    </div>
                </div>  <!-- 채팅 내역 한줄 끝 -->

            </div>

            <!-- 채팅입력 칸 -->
            <div id="chatting_chattingroom_bottom">
                <div>
                    <textarea name="" id="msg"></textarea>
                </div>
                <div>
                    <button onclick="sendMessage();">전송</button>
                    <button>파일전송</button>
                    <input type="file" value="파일전송">
                </div>
            </div>

        </div>
    </main>










	<script>
		const loginId = "${employee.empId}";
		const loginEmpNo = "${employee.empNo}";
		const path = "${pageContext.request.contextPath }";
	</script>
	
	<!-- script문 -->
	<script type="text/javascript" src="${path}/resources/js/chatroom.js"></script>
	<%-- <script type="text/javascript" src="${path}/resources/js/chatopen.js"></script> --%>
</body>
</html>

