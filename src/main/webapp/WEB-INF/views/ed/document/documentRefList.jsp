<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h5>☗ 전자결재 ▸ 결재문서 ▸ 참조문서함</h5>
<hr color="black"/>

<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary textCenter">
			<th>No.</th>
			<th>문서유형</th>
			<th>문서제목</th>
			<th>기안자</th>
			<th>기안부서</th>
			<th>참조일시</th>
		</tr>
	</thead>
	
	<tbody>
	<c:if test="${empty documentRefList }">
		<tr class="textCenter">
			<td colspan="6">현재 참조된 문서가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty documentRefList }">
		<c:forEach items="${documentRefList }" var="ref" varStatus="loop">
		<!-- varStatus 속성 loop 변수를 선언하여 현재 인덱스를 얻기 -->
			<tr class="textCenter">
				<td><c:out value="${loop.index + 1}" /></td> <!-- 1번부터 부여하기 위해 +1-->
				<td>${ref.docType }</td>
				<td class="textLeft"><a href="javascript:;">${ref.docTitle }</a></td>
				<td>${ref.empName }</td>
				<td>${ref.depName }</td>
				<td>${ref.hdDate.toString().replace('T',' ') }</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
</table>
<!-- 샘플 -->
<!-- 
	<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>결재유형</th>
			<th>문서제목</th>
			<th>기안자</th>
			<th>기안부서</th>
			<th>결재자</th>
			<th>참조일시</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td>지출결의</td>
			<td><a href="javascript:;">지출결의서 제출</a></td>
			<td>김영업</td>
			<td>영업부</td>
			<td>영부장</td>
			<td>2023.07.25 13:10</td>
		</tr>

	</tbody>
</table>
-->


<!-- 페이징 혹은 쭉 나오게 -->

