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
        <div class="container d-block">
            <a href="index.html"><i class="bi bi-chevron-left"></i></a>
            <a class="navbar-brand ms-4" href="index.html">
                <img src="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20152%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%3e%3cpath%20d='M0%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='13.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3cpath%20d='M71.676%203.22c.709%200%201.279.228%201.71.684.431.431.646%201.013.646%201.748v22.496c0%20.709-.203%201.267-.608%201.672s-.937.608-1.596.608-1.178-.203-1.558-.608-.57-.963-.57-1.672V12.492l-6.46%2012.236c-.304.557-.633.975-.988%201.254-.355.253-.773.38-1.254.38s-.899-.127-1.254-.38-.684-.671-.988-1.254l-6.498-12.046v15.466c0%20.684-.203%201.241-.608%201.672-.38.405-.899.608-1.558.608s-1.178-.203-1.558-.608-.57-.963-.57-1.672V5.652c0-.735.203-1.317.608-1.748.431-.456%201.001-.684%201.71-.684.988%200%201.761.545%202.318%201.634l8.436%2016.074%208.398-16.074c.557-1.089%201.305-1.634%202.242-1.634zm15.801%207.942c2.584%200%204.497.646%205.738%201.938%201.267%201.267%201.9%203.205%201.9%205.814v9.272c0%20.684-.203%201.229-.608%201.634-.405.38-.962.57-1.672.57-.658%200-1.203-.203-1.634-.608-.405-.405-.608-.937-.608-1.596v-.836c-.431.988-1.114%201.761-2.052%202.318-.912.557-1.976.836-3.192.836-1.241%200-2.368-.253-3.382-.76s-1.811-1.203-2.394-2.09-.874-1.875-.874-2.964c0-1.368.342-2.445%201.026-3.23.71-.785%201.85-1.355%203.42-1.71s3.737-.532%206.498-.532h.95v-.874c0-1.241-.266-2.141-.798-2.698-.532-.583-1.393-.874-2.584-.874a7.78%207.78%200%200%200-2.242.342c-.76.203-1.659.507-2.698.912-.658.329-1.14.494-1.444.494-.456%200-.836-.165-1.14-.494-.278-.329-.418-.76-.418-1.292%200-.431.102-.798.304-1.102.228-.329.596-.633%201.102-.912.887-.481%201.938-.861%203.154-1.14%201.242-.279%202.458-.418%203.648-.418zm-1.178%2015.922c1.267%200%202.293-.418%203.078-1.254.811-.861%201.216-1.963%201.216-3.306v-.798h-.684c-1.697%200-3.015.076-3.952.228s-1.608.418-2.014.798-.608.899-.608%201.558c0%20.811.279%201.482.836%202.014.583.507%201.292.76%202.128.76zm27.476-.456c1.418%200%202.128.595%202.128%201.786%200%20.557-.178%201.001-.532%201.33-.355.304-.887.456-1.596.456h-12.692c-.634%200-1.153-.203-1.558-.608a1.97%201.97%200%200%201-.608-1.444c0-.583.228-1.14.684-1.672l9.766-11.286h-8.474c-.71%200-1.242-.152-1.596-.456s-.532-.747-.532-1.33.177-1.026.532-1.33.886-.456%201.596-.456h12.274c.658%200%201.178.203%201.558.608.405.38.608.861.608%201.444%200%20.608-.216%201.165-.646%201.672l-9.804%2011.286h8.892zm19.762-1.52c.431%200%20.773.165%201.026.494.279.329.418.773.418%201.33%200%20.785-.468%201.444-1.406%201.976-.861.481-1.836.874-2.926%201.178-1.089.279-2.128.418-3.116.418-2.989%200-5.358-.861-7.106-2.584s-2.622-4.079-2.622-7.068c0-1.9.38-3.585%201.14-5.054s1.824-2.609%203.192-3.42c1.394-.811%202.964-1.216%204.712-1.216%201.672%200%203.129.367%204.37%201.102s2.204%201.773%202.888%203.116%201.026%202.926%201.026%204.75c0%201.089-.481%201.634-1.444%201.634h-11.21c.152%201.748.646%203.04%201.482%203.876.836.811%202.052%201.216%203.648%201.216.811%200%201.52-.101%202.128-.304.634-.203%201.343-.481%202.128-.836.76-.405%201.318-.608%201.672-.608zm-6.574-10.602c-1.292%200-2.33.405-3.116%201.216-.76.811-1.216%201.976-1.368%203.496h8.588c-.05-1.545-.43-2.711-1.14-3.496-.709-.811-1.697-1.216-2.964-1.216zm22.43-3.268c.658-.051%201.178.089%201.558.418s.57.823.57%201.482c0%20.684-.165%201.191-.494%201.52s-.925.545-1.786.646l-1.14.114c-1.495.152-2.597.659-3.306%201.52-.684.861-1.026%201.938-1.026%203.23v7.98c0%20.735-.228%201.305-.684%201.71-.456.38-1.026.57-1.71.57s-1.254-.19-1.71-.57c-.431-.405-.646-.975-.646-1.71V13.442c0-.709.215-1.254.646-1.634.456-.38%201.013-.57%201.672-.57s1.19.19%201.596.57c.405.355.608.874.608%201.558v1.52c.481-1.115%201.19-1.976%202.128-2.584.962-.608%202.026-.95%203.192-1.026l.532-.038z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3c/svg%3e">
            </a>
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
		<div data-simplebar class="nicescroll-bar card-body">
			<div class="file-list-view">
				<!-- 탭 메뉴 -->
				<ul class="nav nav-tabs nav-line nav-icon nav-light">
					<li class="nav-item">
						<a class="nav-link active" data-bs-toggle="tab" href="#document">
							<span class="nav-link-text">전자문서</span>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-bs-toggle="tab" href="#attach_file">
							<span class="nav-link-text">첨부파일</span>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-bs-toggle="tab" href="#comment_history">
							<span class="nav-link-text">이력</span>
						</a>
					</li>
				</ul>
								<!-- 탭 내용 -->
								<div class="tab-content">
									<!-- 전자문서 탭 -->
									<div class="tab-pane fade show active" id="document" data-edoc-no="${document.docNumber}">
										<div class="table-responsive col-sm-8">
											<table class="table">
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
															<fmt:formatDate type="both" value="${document.approvalOne.appDate }" pattern="yyyy-MM-dd"/>
														</td>
													</tr>
													<c:if test="${document.docType eq 'T04'}">
														<tr>
															<th>휴가종류</th>
															<td>${document.vacaType }</td>
															<th>사용일수</th>
															<td>${document.vacaUsed }</td>
														</tr>
														<tr>
															<th>휴가 신청 시작일시</th>
															<td>
																<c:if test="${document.vacaType eq '연차' || document.vacaType eq '오전반차' || document.vacaType eq '오후반차'}">
																<fmt:formatDate type="both" value="${document.startDate }" pattern="yyyy-MM-dd"/>
																</c:if>
																<c:if test="${document.vacaType ne '연차' && document.vacaType ne '오전반차' && document.vacaType ne '오후반차'}">
																	<fmt:formatDate type="both" value="${document.startDate }" pattern="yyyy-MM-dd HH:mm"/>
																</c:if>
															</td>
															<th>휴가 신청 종료일시</th>
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
																안녕
															</td>
														</tr>
													</c:if>
												</tbody>
											</table>
							 				<table class="table">
												<tr>
													<td rowspan="3">결재</td>
													<c:forEach items="${document.approvals }" var="a">
														<td class="text-center">
															${a.employee.empName }
														</td>
													</c:forEach>
												</tr>
												<tr>
													<c:forEach items="${document.approvals }" var="a">
														<td class="text-center">
															<c:choose>
																<c:when test="${a.aprvlApvCode eq 'APV002'}">
																	<img class="img-autograph" src="${path }/resources/upload/edoc/autograph/defaultRevoke.png">
																</c:when>
																<c:when test="${a.aprvlApvCode ne 'APV000' }">
																	<img class="img-autograph" src="${path }/resources/upload/edoc/autograph/${a.aprvlAutoFilename}">
																</c:when>
																<c:when test="${a.aprvlStatus eq 'W' and a.aprvlEmpNo eq loginEmp.emp_no }">
																	<c:set var="currentApprovalNo" value="${a.aprvlNo }"/>
																	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_approval">
																		결재
																	</button>
																</c:when>
															</c:choose>
														</td>
													</c:forEach>
												</tr>
												<tr>
													<c:forEach items="${edoc.approval }" var="a">
														<td class="text-center">
														<c:if test="${a.aprvlApvCode ne 'APV000'}">
															<fmt:formatDate type="date" value="${a.aprvlDate }"/>
														</c:if>
														</td>
													</c:forEach>
												</tr>
											</table>
										</div>
										
										<div class="container">
											<div class="document-content">
												<div class="container card-text">
													
													<c:if test="${document.docType eq 'T01' }">
														${document.docContent}
													</c:if>
													<c:if test="${document.docType eq 'T04' }">
														<div class = "card-body">
														${document.reason}
														</div>
													</c:if>
												</div>
											</div>
										</div>
									</div>
									<!-- 첨부파일 탭 -->
