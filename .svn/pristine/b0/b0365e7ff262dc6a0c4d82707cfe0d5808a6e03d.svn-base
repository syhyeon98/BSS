<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
#condition {
	background-color: #e7edf4;
}
</style>
<h5>☗ 실시간금융정보 ▸ 금융상품 ▸ 개인신용대출</h5>
<hr color="black">

<div class="container-fluid">
	<form name="simpleCondition">
		<div id="condition" class="row pt-4">
			<div class="col-md-12">
					<!-- 금융권역 -->
				<div class="row d-flex align-items-center">
					<div class="col-md-1 align-middle">
						<span class="fs-7">금융권역</span>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" checked name="topFinGrpNo"
								id="topFinGrpNo0" value> <label
								class="btn btn-outline-primary" for="topFinGrpNo0">전체</label>
						</div>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" name="topFinGrpNo"
								id="topFinGrpNo1" value="020000"> <label
								class="btn btn-outline-primary" for="topFinGrpNo1">은행</label>
						</div>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" name="topFinGrpNo"
								id="topFinGrpNo2" value="030300"> <label
								class="btn btn-outline-primary" for="topFinGrpNo2">저축은행</label>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
				<hr color="black">
				<!-- 대출종류 -->
				<div class="row d-flex align-items-center">
					<div class="col-md-1 align-middle">
						<span class="fs-7">대출종류</span>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" checked name="crdtLendRateType"
								id="crdtLendRateType0" value> <label
								class="btn btn-outline-primary" for="crdtLendRateType0">전체</label>
						</div>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" name="crdtLendRateType"
								id="crdtLendRateType1" value="1"> <label
								class="btn btn-outline-primary" for="crdtLendRateType1">일반신용대출</label>
						</div>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" name="crdtLendRateType"
								id="crdtLendRateType2" value="3"> <label
								class="btn btn-outline-primary" for="crdtLendRateType2">장기카드대출</label>
						</div>
					</div>
				</div>

			<hr color="black">
			</div>
			<div class="pb-4 d-flex justify-content-center mt-4">
				<button id="searchBtn1" class="btn btn-primary me-1" type="button">금융상품
					검색</button>
				<button class="btn btn-secondary" type="reset">초기화</button>
			</div>
		</div>
	</form>
</div>
<div id="searchUI" class="d-flex justify-content-center mt-4 mb-4">
	<form:select path="simpleCondition.searchType"
		class="form-select col-md-1 me-1">
		<form:option value="" label="전체" />전체
		<form:option value="korCoNm" label="금융회사명" />
		<form:option value="finPrdtNm" label="상품명" />
	</form:select>
	<form:input path="simpleCondition.searchWord"
		class=" form-inline form-control col-md-2 me-1" />
	<input type="button" class="btn btn-primary col-md-2 me-1" value="검색"
		id="searchBtn" />
</div>


<div id="creditLoanListArea" class="mt-4">
</div>


<script>

	// 	// ajax요청시 담아줄 data
	let data;

	// 페이지 선택시
	function fn_paging(page) {
		ajaxDepositList(page)
	};

	/* 조건검색시 */
	$("#searchBtn1").on("click", function() {
		ajaxDepositList(1);
	})

	/* 서치 */
	$("#searchBtn").on("click", function(event) {
		ajaxDepositList(1);
	});

	// 첫 화면 ajax로 데이터 불러오기
	$(function() {
		ajaxDepositList(1);
	})

	function ajaxDepositList(page) {
		data = {
			topFinGrpNo : $("input[name=topFinGrpNo]:checked").val(),
			page : page,
			crdtLendRateType : $("input[name=crdtLendRateType]:checked").val(),
		}
		
		$("#searchUI").find(":input[name]").each(function(idx, input) {
			let name = input.name;
			let value = $(input).val();
			console.log("value:" + value)
			$("#searchForm").find(`[name=\${name}]`).val(value);
			data[name] = value;
		});
		let setting = {
			url : `${pageContext.request.contextPath}/creditLoan/creditLoanList.do`,
			method : "POST",
			dataType : "text",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(resp) {
				$('#creditLoanListArea').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}
</script>
