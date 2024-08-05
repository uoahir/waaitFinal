<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%-- <jsp:include page="${path}/WEB-INF/views/common/header.jsp" /> --%>
<c:set var="employee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Layout Vertical 1 Column - Mazer</title>
    <link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
	<link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
	<link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app-dark.css">

    <link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
    <link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
	<link href="https://unpkg.com/filepond@^4/dist/filepond.css" rel="stylesheet" />
	

  <link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app.css">
  <link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app-dark.css">

</head>
	<script src="/resources/assets/static/js/initTheme.js"></script>
    
<style>
        .check-icon {
            position: absolute;
            bottom: 10px; /* 이미지의 하단에 위치 */
            right: 5px; /* 이미지의 오른쪽에 위치 */
            background: white; /* 아이콘의 배경색 */
            border:0.2px solid lightblue;
            border-radius: 50%; /* 아이콘을 원형으로 만듭니다 */
            padding: 2px; /* 아이콘과 테두리 사이의 간격 */
            font-size: 18px; /* 아이콘 크기 */
            color: green; /* 아이콘 색상 */
        }

.profile-image-container {
    position: relative; /* 자식 요소를 절대 위치로 설정할 수 있도록 합니다 */
    display: inline-block; /* 인라인 블록으로 설정하여 주변 요소와 나란히 배치 */
    padding: 8px; /* 이미지와 테두리 사이의 간격을 추가 */
    background: lightblue; /* 연두색 배경 */
    border-radius: 50%; /* 원형으로 만듭니다 */
}
.profile-image-container-reject {
    position: relative; /* 자식 요소를 절대 위치로 설정할 수 있도록 합니다 */
    display: inline-block; /* 인라인 블록으로 설정하여 주변 요소와 나란히 배치 */
    padding: 8px; /* 이미지와 테두리 사이의 간격을 추가 */
    background: #F08080; /* 연두색 배경 */
    border-radius: 50%; /* 원형으로 만듭니다 */
}
	div.approval div{
		width : 90px;
		border : 1px solid grey;
	}
	
	div#approval {
		width: 25%;
		height: 100%;
		flex-direction: column;
	}


</style>
<nav class="navbar navbar-light">
	
    <div class="container d-block">
        <a class="navbar-brand ms-4" href="index.html">
            <img src="/resources/images/logo.png" style="width:110px; height:80px;">
        </a>
    </div>
    
