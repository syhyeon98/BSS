<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<h3 class="col-md-11">정산대상자</h3>
						<button type="button" class="btn btn-primary btn-sm col-md-1">확정하기</button>
					</div>
					<div id="searchUI" class="row">
						<form:select path="simpleCondition.searchType" class="form-select col-md-1">
							<form:option value="empName" label="사원명" />
							<form:option value="empCd" label="사번" />
						</form:select>
						<input type="text" class=" form-inline form-control col-md-2" id="searchInput" name="searchWord" placeholder="이름검색" />
					</div>
				</div>
			</div>
			<div id="employeeList"></div>

			<form:form id="searchForm"
				action="${pageContext.request.contextPath }/salary/salaryEmpList"
				modelAttribute="simpleCondition">
				<form:hidden path="searchType" />
				<form:hidden path="searchWord"/>
				<input type="hidden" name="page" />
			</form:form>
		</div>
	</div>
</div>
<script>
	$(function() {
		searchEmp();
	});
	
	let data={};
	
	function searchEmp() {
		let setting = {
			url : `${pageContext.request.contextPath }/salary/salaryEmpList`,
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
		data.page=page;
		searchEmp();
	}
	
	$(searchInput).on("keyup",function(event){
		$(searchUI).find(":input[name]").each(function(idx,input){
			let name = input.name;
			let value = $(input).val();
// 			$(searchForm).find(`[name=\${name}]`).val(value);
			data[name]=value;
		});
		searchEmp();
	});
</script>
