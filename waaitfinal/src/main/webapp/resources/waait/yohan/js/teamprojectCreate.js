/**
 * 
 */
//보낼데이터 설정 부분 ---------------------------------------------------
let projectName = "";
let proejctSummary = "";
let projectStartDate = "";
let projectEndDate = "";
console.log(employees);
//const employeesList = [employees];
/*const employeeList = [];
employeeList.push(employees.map(m=>m)); 
console.log(employeeList);
*/// -----------------------------------------------------------------
const projectInfo = document.getElementById("projectInfo");
const functionBoxList = [];

const basicFunction1 = () => {
	const $div = document.createElement('div');
	$div.style.height = "650px";
	$div.id = "$div";
	projectInfo.appendChild($div);
}; //기본적인 div 생성해서 appendChild에 넣어줌
const removeidv = () => {
	projectInfo.firstChild.remove();
}; //projectInfo 내부 div를 삭제함 
const persentBar = (gauge) => { //게이지 바 부분 함수 
	document.getElementById("persentBar").style.width = `${gauge}%`;    //bar에 대한 설정
	document.getElementById("persentBar").setAttribute('aria-valuenow', `${gauge}`);
};//게이지바에 있는 내용 삭제함 

const addFunctionBox = (div) => {
	const functionBox = document.createElement("input");
	functionBox.name = "functionBox";
	functionBoxList.push(functionBox);
	div.appendChild(functionBox);
}
const firstStep = () => {  //1 -> 2 
	console.log("첫단계");

	projectName = document.getElementById("projectName").value;
	proejctSummary = document.getElementById("proejctSummary").value;
	projectStartDate = document.getElementById("projectStartDate").value;
	projectEndDate = document.getElementById("projectEndDate").value;
	//프로젝트에 대한 정보 
	console.log(projectName);
	console.log(proejctSummary);
	console.log(projectStartDate);
	console.log(projectEndDate);


	if (projectName === '' || proejctSummary == '') {
		document.getElementById("projectName").style.borderColor = 'red';
		document.getElementById("proejctSummary").style.borderColor = 'red';
		//확인했음
	} else {
		persentBar(50);
		document.getElementById("firstStep").onclick = secondStep; //버튼 onclick속성변경
		document.getElementById("projectInfo").removeChild(document.getElementById('proejctSummary'));
		document.getElementById("projectInfo").removeChild(document.getElementById('projectName'));
		document.getElementById("projectInfo").removeChild(document.getElementById("projectStartDate"));
		document.getElementById("projectInfo").removeChild(document.getElementById("projectEndDate"));
		const $button = document.createElement("button");
		$button.innerText = "기능 추가하기";

		//$button.onclick = addFunctionBox;
		removeidv();
		$button.onclick = () => addFunctionBox($div);
		projectInfo.appendChild($button);
		basicFunction1(); // secondStep을 위한 값 설정


		document.getElementById("topbanner").innerText = 'Create Project - Function';
	}

} //첫단계 저장함

const secondStep = () => {
	removeidv();
	removeidv();
	
	persentBar(75);
	document.getElementById("firstStep").onclick = thirdStep;


	functionBoxList.forEach((functionBox, index) => {
		console.log(`FunctionBox ${index + 1}: ${functionBox.value}`) //리스트로 받아옴
	})
	document.getElementById("topbanner").innerText = 'Create Project - Employee';

	functionBoxList.forEach(box => box.parentNode.removeChild(box));
}

const thirdStep = () => {
	persentBar(100)
	document.getElementById("firstStep").onclick = finalStep;
	document.getElementById("firstStep").innerText = "프로젝트생성";

}

function connect() {
	fetch(`${contextPath}/teamproject/data/check`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json;charset=UTF-8'
		},
		body: JSON.stringify({
			projectName: projectName,
			projectSummary: proejctSummary,
			projectStartDate: projectStartDate,
			projectEndDate: projectEndDate,
			functionBoxList: functionBoxList.map(box => box.value)
		})
	})
		.then(response => response.json())
		.then(data => {
			console.log('Success:', data);
			location.assign(`${contextPath}/teamproject/main`);
		})
		.catch((error) => {
			console.error('Error:', error);
		});
}
// 81Line ajax통신

const finalStep = () => {
	alert("dd");
	//location.assign(`${contextPath}/teamproject/main`)
	connect();
	document.getElementById("firstStep").onclick = thirdStep;


}	
