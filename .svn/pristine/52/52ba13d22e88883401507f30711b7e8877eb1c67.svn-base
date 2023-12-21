<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 초과근무 기간으로 조회할 때 나오는 곳  -->

<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary">
			<th>번호</th>
			<th>이름</th>
			<th>초과근무시작시간</th>
			<th>초과근무종료시간</th>
			<th>총 시간</th>
			<th>초과근무내용</th>
			<!-- <th>선택</th> -->
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty overTimeList }">
			<tr>
				<td id="col" colspan="6">해당조건에 일치하는 결과가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty overTimeList }">
			<c:forEach items="${overTimeList }" var="overTime">
				<tr>
					<td>${overTime.atteNo }</td>
					<td>${overTime.empName }</td>
					<td>${overTime.overStart.toString().replace('T',' ')  }</td>
					<td>${overTime.overEnd.toString().replace('T',' ')  }</td>
					<td>${overTime.time }시간 ${overTime.minute } 분</td>
					<td>${overTime.overCont }</td>
					<!-- <td><input type="checkbox" /></td> -->
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="7">${paging.pagingHTML }
		</tr>
	</tfoot>
</table>