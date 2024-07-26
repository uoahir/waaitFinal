/**
 * 
 */
//프로젝트 반려

const functionReject=(proejctNo,projectName)=>{
	
	finctionDontComplete(proejctNo,projectName);
	
}
//프로젝트 승인
const functionApprove = (proejctNo,projectName) =>{
	
	functionComplete(proejctNo,projectName);
	
}
//승인 로직
function functionComplete(projectNo,projectName){
	fetch(`${contextPath}/function/approve`,{
		method : "POST",
		headers:{
			'Content-Type' :'application/json;charset=UTF-8'
		},
		body: JSON.stringify({
			projectNo:projectNo,
			allocationFun : projectName
		
		})
	}).then(response => response.json())
	.then(data=>{
		location.assign(`${contextPath}/project${projectNo}/update`);
	})
	.catch((error)=>{
		console.log(error);
		location.assign(`${contextPath}/teamproject/error`);
	})
}
// 반려 로직
function finctionDontComplete(projectNo,projectName){
	fetch(`${contextPath}/function/approve`,{
		method : "POST",
		headers: {
			'Content-Type' : 'application/json;charset=UTF-8'
		},
		body:JSON.stringify({
			projectNo : projectNo,
			allocationFun : projectName
		})
	}).then(response=>response.json())
	.then(data=>{
		location.assign(`${contextPath}/project${projectNo}/update`);
	})
	.catch((error)=>{
		console.log(error);
		location.assign(`${contextPath}/teamproject/error`);
	})
}


