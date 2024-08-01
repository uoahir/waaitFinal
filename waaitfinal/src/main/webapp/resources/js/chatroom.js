

   console.log("chatroom.js 오니?");

const hostName = window.location.hostname;
   let wsProtocol = window.location.protocol === "https:" ? "wss" : "ws";
   let wsUrl;
   
   console.log(hostName);
   console.log(wsProtocol);
   
   if(hostName === "localhost"){
      wsUrl = wsProtocol+"://localhost:5731/chat";
      console.log(wsUrl);
   }else{
      wsUrl = wsProtocol+"://14.36.141.71:15555/chat";
      console.log(wsUrl);
   }

   
document.addEventListener("DOMContentLoaded", function() {
    console.log("외부 스크립트 파일");
    //로딩 후 실행 웹 페이지를 스크롤 가장아래에 위치시킴
   window.scrollTo(0, document.body.scrollHeight);
});
   
   //로그인된 객체 저장 중
   console.log(loginId);
   
   //클라이언트에서 WebSocket 연결설정
   const chatserver = new WebSocket(wsUrl);
   //const chatserver = new WebSocket("wss://14.36.141.71:15555/chat");
   
   //WebSocket이 연결됐을때 실행
   chatserver.onopen = (response) =>{
      const msg = new Message("open","",loginId);
      console.log(msg);
      chatserver.send(msg.convert());
   }
   
   
   // 서버 -> 클라이언트 메세지받았을때 오는 곳
   chatserver.onmessage=(response)=>{
      const receiveMsg = Message.deconvert(response.data);
      console.log(receiveMsg);
      
      switch(receiveMsg.type){
         case "메세지" : messagePrint(receiveMsg);break;   //메세지 전송, 받았을때
         
      }      
   }
   
   
   //매세지 출력
   const messagePrint=(msg)=>{
      console.log("messagePrint : "+msg);
      console.log(msg);
      if(chatRoomNo == msg.chatRoomNo){
         if(msg.empName == loginEmpName){
            //로그인된 사람 메세지 출력
            const $div = document.createElement("div");
            const $div1 = document.createElement("div");
            const $div2 = document.createElement("div");
            
            const $p1 = document.createElement("p");
            const $p2 = document.createElement("p");
            const $p3 = document.createElement("p");
            
            $p1.innerText = msg.chatReadCount;
            $p2.innerText = msg.chatCreationDate;
            $p3.innerText = msg.chatContent;
            
            $div1.appendChild($p1);
            $div1.appendChild($p2);
            $div2.appendChild($p3);
            
            $div.appendChild($div1);
            $div.appendChild($div2);
            
            $div.classList.add("chatting_chattingroom_content_my");
            
            document.querySelector("#chatting_chattingroom_content").appendChild($div);
         }else{
            //로그인된 사람이 아닌 다른 사용자 메세지 출력
            const $div = document.createElement("div");
            const $div1 = document.createElement("div");
            const $div2 = document.createElement("div");
            const $div3 = document.createElement("div");
            
            const $profile = document.createElement("img");
            
            $profile.style.width="50px";
            $profile.style.height="50px";
            $profile.style.borderRadius="100%";
            $profile.setAttribute("src","${path}/resources/images/joyee.png");   // 사원번호를 이용해 프로필사진 가져오기
            
            const $p1 = document.createElement("p");
            const $p2 = document.createElement("p");
            const $p3 = document.createElement("p");
            const $p4 = document.createElement("p");
            
            $p1.innerText = msg.empName;
            $p2.innerText = msg.chatContent;
            $p3.innerText = msg.chatReadCount;
            $p4.innerText = msg.chatCreationDate;
            
            $div1.appendChild($profile);
            $div2.appendChild($p1);
            $div2.appendChild($p2);
            $div3.appendChild($p3);
            $div3.appendChild($p4);
            
            $div.appendChild($div1);
            $div.appendChild($div2);
            $div.appendChild($div3);
            
            $div.classList.add("chatting_chattingroom_content_user");
            
            document.querySelector("#chatting_chattingroom_content").appendChild($div);
         }   
      }            
   }
   

   
   //채팅방 메세지작성 칸 키업이벤트부여 엔터
   document.querySelector("#msg").addEventListener("keyup",function(event){
      if(event.key === "Enter" && !event.shiftKey){
         // 엔터 키의 기본 동작(줄바꿈) 막음
         event.preventDefault();
         sendMessage();
      }
   });
   
   
   //채팅방에서 전송버튼 눌렀을때 작동하는 js 
   const sendMessage=()=>{
      const inputData = document.querySelector("#msg").value;
      console.log("sendMessage : "+inputData);
      
      if(inputData.length > 0){
         //현재 시간 가져와 활용         
         const now = new Date();
         const year = now.getFullYear();
         const month = (now.getMonth()+1).toString().padStart(2,"0");
         const day = now.getDate().toString().padStart(2,"0");
         const hours = now.getHours().toString().padStart(2,"0");
         const minutes = now.getMinutes().toString().padStart(2,"0");
         const seconds = now.getSeconds().toString().padStart(2,"0");
         const msgTime = year+"/"+month+"/"+day+" "+hours+":"+minutes+":"+seconds;
         
         //타입 , 방번호, 전송자사원번호, 채팅내용
         const msgObj = new Message("메세지",loginEmpNo,loginEmpName,chatRoomNo,inputData,msgTime,chatJoinCount).convert();
         
         //클라이언트 -> 서버
         chatserver.send(msgObj);
         console.log("chatserver.send 전송메세지 : "+msgObj);
         document.querySelector("#msg").value = "";
      }else{
         alert("메세지를 입력하세요!");
         document.querySelector("#msg").focus();
      }
   }
   
   
   
   
   // 채팅방참여 수 누르면 채팅방에 속한 사원 리스트 출력 and 사원 초대
   const chatEmpList=()=>{
      const modal = document.getElementById("modal_chatemplist");
      if(modal.style.display === "block"){
         modal.style.display = "none";
      }else{
         modal.style.display = "block";
      }
   }
   
   document.getElementById("modal_chatemplist").addEventListener("click",function(){
      const modal = document.getElementById("modal_chatemplist");
      if(modal.style.display === "block"){
         modal.style.display = "none";
      }else{
         modal.style.display = "block";
      }
      
   })
   
   const chatinvitationemplist=()=>{
      const modal2 = document.getElementById("modal_chatinvitation");
      if(modal2.style.display === "block"){
         modal2.style.display = "none";
      }else{
         modal2.style.display = "block";
      }
   }
   
   document.getElementById("modal_chatinvite_cancel").addEventListener("click",function(){
      const modal2 = document.getElementById("modal_chatinvitation");
      if(modal2.style.display === "block"){
         modal2.style.display = "none";
      }else{
         modal2.style.display = "block";
      }
   });
   
   
   const insertchatjoin=()=>{
      const chatEmpNo = [];
      const checkboxes = document.querySelectorAll('input[name="chatemps"]:checked');
      
      if(checkboxes.length === 0){
         alert("초대할 사원을 선택해주세요");
         return;
      }
      
      checkboxes.forEach(function(checkbox) {
        chatEmpNo.push(checkbox.value);
       });
       
       console.log("채팅방 번호 : "+chatRoomNo);
       console.log("선택된 사원번호 : "+chatEmpNo);
       
       $.ajax({
         type : "POST",
         url : path+"/chat/insertchatjoin.do",
         traditional: true, // 배열을 전송할 때 필요
         /*contentType : 'application/json; charset=utf-8',*/
         data: {
               chatRoomNo: chatRoomNo,
               chatEmpNo: chatEmpNo
           },
         success : function(){
            alert("초대 성공");
             window.location.reload();
         },
           error: function(jqXHR, textStatus, errorThrown) {
               console.error("초대 실패: " + textStatus, errorThrown);
           }
      });
      
      const modal2 = document.getElementById("modal_chatinvitation");
      if(modal2.style.display === "block"){
         modal2.style.display = "none";
      }else{
         modal2.style.display = "block";
      }
      
          
   }
   // 채팅방초대 모달 끝
   
   
   // 채팅방 나가기 모달창
   const setting=()=>{
      const modal = document.getElementById("modal_chat_exit");
      if(modal.style.display === "block"){
         modal.style.display = "none";
      }else{
         modal.style.display = "block";
      }
   }
   
   document.getElementById("modal_chat_exit").addEventListener("click",function(){
      const modal = document.getElementById("modal_chat_exit");
      if(modal.style.display === "block"){
         modal.style.display = "none";
      }else{
         modal.style.display = "block";
      }
   });
   
   // 방번호, 사원번호(서버에서 로그인된 사원번호) 넘겨서 처리하기
   const deletechatjoin=()=>{
      console.log("채팅방 번호 : "+chatRoomNo);
      //1:1방은 나갈수없게 분기처리
      if(chatRoomType != "C1"){
         $.ajax({
            type : "POST",
            url : path+"/chat/deletechatjoin.do",
            data: {
                  chatRoomNo: chatRoomNo
              },
            success : function(){
                window.close();
            },
              error: function(jqXHR, textStatus, errorThrown) {
                  console.error("채팅방 나가기 실패: " + textStatus, errorThrown);
              }
         });
      }else{
         alert("1:1 방은 나갈수 없습니다.");
      }
   }
   
   // 채팅방 나가기 모달 끝
   
   
   
   
   
   
   
   
   //type="" 디폴트 공란 값이 들어오면 그값으로   //자바스크립트 객체
   class Message{
      constructor(type="",empNo="",empName="",chatRoomNo="",chatContent="",chatCreationDate="",chatReadCount=""){
         this.type=type;
         this.empNo=empNo;
         this.empName=empName;
         this.chatRoomNo=chatRoomNo;
         this.chatContent=chatContent;
         this.chatCreationDate=chatCreationDate;
         this.chatReadCount=chatReadCount;
      }
      //자바스크립트 객체 -> JSON (문자열)   //JSON.stringify
      convert(){
         return JSON.stringify(this);
      }   //무슨 타입으로 할껀지 생각해서 택 //분기처리 신경써서
      
      static deconvert(data){
         return JSON.parse(data);
      }
      
   }