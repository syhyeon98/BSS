<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
 #condition{
 	background-color: #e7edf4;
 }
</style>
<h5>☗ 실시간금융정보 ▸ 금융상품 ▸ 적금상품</h5>
<hr color="black">

<div class="container-fluid">
	<form  name="simpleCondition">
		<div id="condition" class="row pt-4">
			<div class="col-md-12">
			
				<!-- 저축금액과 월 -->
				<div class="row d-flex align-items-center">
					<div class="col-md-1 align-middle"><span class="fs-7">월 저축금액</span></div>
					
					<div class="col-md-3 row d-flex align-items-center">
						<input id="saveMoney" class="form-control col-md-6 text-end" type="text" value="10,000,000"  onkeyup="changeNumber()"><span class="col-md-1">원</span>
						<div class="col-md-5 align-middle"><span>저축예정기간</span></div>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check"  name="saveTrm" id="saving-date_dates_1" value="6">
							<label class="btn btn-outline-primary"  for="saving-date_dates_1">6개월</label>
						</div>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" checked name="saveTrm" id="saving-date_dates_2" value="12">
							<label class="btn btn-outline-primary" for="saving-date_dates_2">12개월</label>
						</div>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" name="saveTrm" id="saving-date_dates_3" value="24">
							<label class="btn btn-outline-primary" for="saving-date_dates_3">24개월</label>
						</div>
					</div>
					<div class="col-md-2">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" name="saveTrm" id="saving-date_dates_4" value="36">
							<label class="btn btn-outline-primary" for="saving-date_dates_4">36개월</label>
						</div>
					</div>
				</div>
				
				<hr color="black">
				<!-- 적립방식 -->				
				<div class="row d-flex align-items-center">
					<div class="col-md-1 align-middle"><span class="fs-7">적립방식</span></div>
					<div class="col-md-3">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" checked  name="rsrvType" id="rsrvType0" value>
							<label class="btn btn-outline-primary"  for="rsrvType0" >전체</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check"  name="rsrvType" id="rsrvType1" value="S">
							<label class="btn btn-outline-primary"  for="rsrvType1">정액적립식</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check"  name="rsrvType" id="rsrvType2" value="F">
							<label class="btn btn-outline-primary"  for="rsrvType2">자유적립식</label>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
				
				<hr color="black">
				<!-- 금융권역 -->				
				<div class="row d-flex align-items-center">
					<div class="col-md-1 align-middle"><span class="fs-7">금융권역</span></div>
					<div class="col-md-3">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" checked  name="topFinGrpNo" id="topFinGrpNo0" value>
							<label class="btn btn-outline-primary"  for="topFinGrpNo0" >전체</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check"  name="topFinGrpNo" id="topFinGrpNo1" value="020000">
							<label class="btn btn-outline-primary"  for="topFinGrpNo1">은행</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check"  name="topFinGrpNo" id="topFinGrpNo2" value="030300">
							<label class="btn btn-outline-primary"  for="topFinGrpNo2">저축은행</label>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>

				<hr color="black">
				<!-- 이자계산방식 -->				
				<div class="row d-flex align-items-center">
					<div class="col-md-1 align-middle"><span class="fs-7">이자계산방식</span></div>
					<div class="col-md-3">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" checked  name="intrRateType" id="intrRateType0" value>
							<label class="btn btn-outline-primary"  for="intrRateType0" >전체</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check"  name="intrRateType" id="intrRateTypeS" value="S">
							<label class="btn btn-outline-primary"  for="intrRateTypeS" >단리</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="d-grid gap-2">
							<input type="radio" class="btn-check" name="intrRateType" id="intrRateTypeM" value="M">
							<label class="btn btn-outline-primary"  for="intrRateTypeM" >복리</label>
						</div>
					</div>
					<div class="col-md-2"></div>
					
				</div>
				
				<hr color="black">
				<!-- 지역 -->
				<div class="row" id="areaCondition">
					<div class="col-md-1 align-middle"><span class="fs-7">지역선택</span></div>
					<div class="col-md-11">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" checked id="areaType_chkAll" value="">
						  <label class="form-check-label" for="areaType_chkAll">전체</label>
						 </div>
						  <c:forEach items="${bankOptionList }" var="bankOption" >
							  <div class="form-check form-check-inline">
								  <input class="form-check-input" checked type="checkbox" id="areaType_${bankOption.areaCd}" value="${bankOption.areaCd}">
								  <label class="form-check-label" for="areaType_${bankOption.areaCd}">${bankOption.areaNm}</label>
							  </div>
						  </c:forEach>
					</div>
				</div>
				<hr color="black">
			</div>
			<div class="pb-4 d-flex justify-content-center mt-4">
				<button id="searchBtn1" class="btn btn-primary me-1" type="button">금융상품 검색</button>
				<button class="btn btn-secondary" type="reset" >초기화</button>
			</div>
		</div>
	</form>
