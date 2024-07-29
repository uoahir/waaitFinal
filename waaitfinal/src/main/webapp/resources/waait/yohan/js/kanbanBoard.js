/**
 * 
 */
const todoUrl = `${contextPath}/canban/todoupdate`;
const allocationtodo = (event,projectNo,empNo) => {
    // 이벤트 타겟 (클릭된 요소)을 가져옵니다.
    const todotarget = event.target;
	 window.confirm("기능을 시작하시겠습니까?");
    connect(projectNo,empNo,todotarget.innerText,empName);
    console.log(todotarget); 
};
/*const allocationtodo1 = document.getElementsByClassName("allocationtodo1");
allocationtodo1.*/
const allocationinProgress = (event,projectNo,empNo) =>{
	const allocationProgress = event.target;
	window.confirm("Request-Git");
	connect1(projectNo,empNo,allocationProgress.innerText,empName);
		
}
//todo - progress로 변환
function connect(projectNo,empNo,allocationFun,empName){
	fetch(`${contextPath}/canban/todoupdate` ,{
		method : 'POST',
		headers:{
			'Content-Type' :'application/json;charset=UTF-8'
		},
		body: JSON.stringify({
			projectNo : projectNo,
			empName : empName,
			allocationFun : allocationFun ,
		 	empNo : empNo
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
function connect1(projectNo,empNo,allocationFun,empName){
	fetch(`${contextPath}/canban/inprogressupdate` ,{
		method : 'POST',
		headers:{
			'Content-Type' :'application/json;charset=UTF-8'
		},
		body: JSON.stringify({
			projectNo : projectNo,
			empName : empName,
			allocationFun : allocationFun ,
		 	empNo : empNo
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
}

