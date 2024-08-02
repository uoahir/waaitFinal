/**
 * 
 */

 const insertCodeComment = (no)=>{
	const codeComment = document.getElementById("codeComment");
	let comment = codeComment.value;
	console.log(comment);
	console.log(no);
 }
function connet(codeReviewno, commnet){
	fetch(`${contextPath}/codereview/comment/insert`
	
	)
}