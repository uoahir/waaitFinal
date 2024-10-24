/**
 * 
 */
document.getElementById("deptSelect").addEventListener("change", e => {
	document.getElementById("teamInputExplain").hidden = false;
	document.querySelector("input[name='teamAddInput']").hidden = false;
	document.getElementById("btn-container").hidden = false;
})

const addTeamInput = () => {
	const teamNameInput = document.querySelectorAll("input[name='teamAddInput']");
	if(teamNameInput.size == 5) {
		alert("최대 입력칸은 5개까지만 가능합니다.");
		return;
	} else {
		$input = document.createElement("input");
		
		$input.setAttribute("type", "text");
		$input.setAttribute("class", "form-control");
		$input.setAttribute("name", "teamAddInput");
		$input.setAttribute("placeholder", "팀을 빼고 입력하세요 ex) 개발1 o, 개발1팀 x");
		
		document.getElementById("teaminput-container").appendChild($input);
	}
}

const deleteTeamInput = () => {
	const teamNameInput = document.querySelectorAll("input[name='teamAddInput']");

	if(teamNameInput.length > 0) {
		document.getElementById("teaminput-container").lastElementChild.remove();
	}
}

const enrollTeamWithDeptCode = () => {
	const deptCode = document.getElementById("deptSelect").value;
	const teamNameInput = document.querySelectorAll("input[name='teamAddInput']");
	
	if(teamNameInput.length == 0) {
		alert("등록할 팀이 없습니다.");
		return;
	}
	
	//let teamNameCount = 0;
	let validationBool = true;
	let teamNameStr = "";
	let count = 1;
	teamNameInput.forEach(e => {
		if(e.value.length == 0) {
			alert("입력칸을 입력해 주세요.");
			validationBool = false;
			return;
		}
		
		if(count == teamNameInput.length) {
			teamNameStr += e.value;
		} else {
			teamNameStr += e.value + ",";
		}
		count++;
	});
	
	if(validationBool == false) return;
	
	else if(deptCode == 0) {
		alert("부서를 선택해주세요.");
		return;
	}
	
	console.log("teamNameStr : " + teamNameStr);
	let param = {
		parentDeptCode : deptCode,
		teamNameStr : teamNameStr
	}
	
	fetch(path + "/manage/enrollteam.do", {
		method : "POST",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(param)
	})
	.then(response => response.text())
	.then(data => {
		if(data > 0) {
			alert("팀이 성공적으로 등록되었습니다.");
			document.querySelectorAll("input[name='teamAddInput']").forEach(e => {
				e.value = "";
			});
			
			document.getElementById("teaminput-container").hidden = true;
			document.getElementById("btn-container").hidden = true;
			document.getElementById("teamInputExplain").hidden = true;
		}
	})
}

const showModifyInput = (e) => {
	const modifyInput = e.target.parentElement.nextElementSibling.firstElementChild;
	const modifyAppBtn = e.target.parentElement.nextElementSibling.lastElementChild.previousElementSibling;
	const cancelBtn = e.target.parentElement.nextElementSibling.lastElementChild;
	modifyInput.hidden = false;
	cancelBtn.hidden = false;
	modifyAppBtn.hidden = false;
}

const cancelModify = (e) => {
	const appBtn = e.target.previousElementSibling
	const cancelBtn = e.target;
	const modifyInput = e.target.previousElementSibling.previousElementSibling;
	
	appBtn.hidden = true;
	cancelBtn.hidden = true;
	modifyInput.hidden = true;
}

const modifyApply = (e) => {
	const id = e.target.parentElement.parentElement.id;
	const modifyTeamName = e.target.previousElementSibling.value;
	
	console.log("id : " + id);
	console.log("modifyName : " + modifyTeamName);
	
	if(modifyTeamName.length == 0) {
		alert("작성란을 입력해주세요");
		return;
	} else if( modifyTeamName.charAt(modifyTeamName.length - 1) == '팀') {
		alert("팀 명의 끝글자는 팀으로 끝날 수 없습니다.");
		return;
	}
	
	fetch(path + "manage/checkduplicateteamname.do", {
		method : "POST",
		headers : {
			"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
		},
		body : "modifyName=" + modifyTeamName
	})
	.then(response => response.text())
	.then(data => {
		if(data == 0) {
			fetch(path + "/manage/modifyteamname.do", {
					method : "POST",
					headers : {
						"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
					},
					body : "teamCode=" + id + "&modifyName=" + modifyTeamName
				})
				.then(response => response.text())
				.then(html => {
					console.log(html);
					document.getElementById("teamModifyTable").innerHTML = html;
					
				})
		} else {
			alert("팀명은 중복될 수 없습니다.");
		}
	})
}