<%-- 									<div class="tab-pane fade" id="attach_file">
										<div class="row">
											<div class="list-group list-group-numbered">
												<c:forEach var="file" items="${edoc.attachFiles }">
													<a href="${path }/edoc/downloadFile?filename=${file.attachRenamedFilename}&edocNo=${edoc.edocNo}" class="list-group-item list-group-item-action">${file.attachOriginalFilename }</a>
												</c:forEach>
											</div>
										</div>
									</div> --%>
									<!-- 의견/이력 탭 -->
<%-- 									<div class="tab-pane fade" id="comment_history">
										<div class="row ">
											<div class="list-group list-group-numbered">
												<c:forEach var="apv" items="${edoc.approval}">
													<c:if test="${apv.aprvlApvCode ne 'APV000' }">
														<div class="list-group-item col-sm-6">
															<div class="card">
																<div class="card-body">
																	<h5 class="card-title">
																		${apv.aprvlEmpName }&nbsp;
																		<c:choose>
																			<c:when test="${edoc.creater eq apv.aprvlEmpNo }">
																				기안
																			</c:when>
																			<c:otherwise>
																				${apv.aprvlApvCode.getCode()}
																			</c:otherwise>
																		</c:choose>
																	</h5>
																	<h6 class="card-subtitle">
																		<fmt:formatDate type="date" value="${document.docDate }"/>
																	</h6>
																	<p class='card-text'>${apv.aprvlComment }</p>
																</div>
															</div>
														</div>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div> --%>
								</div>
							</div>
						</div>
					</div>
	<!-- 			</div>
			</div>
		</div>
	</div> -->
