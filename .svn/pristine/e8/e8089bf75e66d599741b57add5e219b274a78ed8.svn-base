<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<style>

table {
	text-align : center;
}
</style>

<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary">
			<th>선택&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" onclick='selectAll(this)'/></th>
			<th>번호</th>
			<th>근무일자</th>
			<th>근무시작시간</th>
			<th>근무종료시간</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="myAttendthisMonth" value="${paging.dataList }"></c:set>
		<c:if test="${empty myAttendthisMonth }">
			<tr>
				<td id="col" colspan="8">해당월에 일치하는 출근내역이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty myAttendthisMonth }">
			<c:forEach items="${myAttendthisMonth }" var="attendVO">
				<tr>
					<td><input type="checkbox"/></td>
					<td class="atteNo">${attendVO.atteNo }</td>
					<td>${attendVO.rnum }</td>
					<td>${attendVO.atteDate }</td>
					<td>${attendVO.atteStime.toString().replace('T',' ') }</td>
					<td>${attendVO.atteEnd.toString().replace('T',' ') }</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot>
        <c:if test="${not empty myAttendthisMonth }">
            <tr>
                <td colspan="8">${paging.pagingHTML }</td>
            </tr>
        </c:if>
    </tfoot>
</table>
<!-- 조회하면 값이 출력되는 테이블 끝 -->

<script>
/* 전체조회 페이징  */
function fn_paging(page) {
	searchForm.page.value = page;
	$(searchForm).submit();
}



</script>