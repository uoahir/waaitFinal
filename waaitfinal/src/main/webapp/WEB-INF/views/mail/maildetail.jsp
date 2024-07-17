<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
<link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
    

<link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/application-email.css">
<link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app.css">
<link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app-dark.css">
</head>
<body>
<script src="${path }/resources/assets/static/js/initTheme.js"></script>
	<!-- Detailed Email View -->
	<div class="email-app-details">
		<!-- email detail view header -->
		
		<!-- email detail view header end-->
		<div class="email-scroll-area ps ps--active-y">
			<!-- email details  -->
			<div class="row">
				<div class="col-12">
					<div class="collapsible email-detail-head">
						<div class="card collapse-header open" role="tablist">
							<div id="headingCollapse7"
								class="card-header d-flex justify-content-between align-items-center"
								data-toggle="collapse" role="tab" data-target="#collapse7"
								aria-expanded="false" aria-controls="collapse7">
								<div class="collapse-title media">
									<div class="pr-1">
										<div class="avatar me-3">
											<img src="${path }/resources/assets/compiled/jpg/8.jpg"
												alt="avtar img holder" width="30" height="30">
										</div>
									</div>
									<div class="media-body mt-25">
										<span class="text-primary">${mail.senderName }</span> 
										<span class="d-sm-inline d-none">&lt;${mail.senderMailAddress }&gt;</span>
										 <small class="text-muted d-block">받는사람 : ${empMailAddress }</small>
									</div>
								</div>
								<div class="information d-sm-flex d-none align-items-center">
									<small class="text-muted me-3">${mail.mailWriteDate }</small> 
										<button class="icon-button" onclick="addFavorite()">
											<span id="colorDecisionSpan" class=
												<c:if test="${mail.mailStatus eq '즐겨찾기' }" >
		                                        	"favorite text-warning"
		                                        </c:if>
												<c:if test="${mail.mailStatus != '즐겨찾기' }" >
		                                        	"favorite"
		                                        </c:if>
		                                	>
												<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
		                                            <use xlink:href=<c:if test="${mail.mailStatus eq '즐겨찾기' }" >
				                                                    	"${path }/resources/assets/static/images/bootstrap-icons.svg#star-fill"
				                                                    </c:if>
																	<c:if test="${mail.mailStatus != '즐겨찾기' }" >
				                                                    	"${path }/resources/assets/static/images/bootstrap-icons.svg#star"
				                                                 	</c:if> id="iconPath" 
				                                    />
		                                        </svg>
		                                    </span>
                                        </button>
									<div class="dropdown">
										<a href="#" class="dropdown-toggle" id="third-open-menu"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"> <i
											class="bi bi-dots-vertical-rounded me-0"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-right"
											aria-labelledby="second-open-submenu">
											<a href="#" class="dropdown-item mail-reply"> <i
												class="bi bi-share"></i> Reply
											</a> <a href="#" class="dropdown-item"> <i class="bi bi-redo"></i>
												Forward
											</a> <a href="#" class="dropdown-item"> <i
												class="bi bi-info-circle"></i> Report Spam
											</a>
										</div>
									</div>
								</div>
							</div>
							<div id="collapse7" role="tabpanel"
								aria-labelledby="headingCollapse7" class="collapse show">
								<div class="card-content">
									<div class="topLineContainer" style="padding-left:25px; font-size:30px; display:flex;">
										<div id="titleContainer">
											제목 : ${mail.mailTitle }										
										</div>
										<div id="deleteButtonContainer">
											<button onclick="deleteMail()">삭제버튼</button>
										</div>
										<div id="moveMyMailBoxButtonContainer">
											<button onclick="moveMyMailBox()">메일함 이동</button>
										</div>
										<div id="myMailBoxOptionContainer">
											<c:if test="${not empty myMailBoxes }">
												<select id="myMailBoxSelect">
													<option value="default" disabled>메일함을 선택하세요</option>
													<c:forEach var="myMailBox" items="${myMailBoxes }">
														<option value="${myMailBox.myMailBoxNo }">메일함 이름 : ${myMailBox.myMailBoxName }</option>
													</c:forEach>
												</select>
											</c:if>
										</div>
									</div>
									<div class="card-body py-1">
										${mail.mailContent }
										<!-- <p class="text-bold-500">Greetings!</p>
										<p>It is a long established fact that a reader will be
											distracted by the readable content of a page when looking at
											its layout.The point of using Lorem Ipsum is that it has a
											more-or-less normal distribution of letters, as opposed to
											using 'Content here, content here',making it look like
											readable English.</p>
										<p>There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered alteration in some
											form, by injected humour, or randomised words which don't
											look even slightly believable.</p>
										<p class="mb-0">Sincerely yours,</p>
										<p class="text-bold-500">Envato Design Team</p> -->
									</div>
									<div class="card-footer pt-0 border-top">
										<label class="sidebar-label">Attached Files</label>
										<c:if test="${not empty mail.files }">
											<ul class="list-unstyled mb-0">
												<c:forEach var="mailFile" items="${mail.files }">
													<li class="cursor-pointer pb-25">
														<a href="javascript:mailFileDownload('${mailFile.mailOriginalFileName }','${mailFile.mailRenamedFileName }')">${mailFile.mailOriginalFileName }</a>
													</li>
												</c:forEach>
												<!-- <li class="cursor-pointer"><img
													src="../../../app-assets/static/images/icon/sketch.png"
													alt="sketch.png" height="30"> <small
													class="text-muted ms-1 attchement-text">uikit-design.sketch</small>
												</li> -->
											</ul>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
				<div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
			</div>
			<div class="ps__rail-y" style="top: 0px; height: 736px; right: 0px;">
				<div class="ps__thumb-y" tabindex="0"
					style="top: 0px; height: 626px;"></div>
			</div>
		</div>
	</div>
	<!--/ Detailed Email View -->
	<%-- <input type="text" id="${mail.mailNo }" name="mailNo" hidden="true"> --%>
