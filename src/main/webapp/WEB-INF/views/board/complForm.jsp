<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<title>칭찬합니다등록</title>
<h5>칭찬합니다등록</h5>
<hr color="black">

<form:form method="post" modelAttribute="compl" entype="multipart/form-data">
<security:authentication property="principal.realUser" var="authEmployee" />
<div>
<input type="hidden" name="empName" value="${authEmployee.empName }" />
<input type="hidden" name="empCd" value="${compl.empCd }">
<input type="hidden" name="complNo" value="${compl.complNo }">
	<table class="table table-bordered table-hover">
	<tbody>
	<tr>
		<th>직원선택</th>
		<th>
			<form:select id="depSelect" path="depName" class="form-select">
				<form:option value="" label="부서선택"/>
				<form:options items="${depList}" itemLabel="depName" itemValue="depCd"/>
			</form:select>
			<form:errors path="depName" class="error" />
			
			<form:select id="empSelect" path="empName" class="form-select">
				<form:option value="" label="직원선택"/>
				<c:forEach items="${empList }" var="emp">
					<form:option value="${emp.empCd }" class="${emp.depCd }" label="${emp.empName }" /> 
				</c:forEach>
			</form:select>
			<form:errors path="empName" class="error" />
			
			<%-- 칭찬할 직원--%>
			<form:hidden id="complEmpCd" path="complEmpCd" class="form-control"/>
			<form:errors path="complEmpCd" class="error"/>
			
		</th>
	</tr>
	
	<tr>
		<th>제목	</th>
		<td>
			<form:input id="ttl" path="complTtl" class="form-control" />
			<form:errors path="complTtl" class="error"/>
		</td>
	</tr>
	<tr>
		<th>이런 점을 칭찬합니다</th>
		<td>
			<form:input path="complCn" class="form-control" style="height:200px; vertical-align: top;"/>
			<form:errors path="complCn" class="error"/>
		</td>
	</tr>
</tbody>
</table>
</div>

<div style="position:absolute;right:25px;buttom:0px;">
			<a href="<c:url value='/board/complAllList'/>" class="btn btn-danger btn-sm">취소</a>
			<input id="ttlSave" type="submit" value="등록" class="btn btn-primary btn-sm">
</div>
</form:form>

<script>
 	var empName; 
 	var depName; 
 	
 	let $empName = $('[name="empName"]'); 
 	$('[name="depName"]').on("change", function(event){ 
 		$("#empSelect option:eq(0)").prop("selected", true) 
 		let depCd = $(this).val(); 
 		depName = $("#depSelect option:selected").text(); 
 		console.log(depName); 
 		if(depCd){ 
 		   $empName.find("option").hide(); 
 		   $empName.find(`option:first`).show() 
 		   $empName.find(`option.\${depCd}`).show(); 
 		}else{ 
 			$empName.find("option").show(); 
 		} 
 	}).trigger("change"); 
	
 	$('[name="empName"]').on("change", function(event){ 
 		$('#complEmpCd').val($(this).val()); 
 		empName = $("#empSelect option:selected").text(); 
 		console.log(empName); 
 	}); 
 	
 </script> 
