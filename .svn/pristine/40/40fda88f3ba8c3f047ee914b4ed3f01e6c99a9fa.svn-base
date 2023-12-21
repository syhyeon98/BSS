<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h5>☗ 전자결재 ▸ 결재문서 ▸ 결재진행함</h5>
<hr color="black"/>

<!-- 기안자 기준일 때 수정필요 -->

<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary textCenter">
			<th>No.</th>
			<th>문서유형</th>
			<th>문서제목</th>
			<th>기안자</th>
			<th>기안부서</th>
			<th>기안일시</th>
			<th>결재자</th>
			<th>결재상태</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty documentIngList }">
		<tr class="textCenter">
			<td colspan="8">현재 결재선에 포함된 문서가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty documentIngList }">
		<c:forEach items="${documentIngList }" var="ing" varStatus="loop">
			<tr class="textCenter">
				<td><c:out value="${loop.index + 1}" /></td> <!-- 1번부터 부여하기 위해 +1-->
				<td>${ing.docType }</td>
				<td class="textLeft"><a href="${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=${ing.docNo}">${ing.docTitle }</a></td>
				<td>${ing.empName }</td>
				<td>${ing.depName }</td>
				<td>${ing.docUpdatedate.toString().replace('T',' ') }</td>
				<td>${ing.approvalEmpName }</td>
				<td>진행중</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
</table>


<!-- 페이징 혹은 쭉 나오게 -->




