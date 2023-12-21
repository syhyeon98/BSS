<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- 임시 -->
<style>
.mar {
	margin-bottom: 15px;
}
</style>
<!-- documentRegPublicList.jsp(목록)를 포함한 jsp -->
<h5>☗ 전자결재 ▸ 보관함</h5>
<hr color="black"/>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		<div class="row">
	    <div class="col-md-12">
	        <div class="row">
	            <h3 class="col-md-11"></h3>
	        </div>
	        
	        <div id="searchUI" class="row ">
	            <form:select path="simpleCondition.searchType" class="form-select col-md-1">
	                <form:option value="docTitle" label="문서제목" />
	                <form:option value="empName" label="사원명" />
	            </form:select>
	            <input type="text" class="form-inline form-control col-md-2" id="searchInput" name="searchWord" placeholder="검색어 입력" />
	        </div>
	        
	        <div id="searchD" class="row mar">
	            <form:select path="simpleCondition.searchType" class="form-select col-md-1">
	                <form:option value="docUpdatedate" label="기안일자" />
	                <form:option value="seDate" label="승인일자" />
	            </form:select>
	            <input type="date" class="form-inline form-control col-md-2" id="searchSDate" name="searchSDate"/>
	            <input type="date" class="form-inline form-control col-md-2" id="searchEDate" name="searchEDate"/>
	            <div class="col-md-1">
	                <input type="button" class="btn btn-info" id="searchDate" name="searchWord" value="조회"/>
	            </div>
	        </div>
	        
	        
	    </div>
		</div>
			
			<!-- 리스트 출력 부분 -->
			<div id="documentRegPublicList"></div>

			<form:form id="searchForm"
				action="${pageContext.request.contextPath }/ed/document/documentRegPublicList.do"
				modelAttribute="simpleCondition">
				<form:hidden path="searchType" />
				<form:hidden path="searchWord"/>
<%-- 				<form:hidden path="searchSDate" /> --%>
<%-- 				<form:hidden path="searchEDate"/> --%>
				<input type="hidden" name="page" />
			</form:form>
		</div>
	</div>
</div>
<script>
	$(function() {
		searchDoc();
	});
	
	let data={};
	
	function searchDoc() {
		let setting = {
			url : `${pageContext.request.contextPath }/ed/document/documentRegPublicList.do`,
			method : "",
			dataType : "text",
			data : data,
			success : function(resp) {
				$('#documentRegPublicList').html(resp);
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
		searchDoc();
	}
	
	$(searchInput).on("keyup",function(event){
		$(searchUI).find(":input[name]").each(function(idx,input){
			let name = input.name;
			let value = $(input).val();
			data[name]=value;
		});
		searchDoc();
	});
	

// 	$(searchDate).on("click", function(event) {
// 	    let startDate = $('#searchSDate').val();
// 	    let endDate = $('#searchEDate').val();
	
// 	    data['searchSDate'] = startDate;
// 	    data['searchEDate'] = endDate;
	
// 	    // Convert date strings to LocalDate format
// 	    data['searchSDate'] = new Date(startDate).toISOString().slice(0, 10);
// 	    data['searchEDate'] = new Date(endDate).toISOString().slice(0, 10);
	
// 	    $(searchD).find(":input[name]").each(function(idx, input) {
// 	        let name = input.name;
// 	        let value = $(input).val();
// 	        data[name] = value;
// 	    });
// 	    searchDoc();
// 	});


</script>
