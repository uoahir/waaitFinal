/**
 * 
 */
const addTeamInput = () => {
	const inputCount = document.querySelectorAll("input[name='teamInput']").length;
	if(inputCount > 4) {
		alert("입력란은 5개까지만 생성 가능합니다.");
	} else {
		//const $button = document.createElement("button");
		const $input = document.createElement("input");
		const $div = document.createElement("div");
		
		$input.setAttribute("type", "text");
		$input.setAttribute("name", "teamInput");
		$input.setAttribute("class", "form-control");
		$input.setAttribute("placeholder", "ex)개발1 o 개발1팀 x 뒤에 팀은 빼고입력하세요");
		
		/*$button.setAttribute("class", "btn btn-outline-success");
		$button.setAttribute("onclick", "addTeamInput()");
		$button.setAttribute("style", "margin-left:4px;");
		$button.innerHTML = "+";*/
		
		const div = document.querySelector(".teamInputContainer");
		
		$div.appendChild($input);
		//$div.appendChild($button);
		
		div.appendChild($div);
	}
}

const deleteTeamInput = () => {
	console.log("오긴한겨?");
	const inputCount = document.querySelectorAll("input[name='teamInput']").length;
	
	if(inputCount > 0) {
		const teamInputContainer = document.querySelector(".teamInputContainer");
		teamInputContainer.lastElementChild.remove();
	}
}

const enrollDeptWithTeam = () => {
	const deptName = document.getElementById("deptNameInput").value;
	let teamNameStr = "";
	let reqNullBoolean = true;
	let reqFormBoolean = true;
	const teamInputExist = document.querySelector("input[name='teamInput']");
	let teamInputCount = 0;
	if(teamInputExist != null) {
		document.querySelectorAll("input[name='teamInput']").forEach(e => {
			if(e.value.length == 0) {
				e.focus();
				reqNullBoolean = false;
				return;
			} else if(e.value.charAt(e.value.length - 1) == "팀") {
				reqFormBoolean = false;
				return;
			} else {
				teamInputCount++;
			}
		});
	}
	
	if(reqNullBoolean == false || deptName.length == 0) {
		alert("부서 혹은 팁입력칸은 빈칸일 수 없습니다.");
		return;
	} else if(reqFormBoolean == false || deptName.charAt(deptName.length - 1) == '부') {
		alert("마지막 글자는 '팀' 이나 '부'로 끝날 수 없습니다.");
		return;
	}
	
	let roopCount = 1;
	document.querySelectorAll("input[name='teamInput']").forEach(e => {
		if(roopCount == teamInputCount) {
			teamNameStr += e.value;
		} else {
			teamNameStr += e.value + ",";
		}
		roopCount++;
	});
	
	fetch(path + "/manage/enrolldepartment.do", {
		method : "POST",
		headers : {
			"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
		},
		body : "deptName=" + deptName + "&teamName=" + teamNameStr
	})
	.then(response => response.text())
	.then(data => {
		if(data > 0) {
			alert("부서 등록이 완료되었습니다.");
		} else {
			alert("부서 등록에 실패했습니다.");
		}
	})
}

const addInheritTeamInput = () => {
	const inputCount = document.querySelectorAll("input[name='inheritTeamInput']").length;
	if(inputCount > 4) {
		alert("입력란은 5개까지만 생성 가능합니다.");
	} else {
		const $input = document.createElement("input");
		const $div = document.createElement("div");
		
		$input.setAttribute("type", "text");
		$input.setAttribute("name", "inheritTeamInput");
		$input.setAttribute("class", "form-control");
		$input.setAttribute("placeholder", "ex)개발1 o 개발1팀 x 뒤에 팀은 빼고입력하세요");
		
		
		const div = document.getElementById("inheritTeamInputContainer");
		$div.appendChild($input);
		div.appendChild($div);
	}
}

const delInheritTeamInput = () => {
	const inputCount = document.querySelectorAll("input[name='inheritTeamInput']").length;
	
	if(inputCount > 0) {
		const teamInputContainer = document.getElementById("inheritTeamInputContainer");
		teamInputContainer.lastElementChild.remove();
	}
}

const enrollTeamByDept = () => {
	
}
