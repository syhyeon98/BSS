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
						<th class="text-center">금리방식</th>
						<th class="text-center">상환방식</th>
						<th class="text-center">당월<br>최저금리</th>
						<th class="text-center">당월<br>최고금리</th>
						<th class="text-center">전월<br>평균금리</th>
						<th class="text-center">월평균<br>상환액</th>
						<th class="text-center">금융상품문의</th>
						<th class="text-center">상세</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${paging.dataList }" var="rentHouse" >
					<c:set  var="i" value="${i+1 }"/>
						<tr>
							<td class="align-middle">
							  <div class="form-check form-check-inline d-flex justify-content-center">
								  <input class="form-check-input prdtCheckBox" type="checkbox" name="comparePrdt" value=""
								  	data-finprdtcd="${rentHouse.finPrdtCd}" 
								  	data-finprdtnm="${rentHouse.finPrdtNm}"
									data-fincono="${rentHouse.finCoNo }"
									data-rpaytype="${rentHouse.rpayType}"
									data-lendratetype="${rentHouse.lendRateType}"
									data-loanamount="${rentHouse.loanAmount }"
								  >
							  </div>
							</td>
							<td class="align-middle text-center">${rentHouse.korCoNm}</td>						
							<td class="align-middle text-center">${rentHouse.finPrdtNm}</td>						
							<td class="align-middle text-center">${rentHouse.lendRateTypeNm}</td>						
							<td class="align-middle text-center">${rentHouse.rpayTypeNm}</td>						
							<td class="align-middle text-center">${rentHouse.lendRateMin}%</td>						
							<td class="align-middle text-center">${rentHouse.lendRateMax}%</td>						
							<td class="align-middle text-center">${rentHouse.lendRateAvg}%</td>						
							<td class="align-middle text-center">${rentHouse.dispMonthlyPayment}</td>						
							<td class="align-middle text-center">
								<div> <a href="${rentHouse.hompUrl }" target="_blank"> ${rentHouse.korCoNm}</a></div>
								<div>(홈페이지)</div>
								<div>${rentHouse.calTel }</div>
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
												<th class="col-md-4 align-middle text-center">가입방법</th>																			
												<th class="col-md-4 align-middle text-center">대출 부대비용</th>
											</tr>
										</thead>
										<tbody>
										<tr class="row">
												<td class="col-md-4  align-middle ">${rentHouse.dclsChrgMan}</td>
												<td class="col-md-4  align-middle ">${rentHouse.joinWay}</td>
												<td class="col-md-4  align-middle ">${rentHouse.loanInciExpn}</td>
											</tr>
										</tbody>	
										<thead>
											<tr class="row">
												<th class="col-md-4 align-middle text-center">중도상환 수수료</th>																			
												<th class="col-md-4 align-middle text-center">연체 이자율</th>																			
												<th class="col-md-4 align-middle text-center">대출한도</th>
											</tr>
										</thead>
										<tbody>
										<tr class="row">
												<td class="col-md-4 align-middle ">${rentHouse.erlyRpayFee}</td>
												<td class="col-md-4 align-middle ">${rentHouse.dlyRate}</td>
												<td class="col-md-4 align-middle ">${rentHouse.loanLmt}</td>
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
		let finCoNoList=[];
		let rpayTypeList=[];
		let lendRateTypeList=[];
		selectedPrdts.forEach((prdt)=>{
			finPrdtCdList.push(prdt.dataset.finprdtcd);
			finCoNoList.push(prdt.dataset.fincono);
			rpayTypeList.push(prdt.dataset.rpaytype);
			lendRateTypeList.push(prdt.dataset.lendratetype);
		})
		data = {
				finPrdtCdList: finPrdtCdList,
				finCoNoList:finCoNoList,
				loanAmount:document.querySelector("#loanAmount").value.replace(/,/g, ''),
				loanPeriod:document.querySelector("#loanPeriod").value,
				rpayTypeList:rpayTypeList,
				lendRateTypeList:lendRateTypeList
			};
		
			fetch(`${pageContext.request.contextPath}/rentHouseLoan/compareRentHouse.do`, {
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
    