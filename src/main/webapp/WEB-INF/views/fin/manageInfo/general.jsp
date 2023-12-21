<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h5>☗ 실시간금융정보 ▸ 경영정보 ▸ ${statisticsList[0].smlDivNm}</h5>
<hr color="black">

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-4 d-flex">
					 <input type="number" id="startYear" value="2022" class="me-1 form-control"  >
					 <select class="me-1 form-select" id="startMonth">
					 	<option value="03">03</option>
					 	<option value="06">06</option>
					 	<option value="09">09</option>
					 	<option value="12">12</option>
					 </select>	
					 ~
					 <input type="number" id="endYear" value="2023" class="me-1 ms-1 form-control">
					 <select class="me-1 form-select" id="endMonth">
					 	<option value="03">03</option>
					 	<option value="06">06</option>
					 	<option value="09">09</option>
					 	<option value="12">12</option>
					 </select>	
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2">
				<hr color="black">
				 	은행
				 	<hr color="black">
				 	<div class="row"  style="overflow-x:hidden;  height:400px;" id="bankCondition">
						<div class="col-md-11">
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" checked id="bank_chkAll" value="">
							  <label class="form-check-label" for="bank_chkAll">전체</label>
							 </div>
							  <c:forEach items="${bankList }" var="bank" >
								  <div class="form-check">
									  <input class="form-check-input" checked type="checkbox" id="bank_${bank.financeCd }" value="${bank.financeCd }">
									  <label class="form-check-label" for="bank_${bank.financeCd }">${bank.financeNm}</label>
								  </div>
							  </c:forEach>
						</div>
					</div>
				</div>
					<div class="col-md-1"></div>
				<div class="col-md-3">
				<div  style="overflow-x:hidden;  height:400px;">
				<hr color="black">
					통계표
					<hr color="black">
					<c:forEach items="${statisticsList }" var="statistics">
						<div class="d-grid gap-2 ms-2">
							<input type="radio" class="btn-check statisticBtn" name="listNo" data-name="${statistics.listNm }" id="${statistics.listNo }" value="${statistics.listNo }"> 
							<label class="btn btn-outline-primary statistics" for="${statistics.listNo }">${statistics.listNm }</label>
						</div>
					</c:forEach>
				</div>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-4">
				<hr color="black">
					통계항목
					<hr color="black">
					<div id="accountListArea" style="overflow-x:hidden;  height:400px;" >
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-md-12" id="statisticsInfo">
				</div>
				<div  class="d-flex justify-content-center">
				  <div  id="spinner" class="spinner-border text-primary" role="status">
				    <span class="visually-hidden">Loading...</span>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

$(document).ready(function(){
	$("#spinner").hide();
 });


/* 은행선택 체크박스*/
$('#bank_chkAll').on('click',function(){
	
	if($('#bank_chkAll').is(':checked')){
		$('#bankCondition').find("input:checkbox").prop("checked",true)
	}else{
		$('#bankCondition').find("input:checkbox").prop("checked",false)
	}
})
$('#bankCondition').find("input:checkbox").not("#bank_chkAll").on('click',function(){
// 	alert("click")
	let checkedNum = $('#bankCondition').find("input:checked").not("#bank_chkAll").length;
	let checkBoxAll=$('#bankCondition').find("input:checkbox").not("#bank_chkAll").length;
	if(checkedNum==checkBoxAll){
		$('#bank_chkAll').prop("checked",true)
	}else {
		$('#bank_chkAll').prop("checked",false)
	}
})



$(".statisticBtn").on("click",function(){
	console.log($(this).val());
	data ={
			listNo:$(this).val()
	}
	let setting = {
		url : `${pageContext.request.contextPath}/general/accountList.do`,
		method : "",
		dataType : "text",
		data : data,
		success : function(resp) {
			$("#accountListArea").html(resp);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR)
			console.log(status)
			console.log(error)
		}
	}

	$.ajax(setting);
});


$("#accountListArea").on("click","#searchBtn",function(){
	$("#statisticsInfo").html("");
	$("#spinner").show();
	
	let bankCd=[];
	let accountCd=[];
	let term;
	let startBaseMm;
	let endBaseMm;
	let listNo;
	
	let checkedBankCd=$('#bankCondition').find("input:checked").not("#bank_chkAll");
	for(let i = 0;i<checkedBankCd.length;i++){
		bankCd[i]=checkedBankCd[i].value;
	}
	
	let checkedaccountCd=$('#accountCondition').find("input:checked").not("#account_chkAll");
	for(let i = 0;i<checkedaccountCd.length;i++){
		accountCd[i]=checkedaccountCd[i].value;
	}
	
	term = $("#term").val();
	startBaseMm = $("#startYear").val()+$("#startMonth").val();
	endBaseMm = $("#endYear").val()+$("#endMonth").val();
	listNo = $("input[name=listNo]:checked").val();
	
	
	data={
		bankCd:bankCd,
		accountCd:accountCd,
		term:term,
		startBaseMm:startBaseMm,
		endBaseMm:endBaseMm,
		listNo:listNo
	}
	
	
	let setting = {
		url : `${pageContext.request.contextPath}/general/statisticsInfo.do`,
		method : "POST",
		dataType : "text",
		data : JSON.stringify(data),
		contentType:"application/json",
		success : function(resp) {
			$("#statisticsInfo").html(resp);
			$("#spinner").hide();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR)
			console.log(status)
			console.log(error)
		}
	}

	$.ajax(setting);
})

</script>

