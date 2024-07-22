

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