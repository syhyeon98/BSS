<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- c3.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/c3.css">

<!-- c3.js -->
<script src="${pageContext.request.contextPath }/resources/js/c3/c3.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/c3/d3-5.8.2.min.js"></script>

<h5>☗ 실시간금융정보 ▸ 금융시장 ▸ 국가지수</h5>
<hr color="black">
<div class="row g-3 justify-content-center">
	<div class="col-auto">
		<input type="month" id="startDate" class="form-control">
	</div>
	<div class="col-auto">
		<input type="month" id="endDate" class="form-control">
	</div>
	<div class="col-auto" id="accountCondition"
		style="overflow-x: hidden; height: 200px;">
		<div class="form-check">
			<input class="form-check-input" type="checkbox" checked
				id="account_chkAll" value=""> <label
				class="form-check-label" for="account_chkAll">전체</label>
		</div>
		<c:forEach items="${accountList }" var="account">
			<div class="form-check ">
				<input class="form-check-input" checked type="checkbox"
					id="account_${account.itemCode }" value="${account.itemCode }">
				<label class="form-check-label" for="account_${account.itemCode }">${account.itemName}</label>
			</div>
		</c:forEach>
	</div>
	<div class="col-auto">
		<input type="button" id="searchBtn" class="btn btn-primary" value="조회">
	</div>
</div>

<div class="row mb-2">
	<div class="col-md-2">
		<select id="chartType" class="form-select">
			<option value="bar">세로막대형</option>
			<option value="line">꺾은선</option>
		</select>
	</div>
</div>
<div id="chart1"></div>

<script>
	$(document).ready(function() {
		firstCallList();
		const today = new Date();
		const year = today.getFullYear();
		const month = String(today.getMonth() + 1).padStart(2, '0');
		const day = String(today.getDate()).padStart(2, '0');
		const formattedDate = `\${year}-\${month}`;
		$("#startDate").val(formattedDate);
		$("#endDate").val(formattedDate);
		$("#startDate").prop("max", formattedDate);
		$("#endDate").prop("max", formattedDate);
	});

	function callList(data) {
		$.ajax({
					url : `${pageContext.request.contextPath}/finMarket/nationalIndexList`,
					type : 'POST',
					dataType : 'json',
					data : JSON.stringify(data),
					contentType : "application/json",
					success : function(result) {
						makeBarChart(result);
						console.log(result);
					},
					error : function(result) {
						console.log("error >> " + $(result).text());
					}
				});
	}
	function firstCallList() {
		$.ajax({
					url : `${pageContext.request.contextPath}/finMarket/firstNationalIndex`,
					type : 'GET',
					dataType : 'json',
					success : function(result) {
						makeBarChart(result);
					},
					error : function(result) {
						console.log("error >> " + $(result).text());
					}
				});
	}

	function makeBarChart(jsonData) {
		var chartType = $("#chartType").val();
		var rows = jsonData.itemList;
		var unitName= rows[0].UNIT_NAME;
	
		var dataList = [];
		var dataListNm = jsonData.dataListNm;
		var baseMonthList = jsonData.timeList;
		console.log(baseMonthList)
		console.log(rows)
		// 		for(let i = 0;i< rows.length;i++){
		// 			dataListNm.push(rows[i].ITEM_NAME1);
		// 		}
		for (let i = 0; i < rows.length; i++) {
			dataList.push(rows[i].DATA_VALUE)
		}
		var rowData = [];
		var columns = [];
		var beforeColumns = [];
		// 		var datas = new Array();
		// 		var beforeDatas = new Array();
		var x = [ "x" ];

		for (let i = 0; i < baseMonthList.length; i++) {
			x.push(baseMonthList[i]);
		}
		columns.push(x);
		beforeColumns.push(x);
		console.log(x);
		// 		for ( var row in rows) {
		// 		datas.push(x);
		for (let i = 0; i < dataListNm.length; i++) {
			var rowData = [ dataListNm[i] ];
			for (let j = i * baseMonthList.length; j < i * baseMonthList.length
					+ baseMonthList.length; j++) {
				rowData.push(dataList[j]);
			}
			columns.push(rowData);
		}
		console.log("columns : " + columns)
		for (let i = 0; i < dataListNm.length; i++) {
			var rowData = [ dataListNm[i] ];
			for (let j = i * baseMonthList.length; j < i * baseMonthList.length
					+ baseMonthList.length; j++) {
				rowData.push(0);
			}
			beforeColumns.push(rowData);
		}

		var chart = c3.generate({
			bindto : '#chart1',
			data : {
				type : chartType,
				x : 'x',
				columns : beforeColumns
			},
			bar : {
				width : {
					radio : 0.5
				}
			},
			legend : {
				position : 'right'
			},
			axis : {
				x : {
					type : 'category' // x축을 카테고리 형태로 사용
				},
				y : {
					label : {
						text : unitName,
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
			tooltip : {
				grouped : false
			}
		});

		setTimeout(function() {
			chart.load({
				columns : columns
			});
		}, 200);
		
		$("#chartType").on("change",function(){
			var chartType = $(this).val();
			chart.transform(chartType);
		})
	}



	$('#account_chkAll').on(
			'click',
			function() {
				if ($('#account_chkAll').is(':checked')) {
					$('#accountCondition').find("input:checkbox").prop(
							"checked", true)
				} else {
					$('#accountCondition').find("input:checkbox").prop(
							"checked", false)
				}
			})

	$('#accountCondition').find("input:checkbox").not("#account_chkAll").on(
			'click',
			function() {
				let checkedNum = $('#accountCondition').find("input:checked")
						.not("#account_chkAll").length;
				let checkBoxAll = $('#accountCondition').find("input:checkbox")
						.not("#account_chkAll").length;
				if (checkedNum == checkBoxAll) {
					$('#account_chkAll').prop("checked", true)
				} else {
					$('#account_chkAll').prop("checked", false)
				}
			})

	$("#searchBtn").on(
			"click",
			function() {
				let accountCd = [];
				let startBaseMm = $("#startDate").val().replaceAll('-', '');
				let endBaseMm = $("#endDate").val().replaceAll('-', '');
				let checkedaccountCd = $('#accountCondition').find(
						"input:checked").not("#account_chkAll");
				for (let i = 0; i < checkedaccountCd.length; i++) {
					accountCd[i] = checkedaccountCd[i].value;
				}
				data = {
					accountCd : accountCd,
					startBaseMm : startBaseMm,
					endBaseMm : endBaseMm
				}
				callList(data);
			});
</script>

