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

        #chatting_chattingroomlist{
            /* border: 1px solid red; */
            width: 100%;
            display: flex;
            flex-direction: column;
        }

         /* 검색창 */
         #chatting_chattingroomlist_search{
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

         #chatting_chattingroomlist_search>div{
            border: 1px solid black;
            width: 100%;
            height: 40px;
            /* background-color: aqua; */
            border-radius: 15px;
            display: flex;
            align-items: center;
            
           
            margin: 0 100px 0 20px;
        }

         #chatting_chattingroomlist_search>div>img{
           /*  border: 1px solid red; */
            margin-left: 10px;
        }

         #chatting_chattingroomlist_search>div>input{
            /* border: 1px solid red; */
            height: 80%;
            width: 100%;
           	border: 0;
        }

         #chatting_chattingroomlist_search>div>p{
            /* border: 1px solid red; */
            height: 100%;
            font-size: 20px;
            align-content: center;
            margin-left: auto;
            margin-right: 10px;
            cursor: pointer;
        }
        /* 검색창 끝 */

        #chatting_chattingroomlist_printarea_all{
            /* border: 1px solid red; */
            margin-top: 90px;
            padding: 0 20px 0 20px;
        }

        .chatting_chattingroomlist_printarea{
            /* border: 1px solid red; */
            width: 100%;
            display: flex;
            margin-bottom: 10px;
            padding: 10px 0 10px 0;
            cursor: pointer;
        }
        
        .chatting_chattingroomlist_printarea:hover{
        	background-color: #AEAEAE;
        }

        .chatting_chattingroomlist_printarea>*{
            margin-left: 10px;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .chatting_chattingroomlist_printarea_profile{
            /* margin-bottom: 30px; */
            margin-left: 20px;
        }

        .chatting_chattingroomlist_printarea_profile>button{
            border: 0;
            background-color: transparent;
        }

        .chatting_chattingroomlist_printarea_profile_img{
            border-radius: 100%;
            /* background-color: red; */
        }

        .chatting_chattingroomlist_printarea>div>div{
            /* background-color: red; */
            display: flex;
            /* margin-left: 30px; */
        }

        .chatting_chattingroomlist_printarea>div>div>p:nth-child(2){
            margin-left: 20px;
            color: #888282;
        }

        .chatting_chattingroomlist_printarea>div>div>p{
            margin: 0;
        }

        .chatting_chattingroomlist_printarea>div>p{
            margin: 0;
            margin-top: 10px;
        }

        .chatting_chattingroomlist_printarea>div:nth-child(3){
            /* background-color: red; */
            margin-left: auto;
            margin-right: 10px;
            color: #888282;
        }

    </style>

</head>
<body>
    
    <main>
        <div id="chatting_chattingroomlist">
            <!-- 검색창 -->
            <div id="chatting_chattingroomlist_search">
                <div>
                    <img src="https://i.pinimg.com/564x/95/ee/40/95ee408c19f2c9d10629b70c4cea3e51.jpg" alt="" width="34px" height="34px">
                    <input type="text" placeholder="채팅방이름, 참가자 검색">
                    <p onclick="">X</p>
                </div>
            </div>
            <div id="chatting_chattingroomlist_printarea_all">
                <!-- 채팅방 목록 -->

                <div class="chatting_chattingroomlist_printarea">
                    <div class="chatting_chattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_chattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <div>
                            <p>김지연</p>
                            
                        </div>
                        <p>그만자</p>
                    </div>
                    <div>
                        <p>오후 9:21</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_chattingroomlist_printarea">
                    <div class="chatting_chattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_chattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <div>
                            <p>여기조기</p>
                            <p>5</p>
                        </div>
                        <p>오늘 샤브샤브먹자</p>
                    </div>
                    <div>
                        <p>오후 9:21</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_chattingroomlist_printarea">
                    <div class="chatting_chattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_chattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <div>
                            <p>여기조기</p>
                            <p>5</p>
                        </div>
                        <p>오늘 샤브샤브먹자</p>
                    </div>
                    <div>
                        <p>오후 9:21</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_chattingroomlist_printarea">
                    <div class="chatting_chattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_chattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <div>
                            <p>여기조기</p>
                            <p>5</p>
                        </div>
                        <p>오늘 샤브샤브먹자</p>
                    </div>
                    <div>
                        <p>오후 9:21</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_chattingroomlist_printarea">
                    <div class="chatting_chattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_chattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <div>
                            <p>여기조기</p>
                            <p>5</p>
                        </div>
                        <p>오늘 샤브샤브먹자</p>
                    </div>
                    <div>
                        <p>오후 9:21</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_chattingroomlist_printarea">
                    <div class="chatting_chattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_chattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <div>
                            <p>여기조기</p>
                            <p>5</p>
                        </div>
                        <p>오늘 샤브샤브먹자</p>
                    </div>
                    <div>
                        <p>오후 9:21</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_chattingroomlist_printarea">
                    <div class="chatting_chattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_chattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <div>
                            <p>여기조기</p>
                            <p>5</p>
                        </div>
                        <p>오늘 샤브샤브먹자</p>
                    </div>
                    <div>
                        <p>오후 9:21</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_chattingroomlist_printarea">
                    <div class="chatting_chattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_chattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <div>
                            <p>여기조기</p>
                            <p>5</p>
                        </div>
                        <p>오늘 샤브샤브먹자</p>
                    </div>
                    <div>
                        <p>오후 9:21</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

            </div>
        </div>
    </main>

    

</body>
</html>