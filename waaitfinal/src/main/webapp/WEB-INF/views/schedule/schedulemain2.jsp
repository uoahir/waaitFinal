<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ include file="/WEB-INF/views/common/header.jsp" %> --%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
  <title>캘린더2</title>
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  </head>
  <body>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/schedule-color-holiday.css">
  <c:import url="${pageContext.request.contextPath}/WEB-INF/views/schedule/addeventmodal.html" />
  		 

	<style>
	  /* body 스타일 */
	  html, body {
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
	  }
	  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
	  .fc-header-toolbar {
	    padding-top: 1em;
	    padding-left: 1em;
	    padding-right: 1em;
	  }
	</style>
</head>


<body style="padding:100px;">
  <!-- calendar 태그 -->
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
  <script>  
  
  var calendar;
  (function(){	 
	  
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      calendar = new FullCalendar.Calendar(calendarEl, {
        height: '550px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        //initialDate: '2024-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보임)
        navLinks: true, // 날짜를 선택하면 Day 캘린더로 링크
        editable: true, // 수정 가능? -> 이거 뭔지 모르겠음
        selectable: true, // 달력 일자 드래그해서 선택
        nowIndicator: true, // 현재 시간 마크 @
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+4 이런식으로 표현됨)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트 
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트 
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트 
          console.log(obj);
        },
         select: function(info){
        	$('#addEventModal').modal('show'); 
            $('#start').val(info.startStr); 
            $('#end').val(info.endStr);        	
        },
        event: loadEvents, // 일정 불러오기(loadEvents 함수 참조)  
        
        
        
        
        //팝업창 띄워서 간단하게 일정추가 
/*          select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('일정추가');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },  */
        // 이벤트 
        events: [
        	//DB에서 내정보 가져와서 띄워주는 것
        	<c:forEach var='event' items='${total}'>
	    		{
	    			title:'${event.scheTitle}',            			
	    			start:'${fn:replace(event.scheTime," ","T")}',
	    			end:'${fn:replace(event.scheEnd," ","T")}',
	    			allDay:${event.scheAllDay},
	    			editable: true
	    		},
	    	</c:forEach>
          {
            title: '1시 개발팀 코드리뷰',
            url: "${path }/codereviewboard/page", // 클릭시 해당 url로 이동
            start: '2024-07-28',
            editable: true
          }
        ],
        
        //그냥 클릭해서 파란거 추가되는 것 - ㄱ 
        dateClick: function(info){ 
        	console.log("Clicked event occurs : date = " + info.dateStr); 
        	//info.dateStr이거는 클릭한 날짜를 string값으로 넣어주는거         	
        	//calendar.addEvent({start: info.dateStr});  -> 이거 밑에 함수로 뺏음             	
        	addEventToCalendar({start: info.dateStr});
        }
                
      });
      // 캘린더 랜더링
      calendar.render();
    });
    
    
    // ㄱ에 대한 이벤트
	function addEventToCalendar(event){
		calendar.addEvent(event);
	}
 
  })();
</script>  
	
	
	


  </body>
</html>


