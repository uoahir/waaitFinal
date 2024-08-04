/**
 * 
 */
//프로젝트 반려

const functionReject = (proejctNo, projectName) => {

	finctionDontComplete(proejctNo, projectName);

}
//프로젝트 승인
const functionApprove = (proejctNo, projectName) => {

	functionComplete(proejctNo, projectName);

}
//승인 로직

//------------------------------모델 창-------------------
function modelopen(title, summay, empName) {
	var modal = document.getElementById("myModal");
	var modalTitle = document.getElementById("modalTitle");
	modalTitle.textContent = "기능 이름 :" + title;
	document.getElementById("functionSummary").innerText = " 기능 내용 : " + summay;
	document.getElementById("empName").innerText = "담당 사원 :" + empName;
	
	document.getElementById("startDate").innerText='';
	document.getElementById("endDate").innerText='';
	const functionapproval = document.getElementById("functionapproval");
	const functionreject = document.getElementById("functionreject");
	functionapproval.style.display ="none";
	functionreject.style.display ="none";
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
// ----------------------------------------------------------

//-----------------------in progress--------------------------
function modelopen1(title, summay, empName, startDate) {
	var modal = document.getElementById("myModal");
	var modalTitle = document.getElementById("modalTitle");
	modalTitle.textContent = "기능 이름 :" + title;
	document.getElementById("functionSummary").innerText = " 기능 내용 : " + summay;
	document.getElementById("empName").innerText = "담당 사원 :" + empName;
	modal.style.display = "block";
	const functionapproval = document.getElementById("functionapproval");
	const functionreject = document.getElementById("functionreject");
	functionapproval.style.display ="none";
	functionreject.style.display ="none";
	document.getElementById("startDate").innerText='';
	document.getElementById("endDate").innerText='';
	document.getElementById("startDate").innerText= "시작 날짜 :" + startDate;

	
}

//------------------------Request-check--------------------------------

function modelopen2(title, summay, empName, startDate,projectNo) {
	var modal = document.getElementById("myModal");
	var modalTitle = document.getElementById("modalTitle");
	modalTitle.textContent = "기능 이름 :" + title;
	document.getElementById("functionSummary").innerText = " 기능 내용 : " + summay;
	document.getElementById("empName").innerText = "담당 사원 :" + empName;
	modal.style.display = "block"; 
	const functionapproval = document.getElementById("functionapproval");
	const functionreject = document.getElementById("functionreject");
	functionapproval.style.display ="block";
	functionreject.style.display ="block";
	document.getElementById("startDate").innerText= "시작 날짜 :" + startDate;	
	console.log(projectNo);
	document.getElementById("endDate").innerText='';
	functionapproval.onclick = () => funapproval(projectNo, title);
	functionreject.onclick =()=>  functionDontComplete(projectNo, title);
}

function modelopen3(title, summay, empName, startDate,endDate) {
	var modal = document.getElementById("myModal");
	var modalTitle = document.getElementById("modalTitle");
	modalTitle.textContent = "기능 이름 :" + title;
	document.getElementById("functionSummary").innerText = " 기능 내용 : " + summay;
	document.getElementById("empName").innerText = "담당 사원 :" + empName;
	modal.style.display = "block"; 
	const functionapproval = document.getElementById("functionapproval");
	const functionreject = document.getElementById("functionreject");
	functionapproval.style.display ="none";
	functionreject.style.display ="none";
	document.getElementById("startDate").innerText= "시작 날짜 :" + startDate;	
	document.getElementById("endDate").innerText="기능 완료 날짜 : " +endDate;
	

}

const funapproval = (projectNo,title)=>{
	console.log(projectNo);
	console.log(title);
	functionComplete(projectNo,title);	
}


function functionComplete(projectNo, projectName) {
	fetch(`${contextPath}/function/approve`, {
		method: "POST",
		headers: {
			'Content-Type': 'application/json;charset=UTF-8'
		},
		body: JSON.stringify({
			projectNo: projectNo,
			functionName: projectName

		})
	}).then(response => response.json())
		.then(data => {
			location.assign(`${contextPath}/project${projectNo}/update`);
		})
		.catch((error) => {
			console.log(error);
			location.assign(`${contextPath}/teamproject/error`);
		})
}
// 반려 로직
function functionDontComplete(projectNo, title) {
	fetch(`${contextPath}/function/Noapprove`, {
		method: "POST",
		headers: {
			'Content-Type': 'application/json;charset=UTF-8'
		},
		body: JSON.stringify({
			projectNo: projectNo,
			functionName: title
		})
	}).then(response => response.json())
		.then(data => {
			location.assign(`${contextPath}/project${projectNo}/update`);
		})
		.catch((error) => {
			console.log(error);
			location.assign(`${contextPath}/teamproject/error`);
		})
}

