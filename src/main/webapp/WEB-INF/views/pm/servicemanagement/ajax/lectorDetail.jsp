<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<form:form method="post" modelAttribute="lectorDetail" action="${pageContext.request.contextPath }/pm/training/ajax/lectorDetail">
	<table class="table table-bordered table-hover">
		<thead>
			<tr class="table-secondary">
				<th>이름</th>
				<th>강사이력</th>
				<th>전화번호</th>
				<th>메일</th>
<!-- 				<th>선택</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lectorDetail }" var="lector">
				<tr class="textCenter">
					<td>${lector.lectorName}</td>
					<td class="textLeft">${lector.lectorRecord}</td>
					<td>${lector.lectorPh}</td>
					<td>${lector.lectorMail}</td>
<!-- 					<td><input type="checkbox" id="checkAll"></td> -->
				</tr>
			</c:forEach>
		</tbody>
	</table>
<!-- 	<div class="btn-group" role="group"> -->
<!-- 		<input type="reset" class="btn btn-outline-secondary" /> -->
<%-- 		<button class="btn btn-outline-secondary" type="button" onClick="location.href='${pageContext.request.contextPath}/pm/training/trainingList'">목록으로</button> --%>
<!-- 		<button class="btn btn-secondary" type="button">삭제</button> -->
<!-- 	</div> -->
</form:form>
