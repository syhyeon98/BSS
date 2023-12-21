<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
			<th>제목</th>
			<th>작성자</th>
			<th>등록날짜</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty complList}">
		<tr>
			<td colspan="4">등록된 공지사항이 없습니다</td>
		</tr>
	</c:if>
		<c:if test="${not empty complList}">
		<c:forEach items="${complList}" var="compl">
			<tr>
				<td class="cen">${compl.rnum }</td>
				<td class="cen">${compl.complTtl}</td>
				<td class="cen">${compl.empName}</td>
				<td class="cen">${compl.complDt}</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
	<tfoot>
		<tr>
		</tr>
	</tfoot>
</table>