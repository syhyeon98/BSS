<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h5>☗ 전자결재 ▸ 수신함</h5>
<hr color="black"/>
<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary textCenter">
			<th>No.</th>
			<th>문서유형</th>
			<th>문서번호</th>
			<th>문서제목</th>
			<th>기안자</th>
			<th>기안부서</th>
			<th>승인완료일</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${depDocList }" var="depDoc">
			<tr>
				<td>${depDoc.docNo }</td>
				<td>${depDoc.docType }</td>
				<td>${depDoc.docSign }</td>
				<td>${depDoc.docTitle}</td>
				<td>${depDoc.empName }</td>
				<td>${depDoc.depName }</td>
				<td>${depDoc.docUpdatedate }</td>
			</tr>	
		</c:forEach>
	</tbody>
</table>
<!-- 나중에 적용 -->
<!-- 
	<tbody>
	<c:set var="memberList" value="${paging.dataList }" />
	<c:if test="${empty memberList }">
		<tr>
			<td colspan="7">등록된 회원 없음.</td>
		</tr>
	</c:if>
	<c:if test="${not empty memberList }">
		<c:forEach items="${memberList }" var="member">
			<tr>
				<td>${member.rnum }</td>
				<td><a href="javascript:;" data-who="${member.memId }" data-bs-toggle="modal" data-bs-target="#exampleModal">${member.memName }</a></td>
				<td>${member.memId }</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
-->
