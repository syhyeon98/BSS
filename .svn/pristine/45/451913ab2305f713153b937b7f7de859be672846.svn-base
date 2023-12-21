<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

<h5>☗ 전자결재 ▸ 기안 ▸ 기안문 목록</h5>
<hr color="black"/>
<!-- documentTypeList : DT_NO, DT_GROUP, DT_CONT, CODE -->

<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary textCenter">
			<th>No.</th>
			<th>문서유형</th>
			<th>양식명</th>

		</tr>
	</thead>
	<tbody>
	<c:if test="${empty documentTypeList }">
		<tr class="textCenter">
			<td colspan="3">등록된 양식이 없습니다</td>
		</tr>
	</c:if>
	<c:if test="${not empty documentTypeList }">
		<!-- loop로 현재 인덱스 얻기 -->
		<c:forEach items="${documentTypeList }" var="docType" varStatus="loop">
			<tr class="textCenter">
				<td><c:out value="${loop.index + 1}" /></td>
				<td>${docType.dtGroup }</td>
				<td><a href="${pageContext.request.contextPath}/ed/document/documentForm.do?dtNo=${docType.dtNo}">${docType.dtName}</a></td>
				
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
</table>

<!-- 샘플	 -->
<!-- 	
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>문서유형</th>
			<th>문서유형세부</th>
			<th>양식명</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>공통</td>
			<td>회의</td>
			<td><a href="javascript:;">출장보고서</a></td>
		</tr>
	</tbody>
</table>
-->

<!-- 페이징 혹은 쭉 나오게 -->


