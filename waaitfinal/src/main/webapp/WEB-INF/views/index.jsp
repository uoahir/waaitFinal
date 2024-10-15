<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="employee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인화면(마이페이지 인덱스)</title>
    
    <!-- 링크테그아이콘 -->
    <link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
    <link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
    
	<link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/app.css"> 
	<!-- 다크모드 관리 -->
	<link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" crossorigin href="${path}/resources/assets/compiled/css/iconly.css"> 
	<link rel="stylesheet" href="${path}/resources/css/ju/headerju.css">
  
	<!-- 조직도 -->
	<script src="https://balkan.app/js/orgchart.js"></script>
  	<style>
  		#chart-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .orgchart {
            background: #fff;
        }
  	</style>
</head>

<body>
    <script src="${path }/resources/assets/static/js/initTheme.js"></script>
    
    
    
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
                    preserveAspectRatio="xMidYMid meet" viewBox="0 0 21 21">
                    <g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round"
                        stroke-linejoin="round">
                        <path
                            d="M10.5 14.5c2.219 0 4-1.763 4-3.982a4.003 4.003 0 0 0-4-4.018c-2.219 0-4 1.781-4 4c0 2.219 1.781 4 4 4zM4.136 4.136L5.55 5.55m9.9 9.9l1.414 1.414M1.5 10.5h2m14 0h2M4.135 16.863L5.55 15.45m9.899-9.9l1.414-1.415M10.5 19.5v-2m0-14v-2"
                            opacity=".3"></path>
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
                    viewBox="0 0 24 24">
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
            <li
                class="sidebar-item active ">
                <a href="${path }/" class='sidebar-link'>
                    <i class="bi bi-grid-fill"></i>
                    <span>Main Page</span>
                </a>
                
            </li>
            <c:if test="${employee.deptCode eq 'D7' }">
	            <li
	                class="sidebar-item "> 
	                <a href="${path }/manage/managemain.do" class='sidebar-link'>
	                    <i class="bi bi-grid-fill"></i>
	                    <span>인사관리</span>
	                </a>                
	            </li>
            </c:if>
            <li
                class="sidebar-item ">
                <a href="${path }/schedule/myschedule" class='sidebar-link'>
                    <i class="bi bi-grid-fill"></i>
                    <span>캘린더</span>
                </a>                
            </li>
<li
                class="sidebar-item ">
                <a href="${path }/codereviewboard/main" class='sidebar-link'>
                    <i class="bi bi-grid-fill"></i>
                    <span>코드리뷰</span>
                </a>                
            </li>
            <li
                class="sidebar-item ">
                <a href="${path }/teamproject/main" class='sidebar-link'>
                    <i class="bi bi-grid-fill"></i>
                    <span>팀프로젝트</span>
                </a>                
            </li>
            <li
                class="sidebar-item  has-sub">
                <a href="#" class='sidebar-link'>
                    <i class="bi bi-file-text"></i>
                    <span>워크플로우</span>
                </a>
                
                <ul class="submenu ">
                    
                    <li class="submenu-item  has-sub">
                        <a href="#" class="submenu-link">내문서함</a>
                        
                        <ul class="submenu submenu-level-2 ">
                            
                            <li class="submenu-item">
                                <a href="${path }/edoc/inprogress" class="submenu-link">진행중인문서함</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="${path }/edoc/approved" class="submenu-link">완료문서함</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="${path }/edoc/saved" class="submenu-link">임시저장함</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="${path }/edoc/rejected" class="submenu-link">반려문서함</a>
                            </li>
                            

                        </ul>
                        
                    </li>
                    
                    <li class="submenu-item">
                        <a href="${path }/edoc/approvedall" class="submenu-link">전체 문서함</a>
                    </li>
                    
                </ul>
            </li>
            <li class="sidebar-item  ">
                <a href="${path }/mail/mailmain.do" class='sidebar-link'>
                    <i class="bi bi-envelope-fill"></i>
                    <span>mail</span>
                </a>
            </li>
            
            <li class="sidebar-item  ">
                <div onclick="chattingOpen();" class='sidebar-link' id="chattingOpen">
                    <i class="bi bi-chat-dots-fill"></i>
                    <span>Chat Application</span>
                </div>
            </li>
        </ul>
    </div>
