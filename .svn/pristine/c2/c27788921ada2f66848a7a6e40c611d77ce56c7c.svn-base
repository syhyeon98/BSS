<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form modelAttribute="ddc" action="${pageContext.request.contextPath }/ddc/ddcModify.do" method="post">
<tr>
	<th>공제코드</th>
	<td><form:input readonly="true" class="form-control" type="text" path="ddcCd" />
		<form:errors class="error" path="ddcCd" /></td>
</tr>
<tr>
	<th>공제명</th>
	<td><form:input class="form-control" type="text" path="ddcNm" />
		<form:errors class="error" path="ddcNm" /></td>
</tr>
<tr>
	<th>공제기준</th>
	<td><form:input class="form-control" type="text" path="ddcCrtr" />
		<form:errors class="error" path="ddcCrtr" /></td>
</tr>
<button type="submit" class="btn btn-primary" >수정하기</button>
</form:form>