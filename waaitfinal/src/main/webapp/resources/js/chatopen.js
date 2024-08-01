
 
	//로그인된 객체 저장 중
	console.log(loginId);
	
	//웹소켓 연결주소 유동적으로 만들기
	const hostName = window.location.hostname;
	let wsProtocol = window.location.protocol === "https:" ? "wss" : "ws";
	let wsUrl;
	
	console.log(hostName);
	console.log(wsProtocol);
	
	if(hostName === "localhost"){
		wsUrl = wsProtocol+"://localhost:5731/chat";
		console.log(wsUrl);
	}else{
		wsUrl = wsProtocol+"://14.36.141.71:15555/GDJ79_WAAIT_final/chat";
		console.log(wsUrl);
	}
	
	//채팅서버 기능
	//ws : http
	//wss : https
	// 클라이언트에서 WebSocket 연결 설정
	const server = new WebSocket(wsUrl);

	

	//입장했을때 실행됨. // WebSocket 연결이 열렸을 때
	server.onopen=(response)=>{
		const msg = new Message("open","",loginId);
		console.log(msg);
		server.send(msg.convert());
	}


	//채팅방생성하면서 바로 열기?
	window.onload = function(){
		if(chatRoomNo > 0){
			console.log("채팅방 열리나?");
			console.log("채팅방 번호 : "+chatRoomNo);
			
			//채팅방 열기
			openChatRoom(chatRoomNo);
		}		
	}


	// 채팅방 새창 여는 함수 // 매개변수 방번호 꼭! 넘겨주기
	function openChatRoom(chatRoomNo){
		let chatserver = window.open(path+"/chat/chatroomopen.do?chatroomNo="+chatRoomNo,"_blank","top=100, left=400, height=700, width=550");
		chatserver.onload = function(){
			chatserver.socket = new WebSocket(wsUrl);
			
			// 채팅방 새창열기 후 채팅방목록을 최신화하여 안읽은 수 최신화
			chatroomlist();
		}
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
	

	//aside에 있는 채팅방추가 클릭했을 때
	const chatinvitation=()=>{
		console.log("채팅방추가 클릭");
		//모달 띄우기
		const modal = document.getElementById("modal_chatinvitation");
		
		if(modal.style.display === "block"){
			modal.style.display = "none";
		}else{
			modal.style.display = "block";
		}
	}
	
	document.getElementById("modal_chatinvitation").addEventListener("click",function(){
		const modal = document.getElementById("modal_chatinvitation");
		
		if(modal.style.display === "block"){
			modal.style.display = "none";
		}else{
			modal.style.display = "block";
		}
	})
	// 채팅방추가 모달 끝
	
	//채팅방추가 화면 전환 일반채팅
	document.getElementById("modal_chatinvitation_groupchat").addEventListener("click",function(){
		
		$.ajax({
			type : "GET",
			url : path+"/chat/chatinvitation.do",
			data : {},
			success : function(data){
				//일반채팅 화면 넣기
				document.querySelector("#chatting_main_content").innerHTML = data;
				
				// form태그 submit때 체크박스가 체크 되지 않았다면 alert창 띄우기
				document.getElementById('create_chatroom').addEventListener('click', function(event) {
				    const checkboxes = document.querySelectorAll('input[name="chatemps"]:checked');
				    if (checkboxes.length === 0) {
				        event.preventDefault(); // 폼 제출 중단
				        alert("사원을 선택해주세요");
				    }
				});
				
				//이벤트 부여 사원번호출력
				const profiles = document.querySelectorAll(".chatting_userlist_printarea_profile");
				profiles.forEach((profilediv, i)=>{
					profilediv.addEventListener("click",e=>{
						const empNo = e.currentTarget.dataset.userNo;
						console.log("클릭된 사원번호 : "+empNo);
					});
				});
			} //success 닫
		}); //Ajax 닫
		
	})
	//채팅방추가 일반채팅 끝
	
	
	//채팅방목록에서 채팅방을 클릭했을 때
	//채팅방을 눌렀을때 해당하는 채팅방의 번호를 보내서 채팅내역을 출력해야함.
	//해당 채팅방번호, 로그인된 사원번호 전달
	const chatroomopen=(e)=>{
		console.log("채팅방 클릭");
		const chatRoomNo = e.currentTarget.dataset.chatroomNo;
		console.log("채팅방 번호 : "+chatRoomNo);
		
		//채팅방 여는 함수
		openChatRoom(chatRoomNo);
	}
	
	
	/* 프로필 눌렀을떄 출려되는 모달 */
	/* 나중에 프로필 생기면 꼭 주소 연결하기 */
	
	// 1:1대화를 클릭했을때 empNo값이 저장됨 -> 하나의변수로 덮어씌우면서 재사용함.
	let lastEmpNo = null;
	// 이벤트 핸들러 추가 여부를 확인하는 플래그
	let isClickHandlerAdded = false; 
	
	const empprofile=(empNo)=>{
		console.log(empNo);
		
		//모달창 열기
		const modal = document.getElementById("modal_empprofile");
		if(modal.style.display === "block"){
			modal.style.display = "none";
		}else{
			modal.style.display = "block";
		}
		
		$.ajax({
			type : "POST",
			url : path+"/chat/selectEmpProfile.do",
			data : {
				empNo:empNo
				},
			success : function(data){
				console.log(data);
				//프로필 사진
				//나중에 프로필 생기면 꼭 주소 연결하기
				const empProfile = document.querySelector("#modal_empprofile_top>div:nth-of-type(2)>img");
				//empProfile.src = path+"/${data.empProfile}";
				
				//이름 직급
				const empNameLevelName = document.querySelector("#modal_empprofile_top>div:nth-of-type(3)>h2");
				empNameLevelName.innerText = data.empName+" "+data.jobLevel.levelName;
				
				//1:1 채팅 바로가기
				const modalempprofileopenchatdiv = document.querySelector("#modal_empprofile_top>div:nth-of-type(4)");
				
				// 현재 empNo대입
				lastEmpNo = data.empNo;
				
				// 자기 자신은 1:1 채팅 바로가기 버튼 출력안됨
				if(data.empNo == loginEmpNo){
					modalempprofileopenchatdiv.style.display = "none";
				}else{
					modalempprofileopenchatdiv.style.display = "flex";					
				}
				
				//플래그를 이용해서 이벤트부여가 한번만되게 만듦
				if(!isClickHandlerAdded){
					// 클릭 이벤트 리스너 추가
					modalempprofileopenchatdiv.addEventListener("click", modalempprofileopenchat);
					isClickHandlerAdded = true;
				}
				
				//부서 직급
				const deptNameLevelName = document.querySelector("#modal_empprofile_middle>div:nth-of-type(1)>p");
				deptNameLevelName.innerText = data.department.deptName+" "+data.jobLevel.levelName;
				
				//연락처
				const empPhone = document.querySelector("#modal_empprofile_middle>div:nth-of-type(2)>p");
				empPhone.innerText = data.empPhone;
				
				//이메일주소
				const empEmail = document.querySelector("#modal_empprofile_middle>div:nth-of-type(3)>p");
				empEmail.innerText = data.empEmail;
				
			},
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.error("프로필 에러 : " + textStatus, errorThrown);
	        }
		});
	};
	/* 프로필 모달 닫 */
	
	/* 프로필 모달 닫기버튼 */
	const modalempprofileclose=()=>{
		const modal = document.getElementById("modal_empprofile");
		
		if(modal.style.display === "block"){
			modal.style.display = "none";
		}else{
			modal.style.display = "block";
		}
	}
	/* 프로필 모달 닫기버튼 */
	
	
	
	/* 프로필 모달 채팅바로가기 */
	function modalempprofileopenchat () {
		console.log(lastEmpNo);
		
		$.ajax({
			type : "POST",
			url : path+"/chat/profilechatopen.do",
			data: {
	            chatEmpNo: lastEmpNo
	        },
			success : function(data){
				/*alert(data);*/
				console.log(data);

				switch(data.type){
					case "방있음" :	
						// 1:1 방이 이미 있는 경우 채팅방 창 열기
						openChatRoom(data.chatRoomNo);
						
					case "방없음" :
						// 1: 방이 없는 경우 채팅방 생성 후 열기
						console.log(data.chatemps);
						
						$.ajax({
							type : "POST",
							url : path+"/chat/insertchatroom.do",
							traditional: true, // 배열을 전송할 때 필요
							data: {
					            chatemps: data.chatemps
					        },
							success : function(){
				    			// 1. Ajax로 방번호 가져오는 컨트롤러 만들어서 가져옴
				    			// 2. 기존 방 생성 컨트롤러랑 리턴값을 다르게 만들어 가져옴
				    			$.ajax({
									type : "POST",
									url : path+"/chat/selectgetchatroomno.do",
									data: {	},
									success : function(response){
						    			openChatRoom(response.chatRoomNo);
									},
							        error: function(jqXHR, textStatus, errorThrown) {
							            console.error("방번호 가져오기 실패: " + textStatus, errorThrown);
							        }
								});
							},
					        error: function(jqXHR, textStatus, errorThrown) {
					            console.error("채팅방 생성 실패: " + textStatus, errorThrown);
					        }
						});	
				}
			},
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.error("프로필 1:1채팅 실패 : " + textStatus, errorThrown);
	        }
		});
	}
	/* 프로필 모달 채팅바로가기 끝 */


	// 현재는 메세지를 저장할 때 한번에 5개씩 리스트형태로 담아서 저장하기 떄문에 아래 기능을 구현하기에 어려움이 있어 한개씩 바로바로 insert되게 변경해서 구현해야됨.
	
	// 채팅 목록에서 자신이 채팅방 별로 안읽은 숫자 표시
	// 채팅 카운팅? 테이블 만들어서 채팅을 한번 전송하면 채팅기록테이블엔 한번 할때 마다 바로 저장하고, 채팅 카운팅 테이블엔 채팅방에 참여하고 있는 사원 수 만큼 row추가 
	// 채팅목록에서 안읽은 채팅 수 띄울 수 있음 

	//CHATHISTORYCOUNT
	// 추가 : 채팅기록 테이블에 저장시킬때 COUNT테이블에 채팅방에 속한 사원 수 만큼 ROW 추가
	// 삭제 : 채팅방을 들어가는 기준으로 해당채팅방번호 + 로그인된 사원번호 ROW 삭제




	//response는 응답 전부 필요한 데이터가 response.data data안에 들어가 있어서 접근한 값들을 Message객체로 저장 시킴
	// 서버로부터 메시지를 받았을 때 자바->클라이언트
	server.onmessage=(response)=>{
		const receiveMsg = Message.deconvert(response.data);
		//console.log("response : "+response);
		//console.log("onmessage : "+receiveMsg);
		console.log(receiveMsg);
		
		switch(receiveMsg.type){
			case "사원목록" : chatuserPrint(receiveMsg);break;
			case "채팅목록" : chatroomPrint(receiveMsg);break;
			
			// 채팅방에서 메세지를 전송했을때 작동함
			// 채팅방에서 메세지를 전송했을때 (모든사람) 채팅목록 다시 불러와 최신화 시킴
			// 자기가 어느 화면에 있던 무조건 채팅목록으로 이동해서 채팅목록을 띄워둔 사람만 최신화 하는 식으로 변경해야 할 것 같음
			case "메세지" : chatroomlist();break;
			
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
	
	//목록을 클릭한 사원만 화면 전환하기 프론트에서 로그인된사원번호 == 컨트롤러에서보내는 사원번호가 일치할때 작동? //해결
	
	const chatuserPrint=(msg)=>{
		//로그인된 사원에서만 작동하도록 분기처리
		if(msg.loginEmpNo == loginEmpNo){
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
				$userprofilebutton.setAttribute("onclick", "empprofile("+chatuser.empNo+")");
							
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
	}
	//유저목록 출력하기 끝



 


	
	//채팅목록 출력하기
	
	//페이징 처리 나중에
	//프로필 눌렀을때 작동하는 script 나중에 구현하기 -> 사원목록에서 프로필눌렀을때 뜨는 창이랑 같은거 사용해도 됨
	
	//개인채팅방은 상대방이름을 출력해야됨
	//그룹채팅일때 몇명인지 표시 -> p태그 만들어서 count? //해결
	//appendChild로 하면 덮어씌우기 안됨 뭔지 찾기 //해결
	//검색창 제대로 안만들어짐 고치셈	//해결
	
	const chatroomPrint=(msg)=>{
		//로그인된 사원에서만 작동하도록 분기처리
		if(msg.loginEmpNo == loginEmpNo){
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
				const $p5 = document.createElement("p");
				
				
				//데이터 대입
				if(chatroom.chatRoomName!=null){
					$p1.innerText=chatroom.chatRoomName;
				}else if(chatroom.chatEmpName != null){
					$p1.innerText=chatroom.chatEmpName;
				}else{
					$p1.innerText = chatroom.chatHistory.empName;
				}
				
				
				
				$p2.innerText=chatroom.chatHistory.chatContent;
				
				$p3.innerText=chatroom.chatHistory.chatCreationDate;
				
				$p4.innerText=chatroom.chatJoinCount;
				
				$p5.innerText = chatroom.chatCount;
				
				$img.setAttribute("src", "${path}/"+chatroom.empProfile); // chatroom 객체의 프로필 이미지 URL 사용
	        	$img.setAttribute("alt", "프로필");
	        	$img.setAttribute("width", "50");
	        	$img.setAttribute("height", "50");
				
				$button.setAttribute("onclick", "profile(event);");
				
				
				//class부여
				$img.classList.add("chatting_chattingroomlist_printarea_profile_img");
				
				$div1.classList.add("chatting_chattingroomlist_printarea_profile");
				
				$div.classList.add("chatting_chattingroomlist_printarea");
				
				
				//채팅방번호 각자 부여
				$div.setAttribute("data-chatroom-no",chatroom.chatRoomNo);
				
				
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
				if(chatroom.chatCount>0){
					$div3.appendChild($p5);					
				}
				
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
			
			//채팅방한테 더블 클릭이벤트 부여
			const chatroomarea = document.querySelectorAll(".chatting_chattingroomlist_printarea");
			chatroomarea.forEach(chatroom=>{
				chatroom.addEventListener("dblclick", chatroomopen);
			});
		}
	};
	//채팅목록 출력하기 끝






	//메세지 출력
	/*const messagePrint=(msg)=>{
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
	}*/



	//채팅방에서 전송버튼 눌렀을때 작동하는 js 
	/*const sendMessage=()=>{
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
	}*/


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
	
	
		
		
		
		
		
		