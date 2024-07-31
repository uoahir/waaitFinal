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

const ajax = (url) => {
	console.log("ajax");
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