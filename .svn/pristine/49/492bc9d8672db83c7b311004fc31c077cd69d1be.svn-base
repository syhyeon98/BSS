<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- 임시 -->
<style>
.mar {
	margin-bottom: 15px;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<h5>☗ 전자결재 ▸ 양식생성</h5>
<hr color="black"/>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		
			<!-- controller -->
			<form:form modelAttribute="documentType" method="post">
			
			<div class="row justify-content-end">
				<div class="col-auto">	
				<tr>
					<td>
						<input type="submit" value="등록" class="btn btn-primary mar"/>
					</td>
				</tr>
				</div>
			</div>	
				
			<table class="table table-bordered">
				<tr>
					<th class="table-active">양식번호</th>
				</tr>
				<tr>
					<td>
						<form:hidden path="dtNo" class="form-control"/>양식 저장 시 자동부여
						<form:errors path="dtNo" class="error" />
					</td>
				</tr>
				<tr>
				    <th class="table-active">문서유형</th>
				</tr>
				<tr>
				    <td>
				        <form:input path="dtGroup" class="form-control"/>
				        <form:errors path="dtGroup" class="error" />
				    </td>
				</tr>
				<tr>
				    <th class="table-active">양식명</th>
				</tr>
				<tr>
				    <td>
				        <form:input path="dtName" class="form-control"/>
				        <form:errors path="dtName" class="error" />
				    </td>
				</tr>
				<tr>
				    <th class="table-active">문서내용</th>
				</tr>
				<tr>
				    <td>
				        <form:textarea path="dtCont" class="form-control" id="docContent" />
				        <form:errors path="dtCont" class="error" />
				    </td>
				</tr>

			</table>
			</form:form>
		</div>
	</div>
</div>

<script>
	//"docContent" 텍스트 영역에 CKEditor를 적용
	CKEDITOR.replace('docContent');
</script>
