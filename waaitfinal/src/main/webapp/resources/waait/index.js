/**
 * 
 */
const time = new Date().toISOString();
console.log(time);

const startTime = new Date('2024-07-25T02:22:00.000Z');
const currentTime = new Date('2024-07-25T03:30:00.000Z');

const diffMs = currentTime - startTime;
const diffHrs = Math.floor(diffMs / (1000 * 60 * 60));
const diffMins = Math.floor((diffMs % (1000 * 60 * 60)) / (1000 * 60));


const work =()=>{
	fetch(`${contextPath}/insert/work`,{
		method : "POST",
		headers: {
			'Content-Type' : 'application/json;charset=UTF-8'
		}
	}).then(response=>response.json())
	.then(data=>{
		location.assign(`${contextPath}/`);
	})
	.catch((error)=>{
		console.log(error);
		location.assign(`${contextPath}/teamproject/error`);
	})
	
}
const leaveWork =()=>{
	fetch(`${contextPath}/insert/leavework`,{
		method : "POST",
		headers: {
			'Content-Type' : 'application/json;charset=UTF-8'
		}
	}).then(response=>response.json())
	.then(data=>{
		location.assign(`${contextPath}/`);
	})
	.catch((error)=>{
		console.log(error);
		location.assign(`${contextPath}/teamproject/error`);
	})
	
}


const noWork =()=>{
	alert("아직 출근을 하지않았습니다");
}