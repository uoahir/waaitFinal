<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>
	
	<!-- 모달 -->
	<div class="modal fade" id="addEventModal" tabindex="-1" aria-labelledby="addEventModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addEventModalLabel">일정 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="eventForm" action="${pageContext.request.contextPath }/schedule/insertSchedule.do" method='POST'>
                   
                    <div class="mb-3">
                        <label for="scheTitle" class="form-label">일정명</label>
                        <input type="text" class="form-control" id="subject" name="scheTitle" required>
                    </div>
                    <div class="mb-3">
                        <label for="scheContent" class="form-label">일정내용</label>
                        <input type="text" class="form-control" id="title" name="scheContent" required>
                    </div>
                    <div class="mb-3">
                        <label for="scheTime" class="form-label">시작 일자</label>
                        <input type="datetime-local" class="form-control" id="start" name="scheTimeData" required>
                    </div>
                    <div class="mb-3">
                        <label for="scheEnd" class="form-label">종료 일자</label>
                        <input type="datetime-local" class="form-control" id="end" name="scheEndData" required>
                    </div>
                    <div class="mb-12">
                    	<label for="scheColor" class="form-label"> 캘린더 색상</label>
                        <select id="color" name="scheColor">
			              <option value="red">빨강색</option>
			              <option value="orange">주황색</option>
			              <option value="yellow">노랑색</option>
			              <option value="green">초록색</option>
			              <option value="blue">파랑색</option>
			              <option value="indigo">남색</option>
			              <option value="purple">보라색</option>
			            </select>
			            <label for="scheAllDay" class="form-label">종일일정</label>
                        <input type="checkbox" name="scheAllDay" value="true" id="scheAllDay">
                         <label for="schePrivate" class="form-label">개인일정</label>
                        <input type="checkbox" name="schePrivate" value="Y" id="schePrivate">
                    </div>
                   
                    <button
		              type="button"
		              class="btn btn-secondary"
		              data-bs-dismiss="modal"
		            >
		              취소
		            </button>
                    <button type="submit" id="submitButton" class="btn btn-primary">등록</button>
                    <button type="button" id="deleteEvent" class="btn btn-danger">삭제</button>
                </form>
            </div>
        </div>
    </div>
</div>
	

</body>
</html>