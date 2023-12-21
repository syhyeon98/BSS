<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- c3.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/c3.css">

<!-- c3.js -->
<script src="${pageContext.request.contextPath }/resources/js/c3/c3.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/c3/d3-5.8.2.min.js"></script>

<style>
.docCount {
	width: 30%
}

.card-title {
	font-size: 14px;
}

.card-text {
	height: 300px;
	overflow-x: auto;
}
</style>

<h5>☗ 전자결재 ▸ 결재문서 ▸ 나의 문서 보관함</h5>
	<hr color="black"/>
<div class="container">
	<!-- 진행도,차트 -->
	<div class="d-flex justify-content-between mb-4 ">
		<!-- 진행 문서 -->
		<div
			class="d-flex p-3 justify-content-between docCount rounded border">
			<div id="chart1" class="w-50">차트</div>
			<div class="w-50">
				<div>진행 문서</div>
				<div class="d-flex justify-content-between">
					<div class="p-1">
						<div>진행</div>
						<div>${totalIngCount }건</div>
					</div>
					<div class="p-1">
						<div>전체</div>
						<div>
							<span class="fs-4">${totalCount}</span>건
						</div>
					</div>
				</div>
			</div>
		</div>
		<div
			class="d-flex p-3 border justify-content-between docCount rounded">
			<div id="chart2" class="w-50">차트</div>
			<div class="w-50">
				<div>반려 문서</div>
				<div class="d-flex justify-content-between">
					<div class="p-1">
						<div>반려</div>
						<div>${totalReturnCount }건</div>
					</div>
					<div class="p-1">
						<div>전체</div>
						<div>
							<span class="fs-4">${totalCount}</span>건
						</div>
					</div>
				</div>
			</div>
		</div>
		<div
			class="d-flex p-3 justify-content-between docCount rounded border">
			<div id="chart3" class="w-50">차트</div>
			<div class="w-50">
				<div>승인 문서</div>
				<div class="d-flex justify-content-between">
					<div class="p-1">
						<div>승인</div>
						<div>${totalSuccessCount }건</div>
					</div>
					<div class="p-1">
						<div>전체</div>
						<div>
							<span class="fs-4">${totalCount}</span>건
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 리스트 -->
	<div>
		<div id="searchUI" class="d-flex mt-4 mb-4">
			<form:select path="simpleCondition.searchType"
				class="form-select col-md-1 me-1">
				<form:option value="" label="전체" />전체
				<form:option value="D_01" label="진행" />
				<form:option value="D_02" label="승인" />
				<form:option value="D_04" label="반려" />
			</form:select>
		</div>
		<div id="documentArea"></div>
	</div>

</div>


<script>
	
	let data;
	
	// 문서리스트 불러오기
	$(document).ready(function(){
		let code= $(".form-select option:selected").val()
		let detailCondition ={
			code:code
		}
		let data = {
				currentPage : 1,
				detailCondition:detailCondition
		};
		console.log("시작페이지 : " , data)
		callDocumentList(data);
	 });
	
	// 페이지 선택시
	function fn_paging(page){
		let code= $(".form-select option:selected").val()
		let detailCondition ={
			code:code
		}
		data ={
			currentPage:page,
			detailCondition:detailCondition
		}
		callDocumentList(data)
	};
	
	// documentList부르기
	function callDocumentList(data){
		console.log("callDocumentList : " , data)
		let setting = {
				url : `${pageContext.request.contextPath}/ed/document/myDocumentList.do`,
				method : "POST",
				dataType : "text",
				data : JSON.stringify(data),
				contentType:"application/json",
				success : function(resp) {
					console.log(resp)
					$("#documentArea").html(resp)
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR)
					console.log(status)
					console.log(error)
				}
			}
			$.ajax(setting);
	}
	
	$(".form-select").on("change",function(){
		
		let code= $(".form-select option:selected").val()
		let detailCondition ={
			code:code
		}
		data ={
			currentPage:1,
			detailCondition:detailCondition
		}
		callDocumentList(data);
	})
	
	/* 여기부터 차트 */
	let totalCount = ${totalCount}

	let columns1=[];
	if(totalCount == ${totalIngCount }){
	columns1.push(['진행',${totalIngCount }],
	 ['전체',0]
	)}else{
	
	columns1.push(['진행',${totalIngCount }],
			 ['전체',totalCount])
	}
	
	let columns2=[];
	if(totalCount == ${totalReturnCount }){
	columns2.push(['반려',${totalReturnCount }],
	 ['전체',0]
	)}else{
	
	columns2.push(['반려',${totalReturnCount }],
			 ['전체',totalCount])
	}
	
	var chart1=c3.generate({
	    bindto: '#chart1',
	    data: {
	      columns:[
	    	  ['진행',0],
	    	  ['전체',0]
	      ],
	      type : 'donut',
	      colors: {
	            "진행": '#0678b6',
	            "전체": '#e5e5e5',
	        },
	    },
	});
	
	setTimeout(function () {
	    chart1.load({
	        columns: columns1
	    });
	}, 500);
	
	var chart2=c3.generate({
	    bindto: '#chart2',
	    data: {
	      columns:[
	    	  ['반려',0],
	    	  ['전체',0]
	      ],
	      type : 'donut',
	      colors: {
	            "반려": '#e17b9c',
	            "전체": '#e5e5e5',
	        },
	    },
	});
	
	setTimeout(function () {
	    chart2.load({
	        columns: columns2
	    });
	}, 500);
	
	let successCount = ${totalSuccessCount };
	
	let columns3=[];
	if(totalCount == successCount){
	columns3.push(['승인',successCount],
	 ['전체',0]
	)}else{
	
	columns3.push(['승인',successCount],
			 ['전체',totalCount])
	}
	
	
	var chart3=c3.generate({
	    bindto: '#chart3',
	    data: {
	      columns:[
	    	  ['승인',0],
	    	  ['전체',0]
	      ],
	      type : 'donut',
	      colors: {
	            "승인": '#6fceb2',
	            "전체": '#e5e5e5',
	        },
	    },
	});
	
	setTimeout(function () {
	    chart3.load({
	        columns: columns3
	    });
	}, 500);

	/* 차트 끝 */
	
	
	
</script>