/**
 * 
 */
//보낼데이터 설정 부분 ---------------------------------------------------
let projectName = "";
let proejctSummary = "";
let projectStartDate = "";
let projectEndDate = "";
console.log(employees[1].empName);

//const employeesList = [employees];
/*const employeeList = [];
employeeList.push(employees.map(m=>m)); 
console.log(employeeList);
*/// -----------------------------------------------------------------
const projectInfo = document.getElementById("projectInfo");
const functionBoxList = [];
const projectEmployee = [];
const functionBoxListTest = [];
const basicFunction1 = () => {
	const $div = document.createElement('div');
	$div.style.height = "811px";
	$div.id = "$div";
	projectInfo.appendChild($div);

	// "기능 추가하기" 버튼을 $div에 추가
	const $button = document.createElement("button");
	$button.id = "addBtn";
	$button.innerText = "기능 추가하기";
	$button.onclick = () => addFunctionBox($div);
	$div.appendChild($button);
}; //기본적인 div 생성해서 appendChild에 넣어줌

const removediv = () => {
	projectInfo.firstChild.remove();
}; //projectInfo 내부 div를 삭제함 

const persentBar = (gauge) => { //게이지 바 부분 함수 
	document.getElementById("persentBar").style.width = `${gauge}%`;    //bar에 대한 설정
	document.getElementById("persentBar").setAttribute('aria-valuenow', `${gauge}`);
};//게이지바에 있는 내용 삭제함 

const addFunctionBox = (div) => {
	const functionBox = document.createElement("input");
	functionBox.className = "round ";
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
		removediv();
		basicFunction1(); // secondStep을 위한 값 설정
		document.getElementById("topbanner").innerText = 'Create Project - Function';
	}
} //첫단계 저장함

