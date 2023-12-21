<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#ed {
	width: 1px;
}

#img {
	width: 150px;
	height: 140px;
}
</style>

<table class="table table-hover table-bordered">
	<tr>
		<th id="ed" rowspan="3">
		<img id="img" src="${pageContext.request.contextPath }/resources/empProfile/${empDetail.outAtchNm }" alt="직원 프로필 사진"></th>
	</tr>
	<tr>
		<th>사번</th>
		<td>${empDetail.empCd }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${empDetail.empName }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td colspan="2">${empDetail.empMail }</td>
	</tr>
	<tr>
		<th>담당업무</th>
		<td colspan="2">${empDetail.busName }</td>
	</tr>
	<tr>
		<th>내선번호</th>
		<td colspan="2">${empDetail.depNum }</td>
	</tr>
</table>
