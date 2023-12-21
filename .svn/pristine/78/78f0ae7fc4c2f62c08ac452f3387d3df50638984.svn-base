<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>


<title>문의사항수정폼</title>
<h5>문의사항수정</h5>
<hr color="black">

<form:form id="reqSave" method="post" modelAttribute="req" entype="multipart/form-data">
<div>
	<table class="table table-bordered table-hover">
	<tbody>
	<tr>
			<form:hidden path="reqNo" class="form-control"/>
			<form:errors path="reqNo" class="error" />
			
		<th>제목</th>
		<td>
			<form:input path="reqTtl" class="form-control"/>
			<form:errors path="reqTtl" class="error" />
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<form:textarea path="reqCn" class="form-control"/>
			<form:errors path="reqCn" class="error" />
		</td>
	</tr>
</tbody>
</table>
</div>

<div style="position:absolute;right:25px;buttom:0px;">
			<a href="<c:url value='/board/reqDetail'/>" class="btn btn-danger btn-sm">취소</a>
			<input onclick="reqSave()" type="submit" value="저장" class="btn btn-primary btn-sm"/>
</div>
</form:form>

<script>
	CKEDITOR.replace('reqCn');
	
	function reqSave(){
		alert("수정완료");
	}
</script>