</div>

<div id="searchUI" class="d-flex justify-content-center mt-4 mb-4">
	<form:select path="simpleCondition.searchType" class="form-select col-md-1 me-1">
		<form:option value="" label="전체" />전체
		<form:option value="korCoNm" label="금융회사명" />
		<form:option value="finPrdtNm" label="상품명" />
	</form:select>
	<form:input path="simpleCondition.searchWord" class=" form-inline form-control col-md-2 me-1"/>
	<input type="button"  class="btn btn-primary col-md-2 me-1" value="검색" id="searchBtn"/>
</div>


<div id="savingPrdtListArea" class="mt-4">
</div>


<script>
		/* 지역선택 체크박스 */
		$('#areaType_chkAll').on('click',function(){
			if($('#areaType_chkAll').is(':checked')){
				$('#areaCondition').find("input:checkbox").prop("checked",true)
			}else{
				$('#areaCondition').find("input:checkbox").prop("checked",false)
			}
		})
		$('#areaCondition').find("input:checkbox").not("#areaType_chkAll").on('click',function(){
			let checkedNum = $('#areaCondition').find("input:checked").not("#areaType_chkAll").length;
			let checkBoxAll=$('#areaCondition').find("input:checkbox").not("#areaType_chkAll").length;
			if(checkedNum==checkBoxAll){
				$('#areaType_chkAll').prop("checked",true)
			}else {
				$('#areaType_chkAll').prop("checked",false)
			}
		})

	
	// ajax요청시 담아줄 data
	let data;
	
	// 페이지 선택시
	function fn_paging(page){
		ajaxDepositList(page)
	};
	
	
	/* 조건검색시 */
	$("#searchBtn1").on("click",function(){
		ajaxDepositList(1);
	})
	
	/* 서치 */
	$("#searchBtn").on("click",function(event){
		ajaxDepositList(1);
	});
	
	
	// 첫 화면 ajax로 데이터 불러오기
	$(function(){
		ajaxDepositList(1);
	})
	
	
	function ajaxDepositList(page){
		let areaCd=[];
		let checkedAreaCd=$('#areaCondition').find("input:checked");
		for(let i = 0;i<checkedAreaCd.length;i++){
			areaCd[i]=checkedAreaCd[i].value;
		}
		data={
			intrRateType:$("input[name=intrRateType]:checked").val(),
			rsrvType:$("input[name=rsrvType]:checked").val(),
			topFinGrpNo:$("input[name=topFinGrpNo]:checked").val(),
			saveTrm:$("input[name=saveTrm]:checked").val(),
			areaCd:areaCd,
			page:page,
			saveMoney:$("#saveMoney").val().replace(/,/g, '')
		}
		$("#searchUI").find(":input[name]").each(function(idx,input){
			let name = input.name;
			let value = $(input).val();
			console.log("value:" + value)
			$("#searchForm").find(`[name=\${name}]`).val(value);
			data[name] = value;
		});
		let setting = {
			url : `${pageContext.request.contextPath}/saving/savingPrdtList.do`,
			method : "POST",
			dataType : "text",
			data : JSON.stringify(data),
			contentType:"application/json",
			success : function(resp) {
				$('#savingPrdtListArea').html(resp);
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

   <script>
        document.addEventListener("DOMContentLoaded", function() {
            const saveMoney = document.getElementById('saveMoney');

            saveMoney.addEventListener('input', function() {
                this.value = (+this.value.replace(/[^\d]/g, '')).toLocaleString('ko-KR');
            });

        });
    </script>