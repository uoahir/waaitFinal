<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ include file="/WEB-INF/views/common/header.jsp" %> --%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
	<title>캘린더2</title>
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>			

	<!-- 원래 코드 -->
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> 
	
	<!-- FullCalendar CDN -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
	<!-- FullCalendar 언어 CDN -->
	  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	</head>
	
	<body style="padding:100px;">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/schedule.css">
  
	<!-- 모달 자리 -->
	<%@include file="/WEB-INF/views/schedule/addeventmodal.jsp" %>
	<%@include file="/WEB-INF/views/schedule/detailmodal.jsp"  %> 
  
	<!-- calendar 태그 -->
	 <div id='calendar-container'>
		<div id='calendar'></div>
	</div>
	

  <script>  
  
  /* DB에서 일정 뽑아오기 */
	function loadEvents(info, successCallback, failureCallback){
	  var events = [
		  //DB에서 가져온 이벤트들
		  <c:forEach var="event" items='${total}'>
		  	{
		  		title: '${event.scheTitle}',
		  		start: '${fn:replace(event.scheTime," ","T")}',
		  		end: '${fn:replace(event.scheEnd, " ", "T")}',
		  		allDay: ${event.scheAllDay},
		  		editable:true,
		  		extendedProps:{"content":"${event.scheContent}","schePrivate":"${event.schePrivate}","scheNo":"${event.scheNo}"},
		  	},
		  </c:forEach>
			{
			    title: '1시 개발팀 코드리뷰',
	            url: '${path}/codereviewboard/page', // 클릭시 해당 url로 이동
	            start: '2024-07-28',
	            editable: true
			}  
	  ];
	  successCallback(events); 	  
  }                                                                                                       
  
  
  /*  */
  var calendar;
  (function(){	 
	  
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      calendar = new FullCalendar.Calendar(calendarEl, {
        height: '550px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '09:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '18:00', // Day 캘린더에서 종료 시간
        customButtons:{
        	myCustomButton:{
        		text:"일정 추가하기",
        		click: function(){
        			//부트스트랩 모달 열기
        			$('#addEventModal').modal('show');
        		}
        	},
        	mySaveButton:{
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
        	}
        },
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today,myCustomButton,mySaveButton',
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
        events: loadEvents, // 일정 불러오기(loadEvents 함수 참조)  
                
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
          	$('#addEventModal').modal('show'); //일정 추가하는 모달창 띄움
            $('#start').val(info.startStr); 
            $('#end').val(info.endStr);               
          }
        
        //그냥 클릭해서 파란거 추가되는 것 -> ㄱ 
/*         dateClick: function(info){ 
        	console.log("Clicked event occurs : date = " + info.dateStr); 
        	//info.dateStr이거는 클릭한 날짜를 string값으로 넣어주는거         	
        	//calendar.addEvent({start: info.dateStr});  -> 이거 밑에 함수로 뺏음             	
        	addEventToCalendar({start: info.dateStr});
        } */
                
      });
      // 캘린더 랜더링
      calendar.render();
      
      
      
      // 폼 제출 처리 (상단에 저장하기 버튼)
      $('#saveEventButton').click(function(){
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
      });
  });   
    // ㄱ에 대한 이벤트
/* 	function addEventToCalendar(event){
		calendar.addEvent(event);
	} */
 
  })();
  
  // 일정 클릭하면 상세 일정 보여주는 모달창 띄움
   $(()=>{    	 
        $(document).on("click", '.fc-daygrid-day-events', function(e) {
        	const eventTitle=$(e.currentTarget).find(".fc-event-title").text();
        	const choiceEvent=calendar.getEvents().filter(e=>e["title"]===eventTitle)[0];
        	console.log(choiceEvent);
    		const {title,allDay,start,end}=choiceEvent;
    		const {content,schePrivate,scheNo}=choiceEvent.extendedProps;
    		
    		//start와 end를 Date 객체로 변환
    		const startDate=formatDateTime(start);
    		const endDate=formatDateTime(end);    		
    		
    		document.getElementById('modalScheTitle').innerHTML=title;
    		document.getElementById('modalScheContent').innerHTML=content;  
    		document.getElementById('modalScheTime').innerHTML=startDate;
    		document.getElementById('modalScheEnd').innerHTML=endDate;
    		       		
    		$("#detailModal").modal("show");
        });    		        		
  	/* $(document).on("mouseleave",'.fc-daygrid-day-events',(e)=>{
	 // alert('나갔다');
  	}); */
  })  
    
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
  
</script>  
	
	
	


  </body>
</html>