</div>
        </div>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>
            
<%-- <div class="page-heading">
    <!-- <h3>Profile Statistics</h3> -->
    <c:forEach var="m" items="${total }">
</div> --%> 
<div class="page-content"> 
    <section class="row">
        <div class="col-12 col-lg-9">
            <div class="row">
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon purple mb-2">
                                        <i class="iconly-boldShow"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                    <h6 class="text-muted font-semibold">승인대기중인문서<br>상신한문서</h6>
                                    <h6 id="edoc"></h6>                                                                  
                                    <%-- <h6>${workTotal.get(0).workEnd}</h6> --%>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card"> 
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon blue mb-2">
                                        <i class="iconly-boldProfile"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                	<a href="${path}/mail/mailmain.do">
	                                    <h6 class="text-muted font-semibold">안읽은 메일</h6>
	                                    <h6 class="font-extrabold mb-0">${notReadReceiveMailCount }</h6><br>
	                                </a>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon green mb-2">
                                        <i class="iconly-boldAdd-User"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7" onclick="chattingOpen();" style="cursor: pointer;">
                                    <h6 class="text-muted font-semibold">안읽은 채팅</h6>
                                    <h6 class="font-extrabold mb-0">${chatCount}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon red mb-2">
                                        <i class="iconly-boldBookmark"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                    <h6 class="text-muted font-semibold">남은 연차</h6>
                                    <%-- <h6 class="font-extrabold mb-0">${total.get(0).vacaLeft }일 / ${total.get(0).basicAnnualLeave }일</h6> --%>
                                    <h6 class="font-extrabold mb-0">${employee.remainingAnnualLeave }일 / ${employee.basicAnnualLeave }일</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- </c:forEach> --%>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>조직도</h4>                            
                        </div>
                        <div class="card-body" style="display: flex; flex-direction:row;" >
                            <div style="width: 1100px;">
                            	<div id="tree"></div>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-xl-4">
                    <div class="card">
                        <div class="card-header">
                            <h4>공지사항</h4>                        
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <div class="d-flex align-items-center">
                                    	<div>
                                    	<!-- 공지사항 더미 시작 -->
										    <section class="section">
										        <div class="card">
										            <div class="card-header">
										            </div>
										            <div class="card-body">
										                <table class="table table-striped" id="table1">
										                    <thead>
										                        <tr>
										                            <th>작성 부서</th>
										                            <th>제목</th>                            
										                        </tr>
										                    </thead>
										                    <tbody>
										                        <tr>
										                            <td>인사팀 </td>
										                            <td>연말 정산 서류 제출 안내</td>                            
										                        </tr>
										                        <tr>
										                            <td>영업팀</td>
										                            <td>3분기 목표 달성 전략 발표</td>                            
										                        </tr>
										                        <tr>
										                            <td>개발2팀</td>
										                            <td>시스템 업그레이드 일정 공지</td>                            
										                        </tr>
										                        <tr>
										                            <td>재정팀</td>
										                            <td>2분기 재무 보고서 제출 요청</td>                            
										                        </tr>
										                        <tr>
										                            <td>경영관리부</td>
										                            <td>사내 규정 변경 사항 안내</td>                            
										                        </tr>
										                        <tr>
										                            <td>개발1팀</td>
										                            <td>신규 프로젝트 계획 회의 안내</td>                            
										                        </tr>
										                        <tr>
										                            <td>인사팀</td>
										                            <td>복리후생 제도 변경 안내
										                            </td>                            
										                        </tr>                    
										                    </tbody>
										                </table>
										            </div>
										        </div>										
										    </section>
										    <!-- 공지사항 더미 여기까지 -->
										</div>
                                    </div>
                                </div>                                                                                               
                            </div>
                            </div>
                            
                            <!-- 이번주 일정 -->
                            <div class="row">
                                <div class="col-7">
									<!-- 이번주 일정 관련해서 여기 들어와야함  -->
                                </div>                                
                            </div>
                            
                            <div class="row">
                                <div class="col-7">
                                    <div class="d-flex align-items-center">
   
                                    </div>
                                </div>
                                <div class="col-5">
                                    
                                </div>
                                <div class="col-12">
                                    <div id="chart-india"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-7">
                                    <div class="d-flex align-items-center">
                                    </div>
                                </div>                                                              
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-12 col-xl-8">
                    <div class="card">
                        <div class="card-header">
                            <h4>휴가 신청 관련</h4>
                        </div> 
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-lg">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Comment</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-md">
                                                        <img src="${path}/resources/assets/compiled/jpg/5.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Si Cantik</p>
                                                </div>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">Congratulations on your graduation!</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-md">
                                                        <img src="${path}/resources/assets/compiled/jpg/2.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Si Ganteng</p>
                                                </div>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">Wow amazing design! Can you make another tutorial for
                                                    this design?</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-md">
                                                        <img src="${path}/resources/assets/compiled/jpg/8.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Singh Eknoor</p>
                                                </div>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">What a stunning design! You are so talented and creative!</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-md">
                                                        <img src="${path}/resources/assets/compiled/jpg/3.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Rani Jhadav</p>
                                                </div>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">I love your design! It’s so beautiful and unique! How did you learn to do this?</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-3">
            <div class="card">
                <div class="card-body py-4 px-4">
                    <div class="d-flex align-items-center">
                        <div class="avatar avatar-xl">
                            <img src="${path}/resources/assets/compiled/jpg/1.jpg" alt="Face 1">
                        </div>
                        <div class="ms-3 name">
                        	<br>
                            <h5 class="font-bold">${employee.empName }</h5>
                            <h6 class="text-muted mb-0">${employee.empEmail}</h6><br>
								<c:if test="${work!=null}">
								<button class="btn btn-primary">출근 ${work.workStart.getHours()}:${work.workStart.getMinutes()} </button>
								<c:if test="${work.workEnd == null }">
								<button onclick="leaveWork()" class="btn btn-primary">퇴근</button>
								</c:if>
								<c:if test="${work.workEnd != null }">
								<button class="btn btn-primary">퇴근 ${work.workEnd.getHours()}:${work.workEnd.getMinutes()} </button>
								</c:if>	
								</c:if>
								<c:if test="${work==null}">
								<button onclick="work()" class="btn btn-primary">출근</button> 
								<button onclick="noWork()" class="btn btn-primary">퇴근</button><br>
								</c:if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h4>MY WORK LIST</h4>
                </div>
                <div class="card-content pb-4">
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="${path}/resources/assets/compiled/jpg/4.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">팀회의록 업데이트</h5>
                            <h6 class="text-muted mb-0">프로젝트</h6>
                        </div>
                    </div>
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="${path}/resources/assets/compiled/jpg/5.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">08/27 판교 출장</h5>
                            <h6 class="text-muted mb-0">일정</h6>
                        </div>
                    </div>
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="${path}/resources/assets/compiled/jpg/1.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">연말 정산 서류 제출</h5>
                            <h6 class="text-muted mb-0">행정</h6>
                        </div>
                    </div>
                    <div class="px-4">
                        <button class='btn btn-block btn-xl btn-outline-primary font-bold mt-3'>TO DO LIST</button>
                    </div>
                </div>
            </div> 
            <div class="card">
                <div class="card-header">
                    <h4>승인 대기중 문서</h4>
                    <h3></h3>
                </div>
                <div class="card-body">
                    <div id="chart-visitors-profile"></div>                                                                              
                </div>
            </div>
        </div>
    </section>
</div>


        </div>
    </div>
    <script src="${path }/resources/assets/static/js/components/dark.js"></script>
    <script src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    
    
    <script src="${path }/resources/assets/compiled/js/app.js"></script>
    

 <!-- 전자결재관련 차트 -->
<%-- <script src="${path }/resources/assets/extensions/apexcharts/apexcharts.min.js"></script> --%>
<%-- <script src="${path }/resources/assets/static/js/pages/dashboard.js"></script> --%>
	
	<!-- script문 JU -->
    <script>const path = "${path}";</script>
    <script type="text/javascript" src="${path}/resources/js/headerju.js"></script>
    <!-- 출퇴근 관련 onclick이벤트 -->
    <script src="${path }/resources/waait/index.js"></script>
</body>

</html>