</nav>
<section class="container">
	<div class="card d-flex align-items-center">
		<div class="card-header d-flex" style="width:100%;">
			<div style="width:90%;">
				<h2 class="card-title">Basic Report</h2><h6>기본보고서</h6>
			</div>
			<div style="width:10%;" class="d-flex gap-2">
				<c:if test="${employee.empNo eq document.docWriter && document.docStat eq '상신'}">
					<button style="height: 50px;" class="btn btn-outline-secondary" onclick="returnDoc('${document.docId }',${document.docType },'${document.docWriter}');">회수</button>
				</c:if>
				<c:forEach items="${document.approvals }" var="app">
					<c:if test="${employee.empNo eq app.appEmp && document.docStat ne '승인' }">
						<button style="height: 50px;" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#approvalModal">결재</button>
						<button style="height: 50px;" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#rejectModal">반려</button>
					</c:if>
				</c:forEach>
				<!-- <button style="height: 50px;" class="btn btn-outline-secondary">인쇄미리보기</button> -->
				<button style="height: 50px;" class="btn btn-outline-secondary" onclick="window.close();">닫기</button>
			</div>
	    </div>
	    <div class="card-body d-flex mt-3" style="width:100%">
	    
	    	<div class = "mt-3"style="width:50%; padding-left:30px;">
                 <table class="table" style="width:300px; height:100px;">
                     <thead>
                         <tr>
                             <th colspan="2" style="text-align:center;">문서정보</th>
                         </tr>
                     </thead>
                     <tbody>
                         <tr>
                             <td class="text-bold-500">문서번호</td>
                             <td>${document.docNumber }</td>
                         </tr>
                         <tr>
                             <td class="text-bold-500">작성일</td>
                             <td>${document.docDate }</td>
                         </tr>
                         <tr>
                             <td class="text-bold-500">기안부서</td>
                             <td id="dept">${document.employee.department.deptName }</td>
                         </tr>
                         <tr>
                             <td class="text-bold-500">기안자</td>
                             <td id="writer">${document.employee.empName }</td>
                         </tr>
                        
                     </tbody>
                 </table>
             </div>
			<div id="appline" class="d-flex justify-content-center align-items-center" style="width:50%">
				<c:if test="${not empty document.approvals }">
					<c:forEach items="${document.approvals }" var="app">
						<div id="approval" class="d-flex justify-content-center align-items-center gap-1"style="width:25%; height:100%; flex-direction:column">
							<div>
								<c:if test="${app.appOrder eq document.approvals.size() }">결재</c:if>
								<c:if test="${app.appOrder ne document.approvals.size() }">검토</c:if>
							</div>
							<c:if test="${app.appStat eq '승인전' }">
								<div class="avatar avatar-xl">
									<img src="${path}/resources/upload/emp/profile\/${app.employee.empProfile}">
								</div>
							</c:if>
							<c:if test="${app.appStat eq '승인' }">
								<div class="avatar avatar-xl profile-image-container">
									<img class="profile-image" src="${path}/resources/upload/emp/profile\/${app.employee.empProfile}">
									<span class="check-icon"><i class="bi bi-check2"></i></span>							
								</div>
							</c:if>
							<c:if test="${app.appStat eq '반려' }">
								<div class="avatar avatar-xl profile-image-container-reject">
									<img class="profile-image" src="${path }/resources/upload/emp/profile\/${app.employee.empProfile}">						
								</div>
							</c:if>
							
							
							<div>${app.employee.department.deptName }</div>
							<div>${app.employee.empName } ${app.employee.jobLevel.levelName }</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<div style="width:90%;" class="mt-3">
			<table class="table table-bordered" style="table-layout:fixed; min-height:600px;">
				<thead>
			        <tr style="text-align:center; height:50px;">
			            <th colspan="4">기본보고서</th>   
			        </tr>
		    	</thead>
		    	<tbody>
			        <tr>
			            <td class="text-bold-500" style="text-align:center;">제목</td>
			            <td colspan="3">
							${document.docTitle }
			            </td>
			        </tr>
			        <tr>
			            <td class="text-bold-500" style="text-align:center;">본문</td>
			            <td colspan="3">
							${document.docContent }
			            </td>
			        </tr>
				
			
					<tr>
					    <td style="text-align:center;">첨부파일</td>
					    <td colspan="3">
					        <c:if test="${not empty document.attachFiles}">
				                <c:forEach var="file" items="${document.attachFiles}">
			                        <div>
				                        <a href="javascript:fileDownload('${file.originalFilename}', '${file.renamedFilename}')">
				                            ${file.originalFilename}
				                        </a>
									</div>
				                </c:forEach>
					        </c:if>
					    </td>
					</tr>

					
					<tr>
						<td class="text-bold-500" style="text-align:center;">보존연한</td>
						<td>
							${document.docLife }년
						</td>
						<td class="text-bold-500" style="text-align:center;">보안등급</td>
						<td>
							${document.docOpen }
						</td>
					</tr>
				</tbody>
		    </table>
		</div>
	</div>
	
	
	
	<!-- 모달창 -->
	<!-- Modal -->
	<div class="modal fade" id="approvalModal" tabindex="-1" aria-labelledby="approverModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">  
	        	<div class="modal-header">
	        		<h6>결재창</h6>
	        	</div>
	            <div class="modal-body">
					<div>
						<textarea name="appReason" id="appReason" cols="" rows="" placeholder="의견을 작성해주세요."></textarea>
	                </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary" data-bs-dismiss = "modal" onclick="approval('${document.docId }','${document.approvals.size()}','${document.docType }', '${document.docWriter }');">결재</button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 모달창 -->
	<!-- Modal -->
	<div class="modal fade" id="rejectModal" tabindex="-1" aria-labelledby="approverModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">  
	        	<div class="modal-header">
	        		<h6>반려창</h6>
	        	</div>
	            <div class="modal-body">
					<div>
						<textarea name="rejectReason" id="rejectReason" cols="" rows="" placeholder="반려사유를 작성해주세요."></textarea>
	                </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary" data-bs-dismiss = "modal" onclick="reject('${document.docId }','${document.approvals.size()}','${document.docType }', '${document.docWriter }');">결재</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
    	var path = "${path}";
    	var employee = {
    		empName : "${employee.empName}",
    		deptName : "${employee.department.deptName}",
    		levelName : "${employee.jobLevel.levelName}",
    		empNo : "${employee.empNo}"
    	}
    </script>
	<script>
	window.onload = function(){
		console.log('${document.docId}', '${document.docType}', '${document.docWriter}')
		
	}
	const approval = (id, endNo, type, writer) => {
		const reason = document.querySelector("#appReason").value;
		console.log(reason);
		console.log(id,endNo,type,writer,reason);
		
				
		fetch("/edoc/approval",{
			method : 'POST',
			headers: {
				'Content-Type': 'application/json; charset=UTF-8;',
			},
			body : JSON.stringify({
				docId : id,
				rnum : endNo,
				docType : type,
				docWriter : writer,
				docStat : reason
				
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
	
	
	const reject = (id, endNo, type, writer) => {
		const reason = document.querySelector("#rejectReason").value;
		console.log(reason);
		console.log(id,endNo,type,writer,reason);
		
				
		fetch("/edoc/reject",{
			method : 'POST',
			headers: {
				'Content-Type': 'application/json; charset=UTF-8;',
			},
			body : JSON.stringify({
				docId : id,
				rnum : endNo,
				docType : type,
				docWriter : writer,
				docStat : reason
				
			})
		})
		.then(response => response.text())
		.then(res => {
			if(res === '성공'){
				alert("반려완료");
				opener.document.location.reload();
				self.close();
			} else {
				alert("반려실패");
			}
		})
		
	}
	
	const returnDoc = (id, type, writer) => {
		fetch("/edoc/returndoc",{
			method:"POST",
			headers: {
				'Content-Type': 'application/json; charset=UTF-8;',
			},
			body : JSON.stringify({
				docWriter : writer,
				docId : id,
				docType : type
			})
		})
		.then(response => response.text())
		.then(res => {
			if(res === '성공'){
				alert("회수완료");
				opener.document.location.reload();
				self.close();
			} else {
				alert("회수실패");
			}
		})
	
	}
    
	
  /*   const inappline = (empName, empNo, deptName, levelName, empProfile)=>{
        console.log(empName, empNo, deptName, levelName, empProfile);

        const employee = { empName, empNo, deptName, levelName, empProfile };

        if (employee.empNo == ${employee.empNo}) {
            alert("결재라인에 본인을 추가할 수 없습니다.");
        } else if (selectedEmployees.some(e => e.empNo === employee.empNo)) {
            alert("해당 직원은 이미 결재라인에 추가되어 있습니다.");
        } else {
            selectedEmployees.push(employee);
            const $tr = document.createElement("tr");
            $tr.onclick = () => {
                // 선택된 employee 리스트에서 제거
                const index = selectedEmployees.findIndex(e => e.empNo === employee.empNo);
                if (index !== -1) {
                    selectedEmployees.splice(index, 1);
                }
                // 트 요소를 DOM에서 제거
                $tr.remove();
            };
            $tr.innerHTML = "<td>" + deptName + "</td><td>" + levelName + "</td><td>" + empName+ "</td>";
            const approvalLine = document.getElementById("approvalLine");

            approvalLine.appendChild($tr);
        }
        
    }; */
	
	/* 
    const setApprovalLine = () => {
       
        const $lineDiv = document.querySelector("#appline");
        const finalApp = selectedEmployees.length;
        console.log(finalApp);
        
        // 기존의 div.line을 비워줍니다.
        $lineDiv.innerHTML = '';
       	
        // 새로운 div 요소 생성 및 설정
        for (let i = 0; i < selectedEmployees.length; i++) {
        	
        	let e = selectedEmployees[i];
        	
        	const $div = document.createElement("div");
            $div.id = "approval"
            $div.classList.add('d-flex','justify-content-center','align-items-center','gap-1');
            //$div.style.display = 'flex'; // 예시 스타일: Flexbox 사용

            const $divStat = document.createElement("div");
            if((i+1)== finalApp){
	            $divStat.innerText = "결재";	
            } else {
            	$divStat.innerText = "검토";
            }
            
            const $divProfile = document.createElement("div");
            $divProfile.classList.add('avatar','avatar-xl');
            const $avatar = document.createElement("img");
            $avatar.setAttribute("src","${path}/resources/images/"+e.empProfile);
            $divProfile.appendChild($avatar);
            
            const $divTeam = document.createElement("div");
            $divTeam.innerText = e.deptName;

            const $divEmp = document.createElement("div");
            $divEmp.innerText = e.empName + " " + e.levelName;
            
            const $inputNo = document.createElement("input");
            $inputNo.setAttribute('type', 'hidden');
            $inputNo.setAttribute('value', e.empNo);
            $inputNo.setAttribute('name', 'empNo');
            $inputNo.setAttribute('id', 'empNo');

            $div.appendChild($divStat);
            $div.appendChild($divProfile);
            $div.appendChild($divTeam);
            $div.appendChild($divEmp);
            $div.appendChild($inputNo);

            // line div에 새로운 div 요소를 추가합니다.
            $lineDiv.appendChild($div);
            
        }
    }
    
 */
	

	const fileDownload = (oriName, renamed) => {
		location.assign("${path }/edoc/filedownload?originalFilename=" + oriName + "&renamedFilename=" + renamed);
	}
  
        
     	

    </script>
    
    
    

</section>

    <script src="https://unpkg.com/filepond@^4/dist/filepond.js"></script>
    <script src="${path}/resources/assets/compiled/js/app.js"></script>

<%-- <jsp:include page="${path}/WEB-INF/views/common/footer.jsp" /> --%>