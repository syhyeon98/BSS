<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form modelAttribute="bTrip" action="${pageContext.request.contextPath }/pm/servicemanagement/businessTripUpdate.do" method="post">
<tr>
	<th>번호</th>
	<td><form:input readonly="true" class="form-control" type="number" path="tripNo" />
		<form:errors class="error" path="tripNo" /></td>
</tr>
<tr>
	<th>이름</th>
	<td><form:input readonly="true" class="form-control" type="text" path="empName" />
		<form:errors class="error" path="empName" /></td>
</tr>
<tr>
	<th>출장일</th>
	<td><form:input class="form-control" type="date" path="tripDate" />
		<form:errors class="error" path="tripDate" /></td>
</tr>
<tr>
	<th>출장목적</th>
	<td><form:input class="form-control" type="text" path="tripPurpose" />
		<form:errors class="error" path="tripPurpose" /></td>
</tr>
<tr>
	<th>출장장소</th>
	<td><form:input class="form-control" type="text" path="tripPlace" />
		<form:errors class="error" path="tripPlace" /></td>
</tr>
<div class="btn">
<button type="submit" class="btn btn-primary" >수정</button>
<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">닫기</button>
</div>
</form:form>