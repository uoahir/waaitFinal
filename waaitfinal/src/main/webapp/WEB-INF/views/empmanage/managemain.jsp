<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Mazer Admin Dashboard</title>
    
    <link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
    <link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
    

  <link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/app.css">
  <link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/app-dark.css">
  <link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/iconly.css">
  <link rel="stylesheet" href="${path}/resources/css/ju/headerju.css">
  <link rel="stylesheet" href="${path }/resources/css/sol/managemain.css">
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
  
</head>

<body>
    <script src="${path }/resources/assets/static/js/initTheme.js"></script>
    
    <!-- script문 JU -->
    <script type="text/javascript" src="${path}/resources/js/headerju.js"></script>
    
    
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
            <header class="mb-3" style="width:100%;">
            	<div class="headerTitle">
            		<a href="#" class="burger-btn d-block d-xl-none">
                    	<i class="bi bi-justify fs-3"></i>
                	</a>
                <h3 style="width : 100%">인사조회</h3>
                
            	</div>
            	<div class="search-container">
            		<input type="text" class="form-control" name="param" id="searchInput" placeholder="검색">
            	</div>
            	<div class="search-detail-container">
            		<button class="btn btn-primary" onclick="showSearchDetailModal()">상세조회</button>
            	</div>
            	<div class="optionContainer">
            		<span>데이터수</span>
            		<select id="numPerpage" class="form-select data-select">
	                	<option value="5">5</option>
	                	<option value="10">10</option>
	                	<option value="15">15</option>
	                	<option value="20">20</option>
                	</select>
                	<span style="margin-left : 10px;">정렬</span>
                	<select id="sortdata" class="form-select data-select">
                		<option value="name">이름</option>
                		<option value="gender">성별</option>
                		<option value="birthday">출생일</option>
                		<option value="jobLevel">직급</option>
                	</select>
                	<select id="sort" class="form-select data-select">
                		<option value="asc">오름차순</option>
                		<option value="desc">내림차순</option>
                	</select>
            	</div>
            </header>
            <div id="mainView">
            	<table class="table mb-0">
            		<thead class="thead-dark">
            			<tr>
            				<th>이름</th>
            				<th>아이디</th>
            				<th>출생일</th>
            				<th>직급</th>
            				<th>부서/팀</th>
            				<th>핸드폰 번호</th>
            				<th>거주지 주소</th>
            				<th>성별</th>
            				<th>입사일</th>
            				<th>퇴사여부</th>
            				<th>남은연차</th>
            			</tr>
            		</thead>
            		<tbody>
            		<c:if test="${empty employees}">
            			<tr>
           					<td colspan="8">사원이 존재하지 않습니다.</td>
            			</tr>
            		</c:if>
            		<c:if test="${not empty employees }">
            			<c:forEach var="emp" items="${employees }">
	            			<tr onclick="location.assign('${path }/manage/joinempdetail.do?empNo=${emp.empNo }')">
	            				<td>${emp.empName }</td>
	            				<td>${emp.empId }</td>
	            				<td>${emp.empBirth }</td>
	            				<td>${emp.jobLevel.levelName }</td>
	            				<td>${emp.deptName } / ${emp.teamName }</td>
	            				<td>${emp.empPhone }</td>
	            				<td>${emp.empAddress }</td>
	            				<td>${emp.empGender }</td>
	            				<td>${emp.empStartDate }</td>
	            				<c:if test="${emp.leaveYN eq 'Y' }">
	            					<td>퇴사</td>
	            				</c:if>
	            				<c:if test="${emp.leaveYN eq 'N' }">
	            					<td>재직</td>
	            				</c:if>
	            				<c:if test="${emp.leaveYN ne 'Y' and emp.leaveYN ne 'N' }">
	            					<td>왜 yn이 아닌데</td>
	            				</c:if>
	            				<td>${emp.remainingAnnualLeave }</td>
	            			</tr>
            			</c:forEach>
            			
            		</c:if>
            		</tbody>
            	</table>
            	<div id="pageBarContainer">
            		${pageBar }
            	</div>
            </div>
        </div>
    </div>
    <!-- modal -->
	<div class="modal" id="searchModal">
		<div class="headLine">
			<i class="bi bi-x" id="deleteSearchModal"></i>
		</div>
		<div class="button" id="searchTitleContainer">
			<button id="searchNameButton" onclick="searchEmployee(event)">
				<span class="searchType">[이름]</span>
				<span class="contentSpan"></span>
			</button>
		</div>
		<div class="button" id="searchContentContainer">
			<button id="searchIdButton" onclick="searchEmployee(event)">
				<span class="searchType">[아이디]</span>
				<span class="contentSpan"></span>
			</button>
		</div>
		<div class="button" id="searchSenderContainer">
			<button id="searchAddressButton" onclick="searchEmployee(event)">
				<span class="searchType">[주소]</span>
				<span class="contentSpan"></span>
			</button>
		</div>
	</div>
	<!-- searchDetailModal -->
	<div id="searchDetailModal">
        <div class="header bd-bottom">
            <p class="header-title">상세조회</p>
        </div>
        <div class="search-option-container bd-bottom">
            <div class="input-container top">
                <span>이름</span>
                <input type="text" class="form-control wd-70" name="empName" placeholder="이름입력">
            </div>
            <div class="input-container">
                <span>출생일</span>
                <input type="date" class="form-control wd-70" name="empBirth">
            </div>
            <div class="input-container">
                <span>아이디</span>
                <input type="text" class="form-control wd-70" name="empId" placeholder="아이디입력">
            </div>
            <div class="input-container">
                <span>직책</span>
                <input type="text" class="form-control wd-70" name="jobLevel" placeholder="직책입력">
            </div>
            <div class="input-container">
                <span>부서</span>
                <input type="text" class="form-control wd-70" name="deptName" placeholder="부서입력">
            </div>
            <div class="input-container">
                <div>
                    <span>입사일</span>
                    <input type="radio" name="dateUserChoice" value="period">기간조회
                    <input type="radio" name="dateUserChoice" value="date">날짜조회
                </div>
                <div>
                    <input type="date" class="form-control small-input-date" name="startEmpStartDate" hidden="true">
                    <span id="periodTextSpan" hidden="true">~</span>
                    <input type="date" class="form-control small-input-date" name="endEmpStartDate" hidden="true">
                </div>
            </div>
        </div>
        <div class="action-container">
        		<button class="btn btn-sm btn-outline-success" onclick="emptyInputValue()">비우기</button>
            <button class="btn btn-sm btn-success" onclick="searchDetailAction(1)">검색</button>
            <button class="btn btn-sm btn-danger" onclick="cancelDetailAction()">취소</button>
        </div>
    </div>
</body>
<script>
	var path = "${path }";
</script>
<script src="${path }/resources/js/managemain.js"></script>
<script src="${path }/resources/assets/static/js/components/dark.js"></script>
<script src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${path }/resources/assets/compiled/js/app.js"></script>
<%-- <script src="${path }/resources/assets/extensions/apexcharts/apexcharts.min.js"></script> --%>
<%-- <script src="${path }/resources/assets/static/js/pages/dashboard.js"></script> --%>
<script src="${path }/resources/waait/index.js"></script>
</html>