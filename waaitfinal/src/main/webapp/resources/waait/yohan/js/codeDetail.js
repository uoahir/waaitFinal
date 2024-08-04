/**
 * 
 */

 const insertCodeComment = (no)=>{
	const codeComment = document.getElementById("codeComment");
	let comment = codeComment.value;
	console.log(comment);
	console.log(no);
	connet(no,comment);
 }
function connet(codeReviewno, commnet){
	fetch(`${contextPath}/codereview/comment/insert`,{
		method : 'POST',
		headers : {
			'Content-Type' : 'application/json;charset=UTF-8'
		},
		
		body: JSON.stringify({
			codeBoardNo : codeReviewno,
			codeReviewContent : commnet
		})
	}).then(res => res.json())
	.then(data=>{
		location.assign(`${contextPath}codereviewboard/codereview${no}`)
	}).catch(error=>{
		console.log(error);
	})
}