<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
#condition {
	background-color: #e7edf4;
}
</style>
<h5>☗ 실시간금융정보 ▸ 금융상품 ▸ 주택담보대출</h5>
<hr color="black">

<div class="container-fluid">
	<form name="simpleCondition">
		<div id="condition" class="row pt-4">
			<div class="col-md-12">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="row mb-4">
								<div class="col-md-3">
									<div class="row d-flex align-items-center">
										<div class="col-md-3">주택가격</div>
										<div class="col-md-7"><input id="housePrice" name="housePrice" class="form-control text-end" type="text" value="300,000,000" onkeyup="changeNumber()"></div>
										<div class="col-md-2">원</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row d-flex align-items-center">
										<div class="col-md-3">대출금액</div>
										<div class="col-md-7"><input id="loanAmount" name="loanAmount" class="form-control text-end" type="text" value="100,000,000" onkeyup="changeNumber()" ></div>
										<div class="col-md-2">원</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row d-flex align-items-center">
										<div class="col-md-3">LTV</div>
										<div class="col-md-7"><input id="ltv" name="ltv" class="form-control text-end" type="text" value="33.33" ></div>
										<div class="col-md-2">%</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row d-flex align-items-center">
										<div class="col-md-3">대출기간</div>
										<div class="col-md-7"><input id="loanPeriod" name="loanPeriod" class="form-control text-end" type="text" value="10" ></div>
										<div class="col-md-2">년</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<div class="row d-flex align-items-center">
										<div class="col-md-3">주택종류</div>
										<div class="col-md-7">
											<select class="form-select" name="mrtgType">
												<option value="">전체</option>
												<c:forEach items="${mrtgTypeList }" var="mrtgType">
													<option value="${mrtgType.mrtgType }">${mrtgType.mrtgTypeNm }</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row d-flex align-items-center">
										<div class="col-md-3">금리방식</div>
										<div class="col-md-7">
											<select class="form-select" name="lendRateType">
												<option value="">전체</option>
												<c:forEach items="${lendRateTypeList }" var="lendRateType">
													<option value="${lendRateType.lendRateType }">${lendRateType.lendRateTypeNm }</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="col-md-6">위 LTV비율은 단순 참고용이며 금융상품 검색결과 상세정보를 확인하거나,<br> 각 금융회사에 문의하여 직접 대출관련 제약조건을 확인하시기 바랍니다.</div>
							</div>
						</div>
					</div>
				</div>
				<hr color="black">
				
				<!-- 상환방식 -->
				<div class="row d-flex align-items-center">
					<div class="col-md-1 align-middle">
						<span class="fs-7">상환방식</span>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" checked name="rpayType"
								id="rpayType0" value> <label
								class="btn btn-outline-primary" for="rpayType0">전체</label>
						</div>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" name="rpayType"
								id="rpayType1" value="S"> <label
								class="btn btn-outline-primary" for="rpayType1">만기일시상환</label>
						</div>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" name="rpayType"
								id="rpayType2" value="D"> <label
								class="btn btn-outline-primary" for="rpayType2">원금분할상환</label>
						</div>
					</div>
				</div>

				<hr color="black">
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
				<!-- 지역 -->
				<div class="row" id="areaCondition">
					<div class="col-md-1 align-middle">
						<span class="fs-7">지역선택</span>
					</div>
					<div class="col-md-11">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" checked
								id="areaType_chkAll" value=""> <label
								class="form-check-label" for="areaType_chkAll">전체</label>
						</div>
						<c:forEach items="${bankOptionList }" var="bankOption">
							<div class="form-check form-check-inline">
								<input class="form-check-input" checked type="checkbox"
									id="areaType_${bankOption.areaCd}" value="${bankOption.areaCd}">
								<label class="form-check-label"
									for="areaType_${bankOption.areaCd}">${bankOption.areaNm}</label>
							</div>
						</c:forEach>
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


<div id="mortagageLoanListArea" class="mt-4">
</div>


<script>
	/* 지역선택 체크박스 */
	$('#areaType_chkAll').on('click', function() {
		if ($('#areaType_chkAll').is(':checked')) {
			$('#areaCondition').find("input:checkbox").prop("checked", true)
		} else {
			$('#areaCondition').find("input:checkbox").prop("checked", false)
		}
	})
	$('#areaCondition').find("input:checkbox").not("#areaType_chkAll").on(
			'click',
			function() {
				let checkedNum = $('#areaCondition').find("input:checked").not(
						"#areaType_chkAll").length;
				let checkBoxAll = $('#areaCondition').find("input:checkbox")
						.not("#areaType_chkAll").length;
				if (checkedNum == checkBoxAll) {
					$('#areaType_chkAll').prop("checked", true)
				} else {
					$('#areaType_chkAll').prop("checked", false)
				}
			})

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
		let areaCd = [];
		let checkedAreaCd = $('#areaCondition').find("input:checked");
		for (let i = 0; i < checkedAreaCd.length; i++) {
			areaCd[i] = checkedAreaCd[i].value;
		}
		data = {
			topFinGrpNo : $("input[name=topFinGrpNo]:checked").val(),
			areaCd : areaCd,
			page : page,
			housePrice : $("input[name=housePrice]").val().replace(/,/g, ''),
			loanAmount : $("input[name=loanAmount]").val().replace(/,/g, ''),
			mrtgType : $("select[name=mrtgType]").val(),
			lendRateType : $("select[name=lendRateType]").val(),
			rpayType : $("input[name=rpayType]:checked").val(),
			loanPeriod:$("input[name=loanPeriod]").val()
		}
		
		$("#searchUI").find(":input[name]").each(function(idx, input) {
			let name = input.name;
			let value = $(input).val();
			console.log("value:" + value)
			$("#searchForm").find(`[name=\${name}]`).val(value);
			data[name] = value;
		});
		let setting = {
			url : `${pageContext.request.contextPath}/mortagageLoan/mortagageLoantList.do`,
			method : "POST",
			dataType : "text",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(resp) {
				$('#mortagageLoanListArea').html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	}
	function changeNumber(){
		let housePrice = parseInt($("#housePrice").val().replace(/,/g, ''));
		let loanAmount = parseInt($("#loanAmount").val().replace(/,/g, ''));
		let ltv = loanAmount/housePrice*100
		$("#ltv").val(ltv.toFixed(2));
	}
</script>

   <script>
        document.addEventListener("DOMContentLoaded", function() {
            const loanAmountInput = document.getElementById('loanAmount');

            loanAmountInput.addEventListener('input', function() {
                this.value = (+this.value.replace(/[^\d]/g, '')).toLocaleString('ko-KR');
            });

            const housePriceInput = document.getElementById('housePrice');

            housePriceInput.addEventListener('input', function() {
                this.value = (+this.value.replace(/[^\d]/g, '')).toLocaleString('ko-KR');
            });
        });
    </script>

