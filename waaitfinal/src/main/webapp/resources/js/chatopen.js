
 
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






	//aside에 있는 사원목록 클릭헀을 때
	const chatuserlist=()=>{
		console.log("사원목록 클릭")
		const msg = new Message("사원목록",loginEmpNo);
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
		//console.log("response : "+response);
		//console.log("onmessage : "+receiveMsg);
		console.log(receiveMsg);
		
		switch(receiveMsg.type){
			case "채팅목록" : chatroomPrint(receiveMsg);break;
			case "사원목록" : chatuserPrint(receiveMsg);break;
			
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








	//유저목록 출력하기
	
	//프로필 클릭했을 때 상세정보 띄우기 나중에
	//출 퇴근 해서 프로필사진 주변에 테두리 초록 회색 표시	//chatting_userlist_printarea_profile_img_green
	
	const chatuserPrint=(msg)=>{
		console.log("chatuserPrint : "+msg);
		console.log(msg);
		
		//전체 범위div
		const $chatuserlistdiv = document.createElement("div");
		$chatuserlistdiv.id="chatting_userlist";
		
		//검색창
		const $div1 = document.createElement("div");
		$div1.id="chatting_userlist_search";
		const $div2 = document.createElement("div");
		const $img = document.createElement("img");
		const $input = document.createElement("input");
		const $p = document.createElement("p");
	
		//데이터 대입
		$img.setAttribute("src","https://i.pinimg.com/564x/95/ee/40/95ee408c19f2c9d10629b70c4cea3e51.jpg");
		$img.setAttribute("alt","검색창");
		$img.setAttribute("width","34px");
		$img.setAttribute("height","34px");
		$input.setAttribute("type","text");
		$input.setAttribute("placeholder","사용자이름, 부서명 검색");
		$p.setAttribute("onclick", "searchdelete();");
		$p.innerText="X";
	
		//합치기
		$div2.appendChild($img);
		$div2.appendChild($input);
		$div2.appendChild($p);
		
		$div1.appendChild($div2);
		
		$chatuserlistdiv.appendChild($div1);
		//검색창 끝
		
		
		//유저목록 전체 감싸기
		const $userlistareadiv = document.createElement("div");
		$userlistareadiv.id="chatting_userlist_printarea_all";
		
		
		//부서별 div
		const $userprintdiv = document.createElement("div");
		const $userprintdivD1 = document.createElement("div");
		const $userprintdivD2 = document.createElement("div");
		const $userprintdivD3 = document.createElement("div");
		const $userprintdivD4 = document.createElement("div");
		const $userprintdivD5 = document.createElement("div");
		const $userprintdivD6 = document.createElement("div");
		const $userprintdivD7 = document.createElement("div");
		const $userprintdivD8 = document.createElement("div");
		
		const $userprintp = document.createElement("p");
		const $userprintpD1 = document.createElement("p");
		const $userprintpD2 = document.createElement("p");
		const $userprintpD3 = document.createElement("p");
		const $userprintpD4 = document.createElement("p");
		const $userprintpD5 = document.createElement("p");
		const $userprintpD6 = document.createElement("p");
		const $userprintpD7 = document.createElement("p");
		const $userprintpD8 = document.createElement("p");
		
		$userprintp.innerText="나";
		$userprintpD1.innerText="대표실";
		$userprintpD2.innerText="개발부";
		$userprintpD3.innerText="개발1팀";
		$userprintpD4.innerText="개발2팀";
		$userprintpD5.innerText="경영관리부";
		$userprintpD6.innerText="재정팀";
		$userprintpD7.innerText="인사팀";
		$userprintpD8.innerText="영업팀";
		
		$userprintdiv.appendChild($userprintp);
		$userprintdivD1.appendChild($userprintpD1);
		$userprintdivD2.appendChild($userprintpD2);
		$userprintdivD3.appendChild($userprintpD3);
		$userprintdivD4.appendChild($userprintpD4);
		$userprintdivD5.appendChild($userprintpD5);
		$userprintdivD6.appendChild($userprintpD6);
		$userprintdivD7.appendChild($userprintpD7);
		$userprintdivD8.appendChild($userprintpD8);
		
		$userprintdiv.classList.add("chatting_userlist_printarea");
		$userprintdivD1.classList.add("chatting_userlist_printarea");
		$userprintdivD2.classList.add("chatting_userlist_printarea");
		$userprintdivD3.classList.add("chatting_userlist_printarea");
		$userprintdivD4.classList.add("chatting_userlist_printarea");
		$userprintdivD5.classList.add("chatting_userlist_printarea");
		$userprintdivD6.classList.add("chatting_userlist_printarea");
		$userprintdivD7.classList.add("chatting_userlist_printarea");
		$userprintdivD8.classList.add("chatting_userlist_printarea");
		
		$userlistareadiv.appendChild($userprintdiv);
		$userlistareadiv.appendChild($userprintdivD1);
		$userlistareadiv.appendChild($userprintdivD2);
		$userlistareadiv.appendChild($userprintdivD3);
		$userlistareadiv.appendChild($userprintdivD4);
		$userlistareadiv.appendChild($userprintdivD5);
		$userlistareadiv.appendChild($userprintdivD6);
		$userlistareadiv.appendChild($userprintdivD7);
		$userlistareadiv.appendChild($userprintdivD8);
			
		
		msg.chatUserlist.forEach(chatuser=>{
			//만들고 대입할떄 D1 인지 D2 인지 따져서 appendChild해주면 되나?
			const $userprofilediv = document.createElement("div");
			const $userprofilebutton = document.createElement("button");
			const $userprofileimg = document.createElement("img");
			const $userprofilep1 = document.createElement("p");
			const $userprofilep2 = document.createElement("p");
			
			$userprofilep1.innerText = chatuser.jobLevel.levelName;
			$userprofilep2.innerText = chatuser.empName;
			
			$userprofileimg.setAttribute("src","${path}/"+chatuser.empProfile);
			$userprofileimg.setAttribute("alt","프로필");
			$userprofileimg.setAttribute("width","50px");
			$userprofileimg.setAttribute("height","50px");
			$userprofilebutton.setAttribute("onclick", "profile(event);");
			
			$userprofilediv.classList.add("chatting_userlist_printarea_profile");
			$userprofileimg.classList.add("chatting_userlist_printarea_profile_img_green");
			
			$userprofilebutton.appendChild($userprofileimg);
			$userprofilediv.appendChild($userprofilebutton);
			$userprofilediv.appendChild($userprofilep1);
			$userprofilediv.appendChild($userprofilep2);
			
			
			if(loginEmpNo == chatuser.empNo){
				$userprintdiv.appendChild($userprofilediv);
			}else{
				switch(chatuser.department.deptCode){
					case "D1" : $userprintdivD1.appendChild($userprofilediv);break;
					case "D2" : $userprintdivD2.appendChild($userprofilediv);break;
					case "D3" : $userprintdivD3.appendChild($userprofilediv);break;
					case "D4" : $userprintdivD4.appendChild($userprofilediv);break;
					case "D5" : $userprintdivD5.appendChild($userprofilediv);break;
					case "D6" : $userprintdivD6.appendChild($userprofilediv);break;
					case "D7" : $userprintdivD7.appendChild($userprofilediv);break;
					case "D8" : $userprintdivD8.appendChild($userprofilediv);break;
				}
			}
			
		});
		
		$chatuserlistdiv.appendChild($userlistareadiv);
		
		document.querySelector("#chatting_main_content").innerHTML=$chatuserlistdiv.innerHTML;
		
	}
	//유저목록 출력하기 끝






	
	//채팅목록 출력하기
	
	//페이징 처리 나중에
	//프로필 눌렀을때 작동하는 script 나중에 구현하기 -> 사원목록에서 프로필눌렀을때 뜨는 창이랑 같은거 사용해도 됨
	
	//그룹채팅일때 몇명인지 표시 -> p태그 만들어서 count? //해결
	//appendChild로 하면 덮어씌우기 안됨 뭔지 찾기 //해결
	//검색창 제대로 안만들어짐 고치셈	//해결
	
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
			const $p4 = document.createElement("p");
			
			
			//데이터 대입
			if(chatroom.chatRoomName!=null){
				$p1.innerText=chatroom.chatRoomName;
			}else{
				$p1.innerText=chatroom.empName;
			}
			$p2.innerText=chatroom.chatHistory.chatContent;
			
			$p3.innerText=chatroom.chatHistory.chatCreationDate;
			
			$p4.innerText=chatroom.chatJoinCount;
			
			
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
			
			if(chatroom.chatJoinCount>2){
				$div21.appendChild($p4);
			}
			
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
		
		document.querySelector("#chatting_main_content").innerHTML=$chatroomlistdiv.innerHTML;
		
		
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
	
	
	
	
	/*class ChatRoom{
		constructor(chatRoomNo="",chatRoomType="",chatRoomEmpNo="",chatRoomCreationDate="",chatRoomName="",chatRoomPassword="",chatRoomIntroduction=""){
			this.chatRoomNo=chatRoomNo;
			this.chatRoomType=chatRoomType;
			this.chatRoomEmpNo=chatRoomEmpNo;
			this.chatRoomCreationDate=chatRoomCreationDate;
			this.chatRoomName=chatRoomName;
			this.chatRoomPassword=chatRoomPassword;
			this.chatRoomIntroduction=chatRoomIntroduction;
		}
	}*/
	
	
		