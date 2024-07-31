employees.map(m => {
	console.log(`번호: ${m.empNo} 이름: ${m.empName}`);
});

let projectNameV = "";
let proejectSummaryV = "";
let projectStartDateV = "";
let projectEndDateV = "";
let selectEmpList = [];
let projectData = [];

const projectInfo = document.getElementById("projectInfo");
const topbanner = document.getElementById("topbanner");

const firstStep = () => {
	projectNameV = document.getElementById("projectName").value;
	proejectSummaryV = document.getElementById("proejectSummary").value;
	projectStartDateV = document.getElementById("projectStartDate").value;
	projectEndDateV = document.getElementById("projectEndDate").value;

	// projectInfo 내용을 지웁니다.
	projectInfo.innerHTML = '';
	topbanner.innerText = 'Project - Employees';

	const $div = document.createElement("div");
	$div.style.height = "800px";
	$div.style.display = "flex";
	$div.style.flexGrow = "1";

	const employeeList = document.createElement("div");
	const selectEmployeeList = document.createElement("div");

	//h3태그 해서 UI화면 
	const employeeListh3 = document.createElement("h3");
	employeeListh3.innerText = "employeeList";
	employeeListh3.style.textAlign = "center";
	const selectEmployeeListListh3 = document.createElement("h3");
	selectEmployeeListListh3.style.textAlign = "center";
	selectEmployeeListListh3.innerText = "selectEmployeeList";

	// 직원 박스
	employeeList.style.width = "40%";
	employeeList.style.height = "750px";
	employeeList.style.border = "1px solid black";
	employeeList.style.flexGrow = "1";
	employeeList.style.marginRight = "10px"; // 선택사항: div들 사이에 간격 추가

	// 선택된 직원 박스 
	selectEmployeeList.style.width = "40%";
	selectEmployeeList.style.height = "750px";
	selectEmployeeList.style.border = "1px solid black";
	selectEmployeeList.style.flexGrow = "1";

	// 안에 박스 여기에 리스트 목록을 넣어야함
	const divEmpList = document.createElement("div");
	const divEmpSelectList = document.createElement("div");
	divEmpSelectList.style.height = "90%";
	divEmpSelectList.className = "card";
	divEmpSelectList.id = "divEmpSelectList";
	divEmpList.style.height = "90%";
	divEmpList.className = "card";
	divEmpList.id = "divEmpList";
	employees.map(m => {
		//const windowFeatures = "left=33%,top=33%,width=700px,height=700px";
		const empOne = document.createElement("div");
		empOne.style.display = "flex";
		empOne.style.justifyContent = "space-around";
		const empName = document.createElement("p"); //이름
		const level = document.createElement("p");	// 등급
		const dept = document.createElement("p");	// 부서
		empName.style.width = "50px";
		dept.style.width = "90px";
		level.style.width = "50px";

		const no = document.createElement("p");
		no.innerText = `${m.empNo}`;
		no.setAttribute('hidden', true);
		no.className = 'empNo';

		const employeeDetail = document.createElement("button");
		employeeDetail.innerText = "프로젝트 내역";
		employeeDetail.id = "employeeDetail";
		employeeDetail.className = "btn btn-outline-secondary";
		employeeDetail.addEventListener("click", () => {
			window.open(`${contextPath}/employee${m.empNo}/projects`, null, `left=${(window.screen.width - 700) / 2}px,top=${(window.screen.height - 700) / 2}px,width=700px,height=700px`);
		});
		const employeeMove = document.createElement("button");
		employeeMove.innerText = "선택";
		employeeMove.className = "btn btn-outline-Primary";
		employeeMove.id = "employeeMove";
		employeeMove.addEventListener("click", () => {
			divEmpSelectList.appendChild(empOne);
			employeeMove.innerText = "삭제";
			employeeMove.className = "btn btn-outline-Danger";
			employeeMove.removeEventListener("click", moveToSelect);
			employeeMove.addEventListener("click", moveToOriginal);
		});

		const moveToSelect = () => {
			divEmpSelectList.appendChild(empOne);
			employeeMove.innerText = "삭제";
			employeeMove.className = "btn btn-outline-Danger";
			employeeMove.removeEventListener("click", moveToSelect);
			employeeMove.addEventListener("click", moveToOriginal);
		};

		const moveToOriginal = () => {
			divEmpList.appendChild(empOne);
			employeeMove.innerText = "선택";
			employeeMove.className = "btn btn-outline-Primary";
			employeeMove.removeEventListener("click", moveToOriginal);
			employeeMove.addEventListener("click", moveToSelect);
		};;

		empName.innerText = `${m.empName}`;
		if (m.levelCode === 'L1') {//대표
			level.innerText = "대표";
		} else if (m.levelCode === 'L2') { //부장
			level.innerText = "부장";
		} else if (m.levelCode === 'L3') { // 팀장
			level.innerText = "팀장";
		} else { //사원
			level.innerText = "사원";
		}
		if (m.deptCode === 'D3' || m.deptCode === 'D4' || m.deptCode === 'D2') {
			if (m.deptCode === 'D2') { //개발부
				dept.innerText = "개발부";
				empOne.appendChild(empName);
				empOne.appendChild(dept);
				empOne.appendChild(level);
				empOne.appendChild(employeeDetail); // 상세정보
				empOne.appendChild(employeeMove);
				empOne.appendChild(no);
				divEmpList.appendChild(empOne);
			} else if (m.deptCode === 'D3') { //개발 1팀
				dept.innerText = "개발 1팀";
				empOne.appendChild(empName);
				empOne.appendChild(dept);
				empOne.appendChild(level);
				empOne.appendChild(employeeDetail); // 상세정보
				empOne.appendChild(employeeMove);
				empOne.appendChild(no);
				divEmpList.appendChild(empOne);
			} else if (m.deptCode === 'D4') { //개발 2팀
				dept.innerText = "개발 2팀"
				empOne.appendChild(empName);
				empOne.appendChild(dept);
				empOne.appendChild(level);
				empOne.appendChild(employeeDetail); // 상세정보
				empOne.appendChild(employeeMove);
				empOne.appendChild(no);
				divEmpList.appendChild(empOne);
			}
		}

	})
	employeeList.appendChild(employeeListh3);
	selectEmployeeList.appendChild(selectEmployeeListListh3);
	selectEmployeeList.appendChild(divEmpSelectList);
	employeeList.appendChild(divEmpList);

	$div.appendChild(employeeList);
	$div.appendChild(selectEmployeeList);
	projectInfo.appendChild($div);

	//-----------------------변환---------------------------------
	document.getElementById("firstStep").onclick = secondStep;

};
const secondStep = () => {
	const divEmpSelectList = document.getElementById("divEmpSelectList");
	selectEmpList = Array.from(divEmpSelectList.childNodes).map(node => {
		const empNo = node.querySelector('.empNo').innerText;
		const empName = node.querySelector('p:first-child').innerText;
		const dept = node.querySelector('p:nth-child(2)').innerText;
		const level = node.querySelector('p:nth-child(3)').innerText;
		return { empNo, empName, dept, level };
	});
	console.log("프로젝트이름" + projectNameV);
	console.log("프로젝트 내용" + proejectSummaryV);
	console.log("프로젝트 시작날짜" + projectStartDateV);
	console.log("프로젝트 종료 날짜" + projectEndDateV);
	projectInfo.innerHTML = '';
	console.log(selectEmpList); // Debugging
	// Further actions with selectEmpList
	//----------화면 생성부분-------------------------------------
	const $div = document.createElement("div");
	$div.style.height = "800px";
	$div.className = "card";
	const $table = document.createElement("table");
	$table.className = "table table-lg";
	const $tr = document.createElement("tr");
	const $td1 = document.createElement("td"); //제목
	const $td2 = document.createElement("td"); //내용
	const $td3 = document.createElement("td"); // 우선순위
	const $td4 = document.createElement("td"); // 인원 
	$td1.innerText = "제목"
	$td2.innerText = "내용"
	$td3.innerText = "우선순위"
	$td4.innerText = "사원"
	$tr.appendChild($td1);
	$tr.appendChild($td2);
	$tr.appendChild($td3);
	$tr.appendChild($td4);
	$table.appendChild($tr);
	
	
	function addSelectBox() {
		const $trFun = document.createElement("tr");
		const $tdFun1 = document.createElement("td");
		const $tdFun2 = document.createElement("td");
		const $tdFun3 = document.createElement("td");
		const $tdFun4 = document.createElement("td");
		
		
		const $functionName = document.createElement("input");
		$functionName.className="form-control square";
		$functionName.style.width="300px";
		$functionName.id="$functionName"; // id 값 
		$tdFun1.appendChild($functionName); // td1 
		
		const $functionSummary = document.createElement("input");
		$functionSummary.className="form-control square";
		$functionSummary.style.width="300px";
		$functionSummary.id="$functionSummary"; // id 값 
		$tdFun2.appendChild($functionSummary); //td2
		
		
		const $functionLevel = document.createElement("select");
		$functionLevel.id="$functionLevel"; // id값 
		const level1 = document.createElement("option");
		const level2 = document.createElement("option");
		const level3 = document.createElement("option");
		level1.innerText="1순위";
		level2.innerText="2순위";
		level3.innerText="3순위";
		
		level1.value="1";
		level2.value="2";
		level3.value="3";
		
	
		
		
		$functionLevel.appendChild(level1);
		$functionLevel.appendChild(level2);
		$functionLevel.appendChild(level3);
		$tdFun3.appendChild($functionLevel); // td 3		
					
		const $select = document.createElement("select");
		$select.id = "$select";
		selectEmpList.map((emp) => {
			const $option = document.createElement("option");
			$option.value = emp.empNo;
			$option.innerText = emp.empName;
			$select.appendChild($option);
		})
		$tdFun4.appendChild($select);
		$trFun.appendChild($tdFun1);
		$trFun.appendChild($tdFun2);
		$trFun.appendChild($tdFun3);
		$trFun.appendChild($tdFun4);
		
		$table.appendChild($trFun);
	}
	$div.appendChild($table);
	const $funButton = document.createElement("button");
	$funButton.onclick=addSelectBox;
	$funButton.innerText="추가 버튼";
	$div.appendChild($funButton);
	projectInfo.appendChild($div);
	
	document.getElementById("firstStep").onclick = thirdStep;
	
};
const thirdStep = ()=>{
	  const $table = document.querySelector("#projectInfo table");
    const rows = $table.querySelectorAll("tr:not(:first-child)"); // exclude header row
    

    rows.forEach(row => {
        const functionName = row.querySelector('input[id="$functionName"]').value;
        const functionSummary = row.querySelector('input[id="$functionSummary"]').value;
        const functionLevel = row.querySelector('select[id="$functionLevel"]').value;
        const empNo = row.querySelector('select[id="$select"]').value; // empNo
        const empSelect = row.querySelector('select[id="$select"]');
        const empName = empSelect.options[empSelect.selectedIndex].innerText;
        const functionStatus = "ToDo"; //전체 다 하는중일테니까 
        projectData.push({ functionName, functionSummary, functionLevel, empNo, empName ,functionStatus});
    });

    console.log("선택된 사원 리스트:", selectEmpList);
    console.log("Table data:", projectData);
	connect();
}


function connect(){
	fetch(`${contextPath}/teamproject/data`,{
		method : 'POST',
		headers : {
			'Content-Type': 'application/json;charset=UTF-8'
		},
		body : JSON.stringify({
			projectName: projectNameV, 
			projectSummary: proejectSummaryV,
			projectStartDate : projectStartDateV,
			projectEndDate : projectEndDateV,
			allocationList : projectData
			
		})
	})
	.then(res =>res.json())
	.then(data =>{
		location.assign(`${contextPath}/teamproject/main`);
	}).catch(error=>{
		location.assign(`${contextPath}/teamproject/error`);
	})


}
//
/*
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


 */






