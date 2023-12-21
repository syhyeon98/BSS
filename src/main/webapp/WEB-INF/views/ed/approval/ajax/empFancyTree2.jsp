<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--     <link href="${pageContext.request.contextPath}/resources/js/fancytree/skin-win8/ui.fancytree.min.css" rel="stylesheet"> --%>

    <h4> 조직도 </h4>
	    <div class="d-flex">
			    <div class="" id="treeArea2" 
			    	data-source="${pageContext.request.contextPath}/ed/approval/empfancytree2.do">
			    </div>
			    <div class="ms-5">
				    <div id="selectHelp2">
				    </div>
			    </div>
	    </div>
    
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>  -->

<%-- <script src="${pageContext.request.contextPath}/resources/js/fancytree/jquery.fancytree-all-deps.min.js"></script> --%>
<script>
$(document).ready(function () {
	let html;
	let count2=1; // 순서를위한
    $("#treeArea2").fancytree({
        source: {
            url: $("#treeArea2").data("source"),
            cache: false
        },
        activate: function (event, data) {
            let nodeData2 = data.node.data;
            console.log("nodeData2 : ",nodeData2);
            if(nodeData2.empList==null){
            console.log(nodeData2)
            let html2 = `<div class='d-flex m-auto'><div class='selectEmp me-4' data-empcd=\${nodeData2.empCd} >\${nodeData2.empPosition}</div>`
            html2 += `
            		<a class="ms-4" href="javascript:void(0);" onclick="deleteSignPath(this)">x</a>
            		</div>`
	            $("#selectHelp2").append(html2);
	            count2++;
            }
        }
        // 추가 설정
    });
});

function deleteSignPath(linkElement){

	console.log(linkElement);
	$(linkElement).parent().remove();
}

</script>




