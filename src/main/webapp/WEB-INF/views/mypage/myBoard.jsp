<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
	.ri {
		text-align: right;
	}
	.cen {
		text-align: center;
	}
	span {
	text-align: right;
	}
</style>

<h5>☗ 업무보고 ▸ 내가 쓴 글</h5>
<hr color="black">
<div>
<h6>☗ 요구사항 
<span class="plusR">
<a href="${pageContext.request.contextPath }/board/reqAllList">전체보기</a></span></h6>
<hr color="black">
<div style="height: 15px;"></div>
<table class="table table-bordered table-hover">
	<thead>
			<tr class="table-secondary" style="text-align: center;">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록날짜</th>
				<th>답변여부</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty reqList}">
		<tr>
			<td colspan="5">등록한 요구사항이 없습니다</td>
		</tr>
	</c:if>
	<c:if test="${not empty reqList}">
		<c:forEach items="${reqList }" var="req">
			<tr>
				<td class="cen">${req.rnum }</td>
				<td class="cen" >
<%-- 				style="cursor:pointer;" onclick='modal("${req.reqNo}", "${req.reqPw }")'> --%>
				${req.reqTtl}</td>
				<td class="cen">${req.empName}</td>
				<td class="cen">${req.reqDt}</td>
				
				<c:if test='${req.reqCheck eq "N " }'>
           		 	<td class="cen">미확인</td>
        		</c:if>
				<c:if test='${req.reqCheck ne "N " }'>
					<td class="cen">완료</td>
				</c:if>
			</tr>
		</c:forEach>
		</c:if>
		</tbody>
	</table>
	</div>
	<div style="height: 15px;"></div>
<div>
<h6>☗ 칭찬합니다 
<span class="plusR">
<a href="${pageContext.request.contextPath }/board/complAllList">전체보기</a></span></h6>
<hr color="black">
<div style="height: 15px;"></div>
<table class="table table-bordered table-hover">
	<thead>
		<tr class="table-secondary" style="text-align: center;">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록날짜</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty complList}">
		<tr>
			<td colspan="4">등록한 칭찬글이 없습니다</td>
		</tr>
	</c:if>
		<c:if test="${not empty complList}">
		<c:forEach items="${complList}" var="compl">
		<c:url value="/board/complDetail" var="viewURL">
					<c:param name="what" value="${compl.complNo}" />
				</c:url>
			<tr>
				<td class="cen">${compl.rnum }</td>
				<td class="cen" style="cursor:pointer;"
					onclick="location.href = '${viewURL}'">${compl.complTtl}</td>
				<td class="cen">${compl.empName}</td>
				<td class="cen">${compl.complDt}</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
</table>
</div>
