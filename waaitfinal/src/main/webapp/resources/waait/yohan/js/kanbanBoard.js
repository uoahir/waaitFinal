/**
 * 
 */
const todoUrl = `${contextPath}/canban/todoupdate`;
const allocationtodo = (functionSummary,projectNo,functionName) => {
    // 이벤트 타겟 (클릭된 요소)을 가져옵니다.
    console.log(functionName);
    
	 window.confirm("기능을 시작하시겠습니까");
    connect(functionSummary,projectNo,functionName);
     
};
/*const allocationtodo1 = document.getElementsByClassName("allocationtodo1");
allocationtodo1.*/
const allocationinProgress = (functionSummary,projectNo,functionName) =>{
	window.confirm("Request-Git");
	connect1(functionSummary,projectNo,functionName);
		
}
//todo - progress로 변환
function connect(functionSummary,projectNo,functionName){
	fetch(`${contextPath}/canban/todoupdate` ,{
		method : 'POST',
		headers:{
			'Content-Type' :'application/json;charset=UTF-8'
		},
		body: JSON.stringify({
			functionSummary :functionSummary,
			projectNo : projectNo,
			functionName : functionName
		})
	}).then(response => response.json())
	  .then(data=>{
		console.log('Success:',data);
		location.assign(`${contextPath}/teamproject${projectNo}/info`);
	  })
	  .catch((error)=>{
		console.log(error);
		location.assign(`${contextPath}/teamproject/error`);
	  });
} //전송부분
//progress - done으로 변환
function connect1(functionSummary,projectNo,functionName){
	fetch(`${contextPath}/canban/inprogressupdate` ,{
		method : 'POST',
		headers:{
			'Content-Type' :'application/json;charset=UTF-8'
		},
		body: JSON.stringify({
			functionSummary : functionSummary,
			projectNo : projectNo,
			functionName : functionName
		 	
		})
	}).then(response => response.json())
	  .then(data=>{
		console.log('Success:',data);
		location.assign(`${contextPath}/teamproject${projectNo}/info`);
	  })
	  .catch((error)=>{
		console.log(error);
		location.assign(`${contextPath}/teamproject/errsor`);
	  });
}

function modelopen(functionSummary,projectNo,functionName) {
	var modal = document.getElementById("myModal");
	//var modalTitle = document.getElementById("modalTitle");
	const modalTitle = document.getElementById("modalTitle");
	const summary = document.getElementById("functionSummary");
	modalTitle.innerText = functionName;
	summary.innerText = functionSummary;
	const functionapproval = document.getElementById("functionapproval");
	functionapproval.innerText="시작";
	functionapproval.onclick = () => connect(functionSummary,projectNo,functionName);
	
	modal.style.display = "block";
	
}
function modelopen1(functionStartDate,functionSummary,projectNo,functionName) {
	var modal = document.getElementById("myModal");
	//var modalTitle = document.getElementById("modalTitle");
	const modalTitle = document.getElementById("modalTitle");
	const summary = document.getElementById("functionSummary");
	modalTitle.innerText = functionName;
	summary.innerText = functionSummary;
	const functionapproval = document.getElementById("functionapproval");
	functionapproval.innerText="git-requestPush";
	functionapproval.onclick = () => connect1(functionSummary,projectNo,functionName);
	
	modal.style.display = "block";
	
}

function closeModal() {
	var modal = document.getElementById("myModal");
	modal.style.display = "none";
}

// 모달 창 바깥을 클릭하면 창 닫기
window.onclick = function(event) {
	var modal = document.getElementById("myModal");
	if (event.target == modal) {
		modal.style.display = "none";
	}
}
