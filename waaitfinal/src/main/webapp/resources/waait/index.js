/**
 * 
 */

window.onload = function(){
	fetch(`${path}/edoc/appcount`)
	.then(response => response.json())
	.then(data => {
		console.log(data);
		console.log(data[0]);
		document.getElementById("edoc").innerText=data[0]+'건 / '+data[1]+'건';
	})
}

let eventSource;


function connectSSE(){
	eventSource = new EventSource(`${path}/api/user/notification`, {
		withCredentials: true,
	});
	
	eventSource.onopen = function(event){
		console.log('SSE 연결이 열렸습니다.');
	};
	
	eventSource.onmessage = function(event){
		console.log('새로운 이벤트 :' + event.data);
	};
	
	eventSource.addEventListener("alarm", (event)=>{
		console.log(event);
		console.log(event.data);
			
	});

	eventSource.onerror = function(event) {
	    console.error("SSE 연결 오류:", event);
	    // 연결이 끊어졌을 때 처리하는 로직
	    if (event.eventPhase === EventSource.CLOSED) {
	        console.log("서버와의 연결이 끊어졌습니다. 다시 연결을 시도합니다.");
	        eventSource.close();
	        connectSSE(); // 다시 연결 시도
	    }
	};
}


if(empNo.length > 0) {
	connectSSE();
}


/* console.log(`${empNo}`);
if(empNo.length > 0) {
	console.log('sse');
	const eventSource = new EventSource(`${path}/api/user/notification`, {
		withCredentials: true,
	});
	console.log("EventSource readyState:", eventSource.readyState);

	console.log('sse222')
	eventSource.addEventListener("connect", (event) => {
		console.log("Connected to SSE : ", event)
		console.log(event.data);
		console.log("EventSource readyState", eventSource.readyState);
		const list = document.getElementById("list");
		const li = document.createElement("li");
		li.innerText=event.data;
		list.appendChild(li);
		
	});
	
	eventSource.addEventListener("alarm", (event)=>{
		console.log(event);
		console.log(event.data);
		
	})
	console.log("EventSource readyState", eventSource.readyState);

	
	eventSource.onmessage = (event) => {
	    console.log("Message received: ", event.data);
	};
	eventSource.onerror = (err) => {
		console.error("SSE Error", err);
	};

	
} */


const time = new Date().toISOString();
console.log(time);

const startTime = new Date('2024-07-25T02:22:00.000Z');
const currentTime = new Date('2024-07-25T03:30:00.000Z');

const diffMs = currentTime - startTime;
const diffHrs = Math.floor(diffMs / (1000 * 60 * 60));
const diffMins = Math.floor((diffMs % (1000 * 60 * 60)) / (1000 * 60));

const work = () => {
	console.log('안녕?');
	fetch(`${path}/insert/work`,{
		method : "POST",
		headers: {
			'Content-Type' : 'application/json;charset=UTF-8'
		}
	}).then(response=>response.json())
	.then(data=>{
		location.assign(`${path}/`);
	})
	.catch((error)=>{
		console.log(error);
		location.assign(`${path}/teamproject/error`);
	})
	
}
const leaveWork =()=>{
	fetch(`${path}/insert/leavework`,{
		method : "POST",
		headers: {
			'Content-Type' : 'application/json;charset=UTF-8'
		}
	}).then(response=>response.json())
	.then(data=>{
		location.assign(`${path}/`);
	})
	.catch((error)=>{
		console.log(error);
		location.assign(`${path}/teamproject/error`);
	})
	
}


const noWork =()=>{
	alert("아직 출근을 하지않았습니다");
}