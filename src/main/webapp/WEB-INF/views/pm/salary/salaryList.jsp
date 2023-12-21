<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<h5>☗ 인사관리 ▸ 급여관리 ▸ 사원별 급여현황</h5>
			<hr color="black">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<h3 class="col-md-11"></h3>
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
			
			<form action="${pageContext.request.contextPath}/salary/salaryPersonalList.do" method="post" id="salaryDetailView">
			<input type="hidden" name="empCd">
			<input type="hidden" name="empName">
			</form>
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
			data[name]=value;
		});
		searchEmp();
	});
	
	$(employeeList).on("click", "tr.datatr", function(event){ 
	    let empCd = $(this).data("empcd");  
	    let empName = $(this).data("empname");  
	    $('input[name=empCd]').val(empCd);
	    $('input[name=empName]').val(empName);
	    $('#salaryDetailView').submit();
	});
</script>
