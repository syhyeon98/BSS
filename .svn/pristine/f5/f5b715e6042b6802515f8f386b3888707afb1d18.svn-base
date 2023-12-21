<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!-- <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> -->

<title>문의사항상세조회</title>
<h5>문의사항상세</h5>
<hr color="black">
<div>
	<form:form method="post" modelAttribute="req"
		entype="multipart/form-data">
		<form:hidden path="reqNo" class="form-control" value="${req.reqNo }" />
		<form:hidden path="empCd" class="form-control" value="${req.empCd }" />
		<form:errors path="reqNo" class="error" />
		<div>
			<table class="table table-bordered table-hover">
				<tr>
				
					<th>글번호 : ${req.reqNo }번</th>
					<th>제목 : ${req.reqTtl }</th>
					<th>작성자 : ${req.empName}</th>
					<th>부서 : ${req.depName}</th>
					<th>등록일 : ${req.reqDt }</th>
				</tr>
			</table>
			<table class="table table-border">
				<tr>
					<td>${req.reqCn }</td>
				</tr>
			</table>
		</div>
		<div style="position: absolute; right: 25px; buttom: 0px;">
			<c:url value="/board/reqUpdate" var="reqEdit">
				<c:param name="what" value="${req.reqNo }" />
			</c:url>
			<security:authentication property="principal.realUser"
				var="authEmployee" />
			<c:choose>
				<c:when
					test="${authEmployee != null and authEmployee.empCd == req.empCd }">

					<a href="${reqEdit }" class="btn btn-success btn-sm">수정</a>
					<a class="btn btn-secondary btn-sm" data-bs-toggle="modal"
						data-bs-target="#exampleModal">삭제</a>
					<!-- 					 onclick="return confirm('정말로 삭제하시겠습니까?');" -->
				</c:when>
			</c:choose>

			<a href="<c:url value='/board/reqAllList'/>"
				class="btn btn-outline-secondary btn-sm">목록으로</a>
		</div>
		<c:choose>
			<c:when
				test="${authEmployee != null and authEmployee.empRole =='ROLE_ADMIN' }">
				<button id="comment" class="btn btn-primary btn-sm" type="button">댓글
					등록</button>
			</c:when>
		</c:choose>
		<div id="commentWrite"></div>


	</form:form>
</div>

<br>
<br>

<div>
	<table class="table table-bordered">
		<c:if test="${empty reqList }">
			<tr class="table-secondary">
				<th>답글 내용</th>
				<th>답글 작성일</th>
			</tr>
			<tr>
				<td colspan="2">등록된 댓글이 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${not empty reqList }">
			<tr class="table-secondary">
				<th>답글 내용</th>
				<th>답글 작성일</th>
			</tr>
			<c:forEach var="req" items="${reqList}">
				<tr>
					<td class="rcnmtNum" style="display: none;">${req.rcnmtNo }</td>
					<td>${req.rcmntCn }</td>
					<td>${req.rcnmtDt }
					<c:choose>
						<c:when	test="${authEmployee != null and authEmployee.empRole =='ROLE_ADMIN' }">
						<span class="plusR"> 
<%-- 						<button class="btn btn-primary btn-sm edit" data-rcnmtNum="${req.rcnmtNo}">수정</button> --%>
							<button class="btn btn-primary btn-sm edit" data-bs-toggle="modal" data-bs-target="#editForm"
							 data-no="${req.rcnmtNo}">수정</button>
							<button class="btn btn-danger btn-sm delete" 
							data-bs-toggle="modal" data-bs-target="#exampleModal1" data-no="${req.rcnmtNo}">삭제</button>
						</span>
						</c:when>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>



<div class="modal fade" data-url="${viewURL }" id="exampleModal1"
	tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel1">비밀번호 확인</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form method="post" action="<c:url value='/board/cmntDelete'/>">
				<div class="modal-body">
					<input type="hidden" name="rcnmtNo" value="" />
					<!-- 	      		<input type="hidden" name="rcnmtNo" value="" /> -->
					<input type="hidden" name="reqNo" value="${req.reqNo }" /> 회원 비밀번호
					: <input type="password" name="empPw" />
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" data-url="${viewURL }" id="exampleModal"
	tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 확인</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form method="post" action="<c:url value='/board/reqDelete'/>">
				<div class="modal-body">
					<input type="hidden" name="reqNo" value="${req.reqNo }" /> 회원 비밀번호
					: <input type="password" name="empPw" />
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" data-url="${viewURL }" id="editForm"
	tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">댓글 수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form method="post" action="<c:url value='/board/cmntUpdate'/>">
				<div class="modal-body">
					<input type="hidden" name="reqNo" value="${req.reqNo }" />
					<input type="hidden" name="rcnmtNo" value="${req.rcnmtNo }" />
					<input type="hidden" name="rcnmtDt" value="${req.rcnmtDt }" />
					수정 할 내용 : <input type="text" name="rcmntCn" value="${req.rcmntCn }" />
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">저장</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
	</form>
			
		</div>
	</div>
</div>


<script>

function Edit(){
	window.location.href= '/BBS/board/reqEdit?what=' + ${req.reqNo}
}

	let reqNum = 0;
	
	$('#comment').on('click', function(){
		let reqHtml = `
			<input type="hidden" name="rcnmtNo" value="${reqCmnt.rcnmtNo}" />
			<input type="hidden" name="reqNo" value="${reqCmnt.reqNo}" />
			<input type="hidden" name="rcnmtDt" value="${reqCmnt.rcnmtDt}" />
			
			<form:textarea path="reqCmnt.rcmntCn" class="form-control" type="text" />
			
			<c:url value="/board/reqCmnt" var="reqCmnt"></c:url> 
			
			<button class="btn btn-primary btn-sm" type="submit">등록</button>
			<input class="btn btn-secondary btn-sm" type="button" 
			value="취소" onClick="window.location.href=window.location.href">
		
		`;
		
		$('#commentWrite').append(reqHtml);
		
		reqNum++;
	});
	
	$(".delete").on("click",function(){
		console.log($(this).data("no"))
		$("input[name='rcnmtNo']").val($(this).data("no"))
	})

	
	$('.edit').on('click', function(event){
	 	console.log($(this).data("no"))
	 	$("input[name='rcnmtNo']").val($(this).data("no"))
	 	$("input[name='rcnmtDt']").val($(this).date("no"))
	});


		
		


	
</script>
