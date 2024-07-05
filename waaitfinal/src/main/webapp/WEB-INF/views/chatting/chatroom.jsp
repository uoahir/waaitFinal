<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
    
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

        #chatting_chattingroom_top{
            border: 1px solid red;
            display: flex;
            position: fixed;
            height: 60px;
            width: 100%;
            background-color: white;
        }

        #chatting_chattingroom_content{
            border: 1px solid red;
            /* display: flex; */
            height: 100%;
            padding: 60px 0 100px 0;
            /* overflow: hidden; */
        }

        #chatting_chattingroom_bottom{
            border: 1px solid red;
            display: flex;
            position: fixed;
            height: 100px;
            bottom: 0;
            width: 100%;
            background-color: white;
        }

        #chatting_chattingroom_top>div:nth-child(1)>p{
            /* background-color: red; */
            margin: 0;
            
        }

        #chatting_chattingroom_top>div:nth-child(1){
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 10px 0 10px 20px;
        }


        #chatting_chattingroom_top>div:nth-child(2){
            /* background-color: red; */
            margin-left: auto;
            align-items: center;
            display: flex;
            margin-right: 10px;
        }

        #chatting_chattingroom_top>div:nth-child(2)>button{
            cursor: pointer;
            border: 0;
            background-color: transparent;
        }

        #chatting_chattingroom_content>div{
            display: flex;
            border: 1px solid red;
            
        }

        /* 상대 채팅내역 */
        .chatting_chattingroom_content_user>div{
            margin: 10px 0 10px 10px;
            border: 1px solid red;
        }

        .chatting_chattingroom_content_user>div:nth-child(1)>img{
            border-radius: 100%;
            /* background-color: red; */
        }

        /* 채팅내역 사용자이름, 채팅메세지 */
        .chatting_chattingroom_content_user>div:nth-child(2)>p:nth-child(1){
            margin: 0 0 10px 0;
        }

        .chatting_chattingroom_content_user>div:nth-child(2)>p:nth-child(2){
            margin: 0;
            background-color: #D9D9D9;
            border-radius: 10px;
            padding: 10px;
        }

        .chatting_chattingroom_content_user>div:nth-child(3){
            margin-left: 20px;
            color: #888282;
            margin-right: 10px;
            min-width: max-content;
            margin-top: auto;
            margin-bottom: 10px;
           
        }

        .chatting_chattingroom_content_user>div:nth-child(3)>p{
            margin: 0;
        }
        /* 상대 채팅내역 끝 */



        /* 나의 채팅내역 */
        .chatting_chattingroom_content_my>div{
            border: 1px solid red;
            /* margin-left: auto; */
            margin: 10px 10px 10px 0;
        }

        .chatting_chattingroom_content_my>div:nth-child(1){
            margin-left: auto;
            color: #888282;
            margin-right: 20px;
            min-width: max-content;
            margin-top: auto;
            margin-bottom: 10px;
        }

        .chatting_chattingroom_content_my>div:nth-child(1)>p{
            margin: 0;
        }

        /* .chatting_chattingroom_content_my>div:nth-child(1)>p:nth-child(2){
            margin: 0;
        }

        .chatting_chattingroom_content_my>div:nth-child(1)>p:nth-child(1){
            margin-left: auto;
            margin: 0 auto 0 0;
        } */

        .chatting_chattingroom_content_my>div:nth-child(2)>p{
            margin: 0;
            background-color: #D9D9D9;
            border-radius: 10px;
            padding: 10px;
        }
        /* 나의 채팅내역 끝 */


        /* 채팅 입력칸 */
        #chatting_chattingroom_bottom>div:nth-child(1){
            /* background-color: red; */
            border: 1px solid red;
            height: 100%;
            width: 100%;
        }

        #chatting_chattingroom_bottom>div:nth-child(2){
            border: 1px solid red;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 10px 10px 10px 0;
        }

        #chatting_chattingroom_bottom>div:nth-child(1)>textarea{
            height: 80%;
            width: 90%;
            margin: 10px 5% 10px 5%;
        }

        #chatting_chattingroom_bottom>div:nth-child(2)>button{
            /* overflow: auto; */
            text-overflow: ellipsis;
        }

        /* 채팅 입력칸 끝 */
    </style>

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
                    <textarea name="" id=""></textarea>
                </div>
                <div>
                    <button>전송</button>
                    <button>파일전송</button>
                </div>
            </div>

        </div>
    </main>

</body>
</html>