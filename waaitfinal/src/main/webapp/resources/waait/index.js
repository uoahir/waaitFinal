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