<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<!-- 보관함 -->
<!-- regPublicList.jsp에 포함된 jsp -->
<!-- 추가할 것 1. 문서유형별로 조회 가능 2. 검색 - 조건: 문서제목, 기안자, 기안일자, 승인일자 -->

<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary textCenter">
			<th>No.</th>
			<th>문서유형</th>
			<th>결재번호</th>
			<th>문서제목</th>
			<th>기안자</th>
			<th>기안일자</th>
			<th>최종결재자</th>
			<th>승인완료일자</th>
		</tr>
	</thead>
	<tbody class="listBody">
	<c:set var="documentRegPublicList" value="${paging.dataList }"></c:set>
	<c:if test="${empty documentRegPublicList }">
		<tr class="textCenter">
			<td colspan="8">승인완료된 문서가 없습니다.</td>
		</tr>
	</c:if>

	<c:if test="${not empty documentRegPublicList }">
		<c:forEach items="${documentRegPublicList }" var="pub" varStatus="loop">
			<tr class="textCenter datatr" data-docno=${pub.docNo }>
				<td>${pub.rnum}</td> <!-- 1번부터 부여하기 위해 +1-->
				<td>${pub.dtName }</td>
				<td>${pub.docSign }</td>
				<td class="textLeft">${pub.docTitle }</td>
				<td>${pub.empName }</td>
				<td>${pub.formatDocUpdate }</td>
				<td>${pub.approvalEmpName }</td>
				<td>${pub.formatSeDate }</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="8">${paging.pagingHTML }
		</tr>
	</tfoot>
</table>
<script>

$(".listBody").on("click","tr.datatr",function(event) {
	let docNo = $(this).data("docno");
	location.href = `${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=\${docNo}`;
});

</script>