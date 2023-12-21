<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<th>제목</th>
				<th>작성자</th>
				<th>등록날짜</th>
				<th>답변여부</th>
			</tr>
		</thead>
		<tbody>
		<c:set var="reqList" value="${paging.dataList }" />
		<c:forEach items="${reqList}" var="req">
			<tr>
				<td class="cen">${req.rnum }</td>
				<td class="left" style="cursor:pointer;" 
					onclick='modal("${req.reqNo}", "${req.reqPw }")'>${req.reqTtl}</td>
				<td class="cen">${req.empName}</td>
				<td class="cen">${req.reqDt}</td>
				
				<c:if test='${req.reqCheck eq "N" }'>
           		 	<td class="cen">미확인</td>
        		</c:if>
				<c:if test='${req.reqCheck eq "Y" }'>
					<td class="cen">완료</td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">${paging.pagingHTML }</td>
			</tr>
		</tfoot>
	</table>
