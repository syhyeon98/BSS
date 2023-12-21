<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<style>
	.left {
		text-align: left;
	}
	.cen {
		text-align: center;
	}
</style>   

	<table class="table table-bordered table-hover">		
	<thead>
			<tr class="table-secondary" style="text-align: center;">
				<th>번호</th>
				<th>칭찬합니다</th>
				<th>칭찬대상자</th>
				<th>작성자</th>
				<th>등록날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:set var="complList" value="${paging.dataList }" />
		<c:forEach items="${complList}" var="compl">
				<c:url value="/board/complDetail" var="viewURL">
					<c:param name="what" value="${compl.complNo}" />
				</c:url>
			<tr>
				<td class="cen">${compl.rnum}</td>
				<td class="left" style="cursor:pointer;"
					onclick="location.href = '${viewURL}'">${compl.complTtl}</td>
				<td class="cen">${compl.complEmpName }</td>
				<td class="cen">${compl.empName }</td>
				<td class="cen">${compl.complDt }</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">${paging.pagingHTML }</td>
			</tr>
		</tfoot>
	</table>
