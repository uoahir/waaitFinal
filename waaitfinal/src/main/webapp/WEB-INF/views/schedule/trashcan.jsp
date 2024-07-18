<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	       // event:testEvents(),                    
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
                
        /* // 이벤트 
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
        ], */
        
    /* DB에 있는 일정 가져오는 이벤트 */    
/*         function testEvents(){
      	  var events = [
      		  //DB에서 가져온 이벤트들
      		  <c:forEach var="event" items='${total}'>
      		  	{
      		  		title: '${event.scheTitle}',
      		  		start: '${fn:replace(event.scheTime," ","T")}',
      		  		end: '${fn:replace(event.scheEnd, " ", "T")}',
      		  		allDay: ${event.scheAllDay},
      		  		editable:true		  		
      		  	},
      		  </c:forEach>
      			{
      			    title: '1시 개발팀 코드리뷰',
      	            url: '${path}/codereviewboard/page', // 클릭시 해당 url로 이동
      	            start: '2024-07-28',
      	            editable: true
      			}  
      	  ];
      	  console.log(events);
      	  return events;
        } */




</script>



</body>
</html>