

	//로그인된 객체 저장 중
	console.log(loginId);
	
	//클라이언트에서 WebSocket 연결설정
	const chatserver = new WebSocket("ws://localhost:5731/chat");
	
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
			case "메세지" : messagePrint(receiveMsg);break;	//메세지 전송, 받았을때
			
		}		
	}
	
	
	//매세지 출력
	const messagePrint=(msg)=>{
		console.log("messagePrint : "+msg);
		console.log(msg);
		
		if(msg.empName == loginId){
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
			$profile.setAttribute("src","${path}/resources/images/joyee.png");	// 사원번호를 이용해 프로필사진 가져오기
			
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
			chatserver.send(msgObj);
			console.log("chatserver.send 전송메세지 : "+msgObj);
			document.querySelector("#msg").value = "";
		}else{
			alert("메세지를 입력하세요!");
			document.querySelector("#msg").focus();
		}
	}
	
	
	
	
	
	
	
	//type="" 디폴트 공란 값이 들어오면 그값으로	//자바스크립트 객체
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
		//자바스크립트 객체 -> JSON (문자열)	//JSON.stringify
		convert(){
			return JSON.stringify(this);
		}	//무슨 타입으로 할껀지 생각해서 택 //분기처리 신경써서
		
		static deconvert(data){
			return JSON.parse(data);
		}
		
	}