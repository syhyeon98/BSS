<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
    
    
	<form method="post" action="<c:url value='/board/cmntUpdate'/>">
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

