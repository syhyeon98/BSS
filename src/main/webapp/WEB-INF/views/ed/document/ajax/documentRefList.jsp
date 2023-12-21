<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary textCenter">
			<th>No.</th>
			<th>문서유형</th>
			<th>문서제목</th>
			<th>기안자</th>
			<th>기안일시</th>
			<th>결재자</th>
			<th>결재상태</th>
		</tr>
	</thead>
    <tbody>
    <c:if test="${empty paging.dataList}">
        <tr class="textCenter">
            <td colspan="7">현재 참조 문서가 없습니다.</td>
        </tr>
    </c:if>
    <c:if test="${not empty paging.dataList}">
        <c:forEach items="${paging.dataList}" var="req" varStatus="loop">
				<tr class="textCenter">
					<td><c:out value="${loop.index + 1}" /></td>
					<td>${req.docType }</td>
					<%-- <td class="textLeft"><a href="javascript:;">${req.docTitle }</a></td> --%>
					<td class="textLeft"><a href="${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=${req.docNo}">${req.docTitle}</a></td>
					<td>${req.empName }</td>
					<td>${req.docUpdatedate.toString().replace('T',' ') }</td>
					<td>${req.approvalEmpName }</td>
					<td>진행중</td>
				</tr>
        </c:forEach>
    </c:if>
    </tbody>
	<tfoot>
		<tr>
			<td colspan="7">${paging.pagingHTML }</td>
		</tr>
	</tfoot>
</table>

<script>
$(".listBody").on("click","tr.datatr",function(event) {
	let docNo = $(this).data("docno");
	location.href = `${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=\${docNo}`;
});
</script>