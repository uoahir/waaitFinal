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

        #chatting_openchattingroomlist{
            /* border: 1px solid red; */
            width: 100%;
            display: flex;
            flex-direction: column;
            margin: 0 -500px 0 0;
        }

         /* 검색창 */
        #chatting_openchattingroomlist_search{
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

        #chatting_openchattingroomlist_search>div{
            border: 1px solid black;
            width: 100%;
            height: 40px;
            /* background-color: aqua; */
            border-radius: 15px;
            display: flex;
            align-items: center;
            
           
            margin: 0 100px 0 20px;
        }

        #chatting_openchattingroomlist_search>div>img{
           /*  border: 1px solid red; */
            margin-left: 10px;
        }

        #chatting_openchattingroomlist_search>div>input{
            /* border: 1px solid red; */
            height: 80%;
            width: 100%;
           	border: 0;
        }

        #chatting_openchattingroomlist_search>div>p{
            /* border: 1px solid red; */
            height: 100%;
            font-size: 20px;
            align-content: center;
            margin-left: auto;
            margin-right: 10px;
            cursor: pointer;
        }
        /* 검색창 끝 */

        #chatting_openchattingroomlist_printarea_all{
            /* border: 1px solid red; */
            /* margin-top: 90px; */
            margin: 90px 0 0 0;
            padding: 0 20px 0 20px;
        }

        .chatting_openchattingroomlist_printarea{
            /* border: 1px solid red; */
            width: 100%;
            display: flex;
            margin-bottom: 10px;
            padding: 10px 0 10px 0;
            /* margin-right:100px; */
            cursor: pointer;
        }
        
        .chatting_openchattingroomlist_printarea:hover{
        	background-color: #AEAEAE;
        }

        .chatting_openchattingroomlist_printarea>*{
            margin-left: 10px;
            text-overflow: ellipsis;
            white-space: nowrap;
            
        }

        .chatting_openchattingroomlist_printarea_profile{
            /* margin-bottom: 30px; */
            margin-left: 20px;
            /* margin-right: 100px; */
        }

        .chatting_openchattingroomlist_printarea_profile>button{
            border: 0;
            background-color: transparent;
        }

        .chatting_openchattingroomlist_printarea_profile_img{
            border-radius: 100%;
            /* background-color: red; */
        }

        .chatting_openchattingroomlist_printarea>div>p:nth-child(2){
            /* margin-left: 20px; */
            color: #888282;
        }

        .chatting_openchattingroomlist_printarea>div>p:nth-child(1){
            margin: 0;
            width: max-content;
        }

        .chatting_openchattingroomlist_printarea>div>p{
            margin: 10px 0 0 0;
            /* margin-top: 10px; */
        }

        .chatting_openchattingroomlist_printarea>div:nth-child(3){
            /* background-color: red; */
            margin-left: auto;
            margin-right: 10px;
            padding-left: 20px;
            overflow: hidden;
            /* color: #888282; */
        }

    </style>

</head>
<body>
    
    <main>
        <div id="chatting_openchattingroomlist">
            <!-- 검색창 -->
            <div id="chatting_openchattingroomlist_search">
                <div>
                    <img src="https://i.pinimg.com/564x/95/ee/40/95ee408c19f2c9d10629b70c4cea3e51.jpg" alt="" width="34px" height="34px">
                    <input type="text" placeholder="채팅방이름, 소개 검색">
                    <p onclick="">X</p>
                </div>
            </div>
            <div id="chatting_openchattingroomlist_printarea_all">
                <!-- 채팅방 목록 -->

                <div class="chatting_openchattingroomlist_printarea">
                    <div class="chatting_openchattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_openchattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <p>밥밥밥밥</p>
                        <p>41명</p>
                    </div>
                    <div>
                        <p>채티방 소개 쇄채팅보색</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_openchattingroomlist_printarea">
                    <div class="chatting_openchattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_openchattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <p>밥밥밥밥</p>
                        <p>41명</p>
                    </div>
                    <div>
                        <p>채티방 소개 쇄채팅보색</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_openchattingroomlist_printarea">
                    <div class="chatting_openchattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_openchattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <p>머하지</p>
                        <p>27명</p>
                    </div>
                    <div>
                        <p>머해무해머해머해머해머햄허ㅐ머해머해멓매허매허머ㅐㅁ허매ㅓ매ㅓ매머ㅐ머ㅐㅓ해</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_openchattingroomlist_printarea">
                    <div class="chatting_openchattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_openchattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <p>머하지</p>
                        <p>27명</p>
                    </div>
                    <div>
                        <p>머해무해머해머해머해머햄허ㅐ머해머해멓매허매허머ㅐㅁ허매ㅓ매ㅓ매머ㅐ머ㅐㅓ해</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_openchattingroomlist_printarea">
                    <div class="chatting_openchattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_openchattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <p>머하지</p>
                        <p>27명</p>
                    </div>
                    <div>
                        <p>머해무해머해머해머해머햄허ㅐ머해머해멓매허매허머ㅐㅁ허매ㅓ매ㅓ매머ㅐ머ㅐㅓ해</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_openchattingroomlist_printarea">
                    <div class="chatting_openchattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_openchattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <p>머하지</p>
                        <p>27명</p>
                    </div>
                    <div>
                        <p>머해무해머해머해머해머햄허ㅐ머해머해멓매허매허머ㅐㅁ허매ㅓ매ㅓ매머ㅐ머ㅐㅓ해</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_openchattingroomlist_printarea">
                    <div class="chatting_openchattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_openchattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <p>머하지</p>
                        <p>27명</p>
                    </div>
                    <div>
                        <p>머해무해머해머해머해머햄허ㅐ머해머해멓매허매허머ㅐㅁ허매ㅓ매ㅓ매머ㅐ머ㅐㅓ해</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

                <div class="chatting_openchattingroomlist_printarea">
                    <div class="chatting_openchattingroomlist_printarea_profile">
                        <button onclick="asd(event);">
                            <img class="chatting_openchattingroomlist_printarea_profile_img" 
                            src="https://i.pinimg.com/236x/4f/c3/a4/4fc3a4db6c4f400b49f353e045f3f8c9.jpg" alt="" width="50" height="50">
                        </button>
                    </div>
                    <div>
                        <p>머하지</p>
                        <p>27명</p>
                    </div>
                    <div>
                        <p>머해무해머해머해머해머햄허ㅐ머해머해멓매허매허머ㅐㅁ허매ㅓ매ㅓ매머ㅐ머ㅐㅓ해</p>
                    </div>
                </div>  <!-- 채팅방 목록 하나 끝 -->

            </div>
        </div>
    </main>

    <script>
        // jsp에서 for문 돌려서 이벤트 부여해야됨
        //document.querySelectorAll(".chatting_openchattingroomlist_printarea")
    </script>

</body>
</html>