</body>
<footer>
	<div class="footer clearfix mb-0 text-muted">
		<div class="float-start">
			<p>2023 &copy; Mazer</p>
		</div>
		<div class="float-end">
			<p>
				Crafted with <span class="text-danger"><i
					class="bi bi-heart-fill icon-mid"></i></span> by <a
					href="https://saugi.me">Saugi</a>
			</p>
		</div>
	</div>
</footer>

<script src="${path }/resources/assets/static/js/components/dark.js"></script>
<script
	src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>


<script src="${path }/resources/assets/compiled/js/app.js"></script>
<script>
	const mailFileDownload = (oriName, renamed) => {
		location.assign("${path }/mail/filedownload.do?mailOriginalFileName=" + oriName + "&mailRenamedFileName=" + renamed);
	}
	
	const addFavorite = (function() {
		let applicationBoolean = ${mail.mailStatus eq '즐겨찾기' ? true : false}
		const addFavorite = () => {
			const mailNo = ${mail.mailNo};
			if(applicationBoolean == false) {
				fetch("${path}/mail/addfavorite.do?mailNo=" + mailNo)
				.then(response => response.text())
				.then(data => {
					console.log(data);
					if(data == 1) {
						alert("즐겨찾기 추가");
						applicationBoolean = true;
						document.getElementById("iconPath").setAttribute("xlink:href","${path }/resources/assets/static/images/bootstrap-icons.svg#star-fill");
						document.getElementById("colorDecisionSpan").className = "favorite text-warning";
					} else {
						alert("실패");
					}
				});
			} else {
				fetch("${path}/mail/canceladdfavorite.do?mailNo=" + mailNo)
				.then(response => response.text())
				.then(data => {
					console.log(data);
					if(data == 1) {
						alert("즐겨찾기 해제");
						applicationBoolean = false;
						document.getElementById("iconPath").setAttribute("xlink:href","${path }/resources/assets/static/images/bootstrap-icons.svg#star");
						document.getElementById("colorDecisionSpan").className = "favorite";
					} else {
						alert("실패");
					}
				});
			}
		}
		return addFavorite;
	})();
	
	//document.getElementById("iconPath").setAttribute("xlink:href","${path }/resources/assets/static/images/bootstrap-icons.svg#star");
	const deleteMail = () => {
		/* const mailNo = document.querySelector("input[name='mailNo']").value; */
		const mailNo = ${mail.mailNo };
		fetch('${path }/mail/deletemail.do', {
			method : "POST",
			headers : {
				"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
			},
			body : "mailNoStr=" + mailNo
		})
		.then(response => response.text())
		.then(data => {
			location.assign('${path }/mail/mailmain.do');
		})
	}
	
	const moveMyMailBox = () => {
		const mailNo = ${mail.mailNo };
		const mailBoxNo = document.getElementById("myMailBoxSelect").value;
		fetch('${path }/mail/addmailmymailbox.do', {
			method : "POST",
			headers : {
				"Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"
			},
			body : "mailNoStr=" + mailNo + "&myMailBoxNo=" + mailBoxNo
		})
		.then(response => response.text())
		.then(data => {
			location.assign("${path }/mail/mailmain.do");
		});
	}
</script>
<style>
.icon-button {
	background: none;
	border: none;
	padding: 0;
	cursor: pointer;
	outline: none;
}
.card .card-body {
    border-top: 1px solid black;
    margin-bottom: 340px;
}
</style>
</html>