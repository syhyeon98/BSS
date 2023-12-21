<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
	
</style>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<!-- 			<div class="progress"> -->
			<!-- 				<div class="progress-bar w-75 reprogress-bar-animated"></div> -->
			<!-- 			</div> -->
			<div class="row">
				<div class="col-md-12">
					<div class="row">
					<h5>☗ 인사관리 ▸ 인사정보 ▸ 직원리스트</h5>
					<hr color="black"/>
					</div>
					
					
					<a href="<c:url value='/pm/card/employeeCardInsert'/>"
							class="btn btn-primary">직원 등록</a>
					<div id="searchUI" class="row">
						<form:select path="simpleCondition.searchType"
							class="form-select col-md-1">
							<form:option value="empName" label="사원명" />
							<form:option value="empCd" label="사번" />
						</form:select>
						<input type="text" class=" form-inline form-control col-md-2"
							id="searchInput" name="searchWord" placeholder="이름검색" />
							
					</div>
				</div>
			</div>
		</div>
		<div style="height: 15px;"></div>
		<div id="employeeList"></div>

		<form:form id="searchForm" 
		action="${pageContext.request.contextPath }/pm/appointments/employeeList" modelAttribute="simpleCondition">
			<form:hidden path="searchType" />
			<form:hidden path="searchWord" />
			<input type="hidden" name="page" />
		</form:form>
	</div>
</div>
<script>
	$(function() {
		searchEmp();
	});

	let data = {};

	function searchEmp() {
		let setting = {
			url : `${pageContext.request.contextPath }/pm/appointments/employeeList`,
			method : "",
			dataType : "text",
			data : data,
			success : function(resp) {
				$('#employeeList').html(resp);
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

	$(searchInput).on("keyup", function(event) {
		$(searchUI).find(":input[name]").each(function(idx, input) {
			let name = input.name;
			let value = $(input).val();
			// 			$(searchForm).find(`[name=\${name}]`).val(value);
			data[name] = value;
		});
		fn_paging(1);
		searchEmp();
	});
</script>