const secondStep = () => {
	/*removediv();
	removediv();*/

	persentBar(75);
	document.getElementById("firstStep").onclick = thirdStep;
	document.getElementById("addBtn").setAttribute("hidden", "on");

	functionBoxList.forEach((functionBox, index) => {
		console.log(`FunctionBox ${index + 1}: ${functionBox.value}`) //리스트로 받아옴
	})
	functionBoxList
	document.getElementById("topbanner").innerText = 'Create Project - Employee';

	// null 또는 빈 문자열이 아닌 요소만을 필터링하여 functionBoxListTest 배열에 추가
	functionBoxList.filter(b => b.value !== null && b.value !== '').forEach(b => functionBoxListTest.push(projectFunction = {
			
				functionName : b.value
			}));
	// 결과 확인
	console.log("아아아아아아아" + functionBoxListTest);
	functionBoxList.forEach(box => box.parentNode.removeChild(box));
	//const divEmployeeInfo = document.createElement("div");

	employees.map((employee) => {
		const empCheckbox = document.createElement("input");
		empCheckbox.setAttribute("type", "checkbox");
		empCheckbox.value = `${employee.empNo}`;
		empCheckbox.className = "empCheckBox";

		const divEmployeeInfo = document.createElement("div");
		divEmployeeInfo.className = "d-flex";
		divEmployeeInfo.style.alignItems = "center";
		let toDate = new Date();
		let year = toDate.getFullYear();
		//console.log((employee.empStartDate+"").slice(-4));.
		//console.log(year-(employee.empStartDate+"").slice(-4));
		let devLevel = "";
		if (year - (employee.empStartDate + "").slice(-4) < 4) {
			devLevel = '초급'
			console.log(devLevel);

		} else if (year - (employee.empStartDate + "").slice(-4) < '6') {
			devLevel = '중급'
			console.log(devLevel);
		} else if (year - (employee.empStartDate + "").slice(-4) < '10') {
			devLevel = '고급'
			console.log(devLevel);
		} else {
			devLevel = 'Tech Lead' //리드 개발자
			console.log(devLevel);
		}



		const pEmpName = document.createElement("span");
		pEmpName.className = "ml-1";
		/*pEmpName.style.margin="auto";*/
		pEmpName.innerText = employee.empName; 		// 이름 

		const pEmplevelCode = document.createElement("span");
		pEmplevelCode.innerText = employee.levelCode; //직급

		const pEmpDeptCode = document.createElement("span");
		pEmpDeptCode.innerText = employee.deptCode; //부서명

		const empDevLevel = document.createElement("span");
		empDevLevel.innerText = devLevel; // 년차
		divEmployeeInfo.appendChild(empCheckbox);
		divEmployeeInfo.appendChild(pEmpName); // 여기서 넣어야함
		divEmployeeInfo.appendChild(pEmplevelCode); // 여기서 넣어야함
		divEmployeeInfo.appendChild(pEmpDeptCode); // 여기서 넣어야함
		divEmployeeInfo.appendChild(empDevLevel); // 여기서 넣어야함
		//-----------------------------------------------------------------------
		$div.appendChild(divEmployeeInfo);
		console.log(employee);
	})


	// 업데이트된 functionBoxList 배열

	//projectInfo.appendChild(divEmployeeInfo);
	removediv();
}
//------------------------변수 선언-----------------------------------
const allocationList = [];
function Allocation(empName, empNo, allocationfun) {
	this.empName = empName,
		this.empNo = empNo,
		this.allocationfun = allocationfun;
}
//------------------------------------------------------------------
const thirdStep = () => { //할당해주는 파트







	// 로직 처리
	projectEmployee.length = 0;
	document.querySelectorAll('.empCheckBox').forEach(check => {
		if (check.checked) {
			employees.forEach((e) => {
				if (check.value == e.empNo) {
					projectEmployee.push(e);
				}
			})
		}
	});


	console.log('Selected Employees:', projectEmployee); //내가 선택한 employee
	persentBar(100);
	document.getElementById("firstStep").onclick = finalStep;
	document.getElementById("firstStep").innerText = "프로젝트생성";
	document.getElementById("topbanner").innerText = 'Create Project - Allocate';
	console.log(projectEmployee);
	projectInfo.replaceChildren(); //안에 있는 값삭제 
	//-----------------div 만들기-----------------
	const $div = document.createElement('div');
	$div.style.height = "811px";
	$div.id = "$div";
	projectInfo.appendChild($div);
	$div.style.display = "flex";
	$div.style.justifyItems = "center";
	const dev1h4 = document.createElement("h2");
	const dev2h4 = document.createElement("h2");
	const dev3h4 = document.createElement("h2");
	const dev4h4 = document.createElement("h2");
	//------------------------------------------
	dev1h4.style.textAlign = "center";
	dev2h4.style.textAlign = "center";
	dev3h4.style.textAlign = "center";
	dev4h4.style.textAlign = "center";

	dev1h4.innerHTML = "초급";
	dev2h4.innerHTML = "중급";
	dev3h4.innerHTML = "고급";
	dev4h4.innerHTML = "리드 개발자";
	//----------------------------------------------
	const dev1EmpName = document.createElement("div");
	dev1EmpName.style.display = "flex";
	dev1EmpName.style.height = "100px";
	const dev2EmpName = document.createElement("div");
	dev2EmpName.style.display = "flex";
	dev2EmpName.style.height = "100px";
	const dev3EmpName = document.createElement("div");
	dev3EmpName.style.display = "flex";
	dev3EmpName.style.height = "100px";
	const dev4EmpName = document.createElement("div");
	dev4EmpName.style.display = "flex";
	dev4EmpName.style.height = "100px";
	//---------------------------------------------이름 정렬할 곳

	const dev4Div = document.createElement("div"); //lead개발자
	dev4Div.appendChild(dev4h4);
	dev4Div.id = "dev4";
	const dev3Div = document.createElement("div"); //고급
	dev3Div.appendChild(dev3h4);
	dev3Div.id = "dev3";
	const dev2Div = document.createElement("div"); //중급
	dev2Div.appendChild(dev2h4);
	dev2Div.id = "dev2";
	const dev1Div = document.createElement("div"); //초급

	dev1Div.appendChild(dev1h4);
	dev1Div.id = "dev1";
	//------------------div 넣기---------------
	dev1Div.appendChild(dev1EmpName);
	dev2Div.appendChild(dev2EmpName);
	dev3Div.appendChild(dev3EmpName);
	dev4Div.appendChild(dev4EmpName);
	//-----------------------------------------



	const $divEmp = document.createElement("div");
	/*$divEmp.style.display="flex";*/
	//-----------------생성부분------------------------
	const emph1 = document.createElement("h1");
	const funh1 = document.createElement("h1");
	funh1.style.textAlign = "center";

	//-----------------------------------------------
	emph1.innerText = "Employee";
	emph1.style.textAlign = "center";
	$divEmp.style.border = "3px solid black";
	$divEmp.style.width = "45%";
	$divEmp.style.height = "90%";


	$divEmp.appendChild(emph1);

	$divEmp.appendChild(dev1Div);
	$divEmp.appendChild(dev2Div);
	$divEmp.appendChild(dev3Div);
	$divEmp.appendChild(dev4Div);



	//---------------------------전체 FUN DIV------------------------------
	funh1.innerText = "Function";
	const $divFun = document.createElement("div");
	$divFun.style.border = "3px solid black";
	$divFun.style.width = "45%";
	$divFun.style.height = "90%";
	$divFun.id = "$divFun";
	$divFun.appendChild(funh1);
	//---------------------------전체 FUN DIV------------------------------
	const divInFun1 = document.createElement("div");
	divInFun1.style.width = "100%";
	divInFun1.style.height = "80%";
	divInFun1.style.backgroundColor = "aqua";
	console.log("내껀 왜안되냐고" + functionBoxList);
	let i = 0;
	functionBoxList.forEach((functionBox) => {
		if (functionBox.value != '' && functionBox.value != null) {
			const divinfun = document.createElement("div");
			divinfun.style.display = "flex";

			i++;
			//------------------select-----------------
			const $select = document.createElement("select");
			$select.className = "function-select";
			$select.dataset.function = functionBox.value;
			projectEmployee.forEach((e) => {
				const $option = document.createElement("option");
				$option.className = "form-select";
				$option.value = e.empNo;
				$option.innerText = e.empName;
				$select.appendChild($option);
			});
			//-----------------------------------------------
			const p = document.createElement("p");
			p.innerText = i + ". " + functionBox.value;
			divinfun.appendChild(p);
			divinfun.appendChild($select);
			divInFun1.appendChild(divinfun);
		}
	});
	let j = 0;
	projectEmployee.forEach((e) => {
		const $p = document.createElement("p");
		$p.style.textAlign = "center";
		$p.style.fontSize = "20px";
		$p.style.width = "75px";
		$p.style.height = "40px";
		$p.addEventListener("click", () => {
			window.open(`${contextPath}/empProject/${e.empNo}`);

		})
		/*$p.style.height = "25px";*/
		//p.innerText = j+". "+e.empName;
		//$divEmp.appendChild(p);

		let toDate = new Date();
		let year = toDate.getFullYear();
		//console.log((employee.empStartDate+"").slice(-4));.
		//console.log(year-(employee.empStartDate+"").slice(-4));

		if (year - (e.empStartDate + "").slice(-4) < 4) {
			$p.innerText = `${e.empName}`;
			dev1EmpName.appendChild($p);
		} else if (year - (e.empStartDate + "").slice(-4) < '6') {
			$p.innerText = `${e.empName}`;
			dev2EmpName.appendChild($p);
		} else if (year - (e.empStartDate + "").slice(-4) < '10') {
			$p.innerText = `${e.empName}`;
			dev3EmpName.appendChild($p);
		} else {
			$p.innerText = `${e.empName}`;
			dev4EmpName.appendChild($p);
		}

	});
	console.log(functionBoxListTest);
	//---------------기본 확인 값 출력------------------	
	const butDiv = document.createElement("div");
	butDiv.className = "d-flex mt-3";

	const $AllocationButton = document.createElement("button");
	$AllocationButton.innerText = "Allocation";
	$AllocationButton.className = "btn btn-Success";
	$AllocationButton.style.margin = "auto";
	$AllocationButton.onclick = Allocation1;

	const $UpdateButton = document.createElement("button");
	$UpdateButton.innerText = "Update";
	$UpdateButton.className = "btn btn-Danger";
	$UpdateButton.style.margin = "auto";
	$UpdateButton.onclick = UpdateButton;

	//------------------------버튼 만들기----------------------------
	butDiv.appendChild($AllocationButton);
	butDiv.appendChild($UpdateButton);
	$divFun.appendChild(divInFun1);//값 넣음
	$divFun.appendChild(butDiv);

	//projectEmployee list
	$div.appendChild($divEmp);
	$div.appendChild($divFun);
	function Allocation1() {
		allocationList.length = 0;
		document.querySelectorAll('.function-select').forEach(select => {
			const empNo = select.value;
			const allocationFun = select.dataset.function;
			const empName = select.options[select.selectedIndex].text;
			/*const allocation = new Allocation(empName, empNo, allocationFun);*/
			allocationList.push(Allocation = {
				empNo: empNo,
				allocationFun: allocationFun,
				empName: empName
			});
		});
		console.log("데이터 값 확인", allocationList);
	}//함수 정의 
	function UpdateButton() {

		allocationList.length = 0;
		console.log("데이터 값 확인", allocationList);
	}

}
function formatDate(dateString) {
	const date = new Date(dateString);
	const year = date.getFullYear();
	const month = ('0' + (date.getMonth() + 1)).slice(-2);
	const day = ('0' + date.getDate()).slice(-2);
	return `${year}-${month}-${day}`;
}

