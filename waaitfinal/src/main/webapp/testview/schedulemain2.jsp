<!DOCTYPE html>
<html lang='ko'>
  <head>
    <title>document</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
            events: [
                {
                title  : '미국출장', 
                start  : '2024-07-01' 
                }
                {
             title : ${schedule.scheduleTitle},
             start : ${schedule.startNo}
              }   
            ]


        });
        calendar.render();
      });

    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>

<!-- 	var events =list.map(schedule=>{
	
	}) -->


