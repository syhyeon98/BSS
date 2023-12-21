<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- c3.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/c3.css">

<!-- c3.js -->
<script src="${pageContext.request.contextPath }/resources/js/c3/c3.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/c3/d3-5.8.2.min.js"></script>
금융정보 메인 페이지
<div >
	
	<div class="d-flex">
		<div id="chart1" style="width:50%"></div>
		<div id="chart2">경제뉴스</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		firstCallList();
	});

	function firstCallList() {
		$.ajax({
					url : `${pageContext.request.contextPath}/finMarket/mainExchangeRateList`,
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


	
</script>