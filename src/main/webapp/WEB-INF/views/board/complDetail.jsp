<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>   
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%> 


<title>칭찬합니다상세조회</title>
<h5>칭찬합니다</h5>
<hr color="black">
<div>
<c:url value="/board/complUpdate" var="updateCompl">
		<c:param name="what" value="${compl.complNo}"></c:param>
	</c:url>
<table class="table table-bordered table-hover">

	<tr>
		<th>글번호 : ${compl.complNo }번</th>
		<th>제목 : ${compl.complTtl }</th>
		<th>칭찬대상자 : ${compl.complEmpName }</th>
		<th>작성자 : ${compl.empName }</th>
		<th>등록일 : ${compl.complDt }</th>
	</tr>
</table>
<table class="table table-bordered">
	<tr>
		<td>${compl.complCn }</td>
	</tr>
</table>
</div>
<div style="position:absolute;right:25px;buttom:0px;">
<security:authentication property="principal.realUser"
				var="authEmployee" />
<c:choose>
	<c:when
		test="${authEmployee != null and authEmployee.empCd == authEmployee.empCd }">
		<a href="${updateCompl }" class="btn btn-success btn-sm">수정</a>
		<a class="btn btn-secondary btn-sm" data-bs-toggle="modal"
			data-bs-target="#exampleModal">삭제</a>
		<!-- 					 onclick="return confirm('정말로 삭제하시겠습니까?');" -->
	</c:when>
</c:choose>
			<a href="<c:url value='/board/complAllList'/>" class="btn btn-outline-secondary btn-sm">목록으로</a>
</div>


<div class="modal fade" data-url="${viewURL }" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 확인</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <form method="post" action="<c:url value='/board/complDelete'/>">
	      <div class="modal-body">
	      		<input type="hidden" name="complNo" value="${compl.complNo }" />
	        	회원 비밀번호 : <input type="password" name="empPw" />
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-danger">삭제</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
        </form>
    </div>
  </div>
</div>




