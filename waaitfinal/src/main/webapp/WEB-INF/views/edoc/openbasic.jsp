<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var ="employee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Layout Vertical 1 Column - Mazer</title>
    <link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
    <link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
	<link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app-dark.css">
</head>

<body>
    <script src="${path }/resources/assets/static/js/initTheme.js"></script>
    
    <nav class="navbar navbar-light">
    	<div class="d-flex">
	        <div class="container d-block" style="width:1095px">
	            <a href="index.html"><i class="bi bi-chevron-left"></i></a>
	            <a class="navbar-brand ms-4" href="index.html">
	                <img src="${path }/resources/images/logo.png" style="width:110px; height:80px;">
	            </a>
	        </div>
	        <div class="mt-4">
	        	<a href="#" class="btn icon btn-primary" onclick="window.close();"><i class="bi bi-x"></i></a>
	        </div>
        </div>
    </nav>
	<section class="container">
	<div class="card mt-5">
		<div class="card-header">
			<c:choose>
				<c:when test="${document.docType eq 'T01' }"><h2 class="card-title">Basic Report</h2></c:when>
				<c:when test="${document.docType eq 'T02' }"><h2 class="card-title">Expense Request Form</h2></c:when>
				<c:when test="${document.docType eq 'T03' }"><h2 class="card-title">Business Travel Request Form</h2></c:when>
				<c:when test="${document.docType eq 'T04' }"><h2 class="card-title">Leave Request Form</h2></c:when>
			</c:choose>
	    </div>
	
		<div class="col-sm-2 mb-3 float-end" style="float: right; margin-left: auto; margin-right: 40px;">
			<table class="table table-bordered">
				<tr>
					<td rowspan="3" style="width: 100px; font-size: 15px;">
						<div style="text-align:center;">결재</div>
					</td>
					<c:forEach items="${document.approvals }" var="a">
						<td class="text-center"  style="width: 100px; font-size: 13px;">
							${a.employee.department.deptName } <br>
							${a.employee.empName } ${a.employee.jobLevel.levelName }  
						</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach items="${document.approvals }" var="a">
						<td class="text-center" style="width: 100px; font-size: 13px;">
							<c:choose>
								<c:when test="${a.appStat eq '승인'}">
									<img class="img-autograph" src="${path }/resources/upload/emp/signfile/approved.png" width="50px;">
								</c:when>
								<c:when test="${a.appStat eq '반려' }">
									<img class="img-autograph" src="${path }/resources/upload/emp/signfile/approved.png" width="50px">
								</c:when>
								<c:when test="${a.appStat eq '승인전' and a.appEmp eq employee.empNo }">
									<c:set var="currentApprovalNo" value="${document.approver }"/>
									<div class="d-flex flex-column">
										<button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal" data-bs-target="#modal_approval">
											결재
										</button>
										<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal_approval">
											반려
										</button>
									</div>
								</c:when>
							</c:choose>
						</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach items="${document.approvals }" var="a">
						<td class="text-center" style="width: 100px; font-size: 13px;">
						<c:if test="${a.appStat eq '승인'}">
							<fmt:formatDate type="date" value="${a.appDate }" pattern="yyyy.MM.dd"/>
						</c:if>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
	    
		<div data-simplebar class="nicescroll-bar card-body">
			<div class="file-list-view ">
				<!-- 탭 메뉴 -->
				<ul class="nav nav-tabs nav-line nav-icon nav-light">
					<li class="nav-item" role="presentation">
						<a class="nav-link active" id="home-tab" data-bs-toggle="tab" role = "tab" href="#document" aria-controls="home" aria-selected="true" >
							<span class="nav-link-text">전자문서</span>
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#attach_file" aria-controls="profile" aria-selected="false" tabindex="-1">
							<span class="nav-link-text">첨부파일</span>
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#comment_history" role="tab" aria-controls="contact" aria-selected="false" tabindex="-1">
							<span class="nav-link-text">이력</span>
						</a>
					</li>
				</ul>
				<!-- 탭 내용 -->
				<div class="tab-content" id="myTabContent">
					<!-- 전자문서 탭 -->
					<div class="tab-pane fade show active" id="document" role="tabpanel" aria-labelledby="home-tab" data-edoc-no="${document.docNumber}">
						<div class="table-responsive">
							<div style="width:100%;" class="col-sm-8">
								<table class="table mt-3">
									<tbody>
										<tr>
											<th scope="row">문서종류</th>
											<td>${document.type.type}</td>
											<th scope="row">기안자</th>
											<td>
												<c:out value="${document.employee.department.deptName }"/> <c:out value="${document.employee.jobLevel.levelName }"/> <c:out value="${document.employee.empName }"/>
											</td>
										</tr>
										<tr>
											<th scope="row">보존연한</th>
											<td>
												${document.docLife }
											</td>
											<th scope="row">보안등급</th>
											<td>
												${document.docOpen}
											</td>
										</tr>
										<tr>
											<th scope="row">문서기안일</th>
											<td>
												<fmt:formatDate type="date" value="${document.docDate }" pattern="yyyy-MM-dd"/>
											</td>
											<th scope="row">문서종료일</th>
											<td>
												<c:forEach items="${document.approvals }" var="a">
													<c:if test="${a.appOrder eq document.approvals.size() }">
														<fmt:formatDate type="both" value="${a.appDate }" pattern="yyyy-MM-dd"/>
													</c:if>
												</c:forEach>	
											</td>
										</tr>
										<c:if test="${document.docType eq 'T04'}">
											<tr>
												<th>휴가 종류</th>
												<td>${document.vacaType }</td>
												<th>휴가 사용일수</th>
												<td>${document.vacaUsed }</td>
											</tr>
											<tr>
												<th>휴가 신청 시작일</th>
												<td>
													<c:if test="${document.vacaType eq '연차' || document.vacaType eq '오전반차' || document.vacaType eq '오후반차'}">
													<fmt:formatDate type="both" value="${document.startDate }" pattern="yyyy-MM-dd"/>
													</c:if>
													<c:if test="${document.vacaType ne '연차' && document.vacaType ne '오전반차' && document.vacaType ne '오후반차'}">
														<fmt:formatDate type="both" value="${document.startDate }" pattern="yyyy-MM-dd HH:mm"/>
													</c:if>
												</td>
												<th>휴가 신청 종료일</th>
												<td>
													<c:if test="${document.vacaType ne '조퇴'}">
														<fmt:formatDate type="both" value="${document.endDate }" pattern="yyyy-MM-dd"/>
													</c:if>
													<c:if test="${document.vacaType eq '조퇴'}">
														<fmt:formatDate type="both" value="${document.endDate }" pattern="yyyy-MM-dd HH:mm"/>
													</c:if>
												</td>
											</tr>
											<tr>	
												<th>휴가 사유</th>
												<td colspan = "3">
													${document.reason }
												</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>				
							<div class="container">
								<div class="document-content">
									<div class="container card-text">
										
										<c:if test="${document.docType eq 'T01' }">
											${document.docContent}
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 첨부파일 탭 -->
					<div class="tab-pane fade" id="attach_file" role="tabpanel" aria-labelledby="profile-tab">
						<div class="row">
							<div class="list-group list-group-numbered">
								<c:forEach var="file" items="${document.attachFiles }">
									<a href="${path }/edoc/downloadFile?filename=${file.renamedFilename}&docId=${document.docId}" class="list-group-item list-group-item-action">${file.originalFilename }</a>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- 의견/이력 탭 -->
					<div class="tab-pane fade" id="comment_history" role="tabpanel" aria-labelledby="contact-tab">
						<div class="row ">
							<div class="list-group list-group-numbered">
								<c:forEach var="a" items="${document.approvals}">
									<c:if test="${a.appStat ne '승인전' }">
										<div class="list-group-item col-sm-6">
											<div class="card">
												<div class="card-body">
													<h5 class="card-title">
														${a.employee.empName }&nbsp;
														<c:choose>
															<c:when test="${document.docWriter eq a.appEmp }">
																기안
															</c:when>
															<c:otherwise>
																${a.appStat}
															</c:otherwise>
														</c:choose>
													</h5>
													<h6 class="card-subtitle">
														<fmt:formatDate type="date" value="${document.docDate }"/>
													</h6>
													<p class='card-text'>${a.reason }</p>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	window.onload = function(){
		// 문서열리자마자 해당문서 docWriter 정보랑 approvals 가지구 와서 ! 결재란 만들어주기 ! ! !
		console.log("${document.approvals.size()}");
		
		
		const $line = document.querySelector("#line");
		console.log('${document.docType}');
		console.log('${document.docNumber}');
		console.log('${document.vacaUsed}');
		
		console.log("${document.employee.empName}");
		console.log("${document.employee.department.deptName}");
		console.log("${document.employee.jobLevel.levelName}");
		
		const writer = {
			empName : '${document.employee.empName}',
			deptName : '${document.employee.department.deptName}',
			levelName : '${document.employee.jobLevel.levelName}'
		}
		
		/* const $writerDiv = document.createElement("div");
		$writerDiv.id='approval';
		
		const $writerType = document.createElement("div");
		$writerType.innerText = "기안";
		
		const $writerTeam = document.createElement("div");
		$writerTeam.innerText = writer.deptName;
		
		const $writerEmp = document.createElement("div");
		$writerEmp.innerText = writer.empName;
		$writerEmp.innerText += " ";
		$writerEmp.innerText += writer.levelName;
		
		$writerDiv.appendChild($writerType);
		$writerDiv.appendChild($writerTeam);
		$writerDiv.appendChild($writerEmp);
		
		$line.appendChild($writerDiv);
		
		fetch('/api/approvals'+${document.docId})
		.then(response => response.json())
		.then(data=>{
			// data 가 ,, 머냐면, 
			for(let app of data){
				console.log(app);
				const $appDiv = document.createElement("div");
				$appDiv.id='approval';
				
				const $appType = document.createElement("div");
				if(app.appOrder == ${document.approvals.size()}){
					$appType.innerText = '결재'
					console.log('최종결재자임');
				} else {
					$appType.innerText = '검토';
					console.log('최종결재자아님!!!');
				}
				
				const $appTeam = document.createElement('div');
				$appTeam.innerText= app.employee.department.deptName;
				
				const $appEmp = document.createElement('div');
				$appEmp.innerText = app.employee.empName;
				$appEmp.innerText += " ";
				$appEmp.innerText += app.employee.jobLevel.levelName;
				
				$appDiv.appendChild($appType);
				$appDiv.appendChild($appTeam);
				$appDiv.appendChild($appEmp);
				
				$line.appendChild($appDiv);
				
			
			} 
		})*/
		
	}
	
	const approval = (id, endNo, type, writer) => {
		// size == 최종결재자의 appOrder를 back에 전달
		// size 와, 자기 자신의 appOrder 를 비교해서, 일치하지 않으면 중간결재자, 일치하면 최종결재자임 !!! 
		// 중간결재자 or 최종결재자 임.
		// 구분 : 
		// 승인버튼 클릭 -> 로그인된 아이디와 appEmp 가 같은 row 를 update : 승인전 -> 승인 
		// 현재결재자를 update - approver : 현재 appOrder + 1 and appStat = 승인전 인 appEmp로 변경 !!!!!
		
		// 최종결재자 구분하는 방법 !!! (최종결재자 -> docStatus : 검토중 -> 승인] 변경)
		// ajax 로 구현해야 할지 ~, , 단순히 값만 넘겨주고 끝내도 될지 !?!?!
		// 승인처리하면, success 됐을 때는 alert 띄워주고 close 해줄까 ? 
				
		fetch("/edoc/approval",{
			method : 'POST',
			headers: {
				'Content-Type': 'application/json; charset=UTF-8;',
			},
			body : JSON.stringify({
				docId : id,
				rnum : endNo,
				docType : type,
				docWriter : writer 
			})
		})
		.then(res => {
			if(res.status === 200){
				alert("승인완료");
				opener.document.location.reload();
				self.close();
			} else {
				alert("승인실패");
			}
		})
		
		
	}
</script>

<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
<script src="${path }/resources/assets/static/js/pages/ckeditor.js"></script>

<script src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${path }/resources/assets/compiled/js/app.js"></script>
    
</body>

</html>