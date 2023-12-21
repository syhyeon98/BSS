<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<h5>☗ 전자결재 ▸ 결재문서 ▸ 반려문서함</h5>
<hr color="black"/>

<div id="documentArea">

</div>

<!-- 페이징 혹은 쭉 나오게 -->

<script>
	
let data1;

// 문서리스트 불러오기
$(document).ready(function(){
	let code= $(".form-select option:selected").val()
// 	let detailCondition ={
// 		code:code
// 	}
	let data1 = {
			currentPage : 1
// 			,detailCondition:detailCondition
	};
	console.log("시작페이지 : " , data1)
	callDocumentList(data1);
 });

// 페이지 선택시
function fn_paging(page){
	let code= $(".form-select option:selected").val()
// 	let detailCondition ={
// 		code:code
// 	}
	data1 ={
		currentPage:page
// 		,detailCondition:detailCondition
	}
	callDocumentList(data1)
};

// documentList부르기
function callDocumentList(data1){
	console.log("callDocumentList : " , data1)
	let setting = {
			url : `${pageContext.request.contextPath}/ed/document/documentReturnAjaxList.do`,
			method : "POST",
			dataType : "text",
			data : JSON.stringify(data1),
			contentType:"application/json",
			success : function(resp) {
				console.log(resp)
				$("#documentArea").html(resp)
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
}

// $(".form-select").on("change",function(){
	
// 	let code= $(".form-select option:selected").val()
// 	let detailCondition ={
// 		code:code
// 	}
// 	data1 ={
// 		currentPage:1,
// 		detailCondition:detailCondition
// 	}
// 	callDocumentList(data);
// })
	
</script>