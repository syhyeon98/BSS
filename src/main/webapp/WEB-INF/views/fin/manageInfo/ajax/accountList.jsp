<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>


<!-- <div class="d-flex justify-content-center align-items-center"> -->
<!-- 			<div class="fs-5">통계코드</div> -->
<%-- 			<c:forEach items="${accountList }" var="account"> --%>
<!-- 					<div class="d-grid gap-2 ms-2"> -->
<%-- 						<input type="radio" class="btn-check statisticBtn" name="accountCd" id="${account.accountCd }" value="${account.accountCd }">  --%>
<%-- 						<label class="btn btn-outline-primary statistics" for="${account.accountCd }">${account.accountNm }</label> --%>
<!-- 					</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
		
		
		<div class="row" id="accountCondition">
					<div class="col-md-1 align-middle"></div>
					<div class="col-md-11">
						<div class="form-check form-check">
						  <input class="form-check-input" type="checkbox" checked id="account_chkAll" value="">
						  <label class="form-check-label" for="account_chkAll">전체</label>
						 </div>
						  <c:forEach items="${accountList }" var="account" >
							  <div class="form-check form-check">
								  <input class="form-check-input" checked type="checkbox"  data-name="${account.accountNm }" id="bank_${account.accountCd }" value="${account.accountCd }">
								  <label class="form-check-label" for="bank_${account.accountCd }">${account.accountNm}</label>
							  </div>
						  </c:forEach>
					</div>
		</div>
		<div class="d-flex justify-content-center mt-4">
			<button id="searchBtn" class="btn btn-primary" type="button">조회</button>
		</div>
		
<script>

/* 통계코드 체크박스*/
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


// })

</script>