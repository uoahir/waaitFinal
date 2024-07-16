<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ include file="/WEB-INF/views/common/header.jsp" %> --%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <title>document</title>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script> 
    
    <!--  -->       
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
<body style="padding:30px;">
  <!-- calendar 태그 -->
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
  
  <script>
  
  
  
  </script>
       
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          selectable: true,
            events: [
            	<c:forEach var='event' items='${total}'>
            		{
            			title:'${event.scheTitle}',            			
            			start:'${fn:replace(event.scheTime," ","T")}',
            			end:'${fn:replace(event.scheEnd," ","T")}',
            			allDay:${event.scheAllDay},
            			editable: true
            		},
            	</c:forEach>
               /*  {
                title  : '미국출장', 
                start  : '2024-07-01' 
                },
                {
                title  : '외부출장',
                start  : '2024-07-07',
                end    : '2024-07-13'  
                }, */
                {
                title  : '스케줄1팀 회의',  
                start  : '2024-07-24T11:30:00',           
                allDay : true,
                editable: true
                }                 
            ],
        
            dateClick: function(info){
            	console.log("Click event occurs : date =" +info.dateStr); 
            	//info.dateStr이거는 클릭한 날짜를 string값으로 넣어주는거 
            	
            	calendar.addEvent({start: info.dateStr});
            	
            }
        


        });
        calendar.render();
      });

    </script>
  </head>
  <body>
    <div id='calendar'></div>
    ${total }
  </body>
</html>

<!-- 	var events =list.map(schedule=>{
	
	}) -->

<%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>

