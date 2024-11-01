<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%-- <jsp:include page="${path}/WEB-INF/views/common/header.jsp" /> --%>
<c:set var="employee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />
	
<%
    // 현재 날짜를 가져오고 원하는 형식으로 포맷팅
    Date currentDate = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = dateFormat.format(currentDate);
%>

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
    
	<!-- <link href="https://unpkg.com/filepond@^4/dist/filepond.css" rel="stylesheet" /> -->
	

  <link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app.css">
  <link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app-dark.css">

</head>
	<script src="/resources/assets/static/js/initTheme.js"></script>
    
<style>
	
	div.approval div{
		width : 90px;
		border : 1px solid grey;
	}
	
	div#approval {
		width: 25%;
		height: 100%;
		flex-direction: column;
	}
	        .ck-editor__editable {
            height: 600px; /* 높이 설정 */
        }

</style>
<nav class="navbar navbar-light">
	
    <div class="container d-block">
        <a class="navbar-brand ms-4" href="index.html">
            <img src="${path }/resources/images/logo.png" style="width:110px; height:80px;">
        </a>
    </div>
    
</nav>
<section class="container">
	<div class="card d-flex align-items-center">
		<div class="card-header d-flex" style="width:100%;">
			<div style="width:80%;">
				<h2 class="card-title">Basic Report</h2><h6>기본보고서</h6>
			</div>
			<div style="width:20%;" class="d-flex gap-2">
				<button style="height:50px;" class="btn btn-outline-secondary" id="submitBtn">기안</button>
				<button style="height:50px;" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#approverModal">결재선</button>
				<!-- <button style="height:50px;" class="btn btn-outline-secondary">임시저장</button>
				<button style="height:50px;" class="btn btn-outline-secondary">인쇄미리보기</button> -->
				<button style="height:50px;" class="btn btn-outline-secondary" onclick="window.close();">닫기</button>
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
                             <td></td>
                         </tr>
                         <tr>
                             <td class="text-bold-500">작성일</td>
                             <td><%= formattedDate %></td>
                         </tr>
                         <tr>
                             <td class="text-bold-500">기안부서</td>
                             <td id="dept"></td>
                         </tr>
                         <tr>
                             <td class="text-bold-500">기안자</td>
                             <td id="writer">	
                             </td>
                         </tr>
                        
                     </tbody>
                 </table>
             </div>
			<div id="appline" class="d-flex justify-content-center align-items-center" style="width:50%">
			</div>
		</div>
		<div style="width:90%;" class="mt-3">
			<table class="table table-bordered" style="text-align:center; table-layout:fixed; min-height:100;">
		    	<tbody>
			        <tr>
			            <td class="text-bold-500">제목</td>
			            <td colspan="3">
			            	<input type="text" name="docTitle" id="docTitle" maxlength="100" style="width: 100%; height:90%; border: none;" placeholder="제목을 입력하세요.">
			            </td>
			        </tr>
					<tr>
						<td colspan="4">
							<div>
		                        <div id="editor" style="width:100%;" style="height:100px;">
									
		                        </div>
		                        <input type="hidden" name="basicContent" id="basicContent">
		                    </div>			
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="3">
						<input type="file" name="file" id="file" multiple>
						</td>
					</tr>
					<tr>
						<td class="text-bold-500">보존연한</td>
						<td>
							<select class="form-select" id="docLife" name="docLife">
                            	<option value="none">선택</option>
                                <option value="1">1년</option>
                                <option value="3">3년</option>
                                <option value="5">5년</option>
                                <option value="10">10년</option>
                                <option value="영구">영구</option>
                            </select>
						</td>
						<td class="text-bold-500">보안등급</td>
						<td>
							<select class="form-select" id="docOpen" name="docOpen">
                            	<option value="none">선택</option>
                                <option value="all">전체공개</option>
                                <option value="dept">부서공개</option>
                                <option value="private">비공개</option>
                            </select>
						</td>
					</tr>
				</tbody>
		    </table>
		</div>
	</div>
	
	
	
	<!-- 모달창 -->
	<!-- Modal -->
	<div class="modal fade" id="approverModal" tabindex="-1" aria-labelledby="approverModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	           
	            <div class="modal-body">
	            	<div class="d-flex mt-3">
	            		<div class="accordion" id="accordionFlushExample" style="width:30%;">
						    <c:forEach items="${depts}" var="d">
						        <!-- 부서 표시 -->
						        <div class="accordion-item">
						            <h2 class="accordion-header" id="heading-${d.deptCode}">
						                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${d.deptCode}" aria-expanded="false" aria-controls="collapse-${d.deptCode}">
						                    ${d.deptName}
						                </button>
						            </h2>
						            <div id="collapse-${d.deptCode}" class="accordion-collapse collapse" aria-labelledby="heading-${d.deptCode}" data-bs-parent="#accordionFlushExample">
						                <div class="accordion-body">
						                    <!-- 직원 목록 -->
						                    <c:forEach items="${employees}" var="e">
						                        <c:if test="${d.deptCode eq e.department.deptCode}">
						                            <div onclick="inappline('${e.empName}', '${e.empNo}', '${e.department.deptName}', '${e.jobLevel.levelName}', '${e.empProfile}')">${e.empName} ${e.jobLevel.levelName }</div>
						                        </c:if>
						                    </c:forEach>
						                </div>
						            </div>
						        </div>
						    </c:forEach>
						</div>       
		                <div style="width:60%; margin-left:30px;">
		                	<div>
								<table class="table" style="text-align:center; table-layout:fixed; ">
									<thead>
								        <tr>
								            <th colspan="3">결재라인</th>   
								        </tr>
							    	</thead>
							    	<tbody id="approvalLine">
								        <tr>
								            <td class="text-bold-500">부서</td>
								            <td class="text-bold-500">직급</td>
								            <td class="text-bold-500">이름</td>
								        </tr>
									</tbody>
								</table>
							</div>
		                </div>
	                </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary" data-bs-dismiss = "modal" onclick="setApprovalLine();">저장</button>
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
		
		fetch("${path}/edoc/docwriter")
		.then(response => response.json())
		.then(data => {
			console.log(data);
			document.querySelector("#dept").innerText = data.department.deptName;
			document.querySelector("#writer").innerText= data.empName;
			
		})
		
		
	}
	
    const selectedEmployees = [];
	
    const inappline = (empName, empNo, deptName, levelName, empProfile)=>{
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
        
    };
	
	// 사용일수를 계산하는 함수
	const calculateDays = () => {
	    const type = document.querySelector("#vacaType option:checked").value;
	    const startDate = document.getElementById('startDate').value;
	    const endDate = document.getElementById('endDate').value;
	    const $vacaUsed = document.getElementById('vacaUsed');

	    // 'remaining' 요소의 값을 숫자로 추출합니다.
	    const hasVacationInput = document.getElementById('remaining');
	    const value = hasVacationInput.innerText;
	    const numberMatch = value.match(/\d+/);
	    const hasVacation = numberMatch ? parseInt(numberMatch[0], 10) : 0;

	    if (!type || type === 'none') {
	        $vacaUsed.innerText = ""; // 연차종류가 none일 경우 초기화
	        return;
	    }
	    
	    if (startDate && endDate) {
	        const start = new Date(startDate);
	        const end = new Date(endDate);
	        const timeDiff = end - start;
	        let daysDiff = timeDiff / (1000 * 3600 * 24) + 1;

	        if (type === '오전반차' || type === '오후반차') {
	            daysDiff /= 2;
	        }

	        if (daysDiff > hasVacation) {
	            alert('보유하고 있는 연차일수를 초과하였습니다.');
	            $vacaUsed.innerText = "";
	        } else if (daysDiff <= 0) {
	            alert('유효하지 않은 사용일수입니다.');
	            $vacaUsed.innerText = "";
	        } else {
	            $vacaUsed.innerText = daysDiff + "일";
	        }
	    }
	};
	
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
    
    const extractNumberFromWord = (str) => {
	    const number = str.match(/\d+/);
	    return number ? Number(number[0]) : null;
	}
	
  
    
    document.addEventListener('DOMContentLoaded', () => {
 		

        const insertBasic = () => {
            const docTitle = document.querySelector("#docTitle").value;
            const docWriter = ${employee.empNo};
            const docLife = document.querySelector("#docLife").value;
            const docOpen = document.querySelector("#docOpen").value;
            const approvals = document.querySelectorAll("#empNo");
            const empNo = Array.from(approvals).map(input => input.value);
            
            const basicContent = document.querySelector(".ck-content").innerHTML;
            console.log(basicContent);
            
            const fileInput = document.getElementById('file');
            const files = fileInput.files; // 선택된 파일들
      
            let valid = true;
	
            if (docTitle.trim() == '') {
                alert('문서제목을 입력하세요.');
                valid = false;
            }
            if (basicContent.trim()==''){
            	alert('보고서 내용을 입력하세요.');
            	valid = false;
            }
            if (docOpen == "none") {
                alert('공개범위를 지정하세요.');
                valid = false;
            }
            if (docLife == "none") {
                alert("보존연한을 지정하세요.");
                valid = false;
            }

            if (approvals.length == 0) {
                alert("결재선을 지정하세요.");
                valid = false;
            }

            if (valid) {
                // 유효성 검사를 통과해야만, 전송되는 객체(실제데이터)를 만들어줌.
                const obj = {
                    docTitle: docTitle,
                    docWriter: docWriter,
                    docLife: docLife,
                    docOpen: docOpen,
                    docType: 'T01',                
                    empNo: empNo,
                    docContent: basicContent
                };
                console.log(obj);

                const formData = new FormData();

                // 선택된 파일들을 FormData에 추가
                for (let i = 0; i < files.length; i++) {
                    formData.append('files', files[i]); // 'files[]'는 서버에서 파일들을 배열로 처리할 때 사용
                }
                
                // Add JSON data to formData
                formData.append("data", new Blob([JSON.stringify(obj)], { type: "application/json" }));

                // Fetch request
                fetch('${path}/edoc/basicedocend', {
                    method: "POST",
                    body: formData
                })
                    .then((res) => {
                        if (!res.ok) {
                            throw new Error('네트워크 응답이 좋지 않습니다.');
                        } else {
                            alert("기안완료");
                            opener.location.reload();
                            self.close();
                        }
                    })
                    .catch((error) => {
                        console.error('오류 발생:', error);
                    });
            }
        };

        // Add event listener to submit button or form
         document.querySelector("#submitBtn").addEventListener("click", insertBasic);
     });

    </script>
    
    
    

</section>
	

	<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
  <!--   <script src="https://unpkg.com/filepond@^4/dist/filepond.js"></script> -->
	<script src="${path }/resources/assets/static/js/pages/ckeditor.js"></script>
    <script src="${path}/resources/assets/compiled/js/app.js"></script>

<%-- <jsp:include page="${path}/WEB-INF/views/common/footer.jsp" /> --%>