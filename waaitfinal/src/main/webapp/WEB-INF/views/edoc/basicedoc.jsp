<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="${path}/WEB-INF/views/common/header.jsp" />
<c:set var="employee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />


<!-- <style>
	div.approval {
		margin-top: 20px;
		width: 100px;
		height: 100px
	}
	
	div.line {
		display: flex;
		width: 100%;
		height: 150px;
	}
	
	div.flex{
		display: flex;
	}
	
	div#title{
		width: 50%; 
	
	}
</style> -->
<section class="section">
	<div class="card">
		<div class="card-header">
			<h2 class="card-title">Business Report</h2>
	    </div>
	    <div class="card-body">
			<form action="${path }/edoc/basicedocend" id="docForm" method="POST"
				enctype="multipart/form-data">
				<div id="button" style="text-align: right;">
					<button type="button" onclick="appline();" class="btn btn-outline-secondary">Approval Line</button>
					<button type="button" class="btn btn-outline-secondary" onclick="insertedoc();">Submission</button>
					<button type="button" class="btn btn-outline-secondary" onclick="save();">Save</button>
					<button type="button" class="btn btn-outline-secondary">Print Preview</button>
				</div>
				<div class="line mt-5" style="width:100%; height:90px;"></div>
				<div class="card-body d-flex">
					<div id="title" style="width:50%;">
						<label for="docTitle">Title
						<input class = "round form-controll" type="text" id="docTitle" name="docTitle"></label>
					</div>
					<div id="writer" style="width:50%;">
						<input type="text" id="deptName" id="deptName"
							value="${employee.department.deptName }" readOnly /> <input
							type="text" id="empName" name="empName" value=${employee.empName }
							readOnly> <input type="hidden" id="docWriter"
							name="docWriter" value=${employee.empName }>
					</div>
				</div>
				<div id="content">
					<div class="card-body">
                        <div id="editor" style="display: none;">

                        </div>
                    </div>			

					<!-- <textarea name="basicConent" id="basicContent"></textarea> -->
				</div>
				<div id="life">
					보존연한 <label for="1"> <input type="radio" name="docLife"
						id="1" value="1" checked> 1년
					</label> <label for="3"> <input type="radio" name="docLife" id="3"
						value="3"> 3년
					</label> <label for="5"> <input type="radio" name="docLife" id="5"
						value="5"> 5년
					</label> <label for="10"> <input type="radio" name="docLife" id="10"
						value="10"> 10년
					</label> <label for="permanent"> <input type="radio" name="docLife"
						id="permanent" value="permanent"> 영구
					</label>
				</div>
				<div id="open">
					보안등급 <label for="a"> <input type="radio" name="docOpen"
						id="a" value="all" checked> a
					</label> <label for="b"> <input type="radio" name="docOpen" id="b"
						value="dept"> b
					</label> <label for="c"> <input type="radio" name="docOpen" id="c"
						value="private"> c
					</label>
				</div>
				<div>
					<input type="file" name="docFile" multiple>
				</div>
				<input type="hidden" name="docType" value="${type}">
			</form>
		</div>
	</div>
	<script>
    	var path = "${path}";
    </script>
	<script>
    
    /* function setApprovalLine(employees) {
    	console.log(employees);
    	const $docForm = document.getElementById("docForm");
    	const $divFlex = document.querySelector(".line");
    	
    	for(let e of employees){
    		console.log(e.empName);
    		
    		const $div = document.createElement("div"); 
    		$div.id = 'approval';
    		
    		const $divTeam = document.createElement("div");
    		$divTeam.innerText = e.deptName;
    		
    		const $divEmp = document.createElement("div");
    		$divEmp.innerText=e.empName;
    		$divEmp.innerText+=" ";
    		$divEmp.innerText+=e.levelName;
    		
    		
    		$div.appendChild($divTeam);
    		$div.appendChild($divEmp);
    		
    		const $inputNo = document.createElement("input");
    		$inputNo.setAttribute('type','hidden');
    		$inputNo.setAttribute('value',e.empNo);
    		$inputNo.setAttribute('name','empNo');
    		
    		$div.appendChild($inputNo);
    		$divFlex.appendChild($div);
    		$docForm.appendChild($divFlex);
    	}
    } */
    
    function setApprovalLine(employees) {
        const $docForm = document.getElementById("docForm");
        const $lineDiv = document.querySelector(".line");

        // 기존의 div.line을 비워줍니다.
        $lineDiv.innerHTML = '';

       	const $divFlex = document.createElement("div");
       	$divFlex.classList.add("d-flex");
       	$divFlex.setAttribute("style","float: right;")
        // 새로운 div 요소 생성 및 설정
        for (let e of employees) {
        	
            const $div = document.createElement("div");
            $div.classList.add('approval'); // ID를 클래스로 변경
            //$div.style.display = 'flex'; // 예시 스타일: Flexbox 사용
            $div.style.justifyContent = 'center'; // 예시 스타일: 양쪽 정렬

            const $divTeam = document.createElement("div");
            $divTeam.innerText = e.deptName;

            const $divEmp = document.createElement("div");
            $divEmp.innerText = e.empName + " " + e.levelName;
			
            const $divSign = document.createElement("div");
            
            const $inputNo = document.createElement("input");
            $inputNo.setAttribute('type', 'hidden');
            $inputNo.setAttribute('value', e.empNo);
            $inputNo.setAttribute('name', 'empNo');

            $div.appendChild($divTeam);
            $div.appendChild($divEmp);
            $div.appendChild($divSign);
            $div.appendChild($inputNo);

            // line div에 새로운 div 요소를 추가합니다.
            $divFlex.appendChild($div);
            $lineDiv.appendChild($divFlex);
            
        }
    }

    
	const insertedoc = () => {
		const form = document.getElementById("docForm");
           const formData = new FormData(form);
           const content = document.querySelector("#basicContent").value;
			
           const obj = {
			  docTitle: formData.get("docTitle"),
              docWriter: formData.get("docWriter"),
              docLife: formData.get("docLife"),
              docOpen: formData.get("docOpen"),
              docContent : content,
              docType : formData.get("docType")
           };

           const jsonData = new Blob([JSON.stringify(obj)], { type: 'multipart/form-data' });
           formData.append('obj', jsonData);

           fetch('${path}/edoc/basicedocend', {
               method: "POST",
               /* headers:{
               	'Content-Type':'multipart/form-data'	
               }, */ 
               body: formData
           })
           .then((res) => {
               if (!res.ok) {
                   throw new Error('네트워크 응답이 좋지 않습니다.');
               }
               return res.text();
           })
           .then((data) => {
               console.log(data);
           })
           .catch((error) => {
               console.error('오류 발생:', error);
           });
       };

	const appline = () => {
		window.open("${path}/edoc/appline", "appline", "height=500, width=500");
	};
 
    </script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
<script src="/assets/static/js/pages/ckeditor.js"></script>

</section>
<jsp:include page="${path}/WEB-INF/views/common/footer.jsp" />