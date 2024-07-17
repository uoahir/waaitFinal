
 
	//로그인된 객체 저장 중
	console.log(loginId);
	
	/**
	 * 채팅서버 기능
	 */
	//ws : http
	//wss : https
	// 클라이언트에서 WebSocket 연결 설정
	const server = new WebSocket("ws://localhost:5731/chat");	// /+chatRoomNo

	//입장했을때 실행됨. // WebSocket 연결이 열렸을 때
	server.onopen=(response)=>{
		const msg = new Message("open","",loginId);
		console.log(msg);
		server.send(msg.convert());
	}


	//aside에 있는 채팅방목록 클릭했을 때
	const chatroomlist=()=>{
		console.log("채팅방목록 클릭");
		const msg = new Message("채팅목록",loginEmpNo);
		server.send(msg.convert());
		
	}




	//response는 응답 전부 필요한 데이터가 response.data data안에 들어가 있어서 접근한 값들을 Message객체로 저장 시킴
	// 서버로부터 메시지를 받았을 때 자바->클라이언트
	server.onmessage=(response)=>{
		const receiveMsg = Message.deconvert(response.data);
		console.log("response : "+response);
		console.log("onmessage : "+receiveMsg);
		console.log(receiveMsg);
		
		switch(receiveMsg.type){
			case "채팅목록" : chatroomPrint(receiveMsg);break;
			
			//case "open" : alertMessage(receiveMsg);break; 	//채팅방에 입장할 때
			case "msg" : messagePrint(receiveMsg);break;	//메세지 왔을때
			//case "attend" :addAttend(receiveMsg);break;		//새로운사람이 입장할 때
			//case "close" : alertMessage(receiveMsg);break;
		}
	}

	//사람이 입장할때 작동? msg에 참가자들 담겨져있음
	//msg가 그냥 문자열이라서 JSON.parse를 해서 리스트형식으로 변경해야함
	/*const addAttend=(msg)=>{
		const clients = JSON.parse(msg.msg);
		const $attendContainer = document.querySelector("#attendContainer");
		$attendContainer.innerHTML = "";
		const $ul = document.createElement("ul");
		$ul.classList.add("listcontainer");
		clients.map(e=>{
			const $li = document.createElement("li");
			$li.innerText=e;
			$li.classList.add("listfont");
			return $li;
		}).forEach(e=>{
			$ul.appendChild(e);
		});
		$attendContainer.appendChild($ul);
	} */



	
	//채팅목록 출력하기
	
	//그룹채팅일때 몇명인지 표시 -> p태그 만들어서 count? 뭐 잘 굴려서 구현하면 됨
	//appendChild로 하면 덮어씌우기 안됨 뭔지 찾기
	//검색창 제대로 안만들어짐 고치셈
	//프로필 눌렀을때 작동하는 script 나중에 구현하기 -> 사원목록에서 프로필눌렀을때 뜨는 창이랑 같은거 사용해도 됨
	
	const chatroomPrint=(msg)=>{
		console.log("chatroomPrint : "+msg);
		console.log(msg);
		
		
		//전체 감싸기
		const $chatroomlistdiv = document.createElement("div");
		$chatroomlistdiv.id="chatting_chattingroomlist";
		
		
		//검색창
		const $div10 = document.createElement("div");
		$div10.id="chatting_chattingroomlist_search";
		const $div20 = document.createElement("div");
		
		const $img10 = document.createElement("img");
		const $input10 = document.createElement("input");
		const $p10 = document.createElement("p");
		
		//데이터 대입
		$img10.setAttribute("src","https://i.pinimg.com/564x/95/ee/40/95ee408c19f2c9d10629b70c4cea3e51.jpg");
		$img10.setAttribute("alt","검색창");
		$img10.setAttribute("width","34px");
		$img10.setAttribute("height","34px");
		
		$input10.setAttribute("type","text");
		$input10.setAttribute("placeholder","채팅방이름, 참가자 검색");
		
		$p10.setAttribute("onclick", "searchdelete();");
		$p10.innerText="X";
		
		//합치기
		$div20.appendChild($img10);
		$div20.appendChild($input10);
		$div20.appendChild($p10);
		
		$div10.appendChild($div20);
		//합치기 끝
		//검색창 끝


		//목록 감싸는 div
		const $chatlistdiv = document.createElement("div");
		$chatlistdiv.id ="chatting_chattingroomlist_printarea_all";
		
		//div하나씩 생성
		msg.chatRoomlist.forEach(chatroom=>{
			//element 생성
			const $div = document.createElement("div");
			
			const $div1 = document.createElement("div");
			const $div2 = document.createElement("div");
			const $div3 = document.createElement("div");
			
			const $div21 = document.createElement("div");
			
			const $button = document.createElement("button");
			
			const $img = document.createElement("img");
			
			const $p1 = document.createElement("p");
			const $p2 = document.createElement("p");
			const $p3 = document.createElement("p");
			
			
			//데이터 대입
			if(chatroom.chatRoomName!=null){
				$p1.innerText=chatroom.chatRoomName;
			}else{
				$p1.innerText=chatroom.empName;
			}
			$p2.innerText=chatroom.chatHistory.chatContent;
			
			$p3.innerText=chatroom.chatHistory.chatCreationDate;
			
			$img.setAttribute("src", "${path}/"+chatroom.empProfile); // chatroom 객체의 프로필 이미지 URL 사용
        	$img.setAttribute("alt", "프로필");
        	$img.setAttribute("width", "50");
        	$img.setAttribute("height", "50");
			
			$button.setAttribute("onclick", "profile(event);");
			
			
			//class부여
			$img.classList.add("chatting_chattingroomlist_printarea_profile_img");
			
			$div1.classList.add("chatting_chattingroomlist_printarea_profile");
			
			$div.classList.add("chatting_chattingroomlist_printarea");
			
			
			//합치기
			$button.appendChild($img);
			
			$div1.appendChild($button);
			
			$div21.appendChild($p1);
			
			$div2.appendChild($div21);
			
			$div2.appendChild($p2);
			
			$div3.appendChild($p3);
			
			$div.appendChild($div1);
			$div.appendChild($div2);
			$div.appendChild($div3);
			
			$chatlistdiv.appendChild($div);
		})
		//오픈 오른쪽 공간에 대입
		$chatroomlistdiv.appendChild($div10);
		$chatroomlistdiv.appendChild($chatlistdiv);
		//document.querySelector("#chatting_main_content").appendChild($chatlistdiv);
		
		document.querySelector("#chatting_main_content").appendChild($chatroomlistdiv);
		
		
	};
	//채팅목록 출력하기 끝






	//메세지 출력
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
			
			$p1.innerText = "안읽은 숫자";
			$p2.innerText = "보낸 시간";
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
			$p3.innerText = "안읽은 숫자";
			$p4.innerText = "보낸 시간";
			
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
			const msgObj = new Message("msg",loginId,"",inputData,"","").convert();
			server.send(msgObj);
			console.log("server.send : "+msgObj);
			document.querySelector("#msg").value = "";
		}else{
			alert("메세지를 입력하세요!");
			document.querySelector("#msg").focus();
		}
	}


	/*const alertMessage=(msg)=>{
		const $container = $("<div>").addClass("alertContainer");
		const status = msg.type=="open"?"접속":"퇴장";
		const $content = $("<h4>").text(`${msg.sender}님이 ${status}하셨습니다`);
		$container.append($content);
		$("#chattingcontent").append($container);
	}*/





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
	
	
	
	
	class ChatRoom{
		constructor(chatRoomNo="",chatRoomType="",chatRoomEmpNo="",chatRoomCreationDate="",chatRoomName="",chatRoomPassword="",chatRoomIntroduction=""){
			this.chatRoomNo=chatRoomNo;
			this.chatRoomType=chatRoomType;
			this.chatRoomEmpNo=chatRoomEmpNo;
			this.chatRoomCreationDate=chatRoomCreationDate;
			this.chatRoomName=chatRoomName;
			this.chatRoomPassword=chatRoomPassword;
			this.chatRoomIntroduction=chatRoomIntroduction;
			
		}
		
		
	}
	
	
		