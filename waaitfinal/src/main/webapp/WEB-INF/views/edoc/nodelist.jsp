<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Org Chart Example</title>
 <!--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/orgchart@3.8.0/dist/js/orgchart.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/orgchart/2.1.1/js/jquery.orgchart.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/orgchart@3.0.7/dist/orgchart.min.css">
    <script src="https://cdn.jsdelivr.net/npm/orgchart@3.0.7/dist/orgchart.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/orgchart@3.8.0/dist/css/orgchart.min.css"> -->
    <script src="https://balkan.app/js/orgchart.js"></script>

    <style>
        #chart-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .orgchart {
            background: #fff;
        }
        
    </style>
<!-- <style>
	.employee {
	    font-family: Arial, sans-serif;
	    font-size: 14px;
	}
	.name {
	    font-weight: bold;
	}
	.employees {
	    white-space: pre-line; /* 줄 바꿈을 지원하도록 설정 */
	}
</style> -->
</head>
<body>
<div id="tree"></div>

<!-- <div class="container">
    <h1 class="text-center mt-5">Organization Chart</h1>
    <div id="chart-container"></div>
</div> -->



<script>
document.addEventListener("DOMContentLoaded", function () {
    fetch('/api/nodeData')
        .then(response => response.json())
        .then(data => {
        	console.log(data);
        	
            var chart = new OrgChart(document.getElementById("tree"), {
            	nodeBinding: {
                    field_0: "name"
                },
                nodes: data
            });
        })
        .catch(error => console.error('Error fetching org chart data:', error));
});


</script>


<!-- <script>
document.addEventListener("DOMContentLoaded", function () {
    fetch('/api/nodeData')
        .then(response => response.json())
        .then(data => {
            console.log(data);
            
            // 각 사원 정보를 여러 줄로 변환
            data.forEach(node => {
                if (node.employees) {
                    // 텍스트를 여러 줄로 나누기
                    node.employees = node.employees.join('\n');
                }
            });

            // OrgChart 설정
            var chart = new OrgChart(document.getElementById("tree"), {
                nodeBinding: {
                    field_0: "name",
                    field_1: "employees" // employees를 줄 바꿈으로 처리
                },
                templates: {
                    employee: `
                        <div class='employee'>
                            <div class='name'>{{name}}</div>
                            <div class='employees'>{{employees}}</div>
                        </div>`
                },
                nodes: data
            });
        })
        .catch(error => console.error('Error fetching org chart data:', error));
});
</script> -->
</body>
</html>