<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${not empty salaryDetailList}">
	<div class="row">
		<div class="col-md-12">
			<div class="row mb-1">
				<div class="d-flex justify-content-between align-items-center">
				<h4>${salaryDetailList[0].salaryVO.salCalcStart}~${salaryDetailList[0].salaryVO.salCalcEnd}전체 사원 급여정보 </h4>
			    <c:if test="${salaryDetailList[0].salaryVO.salCalcYn eq 'N'}">
			    	<div>
				        <div><button id="reCalcBtn" class="btn btn-primary btn-sm mb-1">재계산하기</button></div>
				        <div><button id="finishBtn" class="btn btn-primary btn-sm" >계산확정</button></div>
			        </div>
			    </c:if>
			    <c:if test="${salaryDetailList[0].salaryVO.salCalcYn eq 'Y' and empty salaryDetailList[0].giveYmd}">
			    	<div>
			        <div><button id="cancleBtn" class="btn btn-primary btn-sm mb-1" >확정취소</button></div>
			        <div><button id="salaryGiveBtn" class="btn btn-primary btn-sm" >정산완료</button></div>
			        </div>
			    </c:if>
			    </div>
			</div>
			<form action="${pageContext.request.contextPath}/salary/salaryDetailView.do" method="post" id="salaryDetailView">
			<input type="hidden" name="salNo">
			<input type="hidden" name="empCd">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>급여번호</th>
						<th>직원번호</th>
						<th>직원명</th>
						<th>부서</th>
						<th>직급</th>
						<th>수당항목</th>
						<th>공제항목</th>
						<th>총급여</th>
					</tr>
				</thead>
				
				<tbody id="listBody" >
					<c:forEach items="${salaryDetailList}" var="salaryDetail">
						<tr class="datatr align-middle"  data-salno="${salaryDetail.salNo}" data-empcd="${salaryDetail.empCd }">
							<td class="align-middle">${salaryDetail.salNo}</td>
							<td class="align-middle">${salaryDetail.empCd}</td>
							<td class="align-middle">
								${salaryDetail.employeeVO.empName}
							</td>
							<td class="align-middle">
								${salaryDetail.employeeVO.business.busName}
							</td>
							<td class="align-middle">
								${salaryDetail.employeeVO.position.poName}
							</td>
							<td class="align-middle">
								<c:forEach items="${salaryDetail.allowHistoryList}" var="allowHistory"> 
									<c:if test="${not empty allowHistory.salNo and allowHistory.allowVO.allowCd<004}">
										<div>${allowHistory.allowVO.allowNm}: <fmt:formatNumber value="${allowHistory.allowAmt}" type="currency"/></div>
									</c:if>
										<div class="mb-1">
									<c:if test="${not empty allowHistory.salNo and allowHistory.allowVO.allowCd>003}">
											${allowHistory.allowVO.allowNm}: <fmt:formatNumber value="${allowHistory.allowAmt}" type="currency"/>
											<c:if test="${salaryDetail.salaryVO.salCalcYn eq 'N'}">
											<button class="btn btn-secondary btn-sm allowRemoveBtn" type="button" data-allowcd="${allowHistory.allowVO.allowCd }">-</button>
											</c:if>
									</c:if>
										</div>
									<c:if test="${empty allowHistory.salNo and salaryDetail.salaryVO.salCalcYn eq 'N' and allowHistory.allowVO.allowCd != '002' and allowHistory.allowVO.allowUse=='Y'}">
										<button type="button" class="btn btn-primary allowAddBtn" data-allowcd="${allowHistory.allowVO.allowCd }" 
											data-allowcalc="${allowHistory.allowVO.allowCalc }"
										>${allowHistory.allowVO.allowNm }</button>
									</c:if>
								</c:forEach>
							</td>
							<td class="align-middle"><c:forEach items="${salaryDetail.ddcHistoryList}" var="ddcHistory"> 
									<div>${ddcHistory.ddcVO.ddcNm}:  <fmt:formatNumber value="${ddcHistory.ddcAmt}" type="currency"/></div>
								</c:forEach></td>
							<td class="align-middle"><fmt:formatNumber value="${salaryDetail.salTotal}" type="currency"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
		</div>
	</div>
</c:if>

<script>

$(listBody).on("click", "tr.datatr", function(event){ 
    event.stopPropagation();
    let salNo = $(this).data("salno");  
    let empCd = $(this).data("empcd");  
    $('input[name=salNo]').val(salNo);
    $('input[name=empCd]').val(empCd);
    $('#salaryDetailView').submit();
})
 .on("click","button.allowAddBtn",function(event){
	    event.stopPropagation();
	    let empCd = $(this).parents("tr").data("empcd"); 
	    let salNo = $(this).parents("tr").data("salno"); 
	    let allowCd = $(this).data("allowcd");
	    let allowCalc = $(this).data("allowcalc");
	    console.log(allowCd)
	    console.log(allowCalc)
	    console.log(empCd)
	    console.log(salNo)
	    data ={
	    	salNo:salNo,
	    	empCd:empCd,
	    	allowCd:allowCd,
	    	"allowVO.allowCalc":allowCalc
	    }
	    let setting = {
	    	url : `${pageContext.request.contextPath }/allowHistory/addAllowHistory.do`,
			method : "post",
			dataType : "text",
			data : data,
			success : function(resp) {
				location.reload();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	})
 .on("click","button.allowRemoveBtn",function(event){
	    event.stopPropagation();
	    let empCd = $(this).parents("tr").data("empcd"); 
	    let salNo = $(this).parents("tr").data("salno"); 
	    let allowCd = $(this).data("allowcd");
	    console.log(allowCd)
	    console.log(empCd)
	    console.log(salNo)
	    data ={
	    	salNo:salNo,
	    	empCd:empCd,
	    	allowCd:allowCd,
	    }
	    let setting = {
	    	url : `${pageContext.request.contextPath }/allowHistory/removeAllowHistory.do`,
			method : "post",
			dataType : "text",
			data : data,
			success : function(resp) {
				location.reload();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR)
				console.log(status)
				console.log(error)
			}
		}
		$.ajax(setting);
	})
 
 $("#reCalcBtn").on("click",function(){
	  location.href = "salaryReCalc.do?salNo="+${salaryDetailList[0].salNo};
 })
 
 $("#finishBtn").on("click",function(){
	  location.href = "salaryFinCalc.do?salNo="+${salaryDetailList[0].salNo};
 })
 $("#cancleBtn").on("click",function(){
	  location.href = "salaryFinCalc.do?salNo="+${salaryDetailList[0].salNo};
 })
 $("#salaryGiveBtn").on("click",function(){
	  location.href = "salaryGive.do?salNo="+${salaryDetailList[0].salNo};
 })
	 
 </script> 