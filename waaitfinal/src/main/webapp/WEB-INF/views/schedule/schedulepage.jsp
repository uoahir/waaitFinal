<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="${path}/WEB-INF/views/common/header.jsp" /> 

<section class="section">

	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>			
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ include file="/WEB-INF/views/common/header.jsp" %> --%>

	<!-- 부트스트랩 -->
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="data:image/svg+xml,%3csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2033%2034'%20fill-rule='evenodd'%20stroke-linejoin='round'%20stroke-miterlimit='2'%20xmlns:v='https://vecta.io/nano'%3e%3cpath%20d='M3%2027.472c0%204.409%206.18%205.552%2013.5%205.552%207.281%200%2013.5-1.103%2013.5-5.513s-6.179-5.552-13.5-5.552c-7.281%200-13.5%201.103-13.5%205.513z'%20fill='%23435ebe'%20fill-rule='nonzero'/%3e%3ccircle%20cx='16.5'%20cy='8.8'%20r='8.8'%20fill='%2341bbdd'/%3e%3c/svg%3e" type="image/x-icon">
    <link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">
    
    <link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app.css">
  <link rel="stylesheet" crossorigin href="${path }/resources/assets/compiled/css/app-dark.css">

  <head>
  
	<title>캘린더2</title>
		<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>SCHEDULE</h3>
                <p class="text-subtitle text-muted">일정관리</p>               
            </div>                        
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Calendar</li>
                    </ol>
                </nav>
            </div>            
        </div>
    </div>
   <div>
  	 <form method="post" style="display:flex; align-items: center;">	
       <select id="deptCode" name="deptCode">
		  <option value="">공유캘린더 선택</option>
		  <option value="D1" ${param.deptCode!=null&&param.deptCode=='D1'?"selected":"" }>대표실</option>
		  <option value="D5" ${param.deptCode!=null&&param.deptCode=='D5'?"selected":"" }>경영관리부</option>
		  <option value="D7" ${param.deptCode!=null&&param.deptCode=='D7'?"selected":"" }>인사팀</option>
		  <option value="D6" ${param.deptCode!=null&&param.deptCode=='D6'?"selected":"" }>재정팀</option>
		  <option value="D2" ${param.deptCode!=null&&param.deptCode=='D2'?"selected":"" }>개발부</option>
		  <option value="D3" ${param.deptCode!=null&&param.deptCode=='D3'?"selected":"" }>개발1팀</option>
		  <option value="D4" ${param.deptCode!=null&&param.deptCode=='D4'?"selected":"" }>개발2팀</option>
		  <option value="D8" ${param.deptCode!=null&&param.deptCode=='D8'?"selected":"" }>영업부</option>
		</select>
       <button type="button" id="teamSchedule" name="teamSchedule" class="btn btn-primary"
       ${param.deptCode!=null?"checked":""} onclick="teamSchedule()" 
       style="margin-left:7px;">확인</button>
   	 <label for="mySchedulebox" style="margin-left:50px; margin-right:5px;">내캘린더</label>
   	 <input type="checkbox" id="mySchedulebox" name="mySchedulebox" 
   	 class="form-check-input form-check-primary form-check-glow" style="margin-bottom:5px;">
	</form>
   </div>
	<div>
		<div style="display:flex; align-items:center;">
			<input type="text" class="form-control form-control-sm" id="shceShare" name="shceShare" style="width:180px;" required>
			<button type="button" id="shareButton" class="btn btn-primary" onclick="empline();"chatuserlist
			style="margin-left:7px;">사원조회</button>
		</div>                
	</div>
	<!-- FullCalendar CDN -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
	<!-- FullCalendar 언어 CDN -->
	  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	</head>	
	<style>
		#main {
			background-color : white;
			border-radius : 25px;
		}
	</style> 
	
	<body style="padding:100px;">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/schedule.css">
	
	<!-- editEvent.js -->
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/schedule/editEvent.js"></script> --%>
	
  
	<!-- 모달 자리 -->
	<%@include file="/WEB-INF/views/schedule/addeventmodal.jsp" %>
	 <%@include file="/WEB-INF/views/schedule/detailmodal.jsp"  %>  
  	<div class="card">

	<!-- calendar 태그 -->
	 <div id='calendar-container' style="background-color:white">
		<div id='calendar'></div>
	</div>
	</div>
	

  <script>    
  /* DB에서 일정 뽑아오기 */
	function loadEvents(info, successCallback, failureCallback){
	  var events = [
		  //DB에서 가져온 이벤트들
		  <c:forEach var="event" items='${total}'>
		  	{
		  		color: '${event.scheColor}',
		  		title: '${event.scheTitle}',
		  		start: '${fn:replace(event.scheTime," ","T")}',
		  		end: '${fn:replace(event.scheEnd, " ", "T")}',
		  		allDay: ${event.scheAllDay},
		  		editable:true,
		  		extendedProps:{"content":"${event.scheContent}","schePrivate":"${event.schePrivate}",
		  					"scheNo":"${event.scheNo}","color":"${event.scheColor}"},
		  					"deptCode":"${event.deptCode}"
		  	},
		  </c:forEach>
/* 			{
			    title: '1시 개발팀 코드리뷰',
	            url: '${path}/codereviewboard/page', // 클릭시 해당 url로 이동
	            start: '2024-07-28',
	            editable: true
			}  */ 
	  ];
	  successCallback(events); 	  
  }
         
  var calendar;
  (function(){	 
	  
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      calendar = new FullCalendar.Calendar(calendarEl, {
        height: '650px', // calendar 높이 설정
        aspectRatio: 1,
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '09:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '18:00', // Day 캘린더에서 종료 시간
        customButtons:{
        	myCustomButton:{
        		text:"일정 추가",
        		click: function(){
        			//부트스트랩 모달 열기
        			console.log($('#addEventModal'));
        			$('#addEventModal').modal('show');        			           
	      	          
	       	        $("#addEventModal").find("#subject").val("");
	       	        $("#addEventModal").find("#title").val("");
	       	        $("#addEventModal").find("#addEventModalLabel").text("일정 등록");
	       	        $("#addEventModal").find("#submitButton").text("등록");     
        			
        		}
        	},
/*         	mySaveButton:{
        		text:"저장하기",
        		click: async function(){
        			if(confirm("저장하시겠습니까?")){
        				//지금까지 생성된 모든 이벤트 저장하기
        				var allEvent =calendar.getEvents();
        				//이벤트 저장하기
        				const saveEvent = await axios({
        					method: "POST",
        					url: "/calendar",
        					data: allEvent,
        				});
        			}
        		}
        	} */
        },
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today,myCustomButton,mySaveButton',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },        
        // < 클릭한 날짜와 시간 >
        dateClick: function(info){ 
        	var clickedDate=info.date;
        
      	//로컬 시간대로 포맷팅 함수
        function toDateTimeLocal(date){  
        	 var tzoffset=date.getTimezoneOffset()*60000;
        	 var localISOTime=(new Date(date-tzoffset)).toISOString().slice(0,-1);
        	 return localISOTime.slice(0,16);
        }        	
        $('#addEventModal').modal('show'); //모달 열기 
        
        document.getElementById('start').value=toDateTimeLocal(clickedDate); //모달의 시작시간 필드를 클릭한 날짜와 시간으로 설정
        
        var endDate=new Date(clickedDate); // 모달의 종료 시간 필드도 필요에 따라 설정(여기서는 1시간 후로 설정)
        endDate.setHours(endDate.getHours()+1);
        document.getElementById('end').value=toDateTimeLocal(endDate);        
        },                   
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        //initialDate: '2024-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보임)
        navLinks: true, // 날짜를 선택하면 Day 캘린더로 링크
        editable: true, // 수정 가능? -> 이거 뭔지 모르겠음
        selectable: true, // 달력 일자 드래그해서 선택
        nowIndicator: true, // 현재 시간 마크 @
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+4 이런식으로 표현됨)
        locale: 'ko', // 한국어 설정
        events: loadEvents, // 일정 불러오기(loadEvents 함수 참조)                          
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트 
            console.log(obj);
          },
        eventClick: function(obj){
        	updateSchedule(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트 
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트 
          console.log(obj);
        },
        // < 빈 날짜 누르면 일정추가 >
         select: function(info){
          console.log($('#addEventModal'));
          $('#addEventModal').modal('show'); //일정 추가하는 모달창 띄움
          $('#start').val(info.startStr); 
          $('#end').val(info.endStr);                    
           
          $("#addEventModal").find("#subject").val("");
          $("#addEventModal").find("#title").val("");
          $("#addEventModal").find("#addEventModalLabel").text("일정 등록");
          $("#addEventModal").find("#submitButton").text("등록");                            
          
        }       
                
      });
      // 캘린더 랜더링
      calendar.render();
                  
      // 폼 제출 처리 (상단에 저장하기 버튼)
/*        $('#saveEventButton').click(function(){
    	  var eventData={
                  title: $('#scheTitle').val(),
                  start: $('#scheTime').val(),
                  end: $('#scheEnd').val()	  
    	  }; 
    	  
    	  $.ajax({
    	  type: "POST",
          url: "saveEvent",
          data: eventData,
          success: function(response) {
              $('#addEventModal').modal('hide');
              // 서버로부터 이벤트를 다시 로드하는 등의 작업 수행
              calendar.refetchEvents();
          }
          });
      }); */
  });   
 
  })();
  
  function getFullyearDate(date){
	  	const year = date.getFullYear();
	    const month = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
	    const day = String(date.getDate()).padStart(2, '0');
	    const hours = String(date.getHours()).padStart(2, '0');
	    const minutes = String(date.getMinutes()).padStart(2, '0');
	    const seconds = String(date.getSeconds()).padStart(2, '0');
	    
	    return `\${year}-\${month}-\${day}T\${hours}:\${minutes}:\${seconds}`; 
	    
  }
  
  // 일정수정 모달창 띄움
  function updateSchedule(object){
	  console.log(object);
		const choiceEvent=object.event;
		console.log(choiceEvent);
		const {title,allDay,start,end}=choiceEvent;
		const {content,schePrivate,scheNo,color,deptCode}=choiceEvent.extendedProps;			
		console.log(start,end, typeof start);
	    
		document.getElementById('modalScheNo').value=scheNo;
		document.getElementById('subject').value=title;
		document.getElementById('title').value=content;  
		document.getElementById('start').value=start;
		document.getElementById('end').value=end;
		document.getElementById('scheAllDay').checked=allDay;
		document.getElementById('schePrivate').checked=schePrivate;
		document.getElementById('color').value=color; 
		document.getElementById('deptCode').value=deptCode;
		
		$("#addEventModal").find("#addEventModalLabel").text("일정 수정");
		$("#addEventModal").find("#submitButton").text("수정");				
		$("#addEventModal").find("#start").val(getFullyearDate(start)); 	
		if(end!= null){
			$("#addEventModal").find("#end").val(getFullyearDate(end)); 				
		}else{
			$("#addEventModal").find("#end").val("");
		}
		$("#addEventModal").modal("show");
		
  }
  
         
  // 일정 마우스 호버하면 상세 일정 보여주는 모달창 띄움
     /* $(()=>{    	 
        $(document).on("mouseenter", '.fc-daygrid-day-events', function(e) {
        	const eventTitle=$(e.currentTarget).find(".fc-event-title").text();
        	const choiceEvent=calendar.getEvents().filter(e=>e["title"]===eventTitle)[0];
        	console.log(choiceEvent);
    		const {title,allDay,start,end}=choiceEvent;
    		const {content,schePrivate,scheNo}=choiceEvent.extendedProps;
    		
    		//start와 end를 Date 객체로 변환
    		const startDate=formatDateTime(start);
    		const endDate=formatDateTime(end);    		
    		
    		document.getElementById('modalScheNo').value=scheNo;
    		document.getElementById('modalScheTitle').innerHTML=title;
    		document.getElementById('modalScheContent').innerHTML=content;  
    		document.getElementById('modalScheTime').innerHTML=startDate;
    		document.getElementById('modalScheEnd').innerHTML=endDate;
    		       		 
    		$("#detailModal").modal("show");
        });            */     

        
        //위에서 일정을 클릭함으로써, 클릭한 해당 일정의 정보가 form에 담겨서 들어옴
        //일정삭제 이벤트
 		$("#deleteEvent").click(e=>{
 			$(e.target).parents("form").attr("action","${path}/schedule/deleteSchedule.do");
 			$(e.target).parents("form").submit();
		});                      
        
        //일정수정 이벤트
		$("#submitButton").click(e=>{
			if(e.target.innerText==='수정'){
				console.log(e);
				$(e.target).parents("form").attr("action","${path}/schedule/updateSchedule.do");
			}
			$(e.target).parents("form").submit();
		});
        //팀캘린더 
		$("#teamSchedule").on("click", function(e) {
			var form=$(e.target).closest("form");
			form.attr("action","${path}/schedule/teamSchedule.do");
			form.submit();		    
		});
        
        
  //}) 
  //일정삭제 성공여부 alert창 띄우기
  document.addEventListener("DOMContentLoaded",function(){
  	var msg='${msg}';
  	var loc="${loc}";        	
  	if(msg && msg!=='null'){
  		alert(msg);
  		if(loc && loc !== 'null'){
  			window.location.href=loc;
  		}
  	}
  }); 
    
      //날짜 포맷팅 함수 (모달창에서 날짜 가져오는거 yyyy/mm/dd 이런식으로 써주는 함수)
		function formatDateTime(d){
			console.log(d);
			if(d!=null && typeof d !=='undefined'){
				/* console.log(d.getFullYear()) */
				const year=d.getFullYear();
				const month=d.getMonth()+1;
				const day=d.getDate();
				const hours=d.getHours();
				const minutes=d.getMinutes();							
				return `\${year}/\${month<10?'0'+month:month}/\${day<10?'0'+day:day} \${hours}:\${minutes}`; 
			} 
			return "없음";			
		}
      
      
/*   	 $(()=>{
  		 const mode=$("html").attr("data-bs-theme")
  		console.log(mode);
  		 if(mode==='dark')
  			$("#calendar-container").css("backgoundColor","white");
  		console.log($("#calendar-container"));
  	}); 
  	
  	const htmlTag = document.querySelector("html[lang='en']");
  	if(htmlTag.getAttribute("data-bs-theme") == "dark") {
  		document.getElementById("main").style.backgroundColor = "white";	
  	} */
  	
  	/* 팀캘린더 일정 가져오기 */
/*   	function teamSchedule(){
  		var checkbox=document.getElementById('teamSchedule');
  		if(checkbox.checked){
  			var form=checkbox.closest('form');
  			form.action="${path}/schedule/teamSchedule.do"
  			form.submit();
  		}
  	} */
  	
  	function teamSchedule(){
  		var button=document.getElementById('teamSchedule');
  		var form=button.closest('form');
  		form.action="${path}/schedule/teamSchedule.do";
  		form.submit();
  		
  	}
  	
  	
  	
</script>  

  </body>
</html>





     

</section>
<%-- <jsp:include page="${path}/WEB-INF/views/common/footer.jsp" /> --%>