function connect() {
	console.log(allocationList);
	const formattedProjectStartDate = formatDate(projectStartDate);
	const formattedProjectEndDate = formatDate(projectEndDate);

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
			projectFunctionList: functionBoxListTest,
			projectEmployee: projectEmployee.map(emp => ({
				empNo: emp.empNo,
				empId: emp.empId,
				empPwd: emp.empPwd,
				deptCode: emp.deptCode,
				department: emp.department,
				levelCode: emp.levelCode,
				jobLevel: emp.jobLevel,
				empName: emp.empName,
				empEndDate: emp.empEndDate,
				leaveYN: emp.leaveYN,
				empEmail: emp.empEmail,
				empProfile: emp.empProfile,
				empGender: emp.empGender,
				empBirth: emp.empBirth,
				empPhone: emp.empPhone,
				empAddress: emp.empAddress,
				empSignfile: emp.empSignfile,
				authorities: emp.authorities
			})),
			allocationList: allocationList

		})
	})
		.then(response => response.json())
		.then(data => {
			console.log('Success:', data);
			location.assign(`${contextPath}/teamproject/main`);
		})
		.catch((error) => {
			console.error('Error:', error);
			location.assign(`${contextPath}/teamproject/error`);
		});
}
// 81Line ajax통신

const finalStep = () => {
	alert("Project Create Success");
	//location.assign(`${contextPath}/teamproject/main`)
	connect();
	document.getElementById("firstStep").onclick = thirdStep;
}
