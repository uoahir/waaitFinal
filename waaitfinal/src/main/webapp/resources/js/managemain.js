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