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
	#cont {
		width: 24rem;
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
		<c:if test="${empty ntcList}">
			<tr>
				<td colspan="4">등록된 공지사항이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty ntcList}">
			<c:forEach items="${ntcList}" var="ntc">
				<c:url value="/board/ntcDetail" var="viewURL">
					<c:param name="what" value="${ntc.ntcNo}" />
				</c:url>
				<tr>
					<td class="cen">${ntc.rnum }</td>
					<td class="cen" id="cont"><a href="${viewURL}">${ntc.ntcTtl}</a></td>
					<td class="cen">${ntc.empName}</td>
					<td class="cen">${ntc.ntcDt}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>

</table>