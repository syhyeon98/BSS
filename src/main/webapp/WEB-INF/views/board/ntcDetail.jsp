<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>


<title>공지사항상세조회</title>
<h5>공지사항상세</h5>
<hr color="black">
<div>
	<table class="table table-bordered table-hover">
		<tr>
			<th>글번호 : ${ntc.ntcNo }번</th>
			<th>제목 : ${ntc.ntcTtl }</th>
			<th>작성자 : ${ntc.empName }</th>
			<th>부서명 : ${ntc.depName }</th>
			<th>등록일 : ${ntc.ntcDt }</th>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<td><c:choose>
    <c:when test="${atchdetailList.size() > 0}">
        <c:forEach items="${atchdetailList}" var="ntcFile">
            <c:url value="/download/download.do" var="downloadURL">
                <c:param name="atchNo" value="${ntcFile.atchNo}" />
                <c:param name="outAtchCd" value="${ntcFile.outAtchCd}" />
            </c:url>
            <a href="${downloadURL}">${ntcFile.outOriginNm}</a>
        </c:forEach>
    </c:when>
    <c:otherwise>
        첨부파일이 없습니다
    </c:otherwise>
</c:choose></td>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<td>${ntc.ntcCn }</td>
		</tr>
	</table>
	
	<c:url value="/board/ntcUpdate" var="updateNtc">
		<c:param name="what" value="${ntc.ntcNo}"></c:param>
	</c:url>
	<div style="position: absolute; right: 25px; buttom: 0px;">
	 <security:authentication property="principal.realUser" var="authEmployee"/>
	  <c:choose>
		<c:when
			test="${authEmployee != null and authEmployee.empRole =='ROLE_PMUSER' or authEmployee != null and authEmployee.empRole =='ROLE_ADMIN'}">
			<a href="${updateNtc }" class="btn btn-success btn-sm">수정</a>
			<a class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</a>
		</c:when>
	</c:choose>
		<a href="<c:url value='/board/ntcAllList'/>"
			class="btn btn-outline-secondary btn-sm">목록으로</a>
	</div>
</div>

 <div class="modal fade" data-url="${viewURL }" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 확인</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <form method="post" action="<c:url value='/board/ntcDelete'/>">
	      <div class="modal-body">
	      		<input type="hidden" name="ntcNo" value="${ntc.ntcNo }" />
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