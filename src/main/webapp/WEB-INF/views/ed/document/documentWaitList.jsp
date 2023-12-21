<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<h5>☗ 전자결재 ▸ 결재문서 ▸ 결재대기함</h5>
<hr color="black"/>

<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary textCenter">
			<th>No.</th>
<!-- 			<th>결재유형</th> -->
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
    <c:if test="${empty documentWaitList}">
        <tr class="textCenter">
            <td colspan="8">현재 결재할 문서가 없습니다.</td>
        </tr>
    </c:if>
    <c:if test="${not empty documentWaitList}">
      <security:authentication property="principal.realUser" var="authEmployee"/>
        <c:forEach items="${documentWaitList}" var="wait" varStatus="loop">
<%-- 			<c:if test="${wait.approvalEmpCd eq authEmployee.empCd}"> --%>
				<tr class="textCenter">
					<td><c:out value="${loop.index + 1}" /></td>
					<td>${wait.docType }</td>
					<td class="textLeft"><a href="${pageContext.request.contextPath}/ed/document/documentFormView.do?docNo=${wait.docNo}">${wait.docTitle}</a></td>
					<td>${wait.empName }</td>
					<td>${wait.depName }</td>
					<td>${wait.docUpdatedate.toString().replace('T',' ') }</td>
					<td>${wait.approvalEmpName }</td>
					<td>진행중</td>
				</tr>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${wait.empCd ne authEmployee.empCd}">    --%>
<!-- 				<tr> -->
<!-- 					<td colspan="8">현재 기안한 문서가 없습니다.</td> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>
        </c:forEach>
    </c:if>
    </tbody>
</table>

<!-- 페이징 혹은 쭉 나오게 -->




<!-- 페이징 혹은 쭉 나오게 -->

