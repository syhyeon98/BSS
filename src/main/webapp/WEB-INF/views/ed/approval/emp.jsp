<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- 현재 사용 안 하고 있는 폼, 나중에 직원리스트 출력해서 검색 기능 만들거면 활용하고 아니면 삭제-->

<!-- 조회 폼  -->
<div class="container-fluid">
	<div class="row">
	    <div class="col-md-12">
	    	<div class="row">
				<h3 class="col-md-11"></h3>
			</div>
	        <div class="row" id="searchUI">
	            <div class="col-md-2">
	                <form:select path="simpleCondition.searchType" class="form-select">
	                    <form:option value="depName" label="부서명" />
	                    <form:option value="empName" label="사원명" />
	                    <form:option value="poName" label="직급" />
	                </form:select>
	            </div>
	            <div class="col-md-3">
	                <input type="text" class="form-inline form-control" id="searchInput" name="searchWord" placeholder="검색어를 입력하세요." />
	            </div>
	        </div>
	    </div>
	</div>

	<div id="empList"></div>

	<form:form id="searchForm"
		action="${pageContext.request.contextPath }/ed/approval/empList.do"
		modelAttribute="simpleCondition">
		<form:hidden path="searchType" />
		<form:hidden path="searchWord" />
		<input type="hidden" name="page" />
	</form:form>
</div>
<!-- 조회 폼-->

<script>
	/* 전체조회 페이징  */
// 	function fn_paging(page) {
// 		searchForm.page.value = page;
// 		$(searchForm).submit();
// 	}
	
	/* 직원조회 실행함수 */
	$(function() {
		searchEmp();
	});

	/* 직원조회  */
	let data = {};
	function searchEmp() {
		let setting = {
			url : `${pageContext.request.contextPath }/ed/approval/empList.do`,
			method : "",
			dataType : "text",
// 			method : "GET",
// 			dataType : "html",
			data : data,
			success : function(resp) {
				$('#empList').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}
	
	/* 검색한 조회 값의 페이징 */
	function fn_paging(page) {
		searchForm.page.value = page;
		data.page = page;
		searchEmp();
	}

	/* 검색  */
	$(searchInput).on("keyup", function(event) {
		$(searchUI).find(":input[name]").each(function(idx, input) {
			let name = input.name;
			let value = $(input).val();
			data[name] = value;
		});
		searchEmp();
	});
	
</script>