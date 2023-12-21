<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary">
			<th>선택&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" onclick='selectAll(this)'/></th>
			<th>번호</th>
			<th>이름</th>
			<th>사번</th>
			<th>부서</th>
			<th>근무시작시간</th>
			<th>근무종료시간</th>
			<th>근무일자</th>
			<th>초과근무시작시간</th>
			<th>초과근무종료시간</th>
			<th>초과근무내용</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="attendList" value="${paging.dataList }"></c:set>
		<c:if test="${empty attendList }">
			<tr>
				<td id="col" colspan="11">해당일에 일치하는 출근내역이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty attendList }">
			<c:forEach items="${attendList }" var="attendVO">
				<tr>
					<td><input type="checkbox"/></td>
					<td class="atteNo">${attendVO.atteNo }</td>
					<td>${attendVO.empName }</td>
					<td>${attendVO.empCd }</td>
					<td>${attendVO.depName }</td>
					<td>${attendVO.atteStime.toString().replace('T',' ') }</td>
					<td>${attendVO.atteEnd.toString().replace('T',' ') }</td>
					<td>${attendVO.atteDate }</td>
					<td>${attendVO.overStart.toString().replace('T',' ') }</td>
					<td>${attendVO.overEnd.toString().replace('T',' ') }</td>
					<td id="cont">${attendVO.overCont }</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot>
        <c:if test="${not empty attendList }">
            <tr>
                <td colspan="11">${paging.pagingHTML }</td>
            </tr>
        </c:if>
    </tfoot>
</table>
<!-- 조회하면 값이 출력되는 테이블 끝 -->