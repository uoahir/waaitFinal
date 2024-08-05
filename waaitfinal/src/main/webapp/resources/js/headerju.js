/**
 * 
 */
/* 채팅방 열기 */
 const chattingOpen=()=>{
		
		window.open(path+"/chat/open.do","chatting","top=100, left=200, height=700, width=550");
	}
	
/* 조직도 */
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
            
            setTimeout(() => {
	            document.getElementById("tree").querySelector("svg").setAttribute("viewBox", "0 -100 1650 700");				
			}, 1000);
        })
        .catch(error => console.error('Error fetching org chart data:', error));
});
 