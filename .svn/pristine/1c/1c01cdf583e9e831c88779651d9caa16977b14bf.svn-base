<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<c:if test="${empty paging.dataList}">
	        <tr class="textCenter">
	            <td colspan="7">수신된 문서가 없습니다.</td>
	        </tr>
    	</c:if>
		<c:if test="${not empty paging.dataList}">
			<c:forEach items="${paging.dataList}" var="depDoc">
				<tr>
					<td>${depDoc.rnum }</td>
					<td>${depDoc.docType }</td>
					<td>${depDoc.docSign }</td>
					<td class="textLeft"><a href="${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=${depDoc.docNo }">${depDoc.docTitle}</a></td>
					<td>${depDoc.empName }</td>
					<td>${depDoc.depName }</td>
					<td>${depDoc.docUpdatedate }</td>
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