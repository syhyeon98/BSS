<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- 초과근무 수정할때 뜨는 모달화면  -->

<style>
.form-control {
	width: 100%;
}
</style>


<form:form modelAttribute="attendVO" action="${pageContext.request.contextPath }/pm/servicemanagement/overTimeUpdate.do" method="post">
<tr>
	<th>번호</th>
	<td><form:input readonly="true" class="form-control" type="number" path="atteNo" />
		<form:errors class="error" path="atteNo" /></td>
</tr>
<tr>
	<th>이름</th>
	<td><form:input readonly="true" class="form-control" type="text" path="empName" />
		<form:errors class="error" path="empName" /></td>
</tr>
<tr>
	<th>사번</th>
	<td><form:input readonly="true" class="form-control" type="text" path="empCd" />
		<form:errors class="error" path="empCd" /></td>
</tr>
<tr>
	<th>부서</th>
	<td><form:input readonly="true" class="form-control" type="text" path="depName" />
		<form:errors class="error" path="depName" /></td>
</tr>
<tr>
	<th>출근시간</th>
	<td><form:input readonly="true"  class="form-control" type="datetime-local" path="atteStime" />
		<form:errors class="error" path="atteStime" /></td>
</tr>
<tr>
	<th>퇴근시간</th>
	<td><form:input readonly="true"  class="form-control" type="datetime-local" path="atteEnd" />
		<form:errors class="error" path="atteEnd" /></td>
</tr>
<tr>
	<th>출근일</th>
	<td><form:input readonly="true"  class="form-control" type="date"  path="atteDate" />
		<form:errors class="error" path="atteDate" /></td>
</tr>
<tr>
	<th>초과근무 시작시간</th>
	<td><form:input class="form-control" type="datetime-local" path="overStart" />
		<form:errors class="error" path="overStart" /></td>
</tr>
<tr>
	<th>초과근무 종료시간</th>
	<td><form:input class="form-control" type="datetime-local" path="overEnd" />
		<form:errors class="error" path="overEnd" /></td>
</tr>
<tr>
	<th>초과근무 내용</th>
	<td><form:textarea class="form-control" path="overCont"></form:textarea>
		<form:errors class="error" path="overCont" /></td>
</tr>
<button type="submit" class="btn btn-primary" >등록</button>
</form:form>
