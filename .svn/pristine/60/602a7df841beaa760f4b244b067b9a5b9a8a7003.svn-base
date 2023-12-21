<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>

<h5>칭찬글 수정</h5>
<hr color="black">
<form:form method="post" modelAttribute="compl">
	<input type="hidden" name="empCd" value="${compl.empCd }">
	<input type="hidden" name="complNo" value="${compl.complNo }">
	<table class="table table-bordered table-hover">
		<tbody>
			<tr>
				<th>작성자</th>
				<td>${compl.empName }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
				<form:input path="complTtl" class="form-control" /> 
				<form:errors path="complTtl" class="error" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				<form:textarea path="complCn" class="form-control" /> 
				<form:errors path="complCn" class="error" /></td>
			</tr>
		</tbody>
	</table>
	<div style="position: absolute; right: 25px; buttom: 0px;">
		<input type="submit" value="수정완료" class="btn btn-success btn-sm">
	</div>
</form:form>

<script>
	CKEDITOR.replace('complCn', {
	// 	    filebrowserImageUploadUrl: '${pageContext.request.contextPath }/board/uploadImage.do',
	});
</script>

