<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.modal-dialog {
	max-width: 100%;
}
</style>

<!-- c3.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/c3.css">

<!-- c3.js -->
<script src="${pageContext.request.contextPath }/resources/js/c3/c3.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/c3/d3-5.8.2.min.js"></script>


<div class="d-flex justify-content-end align-items-center">
	<c:choose>
		<c:when test="${unitList[0]=='개' }">
			<div class="text-end">단위 : ${unitList[0]}</div>
		</c:when>
		<c:otherwise>
			<div class="text-end">단위 : 백만${unitList[0]}</div>
		</c:otherwise>
	</c:choose>
	<button id="showChartBtn" class="btn btn-primary ms-2" type="button"
		data-bs-toggle="modal" data-bs-target="#staticBackdrop">차트</button>
</div>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th class="align-middle text-center">금융회사</th>
						<th class="align-middle text-center">구분</th>
						<c:forEach items="${baseMonthList}" var="baseMonth">
							<th class="align-middle text-center baseMonthList">${baseMonth }</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<c:set var="i" value="0" />
					<c:forEach items="${bankList }" var="bank">
						<tr>
							<td class="align-middle text-center bankList"
								rowspan="${infoList.size()/baseMonthList.size()/bankList.size()+1}">${bank }</td>
							<c:forEach begin="0"
								end="${infoList.size()/baseMonthList.size()/bankList.size()-1}"
								var="j">
								<tr>
									<td class="align-middle text-center accountNmList"
										data-test="${bank}_${infoList[i].accountNm}">${infoList[i].accountNm}</td>
									<c:forEach items="${baseMonthList}" var="baseMonth">
										<td class="align-middle text-end infoList" data-infolist="${infoList[i].a}"><c:if test="${not empty infoList[i].a and infoList[i].a > 1000000}">
												<fmt:formatNumber value="${infoList[i].a/1000000}" pattern="#,##0" />
											</c:if> <c:if test="${empty infoList[i].a or infoList[i].a < 1000000}">
												<c:if test="${unitList[0]=='개' }">
													<fmt:formatNumber value="${infoList[i].a}" pattern="#,##0" />
												</c:if>
												<c:if test="${unitList[0]!='개' }">${infoList[i].a}</c:if>
											</c:if></td>
										<c:set var="i" value="${i + 1}" />
									</c:forEach>
								</tr>
							</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="modal " data-url="${viewURL}" id="staticBackdrop"
	tabindex="-1">
	<div class="modal-fullscreen modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-center"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row mb-2">
					<div class="col-md-2">
						<select id="chartType" class="form-select">
							<option value="bar">세로막대형</option>
							<option value="line">꺾은선</option>
							<option value="pie">파이</option>
						</select>
					</div>
				</div>
				<div id="chart"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

	$(".modal-title").text( $("input[name=listNo]:checked").data().name);
	var baseMonthList = $(".baseMonthList");//달
	var accountNmList = $(".accountNmList");// 계쩡항목
	var bankList = $(".bankList"); // 은행
	var infoList = $(".infoList"); // 총 데이터

	var dataListNm = [];
	var dataList = [];

	for (let i = 0; i < accountNmList.length; i++) {
		dataListNm.push(accountNmList[i].dataset.test);
	}
	for (let i = 0; i < infoList.length; i++) {
		dataList.push(infoList[i].dataset.infolist);
	}

	var rowData = [];
	var columns = [];
	var beforeColumns = [];

	var x = [ "x" ];

	for (let i = 0; i < baseMonthList.length; i++) {
		x.push(baseMonthList[i].innerText);
	}

	beforeColumns.push(x);
	columns.push(x);
	for (let i = 0; i < dataListNm.length; i++) {
		var rowData = [ dataListNm[i] ];
		for (let j = i * baseMonthList.length; j < i * baseMonthList.length
				+ baseMonthList.length; j++) {
			rowData.push(dataList[j]);
		}
		columns.push(rowData);
	}
	console.log(columns);

	for (let i = 0; i < dataListNm.length; i++) {
		var rowData = [ dataListNm[i] ];
		for (let j = i * baseMonthList.length; j < i * baseMonthList.length
				+ baseMonthList.length; j++) {
			rowData.push(0);
		}
		beforeColumns.push(rowData);
	}

	$("#showChartBtn").on("click", function() {
		var chart = c3.generate({
			bindto : '#chart',
			data : {
				x : 'x',
				columns : beforeColumns,
				type : 'bar'
			},  
			legend: {
		        position: 'right'
		    },
			axis : {
				x : {
					type : 'category' // x축을 카테고리 형태로 사용
				},
				y : {
					label : {
						text : 'Y Label',
						position : 'outer-middle'
					}
				}
			},
			zoom : {
				enabled : true
			},
			size : {
				height : 500
			},
			 tooltip: {
			        grouped: false // Default true
		    }
		});

		setTimeout(function() {
			chart.load({
				columns : columns
			});
		}, 500);
		
		$("#chartType").on("change",function(){
			var chartType = $(this).val();
			console.log(chartType);
			if(chartType != "rotatedBar"){
				chart.transform(chartType);
			}
		})
		
	})

// 	$(staticBackdrop).on('show.bs.modal', function(event) {

// 	}).on('hidden.bs.modal', function() {
// 	})
</script>