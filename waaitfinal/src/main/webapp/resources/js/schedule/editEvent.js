/**
 *  일정 편집
 */

var editEvent=function(event,element,view){
	
	$('#deleteEvent').data('id',event._id);
	$('.popover.fade.top').remove();
	$(element).popover("hide");
				
	 };
	 
	 
	 //삭제버튼
	 $('#deleteEvent').on('click', function(){
		
		$('#deleteEvent').unbind();
		$("#calendar").fullCalendar('removeEvents',$(this).data('id'));
		eventModal.modal('hide');
		
		//삭제시
		$.ajax({
			type:"get",
			url:"",
			data: {
				id:scheNo
			},
			success: function(response){
				alert("삭제되었ㅅㅂ니다");
			}				
		});					
 });
 
 
 
 
 
 