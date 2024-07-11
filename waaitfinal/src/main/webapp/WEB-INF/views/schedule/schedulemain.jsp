<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <title>document</title>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
            events: [
            	<c:forEach var='event' items='${total}'>
            		{
            			title:'${event.scheTitle}',
            			start:'${fn:replace(event.scheTime," ","T")}'
            		},
            	</c:forEach>
                {
                title  : '미국출장', 
                start  : '2024-07-01' 
                },
                {
                title  : '외부출장',
                start  : '2024-07-07',
                end    : '2024-07-13'  
                },
                {
                title  : '인사팀 회의',  
                start  : '2024-07-24T11:30:00',
                allDay : false 
                }
                
            ]


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