</section>
<div class="container">
    <div class="card mt-5">
        <div class="card-header">
            <h4 class="card-title">기본보고서</h4>
        </div>
        <div>
        <c:if test="${employee.empNo eq document.docWriter && document.docStat eq '상신' }">
        	<button onclick = "returnMy();">회수</button>
        </c:if>
        <c:if test="${employee.empNo ne document.docWriter && (document.docStat ne '승인' || document.docStat ne '반려') }">
        	<button onclick="approval('${document.docId }','${document.approvals.size()}','${document.docType }', '${document.docWriter }');">승인</button>
        	<button onclick="return();">반려</button>
        </c:if>
        </div>
        <div class="card-body">
        	<div style="width:100%">
        	<div id="line" class="d-flex" style="float:right;">
        	</div>
        	</div>
            <div class="card-body d-flex">
				<div id="title" style="width:50%;">
					<label for="docTitle">Title
					<input class = "round form-controll" type="text" id="docTitle" name="docTitle" value = "${document.docTitle }" readOnly></label>
				</div>
				<div id="writer" style="width:50%;">
					<input type="text" id="deptName" id="deptName" value="${employee.department.deptName }" readOnly /> 
					<input type="text" id="empName" name="empName" value=${employee.empName } readOnly> 
					<input type="hidden" id="docWriter" name="docWriter" value=${employee.empNo }>
				</div>
			</div>
			<div id="content">
				<div class="card-body">
                     <%--   <div id="editor" style="display: none;">
							${document.docContent }
                       </div> --%>
                       <input type="hidden" name="basicContent" id="basicContent">
                   </div>			

				<!-- <textarea name="basicConent" id="basicContent"></textarea> -->
			</div>
			<div class="card-body">
               <!-- 보존연한 -->
                <div id="life" class="d-flex">
                    <div class="mt-1" style="margin-right:10px;">
                        <h6>보존연한</h6>
                    </div>
                         
                    <div class="form-check" style="margin-right:10px;">
	                    <input class="form-check-input" type="radio" name="docLife"
	                               id="1" value="1" disabled>
                    	<c:if test="${document.docLife eq 1 }">
	                        <input class="form-check-input" type="radio" name="docLife"
	                               id="1" value="1" checked disabled>
	                    </c:if>
                        <label for="1" class="form-check-label">1년 </label> 
                    </div>  
                    <div class="form-check" style="margin-right:10px;">
                        <input class="form-check-input" type="radio" name="docLife"
	                               id="3" value="3" disabled>
                    	<c:if test = "${document.docLife == 3 }">
	                        <input class="form-check-input" type="radio" name="docLife"
	                               id="3" value="3" checked disabled>
                        </c:if>
                        <label for="3" class="form-check-label">3년 </label> 
                    </div>
                    <div class="form-check" style="margin-right:10px;">
                        <input class="form-check-input" type="radio" name="docLife"
	                               id="5" value="5" disabled>
                    	<c:if test="${document.docLife == 5}">
	                        <input class="form-check-input" type="radio" name="docLife"
	                               id="5" value="5" checked disabled >
                        </c:if>
                        <label for="5" class="form-check-label">5년 </label> 
                    </div>
                    <div class="form-check" style="margin-right:10px;">
	                    <input class="form-check-input" type="radio" name="docLife"
	                               id="10" value="10" disabled>
                    	<c:if test="${document.docLife == 10}">
	                        <input class="form-check-input" type="radio" name="docLife"
	                               id="10" value="10" checked disabled>
	                    </c:if>
                        <label for="10" class="form-check-label">10년 </label> 
                    </div>
                    <div class="form-check" style="margin-right:10px;">
                        <input class="form-check-input" type="radio" name="docLife"
	                               id="permanent" value="permanent" disabled>
                    	<c:if test="${document.docLife == 'permanent'}">
	                        <input class="form-check-input" type="radio" name="docLife"
	                               id="permanent" value="permanent" checked disabled>
                        </c:if>
                        <label for="permanent" class="form-check-label">영구 </label> 
                    </div>
                </div>

                <!-- 보안등급 -->
			    <div id="open" class="d-flex">
			        <div class="mt-1" style="margin-right:10px;">
			            <h6>보안등급</h6>
			        </div>
			
			        <div class="form-check" style="margin-right:10px;">
			            <!-- Option for All -->
			            <input class="form-check-input" type="radio" name="docOpen" id="a" value="all" disabled>
			            <c:if test="${document.docOpen == 'all'}">
			                <input class="form-check-input" type="radio" name="docOpen" id="a" value="all" checked disabled>
			            </c:if>
			            <label for="a" class="form-check-label">전체공개 </label> 
			        </div>
			        <div class="form-check" style="margin-right:10px;">
			            <!-- Option for Department -->
			            <input class="form-check-input" type="radio" name="docOpen" id="b" value="dept" disabled>
			            <c:if test="${document.docOpen == 'dept'}">
			                <input class="form-check-input" type="radio" name="docOpen" id="b" value="dept" checked disabled>
			            </c:if>
			            <label for="b" class="form-check-label">부서공개 </label> 
			        </div>
			        <div class="form-check" style="margin-right:10px;">
			            <!-- Option for Private -->
			            <input class="form-check-input" type="radio" name="docOpen" id="c" value="private" disabled>
			            <c:if test="${document.docOpen == 'private'}">
			                <input class="form-check-input" type="radio" name="docOpen" id="c" value="private" checked disabled>
			            </c:if>
			            <label for="c" class="form-check-label">비공개 </label> 
			        </div>
			    </div>
           	</div>
			<div>
				<input type="file" name="docFile" multiple>
			</div>
			<input type="hidden" name="docType" value="${type}">
        </div>
    </div>
</div>

<script>
	window.onload = function(){
		// 문서열리자마자 해당문서 docWriter 정보랑 approvals 가지구 와서 ! 결재란 만들어주기 ! ! !
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
		
		const $writerDiv = document.createElement("div");
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
		})
		
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
<script src="/assets/static/js/pages/ckeditor.js"></script>
    
<script src="${path }/resources/assets/compiled/js/app.js"></script>
    
</body>

</html>