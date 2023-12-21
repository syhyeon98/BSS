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
		<c:if test="${empty reqList}">
			<tr>
				<td colspan="4">등록된 요구사항이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty reqList}">
			<c:forEach items="${reqList}" var="req">
				<c:url value="/board/reqDetail" var="viewURL">
					<c:param name="what" value="${req.reqNo}" />
				</c:url>
				<tr>
					<td class="cen">${req.rnum }</td>
					<td class="cen"><a href="${viewURL}">${req.reqTtl}</a></td>
					<td class="cen">${req.empName}</td>
					<td class="cen">${req.reqDt}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>

</table>