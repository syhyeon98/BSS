<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<form:form modelAttribute="attend" method = "post">
	<input type="hidden" name="atteNo" value="${attend.atteNo }" />
<table class="table table-bordered table-hover">
		<tr>
			<th>이름</th>
			<td><security:authentication property="principal.realUser" var="authEmployee"/>${authEmployee.empName}</td>
		</tr>
		<tr>
			<th>사번</th>
			<td><security:authentication property="principal.realUser" var="authEmployee"/>${authEmployee.empCd}</td>
		</tr>
		<tr>
			<th>근무시작시간</th>
			<td><input type="dateTime-local" class="form-control" name="atteStime" ></input>
			<form:errors path="atteStime" class="errors"  /></td>
		</tr>
		<tr>
			<th>근무종료시간</th>
			<td><input type="dateTime-local" class="form-control" name="atteEnd" ></input>
			<form:errors path="atteEnd" class="errors"  /></td>
		</tr>
		<tr>
			<th>근무일자</th>
			<td><input type="date" class="form-control" name="atteDate" ></input>
			<form:errors path="atteDate" class="errors"  /></td>
		</tr>
		<tr>
		<td colspan="2">
			<button type="submit" class="btn btn-success"  value="등록">등록</button> 
			<input class="btn btn-danger" type="reset" value="취소">
		</td>
	</tr>
	</table>
</form:form>