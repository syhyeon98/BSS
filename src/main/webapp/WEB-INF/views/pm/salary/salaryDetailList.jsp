<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div>
	<div id="searchUI" class="row">
		<input type="text" class=" form-inline form-control col-md-2" id="searchInput" name="empName" placeholder="사원명검색" />
	</div>
	<div class="container-fluid" id="employeeList">
		<div id="spinnerArea" class="text-center mt-4">
		  <div class="spinner-border" role="status">
		    <span class="visually-hidden">Loading...</span>
		  </div>
		</div>	
	</div>
</div>

<script>
	$(function() {
		searchEmp();
	});
	
	let data={
		salNo:${salNo}			
	};
	
	function searchEmp() {
		let setting = {
			url : `${pageContext.request.contextPath }/mypage/salaryADetail.do`,
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

	
	$(searchInput).on("keyup",function(event){
		$(searchUI).find(":input[name]").each(function(idx,input){
			let name = input.name;
			let value = $(input).val();
			data[name]=value;
		});
		searchEmp();
	});
	
</script>