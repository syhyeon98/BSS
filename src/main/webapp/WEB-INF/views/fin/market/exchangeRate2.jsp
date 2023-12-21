<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!-- c3.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/c3.css">

<!-- c3.js -->
<script src="${pageContext.request.contextPath }/resources/js/c3/c3.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/c3/d3-5.8.2.min.js"></script>


<div class="row g-3 justify-content-center">
	<div class="col-auto">
		<input type="date" id="startDate" class="form-control">
	</div>
	<div class="col-auto">
		<input type="date" id="endDate" class="form-control">
	</div>
	<div class="col-auto" id="accountCondition" style="overflow-x:hidden;  height:200px;" > 
		<div class="form-check">
			<input class="form-check-input" type="checkbox" checked
				id="account_chkAll" value=""> <label class="form-check-label"
				for="account_chkAll">전체</label>
		</div>
		<c:forEach items="${accountList }" var="account">
			<div class="form-check " >
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


<div id="chart1"></div>

<script>
	$(document).ready(function() {
		firstCallList();
		const today = new Date();
	    const year = today.getFullYear();
	    const month = String(today.getMonth() + 1).padStart(2, '0');
	    const day = String(today.getDate()).padStart(2, '0');
	    const formattedDate = `\${year}-\${month}-\${day}`;
		$("#startDate").val(formattedDate);
		$("#endDate").val(formattedDate);
		$("#startDate").prop("max",formattedDate);
		$("#endDate").prop("max",formattedDate);
	});

	function callList(data) {
		$.ajax({
					url : `${pageContext.request.contextPath}/finMarket/exchangeRateList`,
					type : 'POST',
					dataType : 'json',
					data : JSON.stringify(data),
					contentType:"application/json",
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
					url : `${pageContext.request.contextPath}/finMarket/firstexchangeRateList`,
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
		var rows = jsonData.itemList;
		var datas = new Array();
		var beforeDatas = new Array();
		var x = [ "x" ];

		for(let i = 0 ; i<rows.length;i++){
			x.push(rows[i].TIME);
		}
		console.log(x);
// 		for ( var row in rows) {
		datas.push(x);
		for ( let i = 0 ; i<rows.length;i++) {
// 			x.push(rows[row].TIME);
			datas.push(x);
// 			var rowData = [ rows[row].ITEM_NAME1, rows[row].DATA_VALUE ];
			var rowData = [ rows[i].ITEM_NAME1, rows[i].DATA_VALUE ];
			datas.push(rowData);
		}
		console.log(datas);

// 		for ( var row in rows) {
			beforeDatas.push(x);
		for ( let i = 0 ; i<rows.length;i++) {
// 			x.push(rows[row].TIME);
			var rowData = [ rows[i].ITEM_NAME1, 0 ];
// 			var rowData = [ rows[row].ITEM_NAME1, 0 ];
			beforeDatas.push(rowData);
		}

		var chart = c3.generate({
			bindto : '#chart1',
			data : {
				type : 'bar',
				x : 'x',
				columns : beforeDatas
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
						text : '원',
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
				columns : datas
			});
		}, 200);
	}
	
	$('#account_chkAll').on('click',function(){
		if($('#account_chkAll').is(':checked')){
			$('#accountCondition').find("input:checkbox").prop("checked",true)
		}else{
			$('#accountCondition').find("input:checkbox").prop("checked",false)
		}
	})
	
	$('#accountCondition').find("input:checkbox").not("#account_chkAll").on('click',function(){
		let checkedNum = $('#accountCondition').find("input:checked").not("#account_chkAll").length;
		let checkBoxAll=$('#accountCondition').find("input:checkbox").not("#account_chkAll").length;
		if(checkedNum==checkBoxAll){
			$('#account_chkAll').prop("checked",true)
		}else {
			$('#account_chkAll').prop("checked",false)
		}
	})	
	
	$("#searchBtn").on("click",function(){
		let accountCd=[];
		let startBaseMm = $("#startDate").val().replaceAll('-','');
		let endBaseMm= $("#endDate").val().replaceAll('-','');
		let checkedaccountCd=$('#accountCondition').find("input:checked").not("#account_chkAll");
		for(let i = 0;i<checkedaccountCd.length;i++){
			accountCd[i]=checkedaccountCd[i].value;
		}
		data ={
			accountCd:accountCd,
			startBaseMm:startBaseMm,
			endBaseMm:endBaseMm
		}
		callList(data);
	});
</script>

