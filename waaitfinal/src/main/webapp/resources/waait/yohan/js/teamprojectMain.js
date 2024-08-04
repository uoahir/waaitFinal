/**
 * 
 */
const projectStatus = document.getElementById("projectStatus");
const prst = document.getElementsByClassName("prst");
console.log(employee);
if (projectStatus.innerText === "preparation") {
	projectStatus.className="badge bg-dark" // 시작 전
}else if(projectStatus.innerText === 'progress in'){
	projectStatus.style.backgroundColor ="blue"; //시작 중
}else {
	projectStatus.style.backgroundColor ="green"; // 종료
}
const teamprojectInfo=()=>{
	location.assign(`${contextPath}/project/info`);
}


