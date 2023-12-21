<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="${pageContext.request.contextPath }/resources/js/pdf/html2canvas.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/pdf/jspdf.plugin.autotable.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/pdf/jspdf.min.js"></script>
<style>
.detailTable {
	background-color: #e7edf4;
}

.modal-dialog {
	max-width: 100%;
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
					data-bs-toggle="modal" data-bs-target="#staticBackdrop">선택상품
					비교</button>
			</div>
		</div>
		<div class="col-md-12">
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="table-secondary">
						<th class="text-center">비교선택</th>
						<th class="text-center">금융회사</th>
						<th class="text-center">상품명</th>
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
					<c:forEach items="${paging.dataList }" var="deposit">
						<c:set var="i" value="${i+1 }" />
						<tr>
							<td class="align-middle">
								<div
									class="form-check form-check-inline d-flex justify-content-center">
									<input class="form-check-input prdtCheckBox" type="checkbox"
										name="comparePrdt" value=""
										data-finprdtcd="${deposit.finPrdtCd}"
										data-finprdtnm="${deposit.finPrdtNm}"
										data-savetrm="${deposit.saveTrm }"
										data-fincono="${deposit.finCoNo }"
										data-intrratetype="${deposit.intrRateType}"
										data-savemoney="${deposit.saveMoney }">
								</div>
							</td>
							<td class="align-middle text-center">${deposit.korCoNm}</td>
							<td class="align-middle text-center">${deposit.finPrdtNm}</td>
							<td class="align-middle text-center">${deposit.intrRate}%</td>
							<td class="align-middle text-center">${deposit.afterTexIntrRate}%</td>
							<td class="align-middle text-center">${deposit.dispIntrAmount}</td>
							<td class="align-middle text-center">${deposit.intrRate2}%</td>
							<td class="align-middle text-center">${deposit.joinDenyNm}</td>
							<td class="align-middle text-center">${deposit.intrRateTypeNm}</td>
							<td class="align-middle text-center">
								<div>
									<a href="${deposit.hompUrl }" target="_blank">
										${deposit.korCoNm}</a>
								</div>
								<div>(홈페이지)</div>
								<div>${deposit.calTel }</div>
								<div>(대표번호)</div>
							</td>
							<td class="align-middle text-center">
								<p class="d-inline-flex gap-1">
									<a class="btn btn-primary" data-bs-toggle="collapse"
										href="#collapse${i }" role="button" aria-expanded="false"
										aria-controls="collapse${i }"> 상세정보 </a>
								</p>
							</td>
						</tr>
						<tr class="addTable">
							<td colspan="11">
								<div id="collapse${i }" class="collapse"
									aria-labelledby="heading${i }" data-parent="#accordion">
									<table class="row detailTable">
										<thead>
											<tr class="row">
												<th class="col-md-4 align-middle text-center">담당부서 및
													연락처</th>
												<th class="col-md-4 align-middle text-center">우대조건</th>
												<th class="col-md-4 align-middle text-center">가입대상</th>
											</tr>
										</thead>
										<tbody>
											<tr class="row">
												<td class="col-md-4  align-middle text-center">${deposit.dclsChrgMan}</td>
												<td class="col-md-4  align-middle text-center">${deposit.spclCnd}</td>
												<td class="col-md-4  align-middle text-center">${deposit.joinMember}</td>
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
												<td class="col-md-4 align-middle text-center">${deposit.joinWay}</td>
												<td class="col-md-4 align-middle text-center">${deposit.mtrtInt}</td>
												<td class="col-md-4 align-middle text-center">${deposit.etcNote}</td>
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
						<td colspan="11">${paging.pagingHTML }</td>
					</tr>
				</tfoot>
			</table>
			<form:form id="searchForm" modelAttribute="simpleCondition">
				<form:hidden path="searchType" />
				<form:hidden path="searchWord" />
				<input type="hidden" name="page" />
			</form:form>
		</div>
	</div>
</div>

<div class="modal " data-url="${viewURL}" id="staticBackdrop"
	tabindex="-1">
	<div class="modal-fullscreen modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">☗ 실시간금융정보 ▸ 상품비교</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div id="comparePrdtArea"></div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	var dataList;
	
	/* 선택상품 */
	var prdtCheckBox = document.getElementsByClassName("prdtCheckBox");
	$(staticBackdrop).on('show.bs.modal',function(event){
		$("html, body").animate({ scrollTop: 0 }, "slow");
		let selectPrdt = 'input[name="comparePrdt"]:checked';
		let selectedPrdts = document.querySelectorAll(selectPrdt);
		let finPrdtCdList=[];
		let intrRateTypeList=[];
		let finCoNoList=[];
		let saveTrmList=[];
// 		var saveMoney = document.querySelectorAll(selectPrdt).dataset.savemoney;
		selectedPrdts.forEach((prdt)=>{
			finPrdtCdList.push(prdt.dataset.finprdtcd);
			intrRateTypeList.push(prdt.dataset.intrratetype);
			finCoNoList.push(prdt.dataset.fincono);
			saveTrmList.push(prdt.dataset.savetrm);
		})
		dataList = {
				finPrdtCdList: finPrdtCdList,
				intrRateTypeList:intrRateTypeList,
				saveMoney:document.querySelector("#saveMoney").value.replace(/,/g, ''),
				finCoNoList:finCoNoList,
				saveTrmList:saveTrmList
			};
		
			fetch(`${pageContext.request.contextPath}/deposit/compareDepoist.do`, {
			    method: "POST",
			    headers: {
			        "Content-Type": "application/json;charset=UTF-8"
			    },
			    body: JSON.stringify(dataList)
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



<script>
// let setting = {
// 	url : `${pageContext.request.contextPath}/deposit/downloadExcel`,
// 	method : "POST",
// 	dataType : "text",
// 	data :JSON.stringify(dataList),
// 	contentType: 'application/json',
// 	success : function(resp) {

// 	},
// 	error : function(jqXHR, status, error) {
// 		console.log(jqXHR)
// 		console.log(status)
// 		console.log(error)
// 	}
// }

// $.ajax(setting);
function downloadExcelBlob(response) {
    // Convert the response to a Blob
    const blob = new Blob([response], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });

    // Create a temporary anchor element
    const anchor = document.createElement('a');
    anchor.href = URL.createObjectURL(blob);
    anchor.download = 'excel_file.xlsx';
    anchor.style.display = 'none';

    // Trigger a click event on the anchor
    document.body.appendChild(anchor);
    anchor.click();
    document.body.removeChild(anchor);
}

$("#comparePrdtArea").on("click", "#downloadExcel", function () {
    const url = `${pageContext.request.contextPath}/deposit/downloadExcel`;
    let selectPrdt = 'input[name="comparePrdt"]:checked';
	let selectedPrdts = document.querySelectorAll(selectPrdt);
	let finPrdtCdList=[];
	let intrRateTypeList=[];
	let finCoNoList=[];
	let saveTrmList=[];
//		var saveMoney = document.querySelectorAll(selectPrdt).dataset.savemoney;
	selectedPrdts.forEach((prdt)=>{
		finPrdtCdList.push(prdt.dataset.finprdtcd);
		intrRateTypeList.push(prdt.dataset.intrratetype);
		finCoNoList.push(prdt.dataset.fincono);
		saveTrmList.push(prdt.dataset.savetrm);
	})
	let map = {
			finPrdtCdList: finPrdtCdList,
			intrRateTypeList:intrRateTypeList,
			saveMoney:document.querySelector("#saveMoney").value.replace(/,/g, ''),
			finCoNoList:finCoNoList,
			saveTrmList:saveTrmList
		};
	
	console.log("map",map);
	
    $.ajax({
        url: url,
        method: 'POST',
        data: JSON.stringify(dataList),
        contentType: 'application/json',
	     xhrFields: {
	         responseType: 'blob' // Set the response type to Blob
	     },
	     success: function (response) {
	         downloadExcelBlob(response);
	     },
        error: function (jqXHR, status, error) {
            console.log(jqXHR);
            console.log(status);
            console.log(error);
        }
    });
});

// $("#comparePrdtArea").on("click", "#downloadExcel", function () {
//     const url = `${pageContext.request.contextPath}/deposit/downloadExcel`;
//     let excelRowArr = $(".excelRow");
// 	let excelRowCells=[];
// 	let excelRowData =[];
	
	
// 	console.log(excelRowArr[0].cells)
// 	for(let i =0;i<excelRowArr.length;i++){
// 		excelRowCells[i] = excelRowArr[i].cells;
// 	}
// 	console.log(excelRowCells);
// 	for(let i =0 ; i<excelRowCells.length;i++){
// 		let rowData = []
// 		for(let j =0;j<excelRowCells[i].length;j++){
// 			rowData.push(excelRowCells[i][j].innerText)
// 		}
// 		console.log(rowData)
// 		excelRowData[i]=rowData;
//  	}
//     $.ajax({
//         url: url,
//         method: 'POST',
//         data: JSON.stringify(excelRowData),
//         contentType: 'application/json',
//         xhrFields: {
//             responseType: 'blob' // Set the response type to Blob
//         },
//         success: function (response) {
//             downloadExcelBlob(response);
//         },
//         error: function (jqXHR, status, error) {
//             console.log(jqXHR);
//             console.log(status);
//             console.log(error);
//         }
//     });
// });




$("#comparePrdtArea").on("click", "#downloadPdf", function () {
 const quality = 1;
    html2canvas($('#pdfArea')[0], { scale: 3 }).then(function(canvas) {
    	var imgData = canvas.toDataURL('image/png');
        var imgWidth = 200;
        var imgHeight = canvas.height * imgWidth / canvas.width;

        var doc = new jsPDF('p', 'mm', 'a4'); // Use 'a4' as the third parameter for default A4 size
        
        var position = 0;
        var pageHeight = imgHeight;
        var margin = 0;
        console.log(imgWidth)
        console.log(imgHeight)
            doc.addImage(imgData, 'PNG', margin, -211,298,211,'','',-90);
        doc.save('file-name.pdf');
    });
});



	

</script>
