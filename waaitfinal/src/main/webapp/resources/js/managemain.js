/**
 * managemain.jsp의 javascript
 */

const activeSideBar = (e) => {
	const targetLi = e.currentTarget.parentElement;
	document.querySelectorAll(".sidebar-item").forEach(e => {
		e.setAttribute("class", "sidebar-item")
	})
	
	targetLi.setAttribute("class", "sidebar-item active");
}

function ajaxPaging(pageNo, url) {
	const numPerpage = document.getElementById("numPerpage").value;
	const sortdata = document.getElementById("sortdata").value;
	const sort = document.getElementById("sort").value
	console.log('pageNo : ' + pageNo);
	fetch(path + "/manage/joinempInfo.do?numPerpage=" + numPerpage
			+ "&sortdata=" + sortdata + "&sort=" + sort + "&cPage=" + pageNo
	)
	.then(response => response.text())
	.then(data => {
		document.getElementById('mainView').innerHTML = data;
	});
}

function ajaxPagingForSearch(pageNo, url, searchType, searchValue) {
	const numPerpage = document.getElementById("numPerpage").value;
	const sortdata = document.getElementById("sortdata").value;
	const sort = document.getElementById("sort").value;
	
	const data = {
		searchType : searchType,
		searchValue : searchValue,
		numPerpage : numPerpage,
		sortdata : sortdata,
		sort : sort,
		cPage : pageNo
	}
	
	console.log("searchType : " + searchType + " searchValue : " + searchValue);
	
	fetch(path + url, {
		method : "POST",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(response => response.text())
	.then(data => {
		document.getElementById("mainView").innerHTML = data;
	})
}

/*document.getElementById("numPerpage").addEventListener("change", e => {
	const numPerpage = e.target.value;
	const sortdata = document.getElementById("sortdata").value;
	const sort = document.getElementById("sort").value;
	console.log("numPerpage : " + numPerpage);
	fetch(path + "/manage/joinempInfo.do?numPerpage=" + numPerpage
		+ "&sortdata=" + sortdata + "&sort=" + sort
	)
	.then(response => response.text())
	.then(data => {
		document.getElementById("mainView").innerHTML = data;
	})
})

document.getElementById("sortdata").addEventListener("change", e => {
	const numPerpage = document.getElementById("numPerpage").value;
	const sortdata = document.getElementById("sortdata").value;
	const sort = document.getElementById("sort").value;
	
	fetch(path + "/manage/joinempInfo.do?numPerpage=" + numPerpage
			+ "&sortdata=" + sortdata + "&sort=" + sort
	)
	.then(response => response.text())
	.then(data => {
		document.getElementById("mainView").innerHTML = data;
	});
})*/

document.querySelectorAll(".data-select").forEach(e => {
	e.addEventListener("change", e => {
		const numPerpage = document.getElementById("numPerpage").value;
		const sortdata = document.getElementById("sortdata").value;
		const sort = document.getElementById("sort").value;
			
		fetch(path + "/manage/joinempInfo.do?numPerpage=" + numPerpage
				+ "&sortdata=" + sortdata + "&sort=" + sort
		)
		.then(response => response.text())
		.then(data => {
			document.getElementById("mainView").innerHTML = data;
		});
	});
});

document.getElementById("searchInput").addEventListener("keyup", e => {
	const searchValue = e.target.value;
	console.log("searchValue : " + searchValue);
	document.querySelectorAll(".contentSpan").forEach(e => {
		e.innerHTML = searchValue;
	})
	
	if(e.target.value.length > 0) {
		document.getElementById("searchModal").style.display = "grid";
	} else {
		document.getElementById("searchModal").style.display = "none";
	}
})

/*document.getElementById("searchInput").addEventListener("blur", e => {
	document.getElementById("searchModal").style.display = "none";
})*/

document.getElementById("deleteSearchModal").addEventListener("click", e => {
	document.getElementById("searchModal").style.display = "none";
})

document.getElementById("searchInput").addEventListener("click", e => {
	if(e.target.value.length > 0) {
		document.getElementById("searchModal").style.display = "grid";
	} else {
		document.getElementById("searchModal").style.display = "none";
	}
})

const searchEmployee = (e) => {
	const searchType = e.currentTarget.firstElementChild.innerText;
	const searchValue = e.currentTarget.lastElementChild.innerText;
	const numPerpage = document.getElementById("numPerpage").value;
	const sortdata = document.getElementById("sortdata").value;
	const sort = document.getElementById("sort").value;
	
	const data = {
		searchType : searchType,
		searchValue : searchValue,
		numPerpage : numPerpage,
		sortdata : sortdata,
		sort : sort
	}
	console.log("searchType : " + searchType + " searchValue : " + searchValue);
	
	fetch(path + "/manage/searchemployee.do", {
		method : "POST",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(response => response.text())
	.then(data => {
		document.getElementById("mainView").innerHTML = data;
		document.getElementById("searchModal").style.display = "none";
	})
}

document.querySelectorAll("input[name='dateUserChoice']").forEach(e => {
	e.addEventListener("click", e => {
		if(e.target.value == 'period') {
			document.querySelector("input[name='startEmpStartDate']").hidden = false;
			document.getElementById("periodTextSpan").hidden = false;
			document.querySelector("input[name='endEmpStartDate']").hidden = false;
		} else {
			document.getElementById("periodTextSpan").hidden = true;
			document.querySelector("input[name='endEmpStartDate']").hidden = true;
		}
	})
})

const cancelDetailAction = () => {
	document.getElementById("searchDetailModal").style.display = "none";
}

const searchDetailAction = (pageNo) => {
	const numPerpage = document.getElementById("numPerpage").value;
	const sortdata = document.getElementById("sortdata").value;
	const sort = document.getElementById("sort").value;
	const empName = document.querySelector("input[name='empName']").value;
	const empBirth = document.querySelector("input[name='empBirth']").value;
	const empId = document.querySelector("input[name='empId']").value;
	const jobLevelName = document.querySelector("input[name='jobLevel']").value;
	const deptName = document.querySelector("input[name='deptName']").value;
	const startEmpStartDate = document.querySelector("input[name='startEmpStartDate']").value;
	const endEmpStartDate = document.querySelector("input[name='endEmpStartDate']").value;
	console.log("pageNo : " + pageNo);
	console.log(typeof pageNo);
	console.log("empBirth : " + empBirth + "typeof : " + typeof empBirth);
	const data = {
		cPage : pageNo,
		numPerpage : numPerpage,
		sortdata : sortdata,
		sort : sort,
		empName : empName,
		empBirth : empBirth,
		empId : empId,
		levelName : jobLevelName,
		deptName : deptName,
		startEmpStartDate : startEmpStartDate,
		endEmpStartDate : endEmpStartDate
	}
	console.log("typeofdata : " + typeof data.cPage);
	fetch(path + "/manage/detailempsearch.do", {
		method : "POST",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(response => response.text())
	.then(data => {
		document.getElementById("mainView").innerHTML = data;
	})
	
}

const showSearchDetailModal = () => {
	const modal = document.getElementById("searchDetailModal");
	if(modal.style.display == 'none') modal.style.display = "inline"
	else modal.style.display = 'none'
}

const emptyInputValue = () => {
	document.querySelector("input[name='empName']").value = "";
	document.querySelector("input[name='empBirth']").value = "";
	document.querySelector("input[name='empId']").value = "";
	document.querySelector("input[name='jobLevel']").value = "";
	document.querySelector("input[name='deptName']").value = "";
	document.querySelector("input[name='startEmpStartDate']").value = "";
	document.querySelector("input[name='endEmpStartDate']").value = "";
}