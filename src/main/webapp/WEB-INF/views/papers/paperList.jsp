<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    


<h5>☗ 공동서비스 ▸ 기타업무 ▸ 문서 리스트</h5>
<hr color="black">
<table class="table table-bordered table-hover">

	<tr class="table-secondary text-center">
		<th>번호</th>
		<th>문서명</th>
	</tr>
	<tr class="text-center">
		<td>1</td>
		<td><a href="<c:url value='/papers/proPaper'/>">재직증명서</a></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>2</td> -->
<%-- 		<td><a href="<c:url value='/papers/carPaper'/>">경력증명서</a></td> --%>
<!-- 	</tr> -->
	<tr class="text-center">
		<td>2</td>
		<td><a href="<c:url value='/papers/empPaper'/>">인사기록카드</a></td>
	</tr>

</table>
