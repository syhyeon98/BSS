<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    

<style>
	table {
		widows: 200px;
	}
	#dep {
		color:blue;
	}
	
	#name {
		color:fuchsia;
	}
</style>

		<h5>☗ 공동서비스 ▸ 게시판 ▸ 칭찬합니다</h5>
<hr color="black">
		
		<span style="color:MidnightBlue; font-weight: bold; font-size: 20px;">
		<a href="<c:url value='/board/complInsert'/>"class="btn btn-primary btn-sm">칭찬합니다</a>
		가장 칭찬에 많이 언급된 직원은 
		[<span id="dep">${complEmpName.depName }</span> /
		<span id="name">${complEmpName.complEmpName}</span>]님 입니다! 
		</span>
				
		
		<div style="height: 15px;"></div>
	
		<div id="complList"></div>
		
		
		<form:form id="searchForm"
			action="${pageContext.request.contextPath }/board/complList" modelAttribute="simpleCondition">
				<input type="hidden" name="page" />
		</form:form>
		
<script>
	$(function() {
		searchEmp();
	});
	
	let data = {};
	
	function searchEmp() {
		let setting = {
			url : `${pageContext.request.contextPath }/board/complList`,
			method : "",
			dataType : "text",
			data : data,
			success : function(resp) {
				$('#complList').html(resp);
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