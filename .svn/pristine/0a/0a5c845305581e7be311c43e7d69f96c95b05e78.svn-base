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
			<tr class="table-secondary" style="text-align: center;">
				<th>사번</th>
				<th>성명</th>
				<th>직급</th>
				<th>부서명</th>
				<th>생년월일</th>
				<th>퇴사신청일</th>
				<th>퇴직 처리날짜</th>
				<th>퇴직금지급여부</th>
				<th>퇴직금의 금액</th>
				<th>퇴직사유</th>
				<th>퇴직여부</th>
			</tr>
			<tbody>
			<c:set var="reList" value="${paging.dataList }"></c:set>
			<c:if test="${empty reList }">
				<tr>
					<td colspan="11">퇴사한 직원 없음.</td>
				</tr>
			</c:if>
			<c:if test="${not empty reList }">
				<c:forEach items="${reList }" var="res">
					<c:url value="/pm/resignation/reDetail" var="detail">
						<c:param name="who" value="${res.empCd }"></c:param>
					</c:url>
					<tr>
						<td class="cen">${res.empCd }</td>
						<td class="cen"><a href="${detail }">${res.empName }</a></td>
						<td class="cen">${res.poName }</td>
						<td class="cen">${res.depName }</td>
						<td class="cen">${res.empId1 }</td>
						<td class="cen">${res.reDate }</td>
						<td class="cen">${res.reTreatment }</td>
						<c:if test='${res.reGive eq "Y" }'>
							<td class="cen">
								지급 완료
							</td>
						</c:if>
						<c:if test='${res.reGive eq "N" }'>
							<td class="cen">
								지급 예정
							</td>
						</c:if>
						<td class="ri">${res.reMoney } (천원)</td>
						<td class="cen">${res.reCont }</td>
						<td class="cen">${res.stateNm }</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="11">${paging.pagingHTML }</td>
				</tr>
			</tfoot>
		</table>