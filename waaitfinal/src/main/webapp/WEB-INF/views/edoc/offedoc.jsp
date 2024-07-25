<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
</head>

<style>
	
	div.approval div{
		width : 90px;
		border : 1px solid grey;
	}

</style>

<section class="container">
	<div class="card mt-5">
		<div class="card-header">
			<h2 class="card-title">OFF APPLICATION</h2>
	    </div>
	    <div class="card-body">
			<form action="${path }/edoc/offedocend" id="docForm" method="POST">
				<div id="button" style="text-align: right;">
					<button type="button" onclick="appline();" class="btn btn-outline-secondary">Approval Line</button>
					<button type="button" class="btn btn-outline-secondary" onclick="insertoff();">Submission</button>
					<button type="button" class="btn btn-outline-secondary" onclick="save();">Save</button>
					<button type="button" class="btn btn-outline-secondary">Print Preview</button>
				</div>
				<div class="line mt-3" style="width:100%; height:120px;"></div>
				<div class="card-body d-flex" style = "width:100%;">
					<div class="form-group row align-items-center d-flex" style = "width:100%;"> 
						<div class="col-lg-1 col-3" style = "margin-left:5px;">
						    <label class="col-form-label" for="docTitle">Title</label>
						</div>
						<div class="col-lg-2 col-3">
						    <input type="text" class="form-control" name="docTitle" value = "휴가신청서" readOnly>
						</div>
						
						<div class="col-lg-2 col-3" style="margin-left:360px;">
						    <input type="text" class="form-control" id = "deptName" name="deptName" value = "${employee.department.deptName }" readOnly>
						</div>
						<div class="col-lg-2 col-3">
						    <input type="text" class="form-control" id = "empName" name="empName" value = "${employee.empName }" readOnly>
						</div>
						<input type="hidden" id = "docWriter" name="docWriter" value = "${employee.empNo }">
						
					</div>
				</div>
				
				<div class ="card-body">
					<!-- 여기에는 휴가신청에 필요한 input 데이터들 넣기 ~ ! -->
					<div class="form-group row align-items-center"> 
						<div class="col-md-3">
							<div class="input-group">
							<label class="input-group-text" for="inputGroupSelect01">Type</label>
								<select class="form-select" id="inputGroupSelect01">
								    <option value="none">휴가종류</option>
								    <option value="연차">연차</option>
								    <option value="오전반차">오전반차</option>
								    <option value="오후반차">오후반차</option>
								    <option value="오후반차">공가</option>
								    <option value="병가">병가</option>
								    <option value="조퇴">조퇴</option>
								</select>
							</div>
						</div>
						<div class="col-lg-1 col-2">
						    <label class="col-form-label" for="startDate">Start Date</label>
						</div>
						<div class="col-lg-3 col-9">
						    <input type="datetime-local" id="startDate" class="form-control" name="startDate">
						</div>
						<div class="col-lg-1 col-2">
						    <label class="col-form-label" for="endDate">End Date</label>
						</div>
						<div class="col-lg-3 col-9">
						    <input type="datetime-local" id="endDate" class="form-control" name="endDate">
						</div>
						<div class="card-body">
	                        <div class="form-floating col-lg-100 col-11">
	                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
	                            <label for="floatingTextarea">Reason</label>
	                        </div>
                    	</div>
					</div>
					
				</div>
				
				<div class="card-body">
					<div id="life" class = "d-flex ">
						<div class="mt-1" style = "margin-right:10px;">
							<h6>보존연한</h6>
						</div>
						<div class="form-check" style = "margin-right:10px;">
							<input class="form-check-input" type="radio" name="docLife"
							id="1" value="1"> 
							<label for="1" class="form-check-label">1년 </label> 
						</div>
						<div class="form-check" style = "margin-right:10px;">
							<input class="form-check-input" type="radio" name="docLife"
							id="3" value="3"> 
							<label for="3" class="form-check-label">3년 </label> 
						</div>
						<div class="form-check" style = "margin-right:10px;">
							<input class="form-check-input" type="radio" name="docLife"
							id="5" value="5"> 
							<label for="5" class="form-check-label">5년 </label> 
						</div>
						<div class="form-check" style = "margin-right:10px;">
							<input class="form-check-input" type="radio" name="docLife"
							id="10" value="10"> 
							<label for="10" class="form-check-label">10년 </label> 
						</div>
						<div class="form-check" style = "margin-right:10px;">
							<input class="form-check-input" type="radio" name="docLife"
							id="permanent" value="permanent"> 
							<label for="permanent" class="form-check-label">영구 </label> 
						</div>
					</div>
					<div id="open" class = "d-flex">
						<div class="mt-1" style = "margin-right:10px;">
							<h6>보안등급</h6>
						</div>
						<div class="form-check" style = "margin-right:10px;">
							<input class="form-check-input" type="radio" name="docOpen"
							id="a" value="all">
							<label for="a" class="form-check-label">전체공개 </label> 
						</div>
						<div class="form-check" style = "margin-right:10px;">
							<input class="form-check-input" type="radio" name="docOpen"
							id="b" value="dept">
							<label for="b" class="form-check-label">부서공개 </label> 
						</div>
						<div class="form-check" style = "margin-right:10px;">
							<input class="form-check-input" type="radio" name="docOpen"
							id="c" value="private">
							<label for="c" class="form-check-label">비공개 </label> 
						</div>
					</div>
				</div>
				<input type="hidden" name="docType" value="${type}">
			</form>
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
    function setApprovalLine(employees) {
        const $docForm = document.getElementById("docForm");
        const $lineDiv = document.querySelector(".line");

        // 기존의 div.line을 비워줍니다.
        $lineDiv.innerHTML = '';

       	const $divFlex = document.createElement("div");
       	$divFlex.classList.add("d-flex");
       	$divFlex.setAttribute("style","float: right;")
       	
       	const $wDiv = document.createElement("div");
       	$wDiv.classList.add('approval');
       	
       	const $wStatDiv = document.createElement("div");
       	$wStatDiv.innerText = "기안";
       	
       	const $wDivTeam = document.createElement("div");
       	$wDivTeam.innerText = employee.deptName;
       	
       	const $wDivEmp = document.createElement("div");
       	$wDivEmp.innerText = employee.empName + " " + employee.levelName;
       	
       	const $wDivSign = document.createElement("div");
        $wDivSign.setAttribute('style','width:90px; height: 50px;')
       	
       	$wDiv.appendChild($wStatDiv);
       	$wDiv.appendChild($wDivTeam);
       	$wDiv.appendChild($wDivSign);
       	$wDiv.appendChild($wDivEmp);
       	
       	$divFlex.appendChild($wDiv);
       	$lineDiv.appendChild($divFlex);
       	
       	
        // 새로운 div 요소 생성 및 설정
        for (let e of employees) {
        	
            const $div = document.createElement("div");
            $div.classList.add('approval'); // ID를 클래스로 변경
            //$div.style.display = 'flex'; // 예시 스타일: Flexbox 사용

            const $divStat = document.createElement("div");
            $divStat.innerText = "결재";
            
            const $divTeam = document.createElement("div");
            $divTeam.innerText = e.deptName;

            const $divEmp = document.createElement("div");
            $divEmp.innerText = e.empName + " " + e.levelName;
			
            const $divSign = document.createElement("div");
            $divSign.setAttribute('style','width:90px; height: 50px;')
            
            const $inputNo = document.createElement("input");
            $inputNo.setAttribute('type', 'hidden');
            $inputNo.setAttribute('value', e.empNo);
            $inputNo.setAttribute('name', 'empNo');

            $div.appendChild($divStat);
            $div.appendChild($divTeam);
            $div.appendChild($divSign);
            $div.appendChild($divEmp);
            $div.appendChild($inputNo);

            // line div에 새로운 div 요소를 추가합니다.
            $divFlex.appendChild($div);
            $lineDiv.appendChild($divFlex);
            
        }
    }
    
	const insertedoc = () => {
		const form = document.getElementById("docForm");
			const formData = new FormData(form);
            /* const content = document.querySelector("#basicContent").value; */
            const basicContent = document.querySelector(".ck-content").innerHTML;
            console.log(basicContent);
            document.querySelector("#basicContent").setAttribute("value",basicContent);
			const content = document.querySelector("#basicContent").value;
			console.log(content);          
			
           const obj = {
			  docTitle: formData.get("docTitle"),
              docWriter: formData.get("docWriter"),
              docLife: formData.get("docLife"),
              docOpen: formData.get("docOpen"),
              docContent : content,
              docType : formData.get("docType")
           };

           const jsonData = new Blob([JSON.stringify(obj)], { type: 'multipart/form-data' });
           formData.append('obj', jsonData);

           fetch('${path}/edoc/basicedocend', {
               method: "POST",
               /* headers:{
               	'Content-Type':'multipart/form-data'	
               }, */ 
               body: formData
           })
           .then((res) => {
               if (!res.ok) {
                   throw new Error('네트워크 응답이 좋지 않습니다.');
               } else {
					alert("상신완료");
   					opener.document.location.reload();
   					self.close();
               }
           })
           .catch((error) => {
               console.error('오류 발생:', error);
           });
       };

	const appline = () => {
		window.open("${path}/edoc/appline", "appline", "height=500, width=500");
	};

    </script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
<script src="/assets/static/js/pages/ckeditor.js"></script>

</section>
    <script src="${path }/resources/assets/compiled/js/app.js"></script>

<%-- <jsp:include page="${path}/WEB-INF/views/common/footer.jsp" /> --%>