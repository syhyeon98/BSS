<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
.detailTable{
 	background-color: #e7edf4;
}
.modal-dialog{
	max-width:100%;
}
</style>

<div class="container-fluid">
	<div class="d-flex justify-content-center mb-4">
		<h5>검색된 금융 상품은 총 ${paging.totalRecord }건 입니다.</h5>
	</div>
	<div class="row">	
		<div>
			<div>
			<button id="compareBtn" class="btn btn-primary mb-4" type="button"
					data-bs-toggle="modal" data-bs-target="#staticBackdrop">선택상품 비교</button>
			</div>
		</div>
		<div class="col-md-12">
			<table class="table table-hover table-sm table-bordered ">
				<thead>
					<tr>
						<th class="text-center">비교선택</th>
						<th class="text-center">금융회사</th>
						<th class="text-center">상품명</th>
						<th class="text-center">적립방식</th>
						<th class="text-center">세전이자율</th>
						<th class="text-center">세후이자율</th>
						<th class="text-center">세후이자(예시)</th>
						<th class="text-center">최고우대금리</th>
						<th class="text-center">가입대상</th>
						<th class="text-center">이자계산방식</th>
						<th class="text-center">금융상품문의</th>
						<th class="text-center">상세정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${paging.dataList }" var="savingPrdt">
						<c:set  var="i" value="${i+1 }"/>
						<tr>
							<td class="align-middle">
							  <div class="form-check form-check-inline d-flex justify-content-center">
								  <input class="form-check-input prdtCheckBox" type="checkbox" name="comparePrdt" value=""
								  	data-finprdtcd="${savingPrdt.finPrdtCd}" 
								  	data-finprdtnm="${savingPrdt.finPrdtNm}"
									data-savetrm="${savingPrdt.saveTrm }" 
									data-fincono="${savingPrdt.finCoNo }"
									data-intrratetype="${savingPrdt.intrRateType}"
									data-savemoney="${savingPrdt.saveMoney }"
									data-rsrvtype="${savingPrdt.rsrvType}"
								  >
							  </div>
							</td>
							<td class="align-middle text-center">${savingPrdt.korCoNm}</td>						
							<td class="align-middle text-center">${savingPrdt.finPrdtNm}</td>						
							<td class="align-middle text-center">${savingPrdt.rsrvTypeNm}</td>						
							<td class="align-middle text-center">${savingPrdt.intrRate}%</td>						
							<td class="align-middle text-center">${savingPrdt.afterTexIntrRate}%</td>						
							<td class="align-middle text-center">${savingPrdt.dispIntrAmount}</td>						
							<td class="align-middle text-center">${savingPrdt.intrRate2}%</td>						
							<td class="align-middle text-center">${savingPrdt.joinDenyNm}</td>						
							<td class="align-middle text-center">${savingPrdt.intrRateTypeNm}</td>						
							<td class="align-middle text-center">
								<div> <a href="${savingPrdt.hompUrl }" target="_blank"> ${savingPrdt.korCoNm}</a></div>
								<div>(홈페이지)</div>
								<div>${savingPrdt.calTel }</div>
								<div>(대표번호)</div>
							</td>						
							<td class="align-middle text-center">
								<p class="d-inline-flex gap-1">
								  <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapse${i }" role="button" aria-expanded="false" aria-controls="collapse${i }">
								    상세정보
								  </a>
								</p>
							</td>						
						</tr>
						<tr class="addTable">
							<td colspan="12">
							<div id="collapse${i }" class="collapse" aria-labelledby="heading${i }" data-parent="#accordion">
								<table class="row detailTable">
									<thead>
										<tr class="row">
											<th class="col-md-4 align-middle text-center">담당부서 및 연락처</th>																			
											<th class="col-md-4 align-middle text-center">우대조건</th>																			
											<th class="col-md-4 align-middle text-center">가입대상</th>
										</tr>
									</thead>
									<tbody>
									<tr class="row">
											<td class="col-md-4  align-middle text-center">${savingPrdt.dclsChrgMan}</td>
											<td class="col-md-4  align-middle text-center">${savingPrdt.spclCnd}</td>
											<td class="col-md-4  align-middle text-center">${savingPrdt.joinMember}</td>
										</tr>
									</tbody>	
									<thead>
										<tr class="row">
											<th class="col-md-4 align-middle text-center">가입방법</th>																			
											<th class="col-md-4 align-middle text-center">만기후 이자율</th>																			
											<th class="col-md-4 align-middle text-center">기타 유의사항</th>
										</tr>
									</thead>
									<tbody>
									<tr class="row">
											<td class="col-md-4 align-middle text-center">${savingPrdt.joinWay}</td>
											<td class="col-md-4 align-middle text-center">${savingPrdt.mtrtInt}</td>
											<td class="col-md-4 align-middle text-center">${savingPrdt.etcNote}</td>
										</tr>
									</tbody>	
								</table>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
				<tfoot>
					<tr>
						<td colspan="11">
							${paging.pagingHTML }
						</td>
					</tr>
				</tfoot>	
			</table>
			<form:form id="searchForm" modelAttribute="simpleCondition">
				<form:hidden path="searchType" />
				<form:hidden path="searchWord"/>
				<input type="hidden" name="page"/>
			</form:form>
		</div>
	</div>
