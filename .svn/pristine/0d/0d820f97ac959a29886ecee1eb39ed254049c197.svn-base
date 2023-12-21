<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary textCenter">
<!-- 			<th>문서유형</th> -->
			<th>문서제목</th>
			<th>기안자</th>
<!-- 			<th>기안부서</th> -->
			<th>기안일시</th>
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
        <c:forEach items="${documentWaitList}" var="wait">
<%-- 					<td>${wait.docType }</td> --%>
					<td class="textLeft"><a href="javascript:;">${wait.docTitle }</a></td>
					<td>${wait.empName }</td>
<%-- 					<td>${wait.depName }</td> --%>
<%-- 					<td>${wait.docUpdatedate.toString().replace('T',' ') }</td> --%>
					<td>${wait.docUpdatedate }</td>
				</tr>

        </c:forEach>
    </c:if>
    </tbody>
</table>
