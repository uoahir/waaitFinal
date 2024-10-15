<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
<link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
<link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/app.css">
<link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="${path }/resources/css/sol/teammanage.css">
</head>
<body>
<div id="app">
       <div id="sidebar">
           <div class="sidebar-wrapper active">
   			<div class="sidebar-header position-relative">
       			<div class="d-flex justify-content-between align-items-center">
           			<div class="logo" style="height: 100; ">
				        	<a href="${path }/"><img src="/resources/images/logo.png" alt="Logo" srcset="" width="150px" style="height:90px"></a>
				        </div>
           			<div class="theme-toggle d-flex gap-2  align-items-center mt-2">
               			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
                   			role="img" class="iconify iconify--system-uicons" width="20" height="20"
                   				preserveAspectRatio="xMidYMid meet" viewBox="0 0 21 21"
                   		>
                   			<g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round"
                       			stroke-linejoin="round">
                       			<path d="M10.5 14.5c2.219 0 4-1.763 4-3.982a4.003 4.003 0 0 0-4-4.018c-2.219 0-4 1.781-4 4c0 2.219 1.781 4 4 4zM4.136 4.136L5.55 5.55m9.9 9.9l1.414 1.414M1.5 10.5h2m14 0h2M4.135 16.863L5.55 15.45m9.899-9.9l1.414-1.415M10.5 19.5v-2m0-14v-2"
                           			opacity=".3">
                           		</path>
                       			<g transform="translate(-210 -1)">
                           			<path d="M220.5 2.5v2m6.5.5l-1.5 1.5"></path>
                           			<circle cx="220.5" cy="11.5" r="4"></circle>
                           			<path d="m214 5l1.5 1.5m5 14v-2m6.5-.5l-1.5-1.5M214 18l1.5-1.5m-4-5h2m14 0h2"></path>
                       			</g>
                   			</g>
               			</svg>
		                <div class="form-check form-switch fs-6">
		                    <input class="form-check-input  me-0" type="checkbox" id="toggle-dark" style="cursor: pointer">
		                    <label class="form-check-label"></label>
		                </div>
               			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
                   			role="img" class="iconify iconify--mdi" width="20" height="20" preserveAspectRatio="xMidYMid meet"
                   			viewBox="0 0 24 24"
                   		>
                   			<path fill="currentColor"
                       			d="m17.75 4.09l-2.53 1.94l.91 3.06l-2.63-1.81l-2.63 1.81l.91-3.06l-2.53-1.94L12.44 4l1.06-3l1.06 3l3.19.09m3.5 6.91l-1.64 1.25l.59 1.98l-1.7-1.17l-1.7 1.17l.59-1.98L15.75 11l2.06-.05L18.5 9l.69 1.95l2.06.05m-2.28 4.95c.83-.08 1.72 1.1 1.19 1.85c-.32.45-.66.87-1.08 1.27C15.17 23 8.84 23 4.94 19.07c-3.91-3.9-3.91-10.24 0-14.14c.4-.4.82-.76 1.27-1.08c.75-.53 1.93.36 1.85 1.19c-.27 2.86.69 5.83 2.89 8.02a9.96 9.96 0 0 0 8.02 2.89m-1.64 2.02a12.08 12.08 0 0 1-7.8-3.47c-2.17-2.19-3.33-5-3.49-7.82c-2.81 3.14-2.7 7.96.31 10.98c3.02 3.01 7.84 3.12 10.98.31Z">
                   			</path>
               			</svg>
           			</div>
		            <div class="sidebar-toggler  x">
		                <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
		            </div>
       			</div>
   			</div>
		    <div class="sidebar-menu">
			        <ul class="menu">
			            <li class="sidebar-title">Menu</li>
			             <li class="sidebar-item active">
			                <a href="${path }/manage/managemain.do" class='sidebar-link' onclick="activeSideBar(event)">
			                    <i class="bi bi-grid-fill"></i>
			                    <span>인사조회</span>
			                </a>
			            </li>
			            <li class="sidebar-item">
			            	<a href="${path }/manage/enrollemployeeview.do" class='sidebar-link' onclick="activeSideBar(event)">
			                	<i class="bi bi-grid-fill"></i>
			                    <span>인사등록</span>
			                </a>
			            </li>
			            <li class="sidebar-item has-sub">
			            	<a href="#" class="sidebar-link">
			            		<i class="bi bi-stack"></i>
			            		<span>부서/팀 관리</span>
			            	</a>
			            	<ul class="submenu submenu-closed">
			            		<li class="submenu-item">
			            			<a href="${path }/manage/departmentview.do" class="submenu-link">부서 등록/수정/삭제</a>
			            		</li>
			            		<li class="submenu-item">
			            			<a href="${path }/manage/teammanageview.do" class="submenu-link">팀 등록/수정/삭제</a>
			            		</li>
			            	</ul>
			            </li>
					</ul>
				</div>
		</div>
	</div>
	<div id="main">
		<header class="mb-3" style="width: 100%;">
			<div class="headerTitle">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
				<h3 style="width: 100%">부서관리</h3>

			</div>
		</header>
		<div id="mainView">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">팀 조회</h4>
				</div>
				<div class="card-content">
					<div class="card-body">
						<div class="row">
							<div class="col-12 col-sm-12 col-md-4">
								<p>부서명</p>
								<div class="list-group" role="tablist">
									<c:if test="${not empty depts }">
										<c:forEach var="dept" items="${depts }">
											<a class="list-group-item list-group-item-action"
												id="${dept.deptCode }" data-bs-toggle="list"
												href="#${dept.deptName }" role="tab">${dept.deptName }</a>
										</c:forEach>
									</c:if>
									<c:if test="${empty depts }">
										<p>부서가 없습니다</p>
									</c:if>
								</div>
							</div>
							<c:if test="${not empty depts }">
								<div class="col-12 col-sm-12 col-md-8 mt-1">
									<div class="tab-content text-justify padding-top-33"
										id="nav-tabContent">
										<c:forEach var="dept" items="${depts }">
											<div class="tab-pane" id="${dept.deptName }" role="tabpanel"
												aria-labelledby="${dept.deptCode }">
												<c:if test="${not empty teams }">
													<ul class="li-nonestyle">
														<c:forEach var="team" items="${teams }">
															<c:if test="${dept.deptCode eq team.parentCode }">
																<li>${team.deptName }</li>
															</c:if>
														</c:forEach>
													</ul>
												</c:if>
												<c:if test="${empty teams }">
													<p>팀이 없습니다.</p>
												</c:if>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:if>
		
						</div>
					</div>
				</div>
			</div>
			<div class="card">
	            <div class="card-header">
	                <h4 class="card-title">팀등록</h4>
	                <p style="margin-bottom : 0px;">부서를 선택해서 팀을 추가하시면 됩니다.</p>
	                <p>부서없는 팀을 추가하시려면 부서선택에서 부서없음을 선택하시면 됩니다.</p>
	            </div>
				<div class="card-body">
	                <div class="row">
	                    <div class="col-md-6">
	                        <div class="form-group">
	                            부서선택
	                            <div>
	                            	<select id="deptSelect" class="form-control">
	                            		<c:if test="${not empty depts }">
		                            		<option value="0" disabled selected>선택하세요</option>
	                            			<c:forEach var="dept" items="${depts }">
	                            				<option value="${dept.deptCode }">${dept.deptName }</option>
	                            			</c:forEach>
	                            		</c:if>
	                            		<c:if test="${empty depts }">
	                            			<option value="0" disabled>부서가 없습니다</option>
	                            		</c:if>
	                            	</select>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-md-6">
	                        <div class="form-group" id="teamAddContainer">
	                        	<div id="addcancelbtn-container">
		                        	<p style="margin-bottom : 0px;" id="teamInputExplain" hidden="true">추가할 팀명 입력</p>
		                        	<div id="btn-container" hidden="true">
			                        	<button class="btn btn-outline-success btn-sm btn-size" onclick="addTeamInput()">+</button>
			                        	<button class="btn btn-outline-danger btn-sm btn-size" onclick="deleteTeamInput()">-</button>
		                        	</div>	                        	
	                        	</div>
	                        	<div id="teaminput-container">
		                        	<input type="text" class="form-control" name="teamAddInput" 
		                        		placeholder="팀을 빼고 입력하세요 ex) 개발1 o, 개발1팀 x" hidden="true">
	                        	</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="actionContainer">
	            	<button class="btn btn-outline-success" onclick="enrollTeamWithDeptCode()">등록</button>
	            </div>
	        </div>
	        <div>
	        <div class="card">
	        	<div class="card-header">
	                <h4 class="card-title">팀 수정/삭제</h4>
	            </div>
	            <div class="card-body">
		        	<table class="table mb-0" id="teamModifyTable">
	            		<thead class="thead-dark">
	            			<tr>
	            				<th>
									<input type="checkbox" name="checkAll">									
								</th>
	            				<th>부서명</th>
	            				<th>팀명</th>
	            				<th>동작</th>
	            				<th></th>
	            			</tr>
	            		</thead>
	            		<tbody>
	            			<c:if test="${not empty depts }">
		           				<c:forEach var="dept" items="${depts }">
		           					<tr id="${dept.deptCode }">
		           						<td></td>
		           						<td colspan="3">${dept.deptName }</td>
		           					</tr>
		           					<c:if test="${not empty teams }">
		           						<c:forEach var="team" items="${teams }">
		           							<c:if test="${dept.deptCode eq team.parentCode }">
			           							<tr id="${team.deptCode }">
			           								<td>
			           									<input type="checkbox" name="checkTeam">
			           								</td>
			           								<td></td>
			           								<td>${team.deptName }</td>
			           								<td>
			           									<button class="btn btn-primary" onclick="showModifyInput(event)">수정</button>
			           									<button class="btn btn-danger" onclick="deleteTeam()">삭제</button>
			           								</td>
			           								<td>
			           									<input type="text" name="modifyTeamNameInput" class="form-control" id="modifyInput" placeholder="팀은 빼고 입력하세요 ex)개발1o 개발1팀x" hidden="true">
			           									<button class="btn btn-success" onclick="modifyApply(event)" hidden="true">적용</button>
			           									<button class="btn btn-danger" onclick="cancelModify(event)" hidden="true">취소</button>
			           								</td>
			           							</tr>
		           							</c:if>
		           						</c:forEach>
		           					</c:if>
		           					<c:if test="${empty teams }">
		           						<tr>
		           							<td colspan="3">팀이 없습니다.
		           						</tr>
		           					</c:if>
		           				</c:forEach>
	            			</c:if>
	            		</tbody>
	            	</table>
            	</div>
	        </div>
		</div>
	</div>
</div>
</body>
<script>
	var path = "${path }";
</script>

<script src="${path }/resources/assets/static/js/components/dark.js"></script>
<script src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${path }/resources/assets/compiled/js/app.js"></script>
<script src="${path }/resources/waait/index.js"></script>
<script src="${path }/resources/js/teammanage.js"></script>
</html>