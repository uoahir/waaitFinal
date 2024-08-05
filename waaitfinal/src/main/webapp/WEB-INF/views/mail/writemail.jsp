<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var ="emp" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
<link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
<link rel="stylesheet" href="${path }/assets/extensions/summernote/summernote-lite.css">
<link rel="stylesheet" href="${path }/assets/compiled/css/form-editor-summernote.css">
<link rel="stylesheet" href="${path }/assets/compiled/css/app.css">
<link rel="stylesheet" href="${path }/assets/compiled/css/app-dark.css">
<link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
<link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png"> 
<link rel="stylesheet" href="${path }/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet" href="${path }/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">
<link rel="stylesheet" href="${path }/resources/assets/extensions/toastify-js/src/toastify.css">
<link rel="stylesheet" href="${path }/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="${path }/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="${path }/resources/waait/mail/writemail_css.css">
</head>
<body>
	<header>
		<div class="logo" style="height: 100; ">
        	<a href="javascript:goMailMain()"><img src="/resources/images/logo.png" alt="Logo" srcset="" width="150px" style="height:90px"></a>
        </div>
	</header>
	<c:if test="${not empty mail }">
		<form action="${path }/mail/sendmail.do" method="post" enctype="multipart/form-data" onsubmit="return mailContentInputHidden()">
			<section class="section">
				<div class="sectionHeaderContainer">
	        <div class="senderContainer flex-divcontainer">
	            <div class="padding-top3">
	                <span class="boldtext">${emp.empName }</span>
	            </div>
	            <div class="senderInputContainer">
	                <input type="text" class="inherit-input" name="senderMailAddress">
	            </div>
	        </div>
	        <div class="receiverContainer flex-divcontainer">
	            <div class="padding-top3">
	                <span class="boldtext">받는사람</span>
	            </div>
	            <div class="myborder-bottom width90">
	            	<c:if test="${mail.receivers.size() > 0 }">
	            		<c:forEach var="receiver" items="${mail.receivers }">
	                		<input type="text" name="mailReceiverAddress" class="nonestyle-input inherit-input" placeholder="받는사람 입력" value="${receiver.mailReceiverAddress }">
	                	</c:forEach>
	                </c:if>
	            </div>
	        </div>
	        <div class="mailTitleContainer flex-divcontainer">
	            <div class="padding-top3">
	                <span class="boldtext">제목</span>
	            </div>
	            <div class="myborder-bottom width90">
	                <input type="text" name="mailTitle" class="nonestyle-input inherit-input" placeholder="제목입력">
	            </div>
	        </div>
	        <div class="fileContainer flex-divcontainer">
	        	<div class="padding-top3">
	                <span class="boldtext">파일 첨부</span>
	            </div>
	            <div class="width90 fileinput-container">
	                <input type="file" class="multiple-files-filepond" name="upFile" multiple>
	            </div>
	        </div>
	    </div>
	    <div class="border-bottom border-top">
			<div class="row">
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	                        <div id="summernote"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div>
			<input type="text" name="mailContent" hidden="true">
			<input type="text" name="mailReceiver" hidden="true">
			<input type="submit" class="btn btn-success" name="mailStatus" value="전송">
			<input type="submit" class="btn btn-primary" name="mailStatus" value="임시저장">
		</div>
		</section>
	    </form>
    </c:if>
    <c:if test="${empty mail }">
    	<form action="${path }/mail/sendmail.do" method="post" enctype="multipart/form-data" onsubmit="return mailContentInputHidden()">
    	<section>
    	<div class="sectionHeaderContainer">
	        <div class="senderContainer flex-divcontainer">
	            <div class="padding-top3">
	                <span class="boldtext">보내는 사람</span>
	            </div>
	            <div class="senderInputContainer">
	                <input type="text" class="nonestyle-input" name="senderMailAddress" value="${emp.empEmail }">
	            </div>
	        </div>
	        <div class="receiverContainer flex-divcontainer">
	            <div class="padding-top3">
	                <span class="boldtext">받는사람</span>
	            </div>
	            <div class="myborder-bottom width90" style="display : flex;" id="receiverInputContainer">
	                <div>
	                    <input type="text" name="mailReceiverAddress" class="nonestyle-input" placeholder="받는사람 입력" onblur="changeInputView(event)">
	                </div>
	            </div>
	        </div>
	        <div class="mailTitleContainer flex-divcontainer">
	            <div class="padding-top3">
	                <span class="boldtext">제목</span>
	            </div>
	            <div class="myborder-bottom width90">
	                <input type="text" name="mailTitle" class="nonestyle-input" placeholder="제목입력">
	            </div>
	        </div>
	    </div>
    	<div class="fileContainer flex-divcontainer">
        	<div class="padding-top3 width-7">
                <span class="boldtext">파일 첨부</span>
            </div>
            <div class="width90 fileinput-container">
                <input type="file" class="multiple-files-filepond" name="upFile" multiple>
            </div>
        </div>
	    <div class="border-bottom border-top">
			<div class="row">
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	                        <div id="summernote"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div id="actionContainer">
			<input type="text" name="mailContent" hidden="true">
			<input type="text" name="mailReceiver" hidden="true">
			<input type="submit" class="btn btn-success" name="mailStatus" value="전송">
			<input type="submit" class="btn btn-primary" name="mailStatus" value="임시저장">
		</div>
	    </section>

	    </form>
    </c:if>
    
    <script>
    	document.querySelector("input[name='mailReceiver']").addEventListener("keyup", e => {
    		console.log("이벤트발생");
    	});
    	
    	const mailContentInputHidden = () => {
    		const receiverInputs = document.querySelectorAll("input[name='mailReceiver']");
    		let receiverInputLengthBoolean = true;
    		for(let i = 0; i < receiverInputs.length - 1; i++) {
    			if(receiverInputs[i].value.length == 0) {
    				alert("주소 작성창은 공란일 수 없습니다.");
    				receiverInputLengthBoolean = false;
    			}
    		}
    		if(receiverInputLengthBoolean) return false;
    		
    		const mailContent = document.querySelector("div[class='note-editable']").innerHTML
    		document.querySelector("input[name='mailContent']").value = mailContent;
    		document.querySelector("input[name='mailReceiver']").value = document.querySelector("input[name='mailReceiverAddress']").value;
    		
    		return true;
    	}
    	
    	const fileUploadTest = () => {
    		location.assign("${path }/mail/testuploadfile.do");
    	}
    	<c:if test="${not empty mails.mailTitle }">
    		document.addEventListener("DOMContentLoaded", e => {
    			const tempSaveMailContent = "${mails.mailContent}";
        		document.querySelector("div[class='note-editable']").innerHTML = tempSaveMailContent;	
    		});
    	</c:if>
    	
    	const changeInputView = (e) => {
    		const receiverInputs = document.querySelectorAll("input[name='mailReceiver']");
    		
    		if(e.currentTarget.value.length == 0) {
    			alert("주소를 입력해주세요");
    			return;
    		}
    		
    		if(receiverInputs.length != 4) {
	    	    const $button = document.createElement("button");
	    	    $button.setAttribute("class", "nostyle-btn");
	    	    $button.setAttribute("onclick", "deleteMailReceiver(event)");
	    	    $button.innerText = "x";
	
	    	    const receiverInput = e.currentTarget;
	    	    const inputDiv = e.currentTarget.parentElement;
	    	    const inputContainer = e.currentTarget.parentElement.parentElement;
	    	    console.log(inputContainer)
	    	    
	    	    const div = document.createElement("div");
	    	    const $input = document.createElement("input");
	    	    $input.setAttribute("type", "text");
	    	    $input.setAttribute("name", "mailReceiverAddress");
	    	    $input.setAttribute("class", "nonestyle-input");
	    	    $input.setAttribute("placeholder", "받는사람 입력");
	    	    $input.setAttribute("onblur", "changeInputView(event)");
	
	    	    receiverInput.setAttribute("class", "finishing-receiver-input");
	    	    receiverInput.setAttribute("disabled", "true");
	
	    	    inputDiv.appendChild($button);
	
	    	    div.appendChild($input);
	    	    inputContainer.appendChild(div);
    		} else {
    			alert("수령인은 최대 5명까지 가능합니다.");
    		}
    	}

    	const deleteMailReceiver = (e) => {
    	    const receiverInput = document.querySelectorAll("input[name='mailReceiverAddress']");
    	    e.currentTarget.parentElement.remove();
    	    if(receiverInput.length == 1) {
    	        const $input = document.createElement("input");
    	        $input.setAttribute("type", "text");
    	        $input.setAttribute("name", "mailReceiverAddress");
    	        $input.setAttribute("class", "nonestyle-input");
    	        $input.setAttribute("placeholder", "받는사람 입력");
    	        $input.setAttribute("onblur", "changeInputView(event)");

    	        const div = document.createElement("div");
    	        div.appendChild($input);
    	        document.getElementById("receiverInputContainer").appendChild(div);
    	    }
    	}
    	
    	const goMailMain = () => {
    		const mailContent = document.querySelector("div[class='note-editable']").innerHTML;
    		if(mailContent.length > 0) {
    			const result = confirm("지금까지 작성한것들은 저장되지 않습니다. 정말 나가시겠습니까?");
    			if(result) loaction.assign("${path }/mail/mailmain.do");
    		}
    	}
    </script>
	<script src="${path }/assets/static/js/components/dark.js"></script>
	<script src="${path }/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${path }/assets/compiled/js/app.js"></script>
	<script src="${path }/assets/extensions/jquery/jquery.min.js"></script>
	<script src="${path }/assets/extensions/summernote/summernote-lite.min.js"></script>
	<script src="${path }/assets/static/js/pages/summernote.js"></script>
	<script src="${path }/resources/assets/static/js/components/dark.js"></script>
	<script src="${path }/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${path }/resources/assets/compiled/js/app.js"></script>
	<script src="${path }/resources/assets/extensions/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
	<script src="${path }/resources/assets/extensions/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
	<script src="${path }/resources/assets/extensions/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
	<script src="${path }/resources/assets/extensions/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
	<script src="${path }/resources/assets/extensions/filepond-plugin-image-filter/filepond-plugin-image-filter.min.js"></script>
	<script src="${path }/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
	<script src="${path }/resources/assets/extensions/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
	<script src="${path }/resources/assets/extensions/filepond/filepond.js"></script>
	<script src="${path }/resources/assets/extensions/toastify-js/src/toastify.js"></script>
	<script src="${path }/resources/assets/static/js/pages/filepond.js"></script>
</body>

</html>