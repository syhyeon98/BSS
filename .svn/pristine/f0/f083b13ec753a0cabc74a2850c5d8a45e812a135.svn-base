<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>


<h5>☗ 공동서비스 ▸ 게시판 ▸ 공지사항</h5>
<hr color="black">
<div>
	<security:authentication property="principal.realUser"
		var="authEmployee" />
	<c:choose>
		<c:when
			test="${authEmployee != null and authEmployee.empRole =='ROLE_PMUSER' 
			or authEmployee != null and authEmployee.empRole =='ROLE_ADMIN'}">
			<a href="<c:url value='/board/ntcInsert'/>"
				class="btn btn-primary btn-sm">등록</a>
		</c:when>
	</c:choose>
	<div style="height: 15px;"></div>

	<div id="ntcList"></div>
</div>


<form:form id="searchForm"
	action="${pageContext.request.contextPath }/board/ntcList"
	modelAttribute="simpleCondition">
	<input type="hidden" name="page" />
</form:form>

<script>
	$(function() {
		searchEmp();
	});

	let data = {};

	function searchEmp() {
		let setting = {
			url : `${pageContext.request.contextPath }/board/ntcList`,
			method : "",
			dataType : "text",
			data : data,
			success : function(resp) {
				console.log(resp);
				$('#ntcList').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}

	function fn_paging(page) {
		searchForm.page.value = page;
		data.page = page;
		searchEmp();
	}
</script>
