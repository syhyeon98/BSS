<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--     <link href="${pageContext.request.contextPath}/resources/js/fancytree/skin-win8/ui.fancytree.min.css" rel="stylesheet"> --%>

    <h4> 조직도 </h4>
	    <div class="d-flex">
			    <div class="" id="treeArea" 
			    	data-source="${pageContext.request.contextPath}/ed/approval/empfancytree.do">
			    </div>
			    <div class="ms-5">
				    <input type="text" id="signpathNm" name="signpathNm" required class="form-control" placeholder="결재선명">
				    <div id="select">
				    </div>
			    </div>
	    </div>
    
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>  -->

<%-- <script src="${pageContext.request.contextPath}/resources/js/fancytree/jquery.fancytree-all-deps.min.js"></script> --%>
<script>
$(document).ready(function () {
	let html;
	let count=1; // 순서를위한
    $("#treeArea").fancytree({
        source: {
            url: $("#treeArea").data("source"),
            cache: false
        },
        activate: function (event, data) {
            let nodeData = data.node.data;
            console.log("nodeData : ",nodeData);
            if(nodeData.empList==null){
            let html = `<div class='d-flex m-auto'><div class='selectEmp me-4' data-empcd=\${nodeData.empCd} >\${nodeData.empPosition}</div>`
            html += `<select class='selectMethod'>
	            		<option value='SD_01'>결재</option>
	            		<option value='SD_02'>협조</option>
	            		<option value='SD_03'>참조</option>
	            		<option value='SD_04'>전결</option>
	            		<option value='SD_05'>대결</option>
            		</select>
            		<a class="ms-4" href="javascript:void(0);" onclick="deleteSignPath(this)">x</a>
            		</div>`
//             let html=`<input type="text" class="selectEmp" name= value='' />`
// 	            let html=`<input type="text" required name="selectEmp[\${count}]" value="\${nodeData.empCd}">`
	            $("#select").append(html);
	            count++;
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




