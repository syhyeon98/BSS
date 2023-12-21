<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form modelAttribute="company" action="${pageContext.request.contextPath }/company/companyModify.do" method="post">
<tr>
	<th>회사일정코드</th>
	<td><form:input readonly="true" class="form-control" type="text" path="comSCNO" />
		<form:errors class="error" path="comSCNO" /></td>
</tr>
<tr>
	<th>회사일정명</th>
	<td><form:input class="form-control" type="text" path="companytitle" />
		<form:errors class="error" path="companytitle" /></td>
</tr>
<tr>
	<th>회사일정명</th>
	<td><form:input class="form-control" type="text" path="comCont" />
		<form:errors class="error" path="comCont" /></td>
</tr>
<button type="submit" class="btn btn-primary" >수정하기</button>
</form:form>