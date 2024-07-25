/**
 * 
 */
const projectStatus = document.getElementById("projectStatus");

console.log(employee);
if (projectStatus.innerText === "preparation") {
	projectStatus.className="badge bg-dark" // 시작 전
}else if(projectStatus.innerText === 'progress in'){
	projectStatus.style.backgroundColor ="blue"; //시작 중
}else {
	projectStatus.style.backgroundColor ="green"; // 종료
}
const teamprojectUpdate=(projectNo)=>{
	if(document.getElementById("empNo").innerText != empNo){
		location.assign(`${contextPath}/error/403Page`);
	}else{
		location.assign(`${contextPath}/project${projectNo}/update`);
	}
}
const teamprojectInfo=()=>{
	location.assign(`${contextPath}/project/info`);
}


