<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

	h6{
		color:blue;
	}
	
</style>

<body>	
	<!-- 일정 상세화면 모달 -->
	<div class="modal fade" id="detailModal2" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addEventModalLabel"><strong>일정 상세</strong></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="eventForm" action="${pageContext.request.contextPath }/schedule/insertSchedule.do" method='POST'>                   
                    <div class="mb-3">
                        <label for="scheTitle" class="form-label"><strong>일정명</strong></label>
                        <h6 id="modalScheTitle" ></h6>                       
                    </div>
                    <div class="mb-3">
                        <label for="scheContent" class="form-label"><strong>일정내용</strong></label>
                        <h6 id="modalScheContent"> </h6>
                    </div>
                    <div class="mb-3">
                        <label for="scheTime" class="form-label"><strong>시작 일자</strong></label>
                        <h6 id="modalScheTime"> </h6>
                    </div>
                    <div class="mb-3">
                        <label for="scheEnd" class="form-label"><strong>종료 일자</strong></label>
                        <h6 id="modalScheEnd"></h6>
                    </div>
                    <div class="mb-12">                    
			            <label for="scheAllDay" class="form-label">종일일정</label>
                        <input type="checkbox" name="scheAllDay" value="true" id="scheAllDay">
                         <label for="schePrivate" class="form-label">개인일정</label>
                        <input type="checkbox" name="schePrivate" value="Y" id="schePrivate">
                        <input type="hidden" id="modalScheNo" name="scheNo">
                    </div>
                   
                    <button
		              type="button"
		              class="btn btn-secondary"
		              data-bs-dismiss="modal"
		            >
		              취소
		            </button>
                    <button type="button" class="btn btn-primary" id="updateEvent">수정</button>
                    <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                </form>
            </div>
        </div>
    </div>
</div>
	

</body>
</html> --%>