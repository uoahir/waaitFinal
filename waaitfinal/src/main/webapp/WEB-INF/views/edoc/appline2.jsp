<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.2/themes/default/style.min.css" />
</head>
<body>

<div id="jstree"></div>
<div id="employeeList"></div>
<button>demo button</button>

<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>

<!-- jsTree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<script>
$(function () { 
    
	$.ajax({
		url: '/api/treedata',
		type: 'GET',
		dataType:'json',
		success: function(data){
			// jstree 에 데이터 추가
			$('#jstree').jstree({
				'core':{
					'data':data
				}
			});
		},
		error: function(xhr, status, error){
			console.error('Failed to load tree data: ', status, error);
		}
	});
});

</script>
</body>
</html>