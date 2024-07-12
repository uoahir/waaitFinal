<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div id="employeeList">
		<div>조직도</div>
	
	
	</div>
	
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script>
	$(document).ready(function() {
		// 문서가 로드되면 실행될 코드
		$.ajax({
			url: '/api/employees',
			type: 'GET',
			dataType: 'json',
			success: function(data) {
				var employeeListContainer = $('employeeList');
				employeeListContainer.empty(); // 기존 목록 초기화
				$.each(data, function(index,employee) {
					var employeeDiv = $('<div class = "employee-item"></div>')
							.text(employee.department.deptName+' '+employee.jobLevel.levelName + ' ' + employee.empName)
										
					employeeListContainer.append(employeeDiv);
				});
			},
			error : function(xhr, status, error){
				console.error('Failed to load employee data : ', status, error);
			}
		});
	});
</script>
</body>
</html>