</div>

<div class="modal " data-url="${viewURL}" id="staticBackdrop"
	tabindex="-1">
	<div class="modal-fullscreen modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상품비교</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div id="comparePrdtArea">
				</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
</div>

<script>
	
	/* 선택상품 */
	var prdtCheckBox = document.getElementsByClassName("prdtCheckBox");
	$(staticBackdrop).on('show.bs.modal',function(event){
		let selectPrdt = 'input[name="comparePrdt"]:checked';
		let selectedPrdts = document.querySelectorAll(selectPrdt);
		let data;
		let finPrdtCdList=[];
		let intrRateTypeList=[];
		let finCoNoList=[];
		let saveTrmList=[];
		let rsrvTypeList=[];
// 		var saveMoney = document.querySelectorAll(selectPrdt).dataset.savemoney;
		selectedPrdts.forEach((prdt)=>{
			finPrdtCdList.push(prdt.dataset.finprdtcd);
			intrRateTypeList.push(prdt.dataset.intrratetype);
			finCoNoList.push(prdt.dataset.fincono);
			saveTrmList.push(prdt.dataset.savetrm);
			rsrvTypeList.push(prdt.dataset.rsrvtype);
		})
		data = {
				finPrdtCdList: finPrdtCdList,
				intrRateTypeList:intrRateTypeList,
				saveMoney:document.querySelector("#saveMoney").value.replace(/,/g, ''),
				finCoNoList:finCoNoList,
				saveTrmList:saveTrmList,
				rsrvTypeList:rsrvTypeList
			};
		
			fetch(`${pageContext.request.contextPath}/saving/compareSavingPrdt.do`, {
			    method: "POST",
			    headers: {
			        "Content-Type": "application/json;charset=UTF-8"
			    },
			    body: JSON.stringify(data)
			})
			.then(response => {
			    if (!response.ok) {
			        throw new Error("Network response was not ok");
			    }
			    return response.text();
			})
			.then(data => {
			    let comparePrdtArea = document.querySelector("#comparePrdtArea");
			        if (comparePrdtArea) {
			            comparePrdtArea.innerHTML = data;
			        }
			})
			.catch(error => {
			    // 오류 처리 코드
			    console.error("Error:", error);
			});
 	}).on('hidden.bs.modal',function(){
	    let comparePrdtArea = document.querySelector("#comparePrdtArea");
	    if (comparePrdtArea) {
	        comparePrdtArea.innerHTML = "";
	    }
 	})
	
</script>
