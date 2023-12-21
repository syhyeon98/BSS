<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form modelAttribute="allow" action="${pageContext.request.contextPath }/allow/allowModify.do" method="post">
<tr>
	<th>수당코드</th>
	<td><form:input readonly="true" class="form-control" type="text" path="allowCd" />
		<form:errors class="error" path="allowCd" /></td>
</tr>
<tr>
	<th>수당명</th>
	<td><form:input class="form-control" type="text" path="allowNm" />
		<form:errors class="error" path="allowNm" /></td>
</tr>
<tr>
	<th>산출방법</th>
	<td><form:input class="form-control" type="text" path="allowCrtr" />
		<form:errors class="error" path="allowCrtr" /></td>
	<th>계산식</th>
	<td><form:input class="form-control" type="text" path="allowCalc" />
		<form:errors class="error" path="allowCalc" /></td>
</tr>
<button type="submit" class="btn btn-primary" >수정하기</button>
</form:form>