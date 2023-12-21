<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-bordered table-hover textCenter">
	<thead>
		<tr>
			<th>번호</th>
			<th>사번</th>
			<th>성명</th>
			<th>부서</th>
			<th>직급</th>
			<th>이메일</th>
			<th>내선번호</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="employeeList" value="${paging.dataList }"></c:set>
		<c:if test="${empty employeeList }">
			<tr>
				<td colspan="7">등록된 직원 없음.</td>
			</tr>
		</c:if>
		<c:if test="${not empty employeeList }">
			<c:forEach items="${employeeList }" var="emp">
				<tr class="datatr" data-empcd="${emp.empCd }" data-empname="${emp.empName }">
					<td>${emp.rnum }</td>
					<td>${emp.empCd }</td>
					<td>${emp.empName }</td>
					<td>${emp.department.depName }</td>
					<td>${emp.position.poName }</td>
					<td>${emp.empMail}</td>
					<td>${emp.department.depNum }</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="7">${paging.pagingHTML }</td>
		</tr>
	</tfoot>
</table>

