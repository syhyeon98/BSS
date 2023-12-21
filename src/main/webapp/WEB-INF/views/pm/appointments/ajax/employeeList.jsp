<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
	.ri {
		text-align: right;
	}
	.cen {
		text-align: center;
	}
</style>


<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary" style="text-align: center;">
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
				<c:url value="/pm/appointments/employeeDetail" var="empDetail">
					<c:param name="who" value="${emp.empCd }"></c:param>
				</c:url>
				<tr>
					<td class="cen">${emp.rnum }</td>
					<td class="cen">${emp.empCd }</td>
					<td class="cen"><a href="${empDetail }">${emp.empName }</a></td>
					<td class="cen">${emp.department.depName }</td>
					<td class="cen">${emp.position.poName }</td>
					<td class="ri">${emp.empMail }</td>
					<td class="cen">${emp.department.depNum }</td>
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